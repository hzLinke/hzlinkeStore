import {DataSourceType,InputBox,ModalResultEnum,TableRowDataType,MessageBox} from '@v4x/ui';
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TBasicAction} from "../basicAction"

import { WinModal } from '@v4x/ui';
import SelectEl from './cateSelect.vue';
import { AreaInstanceRefs } from './types'
import { WinUploadProductImage } from '@/components';

export class TAreaGridAction extends TBasicAction<AreaInstanceRefs>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<AreaInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
                dataType: 'number',//数据类型
                fieldName: 'idcode',//字段名
                width: 100,//宽度
                title: '编码',//标题
                align:'center',
                readonly: true,
                footers: {
                    align: 'center',
                    value: '合计',
                    valueType: 'fvtNone',
                }
            },{
                fieldName: 'name',//字段名
                width: 200,//宽度
                title: '名称',//标题
                footers: {
                    align: 'center',
                    valueType: 'fvtCount',
                    calculationer: 'countCalc'//计算方法
                }
            },{
                fieldName: 'note',//字段名
                width: 100,//宽度
                title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Cate',sep: true,expand: false,opt:false,parger:true,readOnly: false, draggable: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ]
        })  
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
            },
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: TableRowDataType[]): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        }); 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                if (rowdata.idcode==0) return
                if (_fieldName == 'idcode'){
                    const res = await WinUploadProductImage.show({
                        title:'图片上传',
                        productCode: rowdata.idcode,
                        productName: rowdata.name,
                        fileNames: rowdata.picsrc
                    })
                    const _arr = [] as any
                    res.data.forEach((item: any)=>_arr.push(item.name))
                    if (rowdata.picsrc == _arr.join(';')) return;
                    this.dataSource.setFieldValue('picsrc',_arr.join(';'))
                    this.update()
                    /* this.thisInstance.$UploadProductImage.show({
                        title:'图片上传',
                        productCode: rowdata.idcode,
                        productName: rowdata.name,
                        fileNames: rowdata.picsrc
                    }).then((res: any)=>{
                        const _arr = [] as any
                        res.value.forEach((item: any)=>_arr.push(item.name))
                        if (rowdata.picsrc == _arr.join(';')) return;
                        this.dataSource.setFieldValue('picsrc',_arr.join(';'))
                        this.update()
                    }) */
                    return
                }
                if (this.instanceRefs.headerData) {
                    this.instanceRefs.headerData.value = rowdata;
                }
                if (this.instanceRefs.detailVisabled) {
                    this.instanceRefs.detailVisabled.value = true;
                }


            },
            onDragStart:(Event: DragEvent,RowItem: any,RowIndex: number) =>{
               // console.log(RowItem.idcode)
                Event.dataTransfer?.setData('SourceIdCode', RowItem.idcode);
                Event.dataTransfer?.setData('SourceRowIndex',RowIndex.toString())
            },
            onDragEnd:(Event: DragEvent,TagrgetRowItem: any,TagrgetRowIndex: number)=>{
                let Direction = 1;
                const ChangeIdCodeList = []
                const TagrgetIdCode = TagrgetRowItem.idcode;
                const SourceIdCode =  Event.dataTransfer?.getData('SourceIdCode')||0
                const SourceRowIndexRowIndex =  Event.dataTransfer?.getData('SourceRowIndex')||0
                if (SourceRowIndexRowIndex == TagrgetRowIndex) return;
                const _val = this.dataSource.dataSet.splice(+SourceRowIndexRowIndex,1)
                _val[0]['idcode'] = TagrgetRowItem.idcode;
                this.dataSource.dataSet.splice(TagrgetRowIndex,0,_val[0]);
               // console.log(TagrgetRowIndex, +SourceRowIndexRowIndex)
                if (TagrgetRowIndex< +SourceRowIndexRowIndex){//向上
                    Direction = 1;
                    for (let i=TagrgetRowIndex+1;i <= +SourceRowIndexRowIndex;i++){
                        ChangeIdCodeList.push(this.dataSource.dataSet[i].idcode)
                        this.dataSource.dataSet[i].idcode = (+this.dataSource.dataSet[i].idcode) +1 
                    }
                } else {
                    Direction = -1;
                    for (let i=TagrgetRowIndex-1;i >= +SourceRowIndexRowIndex;i--){
                        ChangeIdCodeList.push(this.dataSource.dataSet[i].idcode)
                        this.dataSource.dataSet[i].idcode = (+this.dataSource.dataSet[i].idcode) -1 
                    }
                }
                //console.log(this.dataSource.detailSet)
                this.swapRows(ChangeIdCodeList.join(';'),+SourceIdCode,TagrgetIdCode,Direction)
            }
        });
    }
    protected async beforeInsert(): Promise<boolean> {
 
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_Cate_Tab',fieldName: 'max(idcode)',condition:'idcode<10000'});
            if (fieldValue != -1){
                this.maxKeyValue = fieldValue*1 + 1;
            } 
        }
        return new Promise((resolve)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('serialnum',this.maxKeyValue)
        this.dataSource.setFieldValue('pcode',1);
        this.dataSource.setFieldValue('DefaultShipperCode',1);
        this.dataSource.setFieldValue('addPriceRate',0)
        this.fieldToColIndex('name')
        return super.afterInsert(rowItem,rowIndex)
    }
    public async swapRows(ChangeIdCodeList: string,SourceIdCode: number,TargetIdCode: number,Direction: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要移动位置？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在移动位置...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'swapRows',{
            ChangeIdCodeList,
            SourceIdCode,
            TargetIdCode,
            Direction
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
}

export class TDetailAreaGridAction extends TBasicAction<AreaInstanceRefs>{
    private maxKeyValue = -1;
    private thisCateCode = 0;

    constructor(dataSource: DataSourceType, instanceRefs: Partial<AreaInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
                dataType: 'number',//数据类型
                fieldName: 'idcode',//字段名
                width: 100,//宽度
                title: '编码',//标题
                align:'center',
                readonly: true,
                footers: {
                    align: 'center',
                    value: '合计',
                    valueType: 'fvtNone',
                }
            },{
                fieldName: 'name',//字段名
                width: 200,//宽度
                title: '名称',//标题
                footers: {
                    align: 'center',
                    valueType: 'fvtCount',
                    calculationer: 'countCalc'//计算方法
                }
            },{
                fieldName: 'serialnum',//字段名
                width: 100,//宽度
                title: '序号',//标题
            },{
                fieldName: 'DefaultShipperCode',//字段名
                width: 200,//宽度
                title: '默认货商',//标题
                inputType: 'drop',
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|200',
                    dropListDatasName: 'ShipperDatas',
                    //dropListDatas: this.commonDatas.value.ShipperDatas
                }
            },{
                dataType: 'number',//数据类型
                fieldName: 'addPriceRate',//字段名
                width: 100,//宽度
                title: '加价率',//标题
                format: '0.00%',
                align:'right'
            },{
                fieldName: 'note',//字段名
                width: 100,//宽度
                title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Cate-detail',sep: true,expand: false,opt:false,parger:true,readOnly: false,
            draggable: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ]
        })  
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
            },
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: TableRowDataType[]): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        }); 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                this.thisCateCode = rowdata.idcode;
                const res = await InputBox.show({
                    title: '分类转移',
                    description: '请选择分类',
                    defaultValue: 0,
                    inputType:'drop',
                    dropDataList: this.commonDatas.PCateDatas
                })
              //  const res = await WinModal.open({title:'分类转移', visible: true,width: 400,content:SelectEl})
                if (res.action=== ModalResultEnum.mrConfirm && +res.data !==0){
                    this.transferPCate(res.data)
                }
            },
            onDragStart:(Event: DragEvent,RowItem: any,RowIndex: number) =>{
               // console.log(RowItem.idcode)
                Event.dataTransfer?.setData('SourceIdCode', RowItem.idcode);
                Event.dataTransfer?.setData('SourceRowIndex',RowIndex.toString())
            },
            onDragEnd:(Event: DragEvent,TagrgetRowItem: any,TagrgetRowIndex: number)=>{
                let Direction = 1;
                const ChangeIdCodeList = []
                const TagrgetIdCode = TagrgetRowItem.idcode;
                const SourceIdCode =  Event.dataTransfer?.getData('SourceIdCode')||0
                const SourceRowIndexRowIndex =  Event.dataTransfer?.getData('SourceRowIndex')||0
                if (SourceRowIndexRowIndex == TagrgetRowIndex) return;
                const _val = this.dataSource.dataSet.splice(+SourceRowIndexRowIndex,1)
                _val[0]['idcode'] = TagrgetRowItem.idcode;
                this.dataSource.dataSet.splice(TagrgetRowIndex,0,_val[0]);
                
                if (TagrgetRowIndex< +SourceRowIndexRowIndex){//向上
                    Direction = 1;
                    for (let i=TagrgetRowIndex+1;i <= +SourceRowIndexRowIndex;i++){
                        ChangeIdCodeList.push(this.dataSource.dataSet[i].idcode)
                        this.dataSource.dataSet[i].idcode = (+this.dataSource.dataSet[i].idcode) +1 
                    }
                } else {
                    Direction = -1
                    for (let i=TagrgetRowIndex-1;i >= +SourceRowIndexRowIndex;i--){
                        ChangeIdCodeList.push(this.dataSource.dataSet[i].idcode)
                        this.dataSource.dataSet[i].idcode = (+this.dataSource.dataSet[i].idcode) -1 
                    }
                }
               // console.log(this.dataSource.detailSet)
                this.swapRows(ChangeIdCodeList.join(';'),+SourceIdCode,TagrgetIdCode,Direction)
            }
        });
    }

    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
       
        if (updateRes){
            const headerData = this.instanceRefs.headerData?.value || {};
             console.log('beforeInsert',headerData);
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_Cate_Tab',fieldName: 'IsNull(max(idcode),0)',condition:`Pcode=${headerData.idcode}`});
            if (fieldValue != -1){
                if (fieldValue == 0){
                    this.maxKeyValue = headerData.idcode*100 + 1;
                } else {
                    this.maxKeyValue = fieldValue*1 + 1;
                }
            }
        }
        return new Promise((resolve)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('serialnum',this.maxKeyValue)
        const headerData = this.instanceRefs.headerData?.value || {};
        this.dataSource.setFieldValue('pcode',headerData.idcode);
        this.dataSource.setFieldValue('DefaultShipperCode',1);
        this.dataSource.setFieldValue('addPriceRate',0)
        this.fieldToColIndex('name')
        return super.afterInsert(rowItem,rowIndex)
    }

    public async swapRows(ChangeIdCodeList: string,SourceIdCode: number,TargetIdCode: number,Direction: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要移动位置？'
        })
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在移动位置...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'swapRows',{
            ChangeIdCodeList,
            SourceIdCode,
            TargetIdCode,
            Direction
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async transferPCate(TargetPCateCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要转移？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在转移...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'transferPCate',{
            TargetPCateCode:TargetPCateCode,
            SoureceCateCode:this.thisCateCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
}
