import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import {getProduct,dataIsExist} from "@/usehook/dataAction"
import { DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableRowDataType } from '@v4x/ui';
import type { StockViewsInstanceRefs } from './types';
import { WinDoMethod, WinProductSelect } from '@/components';
import { WinInHistoryInfBox } from '@/components/WinInHistoryInfBox';
import { WinMoneyPayRes } from '@/components/WinMoneyPayRes';
import { WinOutHistoryInfBox } from '@/components/WinOutHistoryInfBox';
import { WinStockInfBox } from '@/components/WinStockInfBox';
import useAppStore from '@/stores';

export class TStockListGridAction<T extends StockViewsInstanceRefs> extends TGridAction<T>{
    protected maxKeyValue = -1;
    public billType = 6;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0'
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
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
               // console.log(data)
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
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
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number):Promise<boolean> {
        let BillHeaderTxt = 'SC';
        switch (this.billType){
            case 6://库存变更
                BillHeaderTxt = 'SC';
                break;
            case 7://柜组调拨
                BillHeaderTxt = 'AS';
                break;
            case 8://商品领用
                BillHeaderTxt = 'SR';
                break;
            case 9://分店调拨
                BillHeaderTxt = 'SS';
            break;
            case 10://拆零
                BillHeaderTxt = 'SB';
            break;
            case 11://盘点
                BillHeaderTxt = 'Ck';
            break;
            case 12://库存拆分
                BillHeaderTxt = 'SP';
            break;
        }
        const _BillNumber = BillHeaderTxt+$Utils.getDate('none',0,'yyyyMMdd')+$Utils.formatZero(this.maxKeyValue.toString(),4);
        this.dataSource.setFieldValue('billnumber',_BillNumber);
        this.dataSource.setFieldValue('billtype',this.billType);
        this.dataSource.setFieldValue('accountBookCode',useAppStore().accountBookCode);
        if (this.billType == 7){
            this.dataSource.setFieldValue('inareacode',0);
            this.dataSource.setFieldValue('outareacode',0);
        } else {
            this.dataSource.setFieldValue('areacode',0);
        }
        if (this.billType === 6||this.billType === 12){
            this.dataSource.setFieldValue('areacode',101);
        }
        if (this.billType === 10){//
            this.dataSource.setFieldValue('type',0);
        }
        this.dataSource.setFieldValue('MakingAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('ExamineAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('ChangeAt',$Utils.getDate('note',0,'yyyy-MM-dd'));
        this.dataSource.setFieldValue('MakingUserCode',this.instanceRefs.userCode||0);
        this.dataSource.setFieldValue('ExamineUserCode',0);
        this.dataSource.setFieldValue('costMoney',0);
        this.dataSource.setFieldValue('saleMoney',0);
        this.dataSource.setFieldValue('Status',0);
        if (this.billType == 7)
            this.fieldToColIndex('outareacode')
        else 
            this.fieldToColIndex('areacode')
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

export class TStockDetailGridAction<T extends StockViewsInstanceRefs> extends TGridAction<T>{
    public billType = 6;
    protected maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.PagerConfig={curPage:1,pageSize:50,total:0};
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                calculaMoney:(rowItem: any): number=>{
                    return this.instanceRefs.headerData?.value.billtype==6?rowItem.changenum * rowItem.costprice: rowItem.num * rowItem.costprice
                }
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return  this.dataSource.dataSetRowCount
                },
                numCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                numExCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'numex')
                },
                moneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money')
                    if (this.instanceRefs.headerData?.value){
                        this.instanceRefs.headerData.value.salemoney = _Money
                    }
                    return  _Money
                },
            },
            customFormater:{
                unitFormat:(value: string,rowItem: TableRowDataType)=>{
                    return rowItem.saletype==2?(rowItem.downunit||'')+'/'+(rowItem.unit||''):(rowItem.unit||'')
                }
            }
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent: async (data: any)=>{
                const _SelectRes = await WinProductSelect.show({title:'商品选择',defaultDatas:[], billType: this.instanceRefs.headerData?.value.billtype})
                if (_SelectRes.action===ModalResultEnum.mrConfirm){
                    this.changeRowValue(_SelectRes.data)
                }
            },
        })
    }
    
    protected async changeQualityGrade(editRowIndex?: number){
        console.log(editRowIndex)
        if (+this.instanceRefs.headerData?.value?.examineusercode !==0) return
        if (+this.dataSource.getFieldValue('enableqs')==0||
            +this.dataSource.getFieldValue('saletype')!=0
        ) return;

        const res = await WinDoMethod.show({title:'质量选择',datas: '标准/次级/高级'});
        if (res.action === ModalResultEnum.mrConfirm){
            const QualityGrade = res.data=='标准'?1:res.data=='次级'?2:3;
            const _DataSource = this.dataSource;
            _DataSource.setFieldValue('QualityGrade',QualityGrade,editRowIndex);
        }
    }

    public  changeRowValue = async (data: TableRowDataType, editRowIndex?: number): Promise<boolean>=>{
        const headerData = this.instanceRefs.headerData?.value;
        const _DataisExist = await dataIsExist(this.dataSource.apiPath, `billNumber='${headerData?.billnumber}' and ProductCode=${data.idcode}`);
        if (_DataisExist){
            const res = await MessageBox.question({
                title:'提问',
                content:`编码${data.idcode}已存在，不能重复录入`,
                messageType:'warning',
                showCancel: false,
            })
            if (res.action !== ModalResultEnum.mrConfirm){
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
        if (this.billType==6||this.billType==12){
            _DataSource.setFieldValue('stocknum',data.todaystock);
            _DataSource.setFieldValue('changenum',0-Math.abs(data.todaystock));
            _DataSource.setFieldValue('changeat',headerData?.changeat);
        } else {
            _DataSource.setFieldValue('stocknum',data.stock);
            _DataSource.setFieldValue('changenum',0-Math.abs(data.stock));
        }
        if (headerData?.areacode==0){
            _DataSource.setFieldValue('areacode',data.areacode);
        } else {
            _DataSource.setFieldValue('areacode',headerData?.areacode);
        }
        _DataSource.setFieldValue('costprice',data.costprice);
        _DataSource.setFieldValue('saleprice',data.saleprice);
        _DataSource.setFieldValue('saletype',data.saletype);
        _DataSource.setFieldValue('num',0);
        _DataSource.setFieldValue('enableQs',data.enableqs||0,editRowIndex);
        _DataSource.setFieldValue('qualitygrade',data.qualitygrade);
        return false
    }

    protected async headerUpdate(): Promise<boolean> {/**保存头部*/
        return this.instanceRefs.headerGridAction?.update(false)||false
    }       
    protected async beforeInsert(): Promise<boolean> {
         let updateRes = true;
        updateRes =updateRes&& await this.headerUpdate();
        if (updateRes&&this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'isnull(max(RIGHT(Idkey,4)),0)+1',condition:`billNumber='${this.instanceRefs.headerData?.value?.billnumber}'`});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        const headerData = this.instanceRefs.headerData?.value;
        this.dataSource.setFieldValue('idKey',headerData?.billnumber+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('billnumber',headerData?.billnumber);
        this.dataSource.setFieldValue('billtype',headerData?.billtype);
        this.dataSource.setFieldValue('num',0);
        this.dataSource.setFieldValue('costprice',0);
        this.dataSource.setFieldValue('saleprice',0);
        this.dataSource.setFieldValue('qualitygrade',1);
        this.dataSource.setFieldValue('at',$Utils.getDate());
        this.fieldToColIndex('productcode');
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        const headerData = this.instanceRefs.headerData?.value;
        if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),
                    customerCode:0,
                    BillType: this.instanceRefs.headerData?.value?.billtype,
                    AreaCode: headerData?.areacode||headerData?.outareacode,
                    Data: headerData?.billtype == 6?headerData?.changeat:$Utils.getDate()
                })
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
                billType: this.instanceRefs.headerData?.value?.billtype
            })
            if (_SelectRes.action === ModalResultEnum.mrConfirm){return  this.changeRowValue(_SelectRes.data)}
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
        return super.onSetFieldValue(data,rowItem)
    }

    public async submit(submitType: number){
        if (!this.TableConfig.allowedOperations?.alopSubmit) return;
        const updateRes = await this.update(false)
        if (!updateRes) return;
        if (!this.checkSubmit(submitType)) return;
        const res = await MessageBox.question({
            title:'提问',
            content:  submitType==1?'是否要审核单据,审核后将无法修改':"是否要反签单据"
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: submitType==1?'正在审核单据...':'正在反签单据...',
            mask: true
        })
        const headerData = this.instanceRefs.headerData?.value;
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'submit',{
            billnumber: headerData?.billnumber,
            deliveryat: headerData?.deliveryat,
            UserCode:this.instanceRefs.userCode,
            updatetype: submitType
        })   
        if (submitRes.errCode==0){
            if (headerData){
                headerData.examineusercode = submitType==1?this.instanceRefs.userCode:0;
            }
            if (this.instanceRefs.headerDisabled){
                this.instanceRefs.headerDisabled.value = submitType==1?true:false;
            }
            this.TableConfig.readOnly = submitType==1?true:false;  
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async beforePrint(): Promise<boolean> {
        const headerData = this.instanceRefs.headerData?.value;
        return super.beforePrint().then((rs: boolean)=>{
            let res = []
            if (headerData?.billtype!=5){//库存变更单不控制
                res = this.dataSource.dataSet.filter((item: any)=>{
                    return item.num == 0
                })
                if (res.length>0){
                    MessageBox.warning({
                        title:'警告',
                        content:'对不起，数量存在0，不能打印',
                        showCancel: false
                    })
                }
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
                    commonDatas: this.commonDatas ,
                    qualityGrade: +this.dataSource.getFieldValue('qualitygrade')
                })
            break;
            case '_InHistory':
                WinInHistoryInfBox.show({
                    title:'采购历史',
                    productCode:this.dataSource.getFieldValue('productCode'),
                    commonDatas: this.commonDatas,
                    qualityGrade: +this.dataSource.getFieldValue('qualitygrade')
                })
            break;
            case '_OutHistory':
                WinOutHistoryInfBox.show({
                    title:'销售历史',
                    productCode:this.dataSource.getFieldValue('productCode'),
                    commonDatas: this.commonDatas,
                    qualityGrade: +this.dataSource.getFieldValue('qualitygrade')
                })
            break;
            case '_ResMoney':
                if (this.instanceRefs.headerData?.value.examineusercode >0)
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
                if (this.instanceRefs.headerData?.value.examineusercode >0)
                WinMoneyPayRes.show({title:'付款', look:true,type:'pay',commonDatas:this.commonDatas, companyCode:this.instanceRefs.headerData?.value.shippercode,curBillNumber: this.instanceRefs.headerData?.value.billnumber,condition:`shipperCode = ${this.instanceRefs.headerData?.value.shippercode}`})
            break;
        }
    }
}