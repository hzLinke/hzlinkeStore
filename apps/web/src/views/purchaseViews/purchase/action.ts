import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TPurchasesListGridAction,TPurchasesDetailGridAction} from "../PurchaseAction"
import { DataSourceType, MessageBox, TableRowDataType, SetFieldValueType, ModalResultEnum } from '@v4x/ui';
import type { PurchaseViewsInstanceRefs } from '../types'
import { WinBatchInSelect,  WinPackDetail } from '@/components';
import useAppStore from '@/stores';

export class TListGridAction extends TPurchasesListGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 0;
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
            fieldName: 'MakingAt',
            width: 120,
            title: '制单日',
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
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
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'待接单'},{idcode:2,name:'待送货'},{idcode:4,name:'待付款'},{idcode:3,name:'待入帐'},{idcode:5,name:'完成'}]
            },
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurChaseViews-Purchase',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "orderbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "shippercode",caption: "货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "mrAt",caption: "收货日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.mrusercode==0&&row.orderbillnumber==''
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.mrusercode==0
            }
        });
    }
}

export class TDetailGridAction extends TPurchasesDetailGridAction<PurchaseViewsInstanceRefs>{
   
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 0;
        this.toolsBarItems.push({
            title:'<F8>付款',
            idCode:'_PayMoney',
            index:3,
            dropDown:false
        },{
            title:'<F9>清空',
            idCode:'_ClearData',
            index:3,
            dropDown:false
        })
        this.dataSource.getParams.mustCondition = 'Status=0'
        if (!+this.commonDatas.SysParamDatas[0].purchasestoplustype){
            this.Columns = [{
                dataType: 'number',
                fieldName: 'productcode',
                width: 80,
                title: '货号',
                readonly: false,
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
                fieldName: 'num',
                width: 80,
                title: '下单量',
                format:'0.00',
                readonly: false,
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
                readonly: false,
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
                readonly: false,
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
        } else {
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
                fieldName: 'opennum',
                width: 80,
                title: '数量|开单量',
                format:'0.00',
                align: 'right',
                numberFlg: '+',
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'openNumCalc'
                }
            },{
                dataType: 'number',
                fieldName: 'boxnum',
                width: 80,
                title: '数量|件数',
                align: 'right',
                numberFlg: '+',
            },{
                dataType: 'number',
                fieldName: 'packlose',
                width: 80,
                title: '数量|框损',
                format:'0.00',
                align: 'right',
                numberFlg: '+',
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'packloseCalc'
                }
            },{
                dataType: 'number',
                fieldName: 'expense',
                width: 80,
                title: '数量|费用',
                align: 'right',
                format:'0.00',
                numberFlg:'+',
                readonly: true,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'ExpenseCalc'
                }
            },{
                dataType: 'number',
                fieldName: 'numex',
                width: 80,
                title: '数量|实量',
                align: 'right',
                format:'0.00',
                numberFlg:'+',
                readonly: true,
                footers: {
                    align: 'right',
                    valueType: 'fvtSum',
                    calculationer: 'numExCalc'
                }
            },{
                fieldName: 'opencostprice',
                dataType: 'number',
                width: 80,
                title: '单价|开单单价',
                format:'0.0000',
                align:'right',
                numberFlg:'+',
                sort: false
            },{
                fieldName: 'costprice',
                dataType: 'number',
                width: 80,
                title: '单价|实际单价',
                format:'0.0000',
                align:'right',
                readonly: true,
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
                readonly: false,
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
        }
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PurChaseViews-PurchaseDetail',sep: true,expand: false,opt:false,parger:false,readOnly: true,
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
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                if (!rowdata.productcode) return;
                const res = await this.update(false)
                if (!res) return;
                if (fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(rowIndex);
                    return;
                }
                const PackRes = await WinPackDetail.show({
                    title:'商品去向明细',
                    width: '80%',
                    height: '80%',
                    headerDatas: this.instanceRefs.headerData?.value,
                    deliveryAt: this.instanceRefs.headerData?.value.deliveryat,
                    billnumber: this.instanceRefs.headerData?.value.orderbillnumber,
                    productCode: rowdata.productcode,
                    saleType: rowdata.saletype,
                    qualityGrade: rowdata.qualitygrade,
                    billType: 'purchase',
                    //batchNumber: rowdata.batchnumber,
                })
                if (PackRes.action !== ModalResultEnum.mrConfirm){
                    return
                }
                this.open()
                return
            }
        });
    }
    protected async beforedEdit(rowItem: TableRowDataType,fieldName: string): Promise<boolean> {
        const res = true;
        return new Promise((resolve, reject)=>{
            resolve(res)
        })
    }
    protected async beforeDelete(rowItem: TableRowDataType): Promise<boolean> {
        const res = rowItem.detail?rowItem.detail.length==0:true;
        if (!res){
            setTimeout(() => {
                MessageBox.warning({
                    title:'警告',
                    content:'存在商品打包明细的情况，请双击对应行，进入打包明细修改',
                    showCancel: false
                })
            }, 50);
        }
        return new Promise((resolve, reject)=>{
            resolve(res)
        })
    }

    public async ToolsBarItemClick(data: any){
        if (data.idCode == '_ClearData'){
            if (this.instanceRefs.headerData?.value?.examineusercode!==0) return false 
            const questionRes = await MessageBox.question({
                title:'提问',
                content: '是否清空收货单数据？(清空后数据将退回采购汇总)',
            })
            if (questionRes.action !== ModalResultEnum.mrConfirm) return false 
            await $api.comonRequest(this.dataSource.apiPath,'clear',{ billnumber: this.instanceRefs.headerData?.value.billnumber})
            this.open()
            return
        }
        super.ToolsBarItemClick(data)
    }

    public async submit(submitType: number){
        /*if (submitType == 1){
           const res = await this.update(false)
            if (!res) return;
            const _Params =  {
                procName:'Sp_GetPurchaeBatchNotMatch',
                procParmars:{BillNumber: this.instanceRefs.headerData?.value?.billnumber}
            }
            const BatchRes = await $api.comonRequest('/masterApi/PublicApi/','getFromProc',_Params);
            if (BatchRes&&BatchRes.errCode==0&&BatchRes.datas.length>0){
                await WinBatchInSelect.show({
                    title:'批次成本匹配',
                    billType: 'purchase',
                    position: 'right',
                    billNumber: this.instanceRefs.headerData?.value?.billnumber,
                    shipperCode: this.instanceRefs.headerData?.value?.shippercode,
                    defaultDatas: BatchRes?.datas || []
                })
            }
        }*/
        return super.submit(submitType)
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
            numberFlg:'+',
            sort: false,
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
            numberFlg:'+',
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
            id:'PurchaseViews-PurchasePackDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopInsert: false
            }
        }); 
        this.Methods =  $Utils.deepObjectMerge(this.Methods,{
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
    protected async beforedEdit(): Promise<boolean> {
        return new Promise((resolve, reject)=>{
            resolve(true)
        })
    }
    public async submit(submitType: number){
        const submitRes = await super.submit(submitType);
        if (submitRes && submitRes.errCode==0){
            const headerData = this.instanceRefs.headerData?.value;
            if (headerData){
                headerData.mrat = $Utils.getDate();  
            }
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
}