import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import {getProduct,dataIsExist} from "@/usehook/dataAction"
import { DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableRowDataType } from '@v4x/ui';
import type { PurchaseViewsInstanceRefs } from './types';
import { WinDoMethod, WinProductSelect } from '@/components';
import useAppStore from '@/stores';
import { WinInHistoryInfBox } from '@/components/WinInHistoryInfBox';
import { WinMoneyPayRes } from '@/components/WinMoneyPayRes';
import { WinOutHistoryInfBox } from '@/components/WinOutHistoryInfBox';
import { WinStockInfBox } from '@/components/WinStockInfBox';
import { generateBatchNumber } from '@/utils/batchNumber';

export class TPurchasesListGridAction<T extends PurchaseViewsInstanceRefs> extends TGridAction<T>{
    protected maxKeyValue = -1;
    public billType = 0;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0';
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },
            customFormater:{
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                saleMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).costmoney||0
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
              //  console.log(data)
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
                console.log(datas,this.instanceRefs.headerData?.value,rowdata)
            }
        })
    }
   
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: ' isnull(max(RIGHT(billnumber,4)),0)+1',condition:'convert(char(10),makingAt,120)=convert(char(10),getdate(),120)'});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        let BillHeaderTxt = 'RD';
        switch (this.billType){
            case 16:
                BillHeaderTxt = 'RD';
                break;
            case 0:
                BillHeaderTxt = 'RK';
                break;
            case 1:
                BillHeaderTxt = 'RT';
                break;
            case 2:
                BillHeaderTxt = 'CH';
                break;
        }
        const _BillNumber = BillHeaderTxt+$Utils.getDate('none',0,'yyyyMMdd')+$Utils.formatZero(this.maxKeyValue.toString(),4);
        this.dataSource.setFieldValue('billnumber',_BillNumber);
         this.dataSource.setFieldValue('accountBookCode',useAppStore().accountBookCode);
        this.dataSource.setFieldValue('orderbillnumber','');
        this.dataSource.setFieldValue('billtype',this.billType);
        this.dataSource.setFieldValue('shippercode',0);
        const diff = $Utils.getDatePart('h')>=(this.commonDatas as any).SysParamDatas[0].exceedtimetoday?1:0
        this.dataSource.setFieldValue('DeliveryAt',$Utils.getDate('d',diff));
        this.dataSource.setFieldValue('MakingAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('ExamineAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('MakingUserCode',this.instanceRefs.userCode!);
        this.dataSource.setFieldValue('MrUserCode',0);
        this.dataSource.setFieldValue('ExamineUserCode',0);
        this.dataSource.setFieldValue('costMoney',0);
        this.dataSource.setFieldValue('saleMoney',0);
        this.dataSource.setFieldValue('Status',0);
        this.dataSource.setFieldValue('over',0);
        this.fieldToColIndex('shippercode')
        return super.afterInsert(rowItem,rowIndex)
    }
    protected async beforeDelete(rowItem: TableRowDataType): Promise<boolean> {
        const res = await super.beforeDelete(rowItem);
        let returnVale = res;
        if (res){
            const fieldValue = await this.instanceRefs.detailDataSource?.getFieldValueFormServer({fieldName: 'count(billNumber)',condition:`BillNumber='${rowItem.billnumber}'`});
            if (fieldValue!=0){
                returnVale = false
                MessageBox.warning({title:'警告', content:'单据存在明细，不能删除',showCancel:false})
            } else {
                returnVale = true;
            }
        }
        return new Promise((resolve, reject)=>{
            resolve(returnVale)
        })
    }
}

export class TPurchasesDetailGridAction<T extends PurchaseViewsInstanceRefs> extends TGridAction<T>{
    protected maxKeyValue = -1;
    public billType = 0;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.PagerConfig={curPage:1,pageSize:0,total:0}; 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                calculaMoney:(rowItem: any): number=>{
                    return rowItem.numex * rowItem.costprice
                }
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return  this.dataSource.dataSetRowCount
                },
                numCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                openNumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'opennum')
                },
                packloseCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'packlose')
                },
                ExpenseCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'expense')
                },
                numExCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'numex')
                },
                moneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money')
                    if (this.instanceRefs.headerData?.value && this.instanceRefs.headerData?.value.mrusercode==0){
                        this.instanceRefs.headerData.value.costmoney = _Money
                        this.instanceRefs.headerData.value.over = +_Money!==0?0:1
                        
                    }
                    return  _Money
                },
            },
            customFormater:{
                unitFormat:(value: string,rowItem: TableRowDataType)=>{
                    return rowItem.saletype==2||rowItem.saletype==3?(rowItem.downunit||'')+'/'+(rowItem.unit||''):(rowItem.unit||'')
                }
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent: async (data: any)=>{
                
                const _SelectRes = await WinProductSelect.show({
                    title:'商品选择',
                    defaultDatas: [],   
                    billType: this.instanceRefs.headerData?.value.billtype,
                })
                if (_SelectRes.action==ModalResultEnum.mrConfirm){
                    return  this.changeRowValue(_SelectRes.data)
                }
            },
            indicatorDoMethodButtonEvent: async (data: any)=>{
                //this.changeDoMethodValue(data.rowItem.domethod)
                
            },
        })
    }

    protected async selectPurchaseBatch(shipperCode: number|string,productCode: number|string,qualityGrade: number|string,editRowIndex?: number){
        console.log('退货出货单选择',shipperCode,productCode,qualityGrade)
    }

    protected async changeQualityGrade(editRowIndex?: number){
        if (+this.instanceRefs.headerData?.value?.examineusercode !==0) return
         
        if (+this.dataSource.getFieldValue('enableqs')==0||
            +this.dataSource.getFieldValue('saletype')!=0
        ) return;
        const res = await WinDoMethod.show({title:'质量选择',datas: '标准/次级/高级'});
        if (res.action === ModalResultEnum.mrConfirm){
            const QualityGrade = res.data=='标准'?1:res.data=='次级'?2:3;
            const _DataSource = this.dataSource;
            _DataSource.setFieldValue('QualityGrade',QualityGrade,editRowIndex);
            this.dataSource.setFieldValue('sbatchNumber',`BT${this.dataSource.getFieldValue('productcode')}-${QualityGrade||1}`,editRowIndex)
        }
    }
    public async changeRowValue(data: TableRowDataType, editRowIndex?: number): Promise<boolean> {
        const _DataisExist = await dataIsExist(this.dataSource.apiPath, `billNumber='${this.instanceRefs.headerData?.value.billnumber}' and ProductCode=${data.idcode}`);
        if (_DataisExist){
            if (this.instanceRefs.headerData?.value.billtype==2){
                const res = await MessageBox.information({
                    title:'信息',
                    content:`编码${data.idcode}已存在，不能录入`,
                    showCancel: false
                })
                if (res.action == ModalResultEnum.mrConfirm){
                    this.fieldToColIndex('productcode')
                    return false
                } 
            }
            const res = await MessageBox.question({
                title:'提问',
                content:`编码${data.idcode}已存在，是否录入`,
                messageType:'warning',
            })
            if (res.action== ModalResultEnum.mrCancel){
                this.fieldToColIndex('productcode')
                return false
            } 
        }
        const _DataSource = this.dataSource;
        _DataSource.setFieldValue('productcode',data.idcode);
        _DataSource.setFieldValue('barcode',data.barcode);
        _DataSource.setFieldValue('name',data.name);
        _DataSource.setFieldValue('spec',data.spec);
        _DataSource.setFieldValue('unit',data.unit);
        _DataSource.setFieldValue('downunit',data.downunit);
        _DataSource.setFieldValue('areacode',data.areacode);
        _DataSource.setFieldValue('stocknum',data.stock);
        _DataSource.setFieldValue('costprice',data.inprice);
        _DataSource.setFieldValue('opencostprice',data.inprice);
        _DataSource.setFieldValue('saleprice',data.saleprice);
        _DataSource.setFieldValue('saletype',data.saletype);
        _DataSource.setFieldValue('domethod',data.domethod);
        _DataSource.setFieldValue('downwg',data.saletype==2||data.saletype==3?data.downwgspec||1:1);
        this.dataSource.setFieldValue('batchnumber',generateBatchNumber(this.instanceRefs.headerData?.value.shippercode,data.idcode,data.qualitygrade),editRowIndex);
        this.dataSource.setFieldValue('sbatchNumber',`BT${data.idcode}-${data.qualitygrade||1}`,editRowIndex)
       // await this.changeDoMethodValue(data.domethod)
       if (this.billType==1){
            await this.selectPurchaseBatch(this.instanceRefs.headerData?.value?.shippercode, data.idcode, data.qualitygrade, editRowIndex)
        }
        return false
    }
    protected checkHeadData(): boolean{
        let updateRes = true
        if (this.instanceRefs.headerData?.value.shippercode == 0){
            MessageBox.error({
                title:'提示',
                content:  '请指定供货商....',
                showCancel: false
            })
            updateRes = false;
        }
        /*if ($Utils.diffDay($Utils.getDate(),this.thisInstance.headerData.deliveryat)<0){
            MessageBox.error({
                title:'提示',
                content:  '送货日期不能少于当前日期',
                showCancel: false
            })
            updateRes = false;
        }*/
        return updateRes
    }

    protected async headerUpdate(): Promise<boolean> {/**保存头部*/
        return await this.instanceRefs.headerGridAction?.update(false)||true

    }       
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        updateRes = this.checkHeadData();
        updateRes =updateRes&& await this.headerUpdate();
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'isnull(max(RIGHT(Idkey,4)),0)+1',condition:`billNumber='${this.instanceRefs.headerData?.value.billnumber}'`});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idKey',this.instanceRefs.headerData?.value.billnumber+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('billnumber',this.instanceRefs.headerData?.value.billnumber);
        this.dataSource.setFieldValue('billtype',this.instanceRefs.headerData?.value.billtype); 
        this.dataSource.setFieldValue('qualitygrade',1);
        this.dataSource.setFieldValue('num',0);
        this.dataSource.setFieldValue('numex',0);
        this.dataSource.setFieldValue('packlose',0);
        this.dataSource.setFieldValue('opennum',0);
        this.dataSource.setFieldValue('expense',0);//费用
        this.dataSource.setFieldValue('costprice',0);
        this.dataSource.setFieldValue('saleprice',0);
        this.dataSource.setFieldValue('at',$Utils.getDate());
        this.dataSource.setFieldValue('shippercode',this.instanceRefs.headerData?.value.shippercode);
        this.dataSource.setFieldValue('deliveryat',this.instanceRefs.headerData?.value.deliveryat);
        
        this.fieldToColIndex('productcode');
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
            if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),BillType: this.instanceRefs.headerData?.value.billtype,customerCode:0})
            if (res.length==0){
                MessageBox.toast({
                    content:'无此商品',
                    messageType:'warning'
                })
                return false
            }
            if (res.length==1){return  this.changeRowValue(res[0])}
            const _SelectRes = await WinProductSelect.show({
                title:'商品选择',
                defaultDatas: res,   
                billType: this.instanceRefs.headerData?.value.billtype
            })
            if (_SelectRes.action==ModalResultEnum.mrConfirm){
                return  this.changeRowValue(_SelectRes.data)
            }
            return false
        }
        if (+rowItem.saletype===1 || + rowItem.saletype === 3){
            if (data.fieldName.toLocaleLowerCase() == 'num' || data.fieldName.toLocaleLowerCase() == 'numex' || data.fieldName.toLocaleLowerCase() == 'replacenumex'){
                if ($Utils.isFloat(data.fieldValue)){
                    MessageBox.warning({
                        title:'警告',
                        content:'按量销售的商品不可以有小数点',
                        showCancel: false
                    })
                    return false
                }
            }
        }
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = Math.abs(data.fieldValue as number * rowItem.downwg);
            this.dataSource.setFieldValue('numex',_NumEx,data.editRowIndex);
            return true
        }
        if (data.fieldName == 'money'){
          //  console.log(data.fieldValue as number/ rowItem.numex)
            if (!!+this.commonDatas.SysParamDatas[0].purchasestoplustype){//明细模式
                const _Money = +data.fieldValue;
                const _Expense = _Money - +rowItem.opencostprice * +rowItem.opennum
                this.dataSource.setFieldValue('expense',_Expense.toFixed(6));
            } 
            const Price = +data.fieldValue / rowItem.numex
            this.dataSource.setFieldValue('costprice',Price.toFixed(6));
        }
        /*if (data.fieldName == 'numex'){
            data.fieldValue = this.thisInstance.headerData.billtype ==0? Math.abs(data.fieldValue as number):Math.abs(data.fieldValue as number)*-1;
            return true
        }*/
        if (data.fieldName == 'opennum'){//开单量
            const _curOpenNum = rowItem.opennum;//原开单量
            const _curNumEx = rowItem.numex;//原结算量
            data.fieldValue = Math.abs(data.fieldValue as number);
            //const _NumEx = _curNumEx - _curOpenNum + +data.fieldValue;
            const _NumEx = Math.abs(+data.fieldValue - +rowItem.packlose);
            this.dataSource.setFieldValue('numex',_NumEx,data.editRowIndex);
            return true
        }
        
        if (data.fieldName == 'costprice'){//单价
            data.fieldValue = Math.abs(data.fieldValue as number);
            const Price =  +data.fieldValue
            this.dataSource.setFieldValue('opencostprice',Price,data.editRowIndex);
            return true
        }
        if (data.fieldName == 'opencostprice'){//开单价
            data.fieldValue = Math.abs(data.fieldValue as number);
            const Price =  (+data.fieldValue * +rowItem.numex + +rowItem.expense) / +rowItem.numex
            this.dataSource.setFieldValue('costprice',Price,data.editRowIndex);
            return true
        }
        if (data.fieldName == 'packlose'){//框损
            const _CurMoney = +rowItem.money;//保存原金额
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = Math.abs(+data.fieldValue - +rowItem.opennum);
            this.dataSource.setFieldValue('numex',_NumEx,data.editRowIndex);
           // const Price = (+rowItem.opennum * +rowItem.opencostprice + +rowItem.expense) / +rowItem.numex
           const Price = _CurMoney / +rowItem.numex
            this.dataSource.setFieldValue('costprice',Price.toFixed(6));
            return true
        }
        return super.onSetFieldValue(data,rowItem)
    }
 
    public async submit(submitType: number){
        if (!this.TableConfig.allowedOperations?.alopSubmit) return;
        const updateRes = await this.update(false)
        if (!updateRes) return;
        if (!this.checkSubmit(submitType)) return;
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要审核单据,审核后将无法修改',
        })

        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: submitType==1?'正在审核单据...':'正在反签单据...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'submit',{
            billnumber: this.instanceRefs.headerData?.value.billnumber,
            deliveryat: this.instanceRefs.headerData?.value.deliveryat,
            UserCode:this.instanceRefs.userCode,
            updatetype: submitType,
            updateShipper: 0
        })   
        if (submitRes.errCode==0){
            if (this.billType == 0){ //收货
                this.instanceRefs.headerData!.value.mrusercode = submitType==1?this.instanceRefs.userCode!: 0;
                this.instanceRefs.headerData!.value.mrat = $Utils.getDate()
            } else{
                this.instanceRefs.headerData!.value.examineusercode = submitType==1?this.instanceRefs.userCode!: 0;
            }
            this.instanceRefs.headerDisabled!.value = submitType==1?true:false;
            useAppStore().activeWin!.ActiveGridAction!.TableConfig.readOnly = submitType==1?true:false;  
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async beforePrint(): Promise<boolean> {
        return super.beforePrint().then((rs: boolean)=>{
            const res = this.dataSource.dataSet.filter((item: any)=>{
                return item.numex == 0
            })
            if (res.length>0){
                MessageBox.warning({
                    title:'警告',
                    content:'对不起，数量存在0，不能打印',
                    showCancel: false
                })
            }
            return new Promise((resolve, reject)=>{resolve(res.length==0)})
        })        
    }
    public ToolsBarItemClick(data: any){
       if (this.dataSource?.dataSetRowCount == 0) return;
        switch (data.idCode){
            case '_StockList':
                WinStockInfBox.show({
                    title:'商品库存',
                    productCode:this.dataSource.getFieldValue('productCode'),
                    qualityGrade:+this.dataSource.getFieldValue('qualityGrade'),
                    commonDatas: this.commonDatas 
                })
            break;
            case '_InHistory':
                WinInHistoryInfBox.show({
                    title:'采购历史',
                    productCode:this.dataSource.getFieldValue('productCode'),
                    qualityGrade:+this.dataSource.getFieldValue('qualityGrade'),
                    commonDatas: this.commonDatas
                })
            break;
            case '_OutHistory':
                WinOutHistoryInfBox.show({
                    title:'销售历史',
                    productCode:this.dataSource.getFieldValue('productCode'),
                    qualityGrade:+this.dataSource.getFieldValue('qualityGrade'),
                    commonDatas: this.commonDatas
                })
            break;
            case '_ResMoney':
                if (this.instanceRefs.headerData?.value.examineusercode >0&& +this.instanceRefs.headerData?.value.over!=1)
                    WinMoneyPayRes.show({
                        title:'收款',
                        type:'res',
                        look:true,
                        commonDatas:this.commonDatas, 
                        companyCode:this.instanceRefs.headerData?.value.customercode,
                        curBillNumber: this.instanceRefs.headerData?.value.billnumber,
                        condition: `customerCode = ${this.instanceRefs.headerData?.value.customercode}`})

            break;
            case '_PayMoney':
                if (this.instanceRefs.headerData?.value.examineusercode >0&&this.instanceRefs.headerData?.value.over!=1)
                WinMoneyPayRes.show({title:'付款', look:true,type:'pay',commonDatas:this.commonDatas, companyCode:this.instanceRefs.headerData?.value.shippercode,curBillNumber: this.instanceRefs.headerData?.value.billnumber,condition:`shipperCode = ${this.instanceRefs.headerData?.value.shippercode}`})
            break;
        }
    }
}