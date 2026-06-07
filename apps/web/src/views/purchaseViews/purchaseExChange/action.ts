import $Utils from '@v4x/utils/lkxUtil'
import {TPurchasesListGridAction,TPurchasesDetailGridAction} from "../PurchaseAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
import type { PurchaseViewsInstanceRefs } from '../types'
import useAppStore from '@/stores';

export class TListGridAction extends TPurchasesListGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 2;
        this.dataSource.getParams.defaultCondition = 'MrUserCode=0'
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
        this.Columns = [{
            dataType: 'text',
            fieldName: 'billnumber',
            width: 150,
            title: '单号',
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',
            fieldName: 'orderbillnumber',
            width: 150,
            title: '订单号',
            readonly: true
        },{
            fieldName: 'shippercode',
            width: 200,
            title: '货商',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'ShipperDatas',
            },
            indicatorButtonEventName:'indicatorButtonEvent',
            indicatorButtons:[{iconType:'more'}],
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            dataType: 'datetime',
            fieldName: 'deliveryAt',
            width: 120,
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日',
            readonly: false,
        },{
            fieldName: 'MakingUserCode',
            width: 80,
            title: '采购员',
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'UserDatas',
            }
        },{
            fieldName: 'MrUserCode',
            width: 80,
            title: '收货人',
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'UserDatas',
            }
        },{
            dataType: 'datetime',
            fieldName: 'MrAt',
            width: 120,
            title: '收货时间',
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'number',
            fieldName: 'costMoney',
            width: 120,
            title: '金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'saleMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'status',
            width: 80,
            title: '状态',
            customFormater:'statusFormat',
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'待送货'},{idcode:1,name:'完成'}]
            },
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurChaseViews-PurchaseExchange',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "orderbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "shippercode",caption: "货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.mrusercode==0
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.mrusercode==0
            }
        })
    }
}

export class TDetailGridAction extends TPurchasesDetailGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 'Receiving';
        this.dataSource.getParams.mustCondition = 'Status=0'
        this.Columns = [{
            dataType: 'number',
            fieldName: 'productcode',
            width: 80,
            title: '货号',
            allowInputString: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],
            indicatorButtonEventName:'indicatorButtonEvent'
        },{
            fieldName: 'barcode',
            width: 100,
            title: '条码',
            readonly: true,
        },{
            fieldName: 'name',
            width: 200,
            title: '品名',
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            fieldName: 'spec',
            width: 100,
            title: '规格',
            readonly: true,
        },{
            dataType:'number',
            fieldName: 'downwg',
            width: 60,
            title: '个重',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'unit',
            width: 60,
            title: '单位',
            readonly: true,
            sort: false,
            align:'center',
            customFormater:'unitFormat'
        },{
            dataType: 'number',
            fieldName: 'stocknum',
            width: 80,
            title: '可用量',
            align: 'right',
            format:'0.00',
            numberFlg:'none',
            readonly: true
        },{
            dataType: 'number',
            fieldName: 'numex',
            width: 80,
            title: '数量',
            align: 'right',
            format:'0.00',
            numberFlg:'none',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numExCalc'
            }
        },{
            fieldName: 'costprice',
            dataType: 'number',
            width: 80,
            title: '单价',
            format:'0.0000',
            align:'right',
            numberFlg:'+',
            sort: false
        },{
            fieldName: 'money',
            fieldKind: 'fkCalculated',
            dataType: 'number',
            width: 100,
            title: '金额',
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'calculaMoney',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'moneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注/做法',
            sort: false,
            indicatorButtons:[{iconType:'more'}],
            indicatorButtonEventName:'indicatorDoMethodButtonEvent'
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurChaseViews-PurchaseExChangeDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
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
    }

}
