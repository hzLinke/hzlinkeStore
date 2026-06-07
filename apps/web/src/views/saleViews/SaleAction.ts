
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import {getProduct,dataIsExist,dataIsExistQuotedPrice} from "@/usehook/dataAction"
import { DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableRowDataType,InputBox } from '@v4x/ui';
import useAppStore from '@/stores';
import { SaleViewsInstanceRefs } from './types';
import { WinInHistoryInfBox } from '@/components/WinInHistoryInfBox';
import { WinMoneyPayRes } from '@/components/WinMoneyPayRes';
import { WinOutHistoryInfBox } from '@/components/WinOutHistoryInfBox';
import { WinStockInfBox } from '@/components/WinStockInfBox';
import { WinProductSelect,WinDoMethod } from '@/components';

export class TSalesListGridAction<T extends SaleViewsInstanceRefs> extends TGridAction<T>{
    [x: string]: any;
    protected maxKeyValue = -1;
    public billType = 3;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0';
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                //**存在订单号的不能修改 
                return row.examineusercode==0&&(row.orderbillnumber?false:true)
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
                    return (this.dataSource.totalData as any).salemoney||0
                },
                costMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).costmoney||0
                },
                profitMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).profitmoney||0
                },
            },
        })
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
               // console.log(data)
            },
            gridKeyDown:(e: KeyboardEvent)=>{
               /*  if (e.key=='Escape'){
                    this.thisInstance.Win.closeWin()
                } */
            },
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                const res = await this.update(false)
                if (!res) return;
                this.instanceRefs.detailVisabled!.value = true
                this.instanceRefs.headerData!.value = rowdata
            }
        })
    }

    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
        if (data.fieldName.toLocaleLowerCase() == 'customercode'){
            //console.log(data.dropDatas)
            const _pcode =  $Utils.getValueFromArray(data.dropDatas,'idcode','pcode',data.fieldValue);
            const _salesMan =  $Utils.getValueFromArray(data.dropDatas,'idcode','salesman',data.fieldValue);
            const _settlementType =  $Utils.getValueFromArray(data.dropDatas,'idcode','settlementType',data.fieldValue);
            const _accountDay =  $Utils.getValueFromArray(data.dropDatas,'idcode','accountDay',data.fieldValue);
            const _dr =  $Utils.getValueFromArray(data.dropDatas,'idcode','dr',data.fieldValue);
            const _decimalBit =  $Utils.getValueFromArray(data.dropDatas,'idcode','decimalBit',data.fieldValue);
            
            if (+_pcode > 0 && this.billType==302){
                const _arr = (data.dropDatas as any).filter((item: any)=>{
                    return item.pcode == _pcode
                })
                if (_arr[0].idcode!==data.fieldValue){
                    MessageBox.warning({
                        title:'警告', 
                        content:`特定项目“${_arr[0].projectname}”，请用“${_arr[0].name}”来报价`,
                        showCancel:false})
                }
            }
           
            this.dataSource.setFieldValue('salesman',_salesMan);
            this.dataSource.setFieldValue('settlementType',_settlementType);
            this.dataSource.setFieldValue('accountDay',_accountDay);
            this.dataSource.setFieldValue('pcode',_pcode);
            this.dataSource.setFieldValue('dr',_dr);
            this.dataSource.setFieldValue('decimalBit',_decimalBit);
        }
        return super.onSetFieldValue(data,rowItem)
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
        console.log(this.billType)
        let BillHeaderTxt = 'XD';
        switch (this.billType){
            case 17:
                BillHeaderTxt = 'XD';
                break;
            case 3:
                BillHeaderTxt = 'XS';
                break;
            case 333:
                BillHeaderTxt = 'WS';
                break;
            case 4:
                BillHeaderTxt = 'XT';
                break;
            case 302:
                BillHeaderTxt = 'QP';//报价
                break;
        }
        const _BillNumber = BillHeaderTxt+$Utils.getDate('none',0,'yyyyMMdd')+$Utils.formatZero(this.maxKeyValue.toString(),4);
        
        this.dataSource.setFieldValue('accountBookCode',useAppStore().accountBookCode);
        this.dataSource.setFieldValue('billnumber',_BillNumber);
        this.dataSource.setFieldValue('orderbillnumber','');
        this.dataSource.setFieldValue('billtype',this.billType);
        this.dataSource.setFieldValue('customercode',0);
        this.dataSource.setFieldValue('pcode',0);
        const diff = $Utils.getDatePart('h')>=(this.commonDatas as any).SysParamDatas[0].exceedtimetoday?1:0;
        this.dataSource.setFieldValue('DeliveryAt',$Utils.getDate('d',diff));
        this.dataSource.setFieldValue('MakingAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('ExamineAt',$Utils.getDate('note',0,'yyyy-MM-dd HH:mm:ss'));
        this.dataSource.setFieldValue('MakingUserCode',this.instanceRefs.userCode||0);
        this.dataSource.setFieldValuePlus({'ExamineUserCode':0,'salesman':0,'DriverCode':0,SettlementType:0,AccountDay:0})
        /*this.dataSource.setFieldValue('ExamineUserCode',0);
        this.dataSource.setFieldValue('salesman',0);
        this.dataSource.setFieldValue('DriverCode',0);
        this.dataSource.setFieldValue('SettlementType',0);
        this.dataSource.setFieldValue('AccountDay',0);*/
        this.dataSource.setFieldValue('costMoney',0);
        this.dataSource.setFieldValue('saleMoney',0);
        this.dataSource.setFieldValue('Status',0);
        this.fieldToColIndex('customercode');
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

export class TSalesDetailGridAction<T extends SaleViewsInstanceRefs> extends TGridAction<T>{
    public billType = 3;
    protected maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs)
        this.PagerConfig={curPage:1,pageSize:0,total:0};
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                calculaMoney:(rowItem: any): number=>{
                    return $Utils.toFixedFun(rowItem.numex * $Utils.toFixedFun(rowItem.saleprice,rowItem.decimalbit||2),2)
                },
                calculaWeight:(rowItem: any): number=>{
                    return rowItem.numex * rowItem.weight
                },
                calculaDisTotal:(rowItem: any): number=>{
                    return rowItem.numex - rowItem.replacenumex
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
                distributionnumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'distributionnum')
                },
                moneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money');
                    if (this.instanceRefs.headerData&&this.instanceRefs.headerData.value.examineusercode==0){
                        this.instanceRefs.headerData.value.salemoney = _Money
                    }
                    
                    return  _Money
                },
            },
            customFormater:{
                unitFormat:(value: string,rowItem: TableRowDataType)=>{
                    return rowItem.saletype==2?(rowItem.downunit||'')+'/'+(rowItem.tempunit||rowItem.unit):(rowItem.unit||'')
                }
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent: async (data: any)=>{
                const _SelectRes = 
                    await WinProductSelect.show({
                        title:'商品选择',
                        defaultDatas:[],
                        customerCode:this.instanceRefs.headerData?.value.customercode,
                        billType: this.instanceRefs.headerData?.value.billtype
                    })
                if (_SelectRes.action===ModalResultEnum.mrConfirm){
                    this.changeRowValue(_SelectRes.data) 
                }
            },
            indicatorDoMethodButtonEvent: async (data: any)=>{
                this.changeDoMethodValue(data.rowItem.domethod)
                
            }
        })

    }
    protected async changeQualityGrade(editRowIndex?: number){
        if (+this.instanceRefs.headerData?.value?.examineusercode !==0) return
        if (+this.dataSource.getFieldValue('enableqs')==0||
            +this.dataSource.getFieldValue('saletype')!=0
        ) return;

        const res = await WinDoMethod.show({title:'质量选择',datas: '标准/次级/高级'});
        if (res.action === ModalResultEnum.mrConfirm){
            const QualityGrade = res.data=='标准'?1:res.data=='次级'?2:3;
            this.dataSource.setFieldValue('QualityGrade',QualityGrade,editRowIndex);
            this.dataSource.setFieldValue('batchNumber',`BT${this.dataSource.getFieldValue('productcode')}-${QualityGrade||1}`,editRowIndex)
        }
    }
    public async changeRowValue(data: TableRowDataType, editRowIndex?: number): Promise<boolean> {
        const _DataisExist = await dataIsExist(useAppStore().activeWin?.ActiveGridAction?.dataSource?.apiPath as string, `billNumber='${this.instanceRefs.headerData?.value.billnumber}' and ProductCode=${data.idcode} and saleType=${data.saletype}`);
        if (_DataisExist){//报价单
            if (this.instanceRefs.headerData?.value.billtype==302){
               MessageBox.information({
                    title:'提问',
                    content:`编码${data.idcode}已存在，不能重复录入`,
                    showCancel: false
                })
                return false
            }
            const res = await MessageBox.question({ 
                title:'提问',
                content:`编码${data.idcode}已存在，是否录入`,
                messageType:'warning',
            })
            if (res.action !== ModalResultEnum.mrConfirm){
                setTimeout(()=>{
                    this.fieldToColIndex('productcode')
                },100)
                return false
            }
        } 
        /* if (this.instanceRefs.headerData?.value.billtype!=302)
        {
            if (useAppStore().commonDatas.SysParamDatas[0]['tipnotquotedprice']==1){
                const _xDataisExist = await dataIsExistQuotedPrice(useAppStore().activeWin?.ActiveGridAction?.dataSource?.apiPath as string, `pcode='${this.instanceRefs.headerData?.value.customercode}' and ProductCode=${data.idcode}`);
                if (!_xDataisExist){
                    let res = await MessageBox.question({
                        title:'提问',
                        content:`商品【${data.idcode}】${data.name}\n对应客户不存在报价（请小心使用）\n\n是否要进行报价并使用？(确定进行报价,取消直接使用)`,
                        messageType:'warning',
                    })
                    if (res.action !== ModalResultEnum.mrCancel){
                        res = await InputBox.show({
                            title:'单价',
                            inputType:'number',
                            description:'请输入商品单价',
                            defaultValue:data.saleprice
                        })
                        if (res.action!='mrCancel'){
                            data.saleprice = res.data||0
                            this.InsertQuotePrice(this.instanceRefs.headerData?.value.customercode,data.idcode,data.saleprice)
                        }
                    }
                }
            }
        } */
        const _DataSource = this.dataSource;
        const _dr = +this.instanceRefs.headerData?.value.dr||1;//折扣
        const _decimalBit = +this.instanceRefs.headerData?.value.decimalbit||0;//小数位 

        if (this.instanceRefs.headerData?.value.billtype==302){
             _DataSource.setFieldValue('qualitygrade',+data.saletype===1||+data.saletype===3?1:0,editRowIndex);
        } else {
             _DataSource.setFieldValue('qualitygrade',data.qualitygrade,editRowIndex);
        }
        _DataSource.setFieldValue('productcode',data.idcode,editRowIndex);
        _DataSource.setFieldValue('CustomerProcudeCode',data.idcode,editRowIndex);//报价单
        _DataSource.setFieldValue('barcode',data.barcode,editRowIndex);
        _DataSource.setFieldValue('name',data.name,editRowIndex);
        _DataSource.setFieldValue('aliasname',data.name,editRowIndex);
        _DataSource.setFieldValue('pack',data.pack,editRowIndex);
        _DataSource.setFieldValue('spec',data.spec,editRowIndex);
        _DataSource.setFieldValue('unit',data.downunit,editRowIndex);
        _DataSource.setFieldValue('tempunit',data.unit,editRowIndex);
        _DataSource.setFieldValue('num',0,editRowIndex);
        _DataSource.setFieldValue('numex',0,editRowIndex);
        _DataSource.setFieldValue('stocknum',data.stock,editRowIndex);
        _DataSource.setFieldValue('areacode',data.areacode,editRowIndex);
        _DataSource.setFieldValue('catename',data.catename,editRowIndex);
        _DataSource.setFieldValue('downunit',data.downunit,editRowIndex);
        _DataSource.setFieldValue('actualcostprice',data.saletype==3?data.costprice*data.pack:data.costprice,editRowIndex);
        _DataSource.setFieldValue('costprice',data.saletype==3?data.costprice*data.pack:data.costprice,editRowIndex);
        _DataSource.setFieldValue('baseprice',data.saleprice,editRowIndex);
        _DataSource.setFieldValue('cursaleprice',data.saleprice*_dr,editRowIndex);
        _DataSource.setFieldValue('saleprice',data.saleprice*_dr,editRowIndex);
        _DataSource.setFieldValue('saletype',data.saletype,editRowIndex);
        _DataSource.setFieldValue('domethod',data.domethod,editRowIndex);
        _DataSource.setFieldValue('aliasnamelist',data.aliasnamelist,editRowIndex);
        _DataSource.setFieldValue('downwg',data.saletype==2||data.saletype==3?data.downwgspec||1:1,editRowIndex);
        _DataSource.setFieldValue('defaultshippercode',data.defaultshippercode||1,editRowIndex);
        _DataSource.setFieldValue('weight',data.weight||1,editRowIndex);
        _DataSource.setFieldValue('enableQs',data.enableqs||0,editRowIndex);
        _DataSource.setFieldValue('catecode',data.catecode,editRowIndex);
        this.dataSource.setFieldValue('note',data.note||'')
        this.dataSource.setFieldValue('batchNumber',`BT${data.idcode}-${data.qualitygrade||1}`,editRowIndex)
        if (this.billType==302){
            _DataSource.setFieldValue('defaultshippercode',1,editRowIndex);
            await this.changeAliasName(data.aliasnamelist,editRowIndex)
        } else {
            await this.changeDoMethodValue(data.domethod,editRowIndex)
        }
        if (this.billType==4){
            await this.selectSaleBatch(this.instanceRefs.headerData?.value?.customercode, data.idcode, data.qualitygrade, editRowIndex)
        }
        
        return false
    }
    protected async selectSaleBatch(customerCode: number|string,productCode: number|string,qualityGrade: number|string,editRowIndex?: number){
        console.log('退货出货单选择',customerCode,productCode,qualityGrade)
    }
    protected async changeDoMethodValue(doMethodValue: string,editRowIndex?: number){
        if (!doMethodValue) return;
        const res = await WinDoMethod.show({title:'做法选择',datas: doMethodValue});
        if (res.action === ModalResultEnum.mrConfirm){
            const _DataSource = this.dataSource;
            _DataSource.setFieldValue('note',res.data,editRowIndex);
        }
    }
    protected async changeAliasName(doAliasName: string,editRowIndex?: number){
        if (!doAliasName) return;
        if (doAliasName.split('/').length==1) return;
        const res = await WinDoMethod.show({title:'别名选择',datas: doAliasName});
        if (res.action === ModalResultEnum.mrConfirm){
            const _DataSource = this.dataSource;
            _DataSource.setFieldValue('AliasName',res.data,editRowIndex);
        }
    }

    protected checkHeadData(): boolean{
        let updateRes = true
        if (this.instanceRefs.headerData?.value?.customercode == 0){
            MessageBox.error({
                title:'提示',
                content:  '请指定客户....',
                showCancel: false
            })
            updateRes = false;
        }
       /* if ($Utils.diffDay($Utils.getDate(),this.instanceRefs.headerData?.value?.deliveryat)<0){  
            MessageBox.error({
                title:'提示',
                content:  '送货日期不能少于当前日期',
                showCancel: false
            })
            updateRes = false;
        }*/
        return updateRes
    }
    public async headerUpdate(): Promise<boolean> {/**保存头部*/
        if (!this.instanceRefs.headerGridAction) return true
        const res = await this.instanceRefs.headerGridAction.update(false)  
        return res
    }       
    protected async beforeInsert(): Promise<boolean> {
  
        let updateRes = true;
        updateRes = this.checkHeadData();
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
              
        this.dataSource.setFieldValue('idKey',this.instanceRefs.headerData?.value.billnumber+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('billnumber',this.instanceRefs.headerData?.value.billnumber);
        this.dataSource.setFieldValue('customerorderid',this.instanceRefs.headerData?.value.customerorderid);
        this.dataSource.setFieldValue('billtype',this.instanceRefs.headerData?.value.billtype);
        this.dataSource.setFieldValue('num',0);
        this.dataSource.setFieldValue('numex',0);
        this.dataSource.setFieldValue('replaceNumEx',0);
        this.dataSource.setFieldValue('dr',+this.instanceRefs.headerData?.value.dr*100);
        this.dataSource.setFieldValue('decimalbit',+this.instanceRefs.headerData?.value.decimalbit);
        this.dataSource.setFieldValue('baseprice',0);
        this.dataSource.setFieldValue('saleprice',0);
        this.dataSource.setFieldValue('at',$Utils.getDate());
        this.dataSource.setFieldValue('customercode',this.instanceRefs.headerData?.value.customercode);
        this.dataSource.setFieldValue('deliveryat',this.instanceRefs.headerData?.value.deliveryat);
        this.dataSource.setFieldValue('downunittype',this.instanceRefs.headerData?.value.downunittype);
        this.dataSource.setFieldValue('over',0);
        this.dataSource.setFieldValue('qualityGrade',1);
        this.fieldToColIndex('productcode') 
        return super.afterInsert(rowItem,rowIndex)
    }

    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
       
        const appStore = useAppStore();
        const isQuotePrice =(fromQuotedPrrice: boolean,selectData: TableRowDataType) =>{
            if (fromQuotedPrrice && !+selectData.isquotedprice){
                MessageBox.warning({
                    content:'由于系统限制，商品无报价，不能对当前客户销售',
                    title:'警告',
                    showCancel: false
                })
                this.fieldToColIndex('productcode')
                return false;
            }
            return true;
        }
        if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),
                    BillType: this.instanceRefs.headerData?.value.billtype,
                    customerCode:this.instanceRefs.headerData?.value.customercode
                })
            if (res.length==0){
                MessageBox.toast({
                    content:'无此商品',
                    messageType:'warning'
                })
                setTimeout(()=>{
                    appStore.activeWin?.ActiveGridAction?.fieldToColIndex('productcode')
                    //用this.fieldToColIndex('productcode')无法处理
                },0)
                return false
            }
            if (res.length==1){
                if (!isQuotePrice(!!+this.instanceRefs.headerData?.value.salefromquoteprice,res[0])){
                    return false
                }
                return await this.changeRowValue(res[0])
            }
            const _SelectRes = await WinProductSelect.show({title:'商品选择',defaultDatas: res,customerCode:this.instanceRefs.headerData?.value.customercode,billType: this.instanceRefs.headerData?.value.billtype})
              if (_SelectRes.action === ModalResultEnum.mrConfirm){
                if (!isQuotePrice(!!+this.instanceRefs.headerData?.value.salefromquoteprice,_SelectRes.data)){
                    return false
                }
                return this.changeRowValue(_SelectRes.data,data.editRowIndex);
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
            const DownUnitType = this.instanceRefs.headerData?.value.downunittype;
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = rowItem.saletype==3?  
                        Math.abs(data.fieldValue as number) :
                        Math.abs(data.fieldValue as number * (rowItem.downwg/(rowItem.saletype==2&&DownUnitType==1?2:1)));
            this.dataSource.setFieldValue('numex',_NumEx,data.editRowIndex);
            return true
        }
        if (data.fieldName == 'replaceNumEx'&& +data.fieldValue>+rowItem.numex){
            MessageBox.warning({
                title:'警告',
                content:'代打量不能大于结算量',
                showCancel: false
            })
            return false
        }
        if (data.fieldName == 'replaceNumEx'&&rowItem.saletype==2){
            MessageBox.warning({
                title:'警告',
                content:'称重+按量销售类型的商品不可以代打',
                showCancel: false
            })
            return false
        }
        //基准价
        if (data.fieldName == 'baseprice'){
            this.dataSource.setFieldValue('saleprice',+data.fieldValue * (rowItem.dr / 100),data.editRowIndex)
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
            content:  submitType==1?'是否要审核单据,审核后将无法修改':"是否要反签单据"
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
            updatetype: submitType
        })   
        if (submitRes.errCode==0){
            this.instanceRefs.headerData!.value.examineusercode = submitType==1?this.instanceRefs.userCode:0;
            this.instanceRefs.headerDisabled!.value = submitType==1?true:false;
            this.TableConfig.readOnly = submitType==1?true:false;  
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async beforePrint(): Promise<boolean> {
        return super.beforePrint().then((rs: boolean)=>{
            const res = this.dataSource.dataSet.filter((item: any)=>{
                if (this.commonDatas.SysParamDatas[0].numiszeronotallowprint==1){
                    return item.numex == 0 || item.saleprice == 0 || item.baseprice ==''
                }
                return item.numex == 0 
            })
            if (this.instanceRefs.headerData?.value.billtype!=302&&res.length>0){
                MessageBox.warning({
                    title:'警告',
                    content:'对不起，数量,单价为0或者空，不能打印',
                    showCancel: false
                })
            }
            return new Promise((resolve, reject)=>{resolve(res.length==0)})
        })        
    }
    public async InsertQuotePrice(CustomerCode: number,ProductCode: string,SalePrice: number){
        MessageBox.loading({
            moreText: '正在增加报价...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'InsertQuotePrice',{
            CustomerCode: CustomerCode,
            ProdcuctCode: ProductCode,
            SalePrice:SalePrice,
        })   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
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
                       if (this.instanceRefs.headerData?.value.examineusercode >0 && +this.instanceRefs.headerData?.value.over!=1)
                    WinMoneyPayRes.show({title:'付款', look:true,type:'pay',commonDatas:this.commonDatas, companyCode:this.instanceRefs.headerData?.value.shippercode,curBillNumber: this.instanceRefs.headerData?.value.billnumber,condition:`shipperCode = ${this.instanceRefs.headerData?.value.shippercode}`})
                break;
            }
        }
}