import {
    TableRowDataType,
    DataSourceType,
    WinModal,
} from '@v4x/ui';
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil' 
import {TSalesDetailGridAction} from "../SaleAction"
import {MessageBox, ModalResultEnum} from '@v4x/ui'
import { WinCopyMenu, WinDoMethod, WinMergeSelect } from '@/components'
import {useAppStore} from '@/stores';
import { SaleOrderAddInstanceRefs } from './types';

export class TDetailGridAction extends TSalesDetailGridAction<SaleOrderAddInstanceRefs>{
    public MergeList = [];
    constructor(dataSource: DataSourceType, instanceRefs: Partial<SaleOrderAddInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.billType = 171;
        this.toolsBarItems.push({
            title:'<F8>复制菜普',
            idCode:'_CopyFoodMenu',
            index:1,
            dropDown:false
        })
        this.toolsBarItems.push({
            title:'<F9>清空数据',
            idCode:'_Clear',
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
            title: '备注/做法',//标题
            sort: false,
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorDoMethodButtonEvent'
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-SaleOrderAdd',sep: true,expand: false,opt:false,parger:false,readOnly: false,
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
                if (_fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(_rowIndex);
                }
            }
        });   
    }

    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.instanceRefs.headerData?.value.customercode == 0){
            MessageBox.error({
                title:'提示',
                content:  '请指定客户....',
                showCancel: false
            })
            updateRes = false;
        }
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const userCode = useAppStore().loginDatas.idcode;
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'isnull(max(RIGHT(Idkey,4)),0)+1',condition:`userCode='${userCode}'`});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        super.afterInsert(rowItem,rowIndex)
        const userCode = useAppStore().loginDatas.idcode;
        this.dataSource.setFieldValue('idKey',userCode+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('usercode',userCode);
        this.dataSource.setFieldValue('num',0);
        this.dataSource.setFieldValue('numex',0);
        this.dataSource.setFieldValue('replaceNumEx',0);
        this.dataSource.setFieldValue('saleprice',0);
        this.dataSource.setFieldValue('customercode',this.instanceRefs.headerData?.value.customercode);
        this.dataSource.setFieldValue('downUnitType',this.instanceRefs.headerData?.value.downunittype); 
        this.fieldToColIndex('productcode') ;
        return new Promise((resolve, reject)=>{
            resolve(true)
        })
    }
    public async submit(submitType: number){
        let UpdateType = 1;
        let CurBillNumber = ''
        if (!this.TableConfig.allowedOperations?.alopSubmit) return;
        const updateRes = await this.update(false)
        if (!updateRes) return;
        const res = await MessageBox.question({
            title:'提问',
            content:  '是否要审核数据，审核后将清空临时数据'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        const _List = await $api.comonRequest(this.dataSource.apiPath,'getOrderList',{
            DeliveryAt: this.instanceRefs.headerData.value.deliveryat,
            CustomerCode: this.instanceRefs.headerData.value.customercode
        })  
        if (_List.datas.length>0){
            const result = await WinMergeSelect.show({
                listDatas: _List.datas
            })
            if (result.action === ModalResultEnum.mrConfirm) {
                UpdateType = 0
                CurBillNumber = result.data.billnumber
            }
            
            const submitRes = await this.submitOrderAdd(UpdateType, CurBillNumber)
            return submitRes
        } 
        const submitRes = await this.submitOrderAdd(1,'')
        return submitRes;
    }
    public async submitOrderAdd(UpdateType: number,CurBillNumber: string){
        MessageBox.loading({
            moreText: '正在加单...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'submit',{
            CurBillNumber: CurBillNumber,
            DeliveryAt: this.instanceRefs.headerData.value.deliveryat,
            CustomerCode: this.instanceRefs.headerData.value.customercode,
            UserCode:this.instanceRefs.userCode,
            UpdateType: UpdateType
        })   
        if (submitRes.errCode==0){
            this.dataSource.dataSet = []
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
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
            UserCode: this.instanceRefs.userCode,
            customerCode: this.instanceRefs.headerData.value.customercode,
            deliveryAt: this.instanceRefs.headerData.value.deliveryat,
            fromDeliveryAt: fromDeliveryAt,
            fromCustomerCode: FromCustomerCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    /**
     * 清除临时数据
     * @returns 
     */
    public async SaleOrderTempClear(){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要清空数据',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在清空...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'SaleOrderTempClear',{
            UserCode: this.instanceRefs.userCode,
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async ToolsBarItemClick(data: any){
        switch (data.idCode){
            case '_CopyFoodMenu':
                if (this.checkHeadData()) {
                    const result = await WinCopyMenu.show({
                        customerCode: this.instanceRefs.headerData.value.customercode,
                        defaultDatas:[]
                    })
                    if (result.action !== ModalResultEnum.mrConfirm) return false
                    this.foodMenuCopy(result.data.customerCode, result.data.copyAt)
                }
                break;
            case '_Clear':
                this.SaleOrderTempClear();
                break;
            default:
                super.ToolsBarItemClick(data)
                break;
        }
    }
}