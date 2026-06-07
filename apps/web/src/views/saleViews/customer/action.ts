
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import {getProduct,dataIsExist} from "@/usehook/dataAction"
import type { CustomerInstanceRefs } from './types'
import {  DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableColumnsType, TableRowDataType } from '@v4x/ui';
import { ExportTableToExcel } from '@v4x/utils';
import {Print} from '@v4x/utils'
import { WinProductSelect } from '@/components';
import { WinPriceLogs } from '@/components/WinPriceLogs';
import useAppStore from '@/stores';

export class TListGridAction extends TGridAction<CustomerInstanceRefs>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType,instanceRefs: CustomerInstanceRefs){ 
        super(dataSource,instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode} and Status=0`
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
            title: '放置区',//标题
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
            fieldName: 'RelationCode',//字段名
            width: 150,//宽度
            title: '关联公司',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'LtdDatas',
                //dropListDatas: this.commonDatas.value.LtdDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'Pcode',//字段名
            width: 150,//宽度
            title: '项目名称',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ProjectDatas',
                //dropListDatas: this.commonDatas.value.LtdDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'SalesMan',//字段名
            width: 80,//宽度
            title: '业务',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.SettlementTypeDatas
            },
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
            fieldName: 'Dr',//字段名
            width: 100,//宽度
            title: '折扣率',//标题
            sort:false,
            format: '0.0000',
            align:'right'
        },{
            dataType: 'number',//数据类型
            fieldName: 'decimalBit',//字段名
            width: 100,//宽度
            title: '小数位',//标题
            sort:false,
            align:'right'
        },{
            dataType: 'number',//数据类型
            fieldName: 'PriceLevel',//字段名
            width: 80,//宽度
            title: '价格级别',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|120',
                dropListDatas:[{idcode:0,name:'售价1'},{idcode:1,name:'售价2'},{idcode:2,name:'售价3'},{idcode:3,name:'售价4'},{idcode:4,name:'售价5'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'watchorder',//字段名
            width: 80,//宽度
            title: '监视下单',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'关闭'},{idcode:1,name:'开启'}]
            },
        },{
            dataType: 'text',//数据类型
            fieldName: 'downUnitType',//字段名
            width: 80,//宽度
            title: '计价单位',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'自动'},{idcode:1,name:'公斤'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'ChangeAblePrice',//字段名
            width: 80,//宽度
            title: '价格标准',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'时价'},{idcode:1,name:'定价'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'QualityGrade',//字段名
            width: 80,//宽度
            title: '质量',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'不定'},{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'LossAllocation',//字段名
            width: 80,//宽度
            title: '损耗分配',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'不分配'},{idcode:1,name:'分配'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'LookProductType',//字段名
            width: 80,//宽度
            title: '查看类型',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'40|100',
                dropListDatas: [{idcode:0,name:'全部'},{idcode:1,name:'报价'}]
            },
        },{
            fieldName: 'DeliveryAt',//字段名
            width: 80,//宽度
            title: '送货时段',//标题
        },{
            fieldName: 'LineName',//字段名
            width: 80,//宽度
            title: '送货路线',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'notAddPrice',//字段名
            width: 80,//宽度
            title: '是否加价',//标题
            //customFormater:'allowedChangeProductFomat',
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|100',
                dropListDatas: [{idcode:0,name:'加价'},{idcode:1,name:'不加价'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'salefromquoteprice',//字段名
            width: 80,//宽度
            title: '只取报价',//标题
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|100',
                dropListDatas: [{idcode:0,name:'否'},{idcode:1,name:'是'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 80,//宽度
            title: '状态',//标题
            customFormater:'statusFormat',
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
            id:'basicViews-Customer',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "shortname",caption: "简称",filterType: "fsLike"},
                {fieldName: "tel",caption: "电话",filterType: "fsLike"},
                {fieldName: "addr",caption: "地址",filterType: "fsLike"},
                {fieldName: "person",caption: "联系人",filterType: "fsLike"},
                {fieldName: "pcode",caption: "项目名称",filterType: "fsIn",inList:this.commonDatas.ProjectDatas},
                {fieldName: "relationcode",caption: "关联公司",filterType: "fsIn",inList:this.commonDatas.LtdDatas},
                {fieldName: "settlementtype",caption: "结算方式",filterType: "fsIn",inList:this.commonDatas.SettlementTypeDatas},
                {fieldName: "status",caption: "状态",filterType: "fsIn",inList:[{idcode:0,name:'正常'},{idcode:1,name:'停用'}]},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: TableColumnsType): string=>{
                if (rowItem.status==1) return 'red';
                return ''
            },
            customFormater:{
                statusFormat:(fieldVal: any) =>{
                    switch (parseInt(fieldVal)){
                        case 0:
                            return '正常';
                            break;
                        case 1:
                            return '停用';
                            break;
                    }
                }
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        }); 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
               // console.log(data)
            },
            gridFocus:(gridAction: any,printTable: any)=>{
               // console.log('foucts')
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
                this.instanceRefs.printVisabled!.value = false
 
            }
        })  
    }
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_Company_Tab',fieldName: 'max(idcode)',condition:''});
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
        this.dataSource.setFieldValue('RelationCode',0);
        this.dataSource.setFieldValue('SalesMan',0);
        this.dataSource.setFieldValue('SettlementType',0);
        this.dataSource.setFieldValue('AccountDay',0);
        this.dataSource.setFieldValue('PriceLevel',0);
        this.dataSource.setFieldValue('watchorder',1);
        this.dataSource.setFieldValue('notAddPrice',0);
        this.dataSource.setFieldValue('pcode',0);
        this.dataSource.setFieldValue('dr',1);
        this.dataSource.setFieldValue('decimalBit',2);
        this.dataSource.setFieldValue('SaleFromQuotePrice',0);
        this.dataSource.setFieldValue('DownUnitType',0);
        this.dataSource.setFieldValue('LookProductType',0);
        this.dataSource.setFieldValue('ChangeAblePrice',0);
        this.dataSource.setFieldValue('notAddPrice',0);
        this.dataSource.setFieldValue('QualityGrade',0);
        this.dataSource.setFieldValue('LossAllocation',1);
        this.fieldToColIndex('name');
        return super.afterInsert(rowItem,rowIndex)
    }
    protected async beforeDelete(rowItem: TableRowDataType): Promise<boolean> {
        const fieldValue = await this.instanceRefs.detailDataSource.getFieldValueFormServer({fieldName: 'count(pcode)',condition:`pcode='${rowItem.idcode}'`});
        return new Promise((resolve, reject)=>{
            if (fieldValue!=0)
                MessageBox.warning({title:'警告', content:'客户存在报价数据，不能删除',showCancel:false})
            resolve(fieldValue==0)
        })
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'name'){
            const _DataisExist = await dataIsExist(this.dataSource.apiPath, `idcode >90000 and name='${data.fieldValue.toString()}'`);
           if (_DataisExist){
               MessageBox.warning({
                   title:'出错',
                   content:`客户名称"${data.fieldValue}"已存在，不可以重复`,
                   messageType:'warning',
                   showCancel: false
               })
               return false
           }
       }
        return super.onSetFieldValue(data,rowItem)
    }
}

export class TDetailGridAction extends TGridAction<CustomerInstanceRefs>{
    private maxKeyValue = -1;
    public PrintDatas = [];
    public BasicBarItems=[ 
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
            dropDown:false},
        {title:'<F9>打印导出',
            idCode:'_Offer',
            index:2,
            dropDown:false}
    ] 
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
            dataType: 'number',
            fieldName: 'SerialNumber',//字段名
            width: 80,//宽度
            title: '序号',//标题
            align: 'center'
        },{
            fieldName: 'CustomerProcudeCode',//字段名
            width: 100,//宽度
            title: '客编码',//标题
            readonly: true,
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
            dataType: 'number',//数据类型
            fieldName: 'saleType',//字段名
            width: 100,//宽度
            title: '商品类型',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [{idcode:0,name:'称重(斤)'},{idcode:1,name:'按量'},{idcode:2,name:'按量+称重'},{idcode:3,name:'按件'},{idcode:4,name:'称重(公斤)'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'QualityGrade',//字段名
            width: 100,//宽度
            title: '质量',//标题
            sort: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [{idcode:0,name:'不定'},{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'defaultshippercode',//字段名
            width: 150,//宽度
            title: '来源',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'ShipperDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               //dropListDatas: this.commonDatas.value.ShipperDatas
            },
        },{
            fieldName: 'inprice',//字段名
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '进价',//标题
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
            readonly: true
        }
    ]
    constructor(dataSource: DataSourceType,instanceRefs: CustomerInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.Columns = this.ListColumns;
        this.toolsBarItems= this.BasicBarItems;
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'basicViews-Customer-detail',sep: true,expand: false,opt:false,parger:true,readOnly: true
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
            indicatorButtonEvent: async (data: any)=>{
                const _SelectRes = await WinProductSelect.show({
                    title:'商品选择',
                    defaultDatas:[]
                })
                if (_SelectRes.action === ModalResultEnum.mrConfirm){
                    this.changeRowValue(_SelectRes.data)
                }
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                WinPriceLogs.show({
                    title:'价格变动日志',
                    customerCode:this.instanceRefs.headerData.idcode,
                    productCode:rowdata.productcode,
                    saleType:rowdata.saleType
                })
            }
        })
    }
    
    public  changeRowValue = async (data: any)=>{
        const _DataisExist = await dataIsExist(this.dataSource.apiPath, `Pcode=${this.instanceRefs.headerData.value.idcode} and ProductCode=${data.idcode}`);
        if (_DataisExist){
            MessageBox.warning({
                title:'出错',
                content:`编码${data.idcode}已存在，不可以重复`,
                messageType:'warning',
                showCancel: false
            })
            return false
        }
        const _DataSource = this.dataSource;
        _DataSource.setFieldValue('productcode',data.idcode);
        _DataSource.setFieldValue('barcode',data.barcode);
        _DataSource.setFieldValue('name',data.name);
        _DataSource.setFieldValue('spec',data.spec);
        _DataSource.setFieldValue('unit',data.unit);
        _DataSource.setFieldValue('inprice',data.inprice);
        _DataSource.setFieldValue('price',data.price1);
        return false
    }
    protected async headerUpdate(): Promise<boolean> {/**保存头部*/
        return this.instanceRefs.headerGridAction?.update(false)||false
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
            if (res.length==1){return  this.changeRowValue(res[0])}
            const _SelectRes = await WinProductSelect.show({title:'商品选择',defaultDatas: res})
            if (_SelectRes.action === ModalResultEnum.mrConfirm){return  this.changeRowValue(_SelectRes.data)}
            return false
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
    }

    public async offerLoad(){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要调入所有商品'
        })
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在调入...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'offerLoad',{
            CustomerCode: this.instanceRefs.headerData.value.idcode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async offerCopy(CurCustomerCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要复制报价'
        })
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在复制...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'offerCopy',{
            CustomerCode: this.instanceRefs.headerData.value.idcode,
            CurCustomerCode: CurCustomerCode
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
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在清空...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'offerClear',{
            CustomerCode: this.instanceRefs.headerData.value.idcode,
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public  async openQuotedPrice(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        this.instanceRefs.detailOfferDataSource.getParams.condition = '';
        this.instanceRefs.detailOfferDataSource.getParams.mustCondition = `Pcode=${this.instanceRefs.headerData!.value.idcode}`;
        const res = await this.instanceRefs.detailOfferDataSource.open(
            {pageSize:0,curPage:1,total:1}
        )
        if (res){
            this.instanceRefs.detailOfferDataSource.dataSet = $Utils.arrGroup(this.instanceRefs.detailOfferDataSource.dataSet,'catename')
            let _LineObj = {} as any;
            let _LineArr = [] as any;
            this.instanceRefs.detailOfferDataSource.dataSet.map((item: any)=>{
                item.children = $Utils.datasRowToColumns(item.children,3,'sep');
            })
           // this.PrintDatas = $Utils.arrPaging(this.thisInstance.detailOfferDataSource.dataSet,20,1)
           this.instanceRefs.detailOfferDataSource.dataSet.map((item: any)=>{

           })
           const _TempArr = this.instanceRefs.detailOfferDataSource.dataSet;
           let _TempDatas = []
           for (let i=0;i<_TempArr.length;i++){
                _TempDatas.push(_TempArr[i])
                _TempDatas = _TempDatas.concat(_TempArr[i].children)
           }
          //  console.log('wwwww',_TempDatas)
            this.instanceRefs.detailOfferDataSource.dataSet = _TempDatas
            //纵向序号，
           /* this.instanceRefs.detailOfferDataSource.dataSet.map((item: any)=>{ 
                 _LineArr = []
                const rowNum = Math.ceil(item.children.length/3);//行数
                for (let i=0;i<rowNum;i++){
                     _LineObj = {}
                    _LineObj['unit1'] =item.children[i]['unit'];
                    _LineObj['sep1'] = i+1;
                    _LineObj['name1'] = item.children[i]['name'];
                    _LineObj['spec1'] = item.children[i]['spec'];
                    _LineObj['price1'] = item.children[i]['price'];

                    if (i+rowNum < item.children.length){
                        _LineObj['unit2'] =item.children[i+rowNum]['unit'];
                         _LineObj['sep2'] = i+rowNum+1;
                        _LineObj['name2'] = item.children[i+rowNum]['name'];
                        _LineObj['spec2'] = item.children[i+rowNum]['spec'];
                        _LineObj['price2'] = item.children[i+rowNum]['price'];
                    }
                   
                    if (i+rowNum*2 < item.children.length){
                        _LineObj['unit3'] =item.children[i+rowNum*2]['unit'];
                        _LineObj['sep3'] = i+rowNum*2+1;
                        _LineObj['name3'] = item.children[i+rowNum*2]['name'];
                        _LineObj['spec3'] = item.children[i+rowNum*2]['spec'];
                        _LineObj['price3'] = item.children[i+rowNum*2]['price'];
                    }
                     _LineArr.push(_LineObj)
                }
               
                item.children = _LineArr
            })*/
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    public ToolsBarItemClick(data: any){
        switch (data.idCode){
            case '_List':
                this.instanceRefs.printVisabled!.value = false;
                this.toolsBarItems= this.BasicBarItems;
                break;
             case '_Load':
                this.offerLoad()
                break;
            case '_Copy':
                this.instanceRefs.config!.value.open = true;
                break;
             case '_ClearOffer':
                this.offerClear()
                break;
            case '_Offer':
                this.instanceRefs.printVisabled!.value = true;
                this.toolsBarItems= this.PrintBarItems;
                this.openQuotedPrice();
                break;
            case '_Print':
                this.instanceRefs.printDomEx?.value.beforePrint().then(()=>{
                    setTimeout(()=>{
                        Print(this.instanceRefs.printDomEx.value.printDom);
                        this.instanceRefs.printDomEx.value.startPrint = false;
                    },100)
                })
                break;
            case '_Export':
                this.instanceRefs.printDomEx?.value.beforePrint().then(()=>{
                    setTimeout(()=>{
                        ExportTableToExcel(this.instanceRefs.printDomEx.value.printDom);
                        this.instanceRefs.printDomEx.value.startPrint = false;
                    },100)
                })
                break;
        }
    }
}