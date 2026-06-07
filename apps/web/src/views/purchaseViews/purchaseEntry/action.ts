import $Utils from '@v4x/utils/lkxUtil'
import {TPurchasesListGridAction,TPurchasesDetailGridAction} from "../PurchaseAction"
import { DataSourceType } from '@v4x/ui';
import type { PurchaseViewsInstanceRefs } from '../types'
import useAppStore from '@/stores';

export class TListGridAction extends TPurchasesListGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 2
        this.toolsBarItems.push({
            title:'<F8>付款',
            idCode:'_PayMoney',
            index:3,
            dropDown:false
        })
        this.dataSource.getParams.mustCondition = 'mrUserCode<>0';
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0';
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
            readonly: true,
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
            readonly: true,
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
            fieldName: 'ExamineUserCode',
            width: 80,
            title: '入帐人',
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: this.commonDatas.UserDatas
            }
        },{
            dataType: 'datetime',
            fieldName: 'ExamineAt',
            width: 120,
            title: '入帐日',
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
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'待接单'},{idcode:2,name:'待送货'},{idcode:4,name:'待付款'},{idcode:3,name:'待入帐'},{idcode:5,name:'完成'}]
            },
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'PurChaseViews-PurchaseEntry',sep: true,expand: false,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "orderbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "shippercode",caption: "货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "入帐日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
    }
}

export class TDetailGridAction extends TPurchasesDetailGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 2  
        this.dataSource.getParams.mustCondition = 'Status=0'
        this.Columns = [{
            dataType: 'number',
            fieldName: 'productcode',
            width: 80,
            title: '货号',
            readonly: true,
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
            title: '换子',
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
            fieldName: 'num',
            width: 80,
            title: '下单量',
            format:'0.00',
            readonly: true,
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'numex',
            width: 80,
            title: '结算量',
            align: 'right',
            readonly: true,
            format:'0.00',
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
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'PurChaseViews-PurchaseEntryDetail',sep: true,expand: true,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopSubmit: true,
                alopInsert: false,
                alopDelete: false,
            }
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  ;
    }
}

export class TPackGridAction extends TPurchasesDetailGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
                fieldName: 'customercode',
                width: 250,
                title: '订货单位',
                inputType: 'drop',
                readonly: true,
                sort: false,
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',
                    displayFieldName: 'name',
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|200',
                    dropListDatas: this.commonDatas.CustomerDatas
                },
                indicatorButtonEventName:'indicatorButtonEvent',
                indicatorButtons:[{iconType:'more'}],
                footers: {
                    align: 'center',
                    valueType: 'fvtCount',
                    calculationer: 'countCalc'
                }
            },{
            dataType: 'number',
            fieldName: 'num',
            width: 80,
            title: '下单量',
            format:'0.00',
            align: 'right',
            sort: false,
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'numex',
            width: 80,
            title: '结算量',
            align: 'right',
            format:'0.00',
            sort: false,
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
            format:'0.00',
            align:'right',
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
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'PurChaseViews-PurchaseEntryPackDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                calculaMoney:(rowItem: any): number=>{
                    return rowItem.numex * rowItem.costprice
                }
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return  datas.length
                },
                numCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                numExCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'numex')
                },
                moneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money')
                    return  _Money
                },
            },
        });
    }
}