
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil' 
import {TSalesListGridAction,TSalesDetailGridAction} from "../SaleAction"
import { DataSourceType, MessageBox, ModalResultEnum, TableRowDataType, WinModal } from '@v4x/ui';
import type { SaleOrderInstanceRefs } from './types'
import { WinCopyMenu, WinDoMethod, WinMateWin } from '@/components'
import { WinPriceLogs } from '@/components/WinPriceLogs';
import useAppStore from '@/stores';

export class TListGridAction extends TSalesListGridAction<SaleOrderInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleOrderInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 17;
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
                displayFieldWidths:'50|80|350',
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
            fieldName: 'saleMoney',//字段名
            width: 120,//宽度
            title: '订货金额',//标题
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
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'待送货'},{idcode:2,name:'完成'}]
            },
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleOrder',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "customerorderid",caption: "客户单号",filterType: "fsLike"},
                {fieldName: "customercode",caption: "客户",filterType: "fsIn",inList:this.commonDatas.CustomerDatas},
                {fieldName: "pcode",caption: "项目名称",filterType: "fsIn",inList:this.commonDatas.ProjectDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "MakingUserCode",caption: "制单人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "deliveryat",caption: "送货日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "MakingAt",caption: "制单日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
    }
}

export class TDetailGridAction extends TSalesDetailGridAction<SaleOrderInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleOrderInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 17;
        this.toolsBarItems.push({
            title:'<F8>复制菜普',
            idCode:'_CopyFoodMenu',
            index:1,
            dropDown:false
        },{
            title:'<F9>撤销分流',
            idCode:'_CancelAccept',
            index:1,
            dropDown:false
        },{
            title:'<F10>智能匹配',
            idCode:'_mate',
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
            dataType:'number',
            fieldName: 'Weight',//字段名
            width: 60,//宽度
            title: '净重',//标题
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
            numberFlg: '+',
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
            readonly: true,
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
            fieldName: 'dr',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '折扣',//标题
            format:'0.00%',
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
            fieldName: 'baseprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            numberFlg: '+',
            align:'right',
            sort: false,
        },{
            fieldName: 'saleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '结算单价',//标题
            format:'0.00',
            align:'right',
            sort: false,
            readonly: true
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
            fieldName: 'DisTotal',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '应配量',//标题
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'calculaDisTotal',

        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注/做法',//标题
            sort: false,
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorDoMethodButtonEvent'
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleOrderDetail',sep: true,expand: true,opt:false,parger:false,readOnly: false,
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
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                
                if (_fieldName == 'baseprice'){
                    WinPriceLogs.show({
                        title:'价格变动日志',
                        width: 1100,
                        height:600, 
                        customerCode:this.instanceRefs.headerData?.value?.customercode,
                        productCode:rowdata.productcode,
                        saleType:rowdata.saleType
                    })
                }
                if (_fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(_rowIndex);
                 }
             }
        });   
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

    /**撤消分流 
     * FromCustomerCode: 来源客户编码
     * fromDeliveryAt：  来源日期
    */
    public async CancelAutoAccept(){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要取消分流？\n(只有对应采购订单无审核时有效)'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在撤销...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'CancelAutoAccept',{
            BillNumber: this.instanceRefs.headerData?.value?.billnumber
        })   
        if (submitRes.errCode==0){
            MessageBox.information({
                title:'信息',
                content:'分流已取消，可以正常操作',
                showCancel: false
            }) 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async ToolsBarItemClick(data: any){
        switch (data.idCode) {
            case '_CopyFoodMenu':
                if (+this.instanceRefs.headerData?.value?.examineusercode !==0) return
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
            case '_CancelAccept':
                if (+this.instanceRefs.headerData?.value?.examineusercode ===0) return
                this.CancelAutoAccept()
                break;
            case '_mate':
                if (+this.instanceRefs.headerData?.value?.examineusercode !==0) return
                 await this.headerUpdate()
                const result = await WinMateWin.show({
                    customercode: this.instanceRefs.headerData?.value?.customercode,
                    billnumber: this.instanceRefs.headerData?.value?.billnumber
                })
                if (result.action !== ModalResultEnum.mrConfirm) return false
                this.open()
                break;
            case '_Info':
                console.log('特殊信息');
                break;
            default:
                super.ToolsBarItemClick(data)
                break;
        }
    }

}