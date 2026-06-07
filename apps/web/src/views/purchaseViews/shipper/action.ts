
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { defineComponent, reactive, ref ,onMounted, toRefs,inject } from 'vue'
import {TGridAction} from "@/usehook/gridAction"
import {getProduct,dataIsExist} from "@/usehook/dataAction"
import { CommondDatasParamType, DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableColumnsType, TableRowDataType } from '@v4x/ui';
import { ShipperInstanceRefs } from './types';
import useAppStore from '@/stores';
export class TListGridAction extends TGridAction{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType,instanceRefs: ShipperInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.mustCondition = ` Status=0`
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 80,//宽度
            title: '编码',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'selfcode',//字段名
            width: 80,//宽度
            title: '序号',//标题
            
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
            dataType: 'text',//数据类型
            fieldName: 'shortname',//字段名
            width: 120,//宽度
            title: '简称',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'addr',//字段名
            width: 150,//宽度
            title: '地址',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'person',//字段名
            width: 100,//宽度
            title: '联系人',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'tel',//字段名
            width: 150,//宽度
            title: '电话',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'SettlementType',//字段名
            width: 80,//宽度
            title: '结算方式',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'SettlementTypeDatas',
                //dropListDatas: this.commonDatas.value.SettlementTypeDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'AccountDay',//字段名
            width: 50,//宽度
            title: '账期',//标题
            sort:false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'salesMan',//字段名
            width: 80,//宽度
            title: '采购员',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'UserDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               // dropListDatas: this.commonDatas.value.PostDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'allowedChangeProduct',//字段名
            width: 80,//宽度
            title: '换菜',//标题
            //customFormater:'allowedChangeProductFomat',
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|100',
                dropListDatas: [{idcode:0,name:'不允许'},{idcode:1,name:'允许'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 80,//宽度
            title: '状态',//标题
            //customFormater:'statusFormat',
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'正常'},{idcode:1,name:'停用'}]
            },
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Shipper',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "shortname",caption: "简称",filterType: "fsLike"},
                {fieldName: "addr",caption: "地址",filterType: "fsLike"},
                {fieldName: "tel",caption: "电话",filterType: "fsLike"},
                {fieldName: "person",caption: "联系人",filterType: "fsLike"},
                {fieldName: "status",caption: "状态",filterType: "fsIn",inList:[{idcode:0,name:'正常'},{idcode:1,name:'停用'}]},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                           
            ],
        }) 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: object): string=>{
                if (rowItem.status==1) return 'red';
                return ''
            },
            customFormater:{
                /*statusFormat:(fieldVal: any) =>{
                    switch (parseInt(fieldVal)){
                        case 0:
                            return '正常';
                            break;
                        case 1:
                            return '停用';
                            break;
                    }
                }    */        
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        });  
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
              //  console.log(data)
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                if (rowdata.idcode==1) return
               // this.thisInstance.detailVisabled = true
               // this.thisInstance.headerData = rowdata
            }
        })
    }

   
    protected async beforeInsert(): Promise<boolean> {
       
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_User_Tab',fieldName: 'max(idcode)',condition:''});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 + 1;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('selfcode',this.maxKeyValue);
        this.dataSource.setFieldValue('Status',0);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('salesMan',0);
        this.dataSource.setFieldValue('allowedChangeProduct',0);
        this.fieldToColIndex('name');
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将此方法付于dataSource的onSetFieldValue
        if (data.fieldName == 'name'){
             const _DataisExist = await dataIsExist(this.dataSource.apiPath, `idcode <90000 and name='${data.fieldValue.toString()}'`);
            if (_DataisExist){
                MessageBox.warning({
                    title:'出错',
                    content:`供货名称"${data.fieldValue}"已存在，不可以重复`,
                    messageType:'warning',
                    showCancel: false
                })
                return false
            }
        }
        return super.onSetFieldValue(data,rowItem)
    }
}

export class TDetailGridAction extends TGridAction{
    private maxKeyValue = -1;
    public BasicBarItems=[
        /*{title:'<F5>上传报价',
            idCode:'_Import',
            index:1,
            dropDown:false},*/
        {title:'<F6>调入商品',
            idCode:'_Load',
            index:1,
            dropDown:false},
        {title:'<F7>复制报价',
            idCode:'_Copy',
            index:1,
            dropDown:false},
        {title:'<F8>清空报价',
            idCode:'_ClearOffer',
            index:2,
            dropDown:false}]
    public PrintBarItems=[ 
        {title:'<F5>录入修改',
            idCode:'_List',
            index:1,
            dropDown:false},
        {title:'<F7>打印',
            idCode:'_Print',
            index:2,
            dropDown:false},
        {title:'<F6>导出',
            idCode:'_Export',
            index:2,
            dropDown:false}
    ] 
    public toolsBarItems= [ 
        {title:'<F5>录入修改',
            idCode:'_List',
            index:1,
            dropDown:false},
        {title:'<F6>打印导出',
            idCode:'_Offer',
            index:2,
            dropDown:false}
    ] 
    public ListColumns: TableColumnsType[] = [
        {
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '编码',//标题
            allowInputString: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorButtonEvent'
        },{
            fieldName: 'barcode',//字段名
            width: 100,//宽度
            title: '条码',//标题
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            readonly: true,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center'
        },{
            fieldName: 'curprice',//字段名
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '上次报价',//标题
            readonly: true,
            format:'0.000',
            align:'right'
        },{
            fieldName: 'price',//字段名
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            numberFlg: '+'
        },{
            fieldName: 'note',//字段名
            width: 150,//宽度
            title: '备注',//标题
            sort: false,
            readonly: false
        }
    ]
    constructor(dataSource: DataSourceType,instanceRefs: ShipperInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.Columns = this.ListColumns;
        this.toolsBarItems= this.BasicBarItems;
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'basicViews-Customer-detail',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},   
                {fieldName: "spec",caption: "规格",filterType: "fsLike"}                
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        }); 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            back:()=>{
                this.instanceRefs.detailVisabled.value = false
                this.instanceRefs.Win.ActiveGridAction = this.instanceRefs.gridAction
            },
            indicatorButtonEvent: async (data: any)=>{
                /* const _SelectRes = await this.thisInstance.$productSelectWin.show({title:'商品选择'})
                if (_SelectRes){
                    this.changeRowValue(_SelectRes)
                } */
            },
            gridFocus:(gridAction: any,printTable: any)=>{
              //  console.log('foucts')
            }
        })
    }
    public  changeRowValue = async (data: any)=>{
        const _DataisExist = await dataIsExist(this.instanceRefs.Win.ActiveGridAction.dataSource.apiPath, `Pcode=${this.instanceRefs.headerData.idcode} and ProductCode=${data.idcode}`);
        if (_DataisExist){
            this.instanceRefs.$MessageBox.warning({
                title:'出错',
                content:`编码${data.idcode}已存在，不可以重复`,
                messageType:'warning',
                showCancel: false
            })
            return false
        }
        const _DataSource = this.instanceRefs.Win.ActiveGridAction.dataSource;
        _DataSource.setFieldValue('productcode',data.idcode);
        _DataSource.setFieldValue('barcode',data.barcode);
        _DataSource.setFieldValue('name',data.name);
        _DataSource.setFieldValue('spec',data.spec);
        _DataSource.setFieldValue('unit',data.unit);
        _DataSource.setFieldValue('curprice',data.inprice);
        _DataSource.setFieldValue('price',data.inprice);
        return false
    }
    protected async headerUpdate(): Promise<boolean> {/**保存头部*/
        return this.instanceRefs.gridAction.update(false)
    }       
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'isnull(max(RIGHT(Idkey,4)),0)+1',condition:`Pcode=${this.instanceRefs.headerData.value.idcode}`});
            if (fieldValue != -1){
                this.maxKeyValue = fieldValue*1==1?90001:fieldValue*1 ;
                
            } 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idKey',this.instanceRefs.headerData.value.idcode+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('pcode',this.instanceRefs.headerData.value.idcode)
        this.dataSource.setFieldValue('SerialNumber',this.dataSource.dataSetRowCount)
        this.fieldToColIndex('productcode');
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
        if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),BillType:22})
            if (res.length==0){
                MessageBox.toast({
                    content:'无此商品',
                    messageType:'warning'
                })
                return false
            }
            if (res.length==1){return  this.instanceRefs.Win.ActiveGridAction.changeRowValue(res[0])}
            const _SelectRes = await this.instanceRefs.$productSelectWin.show({title:'商品选择',dataSet: res})
            if (_SelectRes){return  this.instanceRefs.Win.ActiveGridAction.changeRowValue(_SelectRes)}
            return false
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
    }

    public async QuotedPriceLoad(cateList: any){
       
        const selectCateList = cateList.filter((item: any)=>{
            return item.checked == true;
        })
        const selectCateCodeList: any[] = [];
        selectCateList.forEach((element: any) => {
            selectCateCodeList.push(element.idcode)
        })
        if (selectCateCodeList.length==0) return;
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要调入所选分类对应商品？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在调入...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceLoad',{
            BillNumber: this.instanceRefs.headerData.value.idcode,
            CateCodeList: selectCateCodeList.join(',')
           
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async QuotedPriceCopy(ShipperCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要复制报价'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在复制...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceCopy',{
            ShipperCode: this.instanceRefs.headerData.idcode,
            CurShipperCode: ShipperCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async offerClear(){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要清空报价',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在清空...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceClear',{
            ShipperCode: this.instanceRefs.headerData.value.idcode,
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public ToolsBarItemClick(data: any){
        switch (data.idCode){
            case '_Import':
                    this.instanceRefs.importConfig.open = true;
                break;
            case '_Load':
                this.instanceRefs.cateConfig.open = true;
                break;
            case '_Copy':
                this.instanceRefs.copyConfig.open = true;
                break;
             case '_ClearOffer':
                this.offerClear()
                break;
            /*case '_Offer':
                this.thisInstance.printVisabled = true;
                this.toolsBarItems= this.PrintBarItems;
                this.openQuotedPrice();
                break;
            case '_Print':
                this.thisInstance.$print(this.thisInstance.printDomEx.printDom);
                break;
            case '_Export':
                ExportTableToExcel(this.thisInstance.printDomEx.printDom);
                break;*/
        }
    }
}