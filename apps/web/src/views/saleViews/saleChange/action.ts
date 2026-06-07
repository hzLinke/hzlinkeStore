import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TSalesListGridAction,TSalesDetailGridAction} from "../SaleAction"
import { DataSourceType, MessageBox, ModalResultEnum, TableRowDataType, SetFieldValueType } from '@v4x/ui';
import type { SaleChangeInstanceRefs } from './types'
import useAppStore from '@/stores';
import { WinCopyMenu } from '@/components';

export class TListGridAction extends TSalesListGridAction<SaleChangeInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleChangeInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 333;
        this.PowerList.allowedEdit  = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedDelete = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedPrint = true
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
                //dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            fieldName: 'MakingUserCode',//字段名
            width: 80,//宽度
            title: '制单',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
                //dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'MakingAt',//字段名
            width: 120,//宽度
            title: '制单日',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
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
                calculationer: 'profitMoneyCalc'//计算方法
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
            id:'SaleViews-Sale',sep: true,expand: false,opt:false,parger:true,readOnly: false,
            
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "orderbillnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "customercode",caption: "客户",filterType: "fsIn",inList:this.commonDatas.CustomerDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "MakingUserCode",caption: "制单人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "MakingAt",caption: "制单日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        }) 
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
            }
        });  
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName === 'customercode'){
            const relationcode = $Utils.getValueFromArray(this.commonDatas.CustomerDatas,'idcode','relationcode',data.fieldValue)
            rowItem.relationcode = relationcode;
        }
        return super.onSetFieldValue(data,rowItem)
    }
    public async copyBillToEx(customerCode: number,startAt: string,endAt: string){
        const res = await MessageBox.question({
            title:'提问',
            content:  '是否要复制指定客户数据到外帐？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在复制...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'CopyBillToEx',{
           CustomerCode : customerCode,
           StartAt: startAt,
           EndAt: endAt
        })   
        if (submitRes.errCode==0){
            this.open(); 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }

    public async singleMerge(targetCustomerCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content:  '是否要合并数据到对应客户,合并后将删除原数据？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在合并...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'SingleMerge',{
           CurCustomerCode : this.dataSource.getFieldValue('customercode'),
           TargetCustomerCode : targetCustomerCode,
           BillNumer: this.dataSource.getFieldValue('billnumber')
        })   
        if (submitRes.errCode==0){
            this.open(); 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }

    public async batchMerge(curCustomerCode: number,targetCustomerCode: number,startAt: string,endAt: string){
        if (curCustomerCode===0){
            MessageBox.warning({
                title:'出错',
                content:  '请指定原客户！'
            });
            return false;
        }
        if (targetCustomerCode===0){
            MessageBox.warning({
                title:'出错',
                content:  '请指定目标客户！'
            });
            return false;
        }
        const res = await MessageBox.question({
            title:'提问',
            content:  '是否要合并数据到对应客户,合并后将删除原数据？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在合并...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'BatchMerge',{
           CurCustomerCode : curCustomerCode,
           TargetCustomerCode : targetCustomerCode,
           StartAt: startAt,
           EndAt: endAt
        })   
        if (submitRes.errCode==0){
            this.open(); 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }

    public async batchClear(customerCode: number,startAt: string,endAt: string){
        if (customerCode===0){
            MessageBox.warning({
                title:'出错',
                content:  '请选择需要清空的客户！'
            });
            return false;
        }
        const res = await MessageBox.question({
            title:'提问',
            content:  '是否要清空对应时段的外帐数据？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在清除...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'BatchClear',{
           CustomerCode : customerCode,
           StartAt: startAt,
           EndAt: endAt
        })   
        if (submitRes.errCode==0){
            this.open(); 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
}

export class TDetailGridAction extends TSalesDetailGridAction<SaleChangeInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleChangeInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 333;
        this.PowerList.allowedEdit  = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedDelete = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedPrint = true
        this.PowerList.allowedExport = true
        this.dataSource.getParams.mustCondition = 'Status=0';
         this.toolsBarItems.push({
            title:'<F8>复制菜普',
            idCode:'_CopyFoodMenu',
            index:1,
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
            title: '换子',//标题
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
            dataType: 'number',
            fieldName: 'stocknum',//字段名
            width: 80,//宽度
            title: '可用量',//标题
            format:'0.00',
            readonly: true,
            sort: false,
            align: 'right',
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
            numberFlg: '+',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numExCalc'//计算方法
            }
        },{
            fieldName: 'replaceNumEx',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '代打数量',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
            sort: false
        },{
            dataType: 'number',
            fieldName: 'distributionnum',//字段名
            width: 80,//宽度
            title: '配货量',//标题
            align: 'right',
            format:'0.00',
            numberFlg: '+',
            readonly: true,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'distributionnumCalc'//计算方法
            }
        },{
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '进价',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
            sort: false,
            readonly: true
        },{
            fieldName: 'cursaleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '原价',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
            sort: false,
            readonly: true
        },{
            fieldName: 'saleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
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
            
        },{
            fieldName: 'catename',//字段名
            width: 100,//宽度
            title: '分类',//标题
            sort: true,
            readonly: true
            
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleDetail',sep: true,expand: true,opt:false,parger:false,readOnly: false,
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
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('status',1);
        this.dataSource.setFieldValue('examineUserCode',0)
        this.fieldToColIndex('productcode');
        return super.afterInsert(rowItem,rowIndex)
    }

    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        return super.onSetFieldValue(data,rowItem)
    }

    /**菜单复制 
     * FromCustomerCode: 来源客户编码
     * fromDeliveryAt：  来源日期
    */
    public async foodMenuCopy(FromCustomerCode: number,fromDeliveryAt: string){
            const res = await MessageBox.question({
            title:'提问',
            content: '是否要复制菜普'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在复制...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'memuCopy',{
            billNumber: this.instanceRefs.headerData?.value?.billnumber,
            customerCode: this.instanceRefs.headerData?.value?.customercode,
            deliveryAt: this.instanceRefs.headerData?.value?.deliveryat,
            fromDeliveryAt: fromDeliveryAt,
            fromCustomerCode: FromCustomerCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async ToolsBarItemClick(data: any){
        switch (data.idCode) {
            case '_CopyFoodMenu':
                if (this.checkHeadData()) {
                    await this.headerUpdate()
                    const result = await WinCopyMenu.show({
                        customerCode: this.instanceRefs.headerData?.value?.customercode,
                        defaultDatas:[]
                    })
                    if (result.action !== ModalResultEnum.mrConfirm) return false
                    this.foodMenuCopy(result.data.customerCode, result.data.copyAt)
                }
                break;
            
            default:
                super.ToolsBarItemClick(data)
                break;
        }
    }
}