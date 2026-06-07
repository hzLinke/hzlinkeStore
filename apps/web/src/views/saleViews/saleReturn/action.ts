import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TSalesListGridAction,TSalesDetailGridAction} from "../SaleAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
import type { SaleReturnInstanceRefs } from './types'
import useAppStore from '@/stores';

export class TListGridAction extends TSalesListGridAction<SaleReturnInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleReturnInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 4;
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0'
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
        this.Columns = [{
            dataType: 'text',//数据类型
            fieldName: 'billnumber',//字段名
            width: 150,//宽度
            title: '单号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'orderbillnumber',//字段名
            width: 150,//宽度
            title: '订单号',//标题
            readonly: true
        },{
            dataType: 'text',//数据类型
            fieldName: 'CustomerOrderId',//字段名
            width: 150,//宽度
            title: '客户单号',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'Pcode',//字段名
            width: 150,//宽度
            title: '项目名称',//标题
            sort: false,
            inputType: 'drop',
            readonly: true,
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
            fieldName: 'customercode',//字段名
            width: 200,//宽度
            title: '客户',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|shortname|name',
                displayFieldWidths:'50|100|200',
                dropListDatasName:'CustomerDatas',
               // dropListDatas: this.commonDatas.value.CustomerDatas
               onFilter:(filterValue: string,dropListDatas: any[])=>{
                    return dropListDatas.filter((item: any)=>{
                        return item.shortname.indexOf(filterValue)!=-1||item.name.indexOf(filterValue)!=-1
                    })
                }
            },
            indicatorButtonEventName:'indicatorButtonEvent',
            indicatorButtons:[{iconType:'more'}],
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
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
            width: 80,//宽度
            title: '帐期',//标题
            sort: false,
            inputType: 'number',
           
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
            fieldName: 'DriverCode',//字段名
            width: 80,//宽度
            title: '司机',//标题
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
            dataType: 'datetime',//数据类型
            fieldName: 'deliveryAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            readonly: false,
            title: '送货日',//标题
        },{
            fieldName: 'ExamineUserCode',//字段名
            width: 80,//宽度
            title: '审核',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
               // dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'ExamineAt',//字段名
            width: 120,//宽度
            title: '审核日',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'costMoney',//字段名
            width: 120,//宽度
            title: '成本金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'costMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'saleMoney',//字段名
            width: 120,//宽度
            title: '销售金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'saleMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'profit',//字段名
            width: 120,//宽度
            title: '毛利',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'saleMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'type',//字段名
            width: 80,//宽度
            title: '类型',//标题
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'后台'},{idcode:1,name:'自助'},{idcode:2,name:'拆单'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 80,//宽度
            title: '状态',//标题
            customFormater:'statusFormat',
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'待送货'},{idcode:1,name:'待收款'},{idcode:2,name:'完成'}]
            },
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleReturn',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "orderbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "customerorderid",caption: "客户单号",filterType: "fsLike"},
                {fieldName: "customercode",caption: "客户",filterType: "fsIn",inList:this.commonDatas.CustomerDatas},
                {fieldName: "pcode",caption: "项目名称",filterType: "fsIn",inList:this.commonDatas.ProjectDatas},{fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
    }
}

export class TDetailGridAction extends TSalesDetailGridAction<SaleReturnInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleReturnInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 4;
        this.dataSource.getParams.mustCondition = 'Status=0';
        this.toolsBarItems.push({
            title:'<F8>收款',
            idCode:'_ResMoney',
            index:3,
            dropDown:false
        })
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '货号',//标题
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
            dataType:'number',
            fieldName: 'downwg',//字段名
            width: 60,//宽度
            title: '个重',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center',
            customFormater:'unitFormat'
        },{
            dataType: 'number',//数据类型
            fieldName: 'QualityGrade',//字段名
            width: 100,//宽度
            title: '质量',//标题
            sort: true,
            readonly: true,
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
            dataType: 'number',
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '下单量',//标题
            format:'0.00',
            readonly: true,
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'//计算方法
            }
        },{
            dataType: 'number',
            fieldName: 'numex',//字段名
            width: 80,//宽度
            title: '结算量',//标题
            align: 'right',
            format:'0.00',
            numberFlg:'-',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numExCalc'//计算方法
            }
        },{
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '进价',//标题
            format:'0.0000',
            numberFlg: '+',
            align:'right',
            sort: false,
            readonly: false
        },{
            fieldName: 'saleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            numberFlg:'+',
            sort: false
        },{
            fieldName: 'money',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '金额',//标题
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'calculaMoney',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'moneyCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
            
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleReturnDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopSubmit: true
            }
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                if (_fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(_rowIndex);
                    return 
                }
                await this.selectSaleBatch(rowdata.customercode, rowdata.productcode, rowdata.qualitygrade, _rowIndex)
            }
                
        });    
    }
}