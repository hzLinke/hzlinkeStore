import $Utils from '@v4x/utils/lkxUtil'
import {TPurchasesListGridAction,TPurchasesDetailGridAction} from "../PurchaseAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
import type { PurchaseViewsInstanceRefs } from '../types'
import useAppStore from '@/stores';

export class TListGridAction extends TPurchasesListGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 1;
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`;
        this.toolsBarItems.push({
            title:'<F8>付款',
            idCode:'_PayMoney',
            index:3,
            dropDown:false
        })
        this.dataSource.getParams.defaultCondition = 'MrUserCode=0'
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
            fieldName: 'shippercode',
            width: 200,
            title: '货商',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',
                displayFieldName: 'name',
                displayFields:'idcode|shortname|name',
                displayFieldWidths:'50|80|200',
                dropListDatasName: 'ShipperDatas',
                onFilter:(filterValue: string,dropListDatas: any[])=>{
                    const CurArr =  dropListDatas;
                    const arr = CurArr.filter((item: any)=>{
                        return item.shortname.toLowerCase().indexOf(filterValue.toLowerCase())!=-1||item.name.toLowerCase().indexOf(filterValue.toLowerCase())!=-1
                    })
                    return arr
                }
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
        },{
            fieldName: 'MakingUserCode',
            width: 80,
            title: '制单',
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
            title: '退货人',
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
            fieldName: 'MakingAt',
            width: 120,
            title: '制单日',
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'datetime',
            fieldName: 'ExamineAt',
            width: 120,
            title: '审核日',
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
            id:'PurChaseViews-PurchaseRetrun',sep: true,expand: false,opt:false,parger:true,readOnly: false,
           
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "shippercode",caption: "货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   ;
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
        this.billType = 1;
        this.dataSource.getParams.mustCondition = 'Status=0'
        this.toolsBarItems.push({
            title:'<F8>付款',
            idCode:'_PayMoney',
            index:3,
            dropDown:false
        })
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
            fieldName: 'stocknum',
            width: 80,
            title: '可用量',
            align: 'right',
            format:'0.00',
            numberFlg:'none',
            readonly: true
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
            numberFlg:'-',
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
            format:'0.00',
            numberFlg:'+',
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
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurChaseViews-PurchaseRetrunDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true,
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
            expand:(data: any,action: any)=>{
                
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                if (!rowdata.productcode) return;
                const res = await this.update(false)
                if (!res) return;
                if (fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(rowIndex);
                    return;
                }
            }
        })  
    }

}
