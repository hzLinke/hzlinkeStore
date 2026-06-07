
import $api from '@/request/api';
import $Utils, { clearDecimal } from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType, SetFieldValueType, MessageBox, ModalResultEnum, InputBox, WinModal } from '@v4x/ui';
import { WinChangeProduct,WinProductSelect,WinTransferShipper } from '@/components'

export class TAction extends TGridAction{
    private type: string;
    constructor(dataSource: DataSourceType,instanceRefs: any,type = 'order'){ 
        super(dataSource,instanceRefs)
        this.type = type;
        this.Columns = [{
            fieldName: 'billnumber',//字段名
            width: 135,//宽度
            title: '单号',//标题
            readonly: true,
            sort: false
        },{
                fieldName: 'customercode',//字段名
                width: 150,//宽度
                title: '订货单位',//标题
                inputType: 'drop',
                readonly: true,
                sort: false,
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|200',
                    dropListDatas: this.commonDatas.CustomerDatas
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
                fieldName: 'QualityGrade',//字段名
                width: 60,//宽度
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
            dataType: 'number',
            fieldName: 'num',//字段名
            width: 70,//宽度
            title: '下单量',//标题
            format:'0.00',
            align: 'right',
            sort: false,
            numberFlg:'+',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'//计算方法
            }
        },{
            dataType: 'number',
            fieldName: 'numex',//字段名
            width: 70,//宽度
            title: '结算量',//标题
            align: 'right',
            format:'0.00',
            readonly: type=='order'?true:false,
            sort: false,
            numberFlg:'+',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numExCalc'//计算方法
            }
        },{
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 70,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            numberFlg:'+',
            sort: false
        },{
            fieldName: 'money',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 80,//宽度
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
            width: 80,//宽度
            title: '备注/做法',//标题
            sort: false,
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorDoMethodButtonEvent'
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'OrderPackDetail',sep: true,expand: false,
            opt:true,parger:false,readOnly: false,
            optWidth: 280,
            allowedOperations:{
                alopInsert: false
            }
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                if (+row.customercode===0 )
                    return false
                if (row.billnumber==='free' )
                    return false
                if (this.type === 'purchase')
                    return true
                return row.examineusercode==0 
            },
           /* allowDel:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },*/
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
            customFormater:{
                unitFormat:(value: string,rowItem: TableRowDataType)=>{
                    return rowItem.saletype==2?(rowItem.downunit||'')+'/'+(rowItem.unit||''):(rowItem.unit||'')
                }
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
        
        })
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = Math.abs(data.fieldValue as number * rowItem.downwg);
            this.dataSource.setFieldValue('numex',_NumEx,data.editRowIndex);
            return true
        }
        return super.onSetFieldValue(data,rowItem)
    }
    protected async beforedEdit(): Promise<boolean> {
        return new Promise((resolve)=>{
            resolve(true)
        })
    }

    public async transferStock(){
        const curData = this.dataSource.thisRowData
        if (+curData.customercode === 0 || curData.billnumber==='free') return;
        //const $inputBox= this.thisInstance.$inputBox as LkxMessageBoxParamType;
        const res = await InputBox.show({
                title: '转存',
                description:'请输入数量',
                inputType:'number',
                defaultValue: +$Utils.clearDecimal(this.dataSource.getFieldValue('numex')),
                keepExisting: true
        })
        if (res.action == ModalResultEnum.mrConfirm){
            const r = await MessageBox.question({
                title:'提问',
                content:'转存货后，对应客户的商品数量将删除，是否转存？？',
                defaultButton: ModalResultEnum.mrCancel
            })
            if (r.action !== ModalResultEnum.mrConfirm) return;
                try {
                    MessageBox.loading({
                        moreText: '正在处理...',
                        mask: true
                    })
                    const Parmars={
                        PurchaseOrderIdKey      :   curData.idkey, 
                        PurchaseOrderBillNumber :   curData.billnumber, 
                        ProductCode             :   curData.productcode,
                        SaleType                :   curData.saletype,
                        TransferNum             :   Math.abs(res.data),
                        TransferNumEx           :   Math.abs(res.data)
                    }
                    const submitRes = await $api.comonRequest(this.dataSource.apiPath,'transferStock',Parmars)   
                    if (submitRes.errCode==0){  
                        this.open()
                    }  
                } finally {
                    MessageBox.closeAllLoading()
                }
            }
        }
    public async transferShipper(userCode: number){
        const curData = this.dataSource.thisRowData
        if (curData.billnumber==='free') return;
        const res = await WinTransferShipper.show({
            title:'商品转移供货商',
            defaultShipperCode: curData.shippercode,
            defaultCostPrice: +$Utils.clearDecimal(curData.costprice),
            defaultNum: +$Utils.clearDecimal(curData.num),
            keepExisting: true
        })
        if (res.action !== ModalResultEnum.mrConfirm) return;
        const {targetShipperCode ,transferNum ,transferPrice } = res.data
            if (+curData.shippercode === +targetShipperCode){
            MessageBox.error({
                title: '出错',
                content:'目标供货商与源供货商不能相同！',
                showCancel: false
            })
            return;
        }
        try {
            MessageBox.loading({
                moreText: '正在处理...',
                mask: true
            })
            const Parmars={
                PurchaseOrderBillNumber :   curData.billnumber,
                SaleOrderBillNumber     :   curData.saleorderbillnumber,
                ProductCode             :   curData.productcode,
                PurchaseOrderIdKey      :   curData.idkey,
                SaleOrderIdKey          :   curData.saleorderidkey,  
                TargetShipperCode       :   targetShipperCode,     
                Num                     :   +clearDecimal(transferNum),
                NumEx                   :   +clearDecimal(transferNum),
                InPrice                 :   +clearDecimal(transferPrice),
                UserCode                :   userCode
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'transferShipperSingle',Parmars)   
            if (submitRes.errCode==0){  
                const _thisIndex = this.dataSource.activeRowIndex;
            // this.dataSource.dataSet.splice(_thisIndex,1)
            this.open()
            }  
        } finally {
            setTimeout(() => {
                MessageBox.closeAllLoading()
            }, 100);
        }
    }

    public async cancelProduct(){
        const curData = this.dataSource.thisRowData
        if (+curData.customercode === 0  || curData.billnumber==='free') return;
        const res = await MessageBox.question({
            title:'提问',
            content:'取消后，对应客户的商品将删除，是否要取消该商品？',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        try {
            MessageBox.loading({
                moreText: '正在处理...',
                mask: true
            })
            const dataSource = this.dataSource
            const Parmars={
                SaleOrderBillNumber :   dataSource.getFieldValue('saleorderbillnumber'),
                PurchaseOrderIdkey  :   dataSource.getFieldValue('idkey'), 
                SaleOrderIdkey      :   dataSource.getFieldValue('saleorderidkey'), 
                ProductCode         :   dataSource.getFieldValue('productcode'),
                CancelNum           :   dataSource.getFieldValue('num'),
                CancelNumEx         :   dataSource.getFieldValue('num'),
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'CancelProduct',Parmars)   
            if (submitRes.errCode==0){  
            const _thisIndex = this.dataSource.activeRowIndex;
            this.dataSource.dataSet.splice(_thisIndex,1)
            }  
        } finally {
            MessageBox.closeAllLoading()
        }
    }
    public async changeProduct(){
        /**
         * 这个换货是直接用新数量替换旧数量
         */
        const curData = this.dataSource.thisRowData
        if (+curData.customercode === 0  || curData.billnumber==='free') return;
        const _SelectRes = await WinProductSelect.show({
            title:'换货商品选择',
            customerCode: this.dataSource.getFieldValue('customercode'),
            billType:3,
            defaultDatas:[],
            keepExisting: true
        });
        if (_SelectRes.action !== ModalResultEnum.mrConfirm) return;  
        const newData = _SelectRes.data as TableRowDataType
        const changeProductRes = await WinChangeProduct.show({
            title:'换货参数',
            inputNum: +$Utils.clearDecimal(curData.num),
            inputDoMethod: curData.note,
            keepExisting: true
        })

        if (changeProductRes.action !== ModalResultEnum.mrConfirm) return;
        const {inputNum:changeNum,inputDoMethod:changeDoMethod} = changeProductRes.data
        try {
            MessageBox.loading({
                moreText: '正在处理...',
                mask: true
            })
            const Parmars={
                PurchaseOrderBillNumber: curData.billnumber,
                CurOrderIdKey: curData.idkey,
                CurProductCode: curData.productcode,
                ProductCode:newData.idcode,
                Num:changeNum,
                NumEx: changeNum,
                CurSaleType: curData.saletype,
                SaleType: newData.saletype,
                DownUnit: newData.downunit,
                DownWg: newData.saletype==2||newData.saletype==3?newData.downwgspec||1:1,
                CostPrice:newData.costprice,
                Note: changeDoMethod||'',
                CustomerCode: curData.customercode,
                SalePrice: newData.saleprice
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'changeProduct',Parmars)   
            if (submitRes.errCode==0){  
            const _thisIndex = this.dataSource.activeRowIndex;
            this.dataSource.dataSet.splice(_thisIndex,1)
        }  
        } finally {
            setTimeout(() => {
                MessageBox.closeAllLoading()
            }, 100);
        }
   
    }
    public async free(){
        const curData = this.dataSource.thisRowData
        if (+curData.customercode === 0  || curData.billnumber==='free') return;
        const res = await InputBox.show({
            title: '免采',
            description:'请输入数量',
            defaultValue: +$Utils.clearDecimal(this.dataSource.getFieldValue('num')),
            inputType: 'number',
            keepExisting: true
        });
        if (res.action !== ModalResultEnum.mrConfirm) return
            try {
                MessageBox.loading({
                    moreText: '正在处理...',
                    mask: true
                })
                const Parmars={
                    PurchaseOrderIdkey: curData.idkey,
                    SaleOrderIdkey: curData.saleorderidkey,
                    FreeNum: Math.abs(+res.data),
                    FreeNumEx: Math.abs(+res.data),
                    SaleOrderList:curData.saleorderbillnumber
                }
                const submitRes = await $api.comonRequest(this.dataSource.apiPath,'freeProduct',Parmars)   
                if (submitRes.errCode==0){  
                    this.open()
                }  
            } finally {
                setTimeout(() => {
                    MessageBox.closeAllLoading()
                }, 100);
            }
    }
}