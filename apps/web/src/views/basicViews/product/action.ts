
import commonParam from '@/config'
import $Utils from '@v4x/utils/lkxUtil';
import {getProduct,dataIsExist} from "@/usehook/dataAction";
import {TBasicAction} from "../basicAction"
import { DataSourceType, MessageBox,InputBox, ModalResultEnum, SetFieldValueType, TableRowDataType } from '@v4x/ui';
import { WinUploadProductImage } from '@/components/WinUploadProductImage'
import useAppStore from '@/stores';
import { ProductInstanceRefs } from './types';
import { WinProductSelect } from '@/components';


export class TProductGridAction extends TBasicAction<ProductInstanceRefs>{
    
    private maxKeyValue = -1;
    private defaultShipperCode = 0;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<ProductInstanceRefs>){ 
        super(dataSource, instanceRefs);
        this.defaultShipperCode = this.commonDatas.SysParamDatas[0].defaultshippercode;
        this.dataSource.getParams.mustCondition = 'Status=0'
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'barcode',//字段名
            width: 120,//宽度
            title: '条码',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'selfcode',//字段名
            width: 120,//宽度
            title: '自编码',//标题
        },{
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '品名',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'AliasName',//字段名
            width: 150,//宽度
            title: '别名',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'pack',//字段名
            width: 50,//宽度
            align: 'right',
            sort:false,
            title: '装数',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'Weight',//字段名
            width: 100,//宽度
            align:'right',
            title: '净重',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'brand',//字段名
            width: 100,//宽度
            title: '品牌',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'origin',//字段名
            width: 100,//宽度
            title: '产地',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'unit',//字段名
            width: 80,//宽度
            title: '结算单位',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'text',//数据类型
            fieldName: 'punit',//字段名
            width: 80,//宽度
            title: '下单单位',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'text',//数据类型
            fieldName: 'Downwgspec',//字段名
            width: 60,//宽度
            title: '个重',//标题
            sort: false,
        },{
            dataType: 'text',//数据类型
            fieldName: 'domethod',//字段名
            width: 60,//宽度
            title: '做法',//标题
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'EnableQs',//字段名
            width: 80,//宽度
            title: '多质量',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'20|130',
                dropListDatas: [{idcode:0,name:'0-不启用'},{idcode:1,name:'1-启用'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'saletype',//字段名
            width: 80,//宽度
            title: '商品类型',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'20|130',
                dropListDatas: [{idcode:0,name:'0-称重'},{idcode:1,name:'1-按量'},{idcode:3,name:'3-散+件'}]
            },
        },{
            //dataType: 'number',//数据类型
            fieldName: 'catecode',//字段名
            width: 80,//宽度
            title: '分类',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'CateDatas'
            },
        },{
            fieldName: 'shipperCode',//字段名
            width: 200,//宽度
            title: '供货商',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ShipperDatas'
            }
        },{
           // dataType: 'number',//数据类型
            fieldName: 'areacode',//字段名
            width: 80,//宽度
            title: '仓库',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'AreaDatas'
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'inprice',//字段名
            width: 80,//宽度
            title: '进价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'price1',//字段名
            width: 80,//宽度
            title: '售价1',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'price2',//字段名
            width: 80,//宽度
            title: '售价2',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'price3',//字段名
            width: 80,//宽度
            title: '售价3',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'price4',//字段名
            width: 80,//宽度
            title: '售价4',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'price5',//字段名
            width: 80,//宽度
            title: '售价5',//标题
            align: 'right',
            format:'0.00',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'LowerLimit',//字段名
            width: 50,//宽度
            title: '下限',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'UpperLimit',//字段名
            width: 50,//宽度
            title: '上限',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 60,//宽度
            title: '状态',//标题
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'30|100',
                dropListDatas: [{idcode:0,name:'正常'},{idcode:1,name:'只销'},{idcode:2,name:'停销'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'avgCostprice',//字段名
            width: 80,//宽度
            title: '最后平均价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
            readonly: true
        },{
            fieldName: 'checknote',//字段名
            width: 100,//宽度
            inputType: 'text',
            title: '验收标准',//标题PicSrc
        },{
            fieldName: 'PicSrc',//字段名
            width: 100,//宽度
            inputType: 'text',
            readonly: true,
            title: '图片',//标题
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'text',
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-porduct',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "selfcode",caption: "自编码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "aliasName",caption: "别名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "shippercode",caption: "供货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "areacode",caption: "仓库",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "saletype",caption:"商品类型",filterType:"fsIn",inList: [{idcode:0,name:'0-称重'},{idcode:1,name:'1-按量'},{idcode:2,name:'2-称重+按量'},{idcode:3,name:'3-散+件'}]},
                {fieldName: "domethod",caption: "做法",filterType: "fsLike"},
                {fieldName: "status",caption:"品态",filterType:"fsIn",inList: [{idcode:0,name:'0-正常'},{idcode:1,name:'1-只销'},{idcode:2,name:'2-停销'}]},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
            },
            customColor:(rowItem: TableRowDataType,_cellItem: object): string=>{
                if (rowItem.status==2) return 'red';
                if (rowItem.status==1) return 'rgb(161, 13, 13)';
                if (rowItem.isparent == 1) return 'yellow';
                return ''
            },
           /* customBgColor:(rowItem: TableRowDataType,_cellItem: object): string=>{
                if (rowItem.isparent == 1) return 'yellow';
                return ''
            },*/
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(_datas: any): number=> {
                   // console.log('计算')
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
               // console.log(data)
            },
            rowDbClick: async (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                if (_fieldName == 'shipperCode'){
                    //this.thisInstance.shipperCode = rowdata.shippercode
                  //  this.thisInstance.shipperConfig.open = true
                    const res = await InputBox.show({
                        title:'批量更新货商',
                        description:'请选择供货商：',
                        inputType:'drop',
                        defaultValue: rowdata.shippercode,
                        dropDataList:this.commonDatas.ShipperDatas
                    })
                    if (res.action === ModalResultEnum.mrCancel) return
                    this.batchUpdateShipperCode(+res.data)
                    return
                }
                if (_fieldName == 'idcode'){
                    this.instanceRefs.headerData!.value = rowdata;
                    this.instanceRefs.detailVisabled!.value = true;
                    return
                }
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
                return
               /*  this.thisInstance.$UploadProductImage.show({
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
               
            }
        })
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将此方法付于dataSource的onSetFieldValue
        if (data.fieldName === 'name'){
            const _DataisExist = await dataIsExist(this.dataSource.apiPath, `idcode <90000 and name='${data.fieldValue.toString()}'`);
           if (_DataisExist){
                const res = await MessageBox.question({
                    title:'提问',
                    content:`商品名称"${data.fieldValue}"已存在，是否录入？`,
                })
                if (res.action !== ModalResultEnum.mrConfirm) return false; 
           }
       }
       if (data.fieldName === 'barcode'){
            const _DataisExist = await dataIsExist(this.dataSource.apiPath, `idcode <90000 and barcode='${data.fieldValue.toString()}'`);
            if (_DataisExist){
                const res = await MessageBox.question({
                    title:'提问',
                    content:`商品条码"${data.fieldValue}"已存在，不能录入`,
                })
                return false; 
            }
        }
        /*if (data.fieldName == 'spec'){
            const _arr = (data.fieldValue as string).split('*');
            if (_arr.length >1){
                this.thisInstance.Win.ActiveGridAction.dataSource.setFieldValue('pack',_arr[1])
            }
        }*/
        return super.onSetFieldValue(data,rowItem)
    }
    protected async beforedEdit(rowItem: TableRowDataType,fieldName: string): Promise<boolean> {
        let allowed = await super.beforedEdit(rowItem,fieldName)
        if (fieldName!='inprice'&&fieldName!='price1'){
            allowed = allowed&&commonParam.$linkname.toLowerCase()==useAppStore().commonDatas.SysParamDatas[0].mainbookname.toLowerCase()
            if (!allowed ){
                await MessageBox.warning({
                    title:'警告',
                    content:'对不起子帐套不可以修改除进价与售价外的商品数据，请用主帐套处理',
                    showCancel: false
                })
            }
        }
        return new Promise((resolve, reject)=>{
            resolve(allowed)
        })
    }
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        updateRes = updateRes&&commonParam.$linkname.toLowerCase()==this.commonDatas.SysParamDatas[0].mainbookname.toLowerCase()
        if (!updateRes ){
            await MessageBox.warning({
                title:'警告',
                content:'对不起子帐套不可以增加商品，请用主帐套处理',
                showCancel: false
            })
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'max(idcode)',condition:''});
            if (fieldValue != -1){
                if (fieldValue == 0) 
                    this.maxKeyValue = 10001
                else
                    this.maxKeyValue = fieldValue*1 + 1;
            } 
        }
        return new Promise((resolve, _reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(_rowItem: TableRowDataType,_rowIndex: number): Promise<boolean>{
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('barcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('selfcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('Downwgspec',1);
        this.dataSource.setFieldValue('unit','斤');
        this.dataSource.setFieldValue('punit','斤');
        this.dataSource.setFieldValue('saleType',0);
        this.dataSource.setFieldValue('areacode',101);
       // this.dataSource.setFieldValue('cateCode',this.thisInstance.cateActiveCode);
        this.dataSource.setFieldValue('inprice',0);
        this.dataSource.setFieldValue('price1',0);
        this.dataSource.setFieldValue('pack',1);
        this.dataSource.setFieldValue('shippercode',this.defaultShipperCode);
        this.dataSource.setFieldValue('LowerLimit',0);
        this.dataSource.setFieldValue('UpperLimit',0);
        this.dataSource.setFieldValue('status',0);
        this.fieldToColIndex('barcode');
        return super.afterInsert(_rowItem,_rowIndex)
    }
    protected async beforeDelete(rowItem: TableRowDataType): Promise<boolean> {
        let res = await super.beforeDelete(rowItem);
        res = res&&commonParam.$linkname.toLowerCase()==this.commonDatas.SysParamDatas[0].mainbookname.toLowerCase()
        if (!res ){
            await MessageBox.warning({
                title:'警告',
                content:'对不起子帐套不可以删除商品，请用主帐套处理',
                showCancel: false
            })
        }
        let returnVale = res;
        if (res){
            const fieldValue = await this.instanceRefs.detailDataSource.getFieldValueFormServer({
                    tableName:'L_Basic_Product_Comb_Tab',
                    fieldName: 'count(idkey)',
                    condition:`PCode='${rowItem.idcode}'`
            });
            if (fieldValue!=0){
                returnVale = false
                MessageBox.warning({title:'警告', content:'商品存在拆零配置，不可以删除',showCancel:false})
            } else {
                returnVale = true;
            }
        }
        return new Promise((resolve, _reject)=>{
            resolve(returnVale)
        })
    }
    public async batchUpdateShipperCode(shipperCode: number){ 
        const questionRes = await MessageBox.question({
            title:'提问',
            content: '是否批批量修改商品供应商?(只修改本页,记得要保存哦',
            defaultButton: ModalResultEnum.mrCancel,
        })
        if (questionRes.action == ModalResultEnum.mrCancel) return false 
        this.dataSource.dataSet.forEach((rowItem,index)=>{
            this.dataSource.setFieldValue('shippercode',shipperCode,index);
        })
    }
}

export class TProductGridDetailAction extends TBasicAction<ProductInstanceRefs>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<ProductInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '货号',//标题
            sort: false,
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
            sort: false,
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            readonly: true,
            sort: false,
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
            dataType: 'number',
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '转换量',//标题
            format:'0.00',
            sort: false,
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
               // calculationer: 'numCalc'//计算方法
            }
        },{
            fieldName: 'inprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
            
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-porduct-Swap',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(_datas: any): number=> {
                   // console.log('计算')
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
              //  console.log(data)
            },
            rowDbClick: (_datas: TableRowDataType[],_rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
              
            }
        })
    }
    /*
    public Methods: LkxTableMethodsType = $Utils.deepObjectMerge(this.Methods,{
        sumCalculated:{
            countCalc:(_datas: any): number=> {
                console.log('计算')
                return (this.dataSource.totalData as any).count
            },
        },
    })
    public Events: LkxTableEventsType = $Utils.deepObjectMerge(this.Events,{
        indicatorButtonEvent:(data: any)=>{
            console.log(data)
        },
        rowDbClick: (_datas: TableRowDataType[],_rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
          
        }
    })*/
    public  changeRowValue = async (data: any,editRowIndex?: number)=>{
        const _DataisExist = await dataIsExist(this.dataSource.apiPath, `PCode='${this.instanceRefs.headerData?.value.idcode}' and ProductCode=${data.idcode}`);
        if (_DataisExist){
            MessageBox.information({
                title:'提问',
                content:`编码${data.idcode}已存在，不能重复录入`,
                showCancel: false
            })
            return false
        }
        const _DataSource = this.dataSource;
        _DataSource.setFieldValue('productcode',data.idcode,editRowIndex);
        _DataSource.setFieldValue('barcode',data.barcode,editRowIndex);
        _DataSource.setFieldValue('name',data.name,editRowIndex);
        _DataSource.setFieldValue('spec',data.spec,editRowIndex);
        _DataSource.setFieldValue('unit',data.unit,editRowIndex);
        _DataSource.setFieldValue('num',0,editRowIndex);
        _DataSource.setFieldValue('inprice',data.inprice,editRowIndex);
        return false
    }
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_Product_Comb_Tab',fieldName: 'isnull(max(RIGHT(idkey,4)),0)+1',condition:`PCode='${this.instanceRefs.headerData?.value.idcode}'`});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, _reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(_rowItem: TableRowDataType,_rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idKey',this.instanceRefs.headerData?.value.idcode+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('pcode',this.instanceRefs.headerData?.value.idcode);
        this.dataSource.setFieldValue('num',0);
        this.dataSource.setFieldValue('inprice',0);
        this.fieldToColIndex('productcode') ;
        return super.afterInsert(_rowItem,_rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
        if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),customerCode:0})
            if (res.length==0){
                MessageBox.toast({
                    content:'无此商品',
                    messageType:'warning'
                })
                setTimeout(()=>{
                    this.fieldToColIndex('productcode')
                },100)
                return false
            }
            if (res.length==1){return await this.changeRowValue(res[0])}
            const _SelectRes = await WinProductSelect.show({title:'商品选择',defaultDatas: res,customerCode:0})
            if (_SelectRes){
                return this.changeRowValue(_SelectRes,data.editRowIndex);
            }
            return false
        }
        return super.onSetFieldValue(data,rowItem)
    }
}