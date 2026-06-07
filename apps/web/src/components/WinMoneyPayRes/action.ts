import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { TableColumnsType, DataSourceType, CommondDatasParamType, TableMethodsType, TableEventsType } from '@v4x/ui';
import { MoneyPayResInstanceRefs } from './types';

export class TAction extends TGridAction<MoneyPayResInstanceRefs>{
    private maxKeyValue = 1;
    private type = 'pay';
    public PayColumns = <TableColumnsType[]>[
        {
            dataType: 'text',
            fieldName: 'curbillnumber',
            width: 150,
            title: '单号',
            readonly: true,
            sort: false,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'number',
            fieldName: 'curmoney',
            width: 100,
            title: '采购金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'CurMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 100,
            title: '应付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'OweMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'money',
            width: 100,
            title: '金额',
            format: '0.00',
            align: 'right',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
            sort: false,
        }
    ];
    public ResColumns = <TableColumnsType[]>[
        {
            dataType: 'text',
            fieldName: 'curbillnumber',
            width: 150,
            title: '单号',
            readonly: true,
            sort: false,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'number',
            fieldName: 'curmoney',
            width: 100,
            title: '销售金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'CurMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 100,
            title: '应收金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'OweMoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'money',
            width: 100,
            title: '实收金额',
            format: '0.00',
            align: 'right',
            readonly: false,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'freemoney',
            width: 100,
            title: '优惠金额',
            format: '0.00',
            align: 'right',
            readonly: false,
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'FreeMoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
            sort: false,
        }
    ];
    public getParams: object = {};
    constructor(dataSource: DataSourceType, instanceRefs: any, type: string){ 
        super(dataSource, instanceRefs)
        this.type = type;
        this.allPower = true;
        type=='pay'?this.Columns = this.PayColumns:this.Columns = this.ResColumns
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'LkxMoneyPayRes',sep: true,expand: true,opt:false,parger:false,readOnly: false,endAutoAppend: false
        }); 
        this.PagerConfig.pageSize = 0;
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                CurMoneyCalc:(datas: any): number=> {
                    return $Utils.sumArray(datas,'curmoney')
                },
                OweMoneyCalc:(datas: any): number=> {
                    return $Utils.sumArray(datas,'owemoney')
                },
                MoneyCalc:(datas: any): number=> {
                    const _M = $Utils.sumArray(datas,'money')
                    this.instanceRefs.headerData!.value!.money = _M
                    return _M
                },
                FreeMoneyCalc:(datas: any): number=> {
                    const _M = $Utils.sumArray(datas,'freemoney')
                    this.instanceRefs.headerData!.value!.freemoney = _M
                    return _M
                },
            },
            customColor:(rowItem: any,cellItem: Object)=>{
                if (rowItem.owemoney<0) return 'red'; else return '';
            }
        })
        this.Events = $Utils.deepObjectMerge(this.Events,<TableEventsType>{
            expand:(data: any,action: any)=>{
                if (data.expanded){
                    if (this.type!='pay'){
                        this.instanceRefs.gridDetailListAction!.Columns = this.instanceRefs.gridDetailListAction?.Columns||[]
                        this.instanceRefs.detailListDataSource!.apiPath='/masterApi/PosApi/sales/sale/billDetail/'
                    }   else {
                        this.instanceRefs.gridDetailListAction!.Columns = this.instanceRefs.gridDetailListAction?.Columns ||[]
                        this.instanceRefs.detailListDataSource!.apiPath='/masterApi/PosApi/purchase/purchase/billDetail/'
                    }
                    this.instanceRefs.detailListDataSource!.getParams.condition = 
                        `BillNumber='${data.rowData.curbillnumber}'`;
                    this.instanceRefs.gridDetailListAction?.open()
                } else {
                    this.instanceRefs.detailListDataSource!.dataSet = []
                   // this.instanceRefs.Win.ActiveGridAction = this;
                }
            },
            rowDbClick: async (datas: any[],rowdata: any,rowIndex: number,cellIndex: number,fieldName: string)=>{
                this.instanceRefs.gridMoneyListAction!.dataSource.dataSet.push({
                        billnumber: rowdata.curbillnumber,
                        costmoney: rowdata.curmoney,
                        salemoney: rowdata.curmoney,
                        owemoney: rowdata.owemoney,
                        examineat: rowdata.mrat,
                        deliveryat: rowdata.mrat,
                        settlementat: rowdata.settlementat
                    })
                this.delete(false)
            },
        })
    }
    
    protected async beforeInsert(): Promise<boolean> {
        this.maxKeyValue = this.maxKeyValue + 1
        return new Promise((resolve, reject)=>{
            resolve(this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: any,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idKey',this.instanceRefs.headerData?.value?.billnumber+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4),rowIndex);
        this.dataSource.setFieldValue('billnumber',this.instanceRefs.headerData?.value?.billnumber,rowIndex);
        this.dataSource.setFieldValue('billtype',50201,rowIndex);  
        this.dataSource.setFieldValue('at',$Utils.getDate(),rowIndex);
        this.fieldToColIndex('money')
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: any,rowItem: any): Promise<boolean>{
        const _fieldName = data.fieldName.toLocaleLowerCase()
        const flg = +rowItem.owemoney>=0?1:-1

        if (_fieldName == 'money'){
            data.fieldValue = Math.abs(+data.fieldValue)*flg
            this.dataSource.setFieldValue('freemoney',0,data.editRowIndex);
        }
        if (_fieldName == 'freemoney'){
            data.fieldValue = Math.abs(+data.fieldValue)*flg
            const _Money = (+rowItem.owemoney) -  (+data.fieldValue);
            this.dataSource.setFieldValue('money',_Money,data.editRowIndex);
            return true
        }
        return super.onSetFieldValue(data,rowItem)
    }
    public setPower(){
        return false
    }    

}

export class TMoneyListAction extends TGridAction<MoneyPayResInstanceRefs>{
    private type = 'pay';
    public curDataset = <any>[];
    public  PayColumns = [
        {
            dataType: 'text',
            fieldName: 'billnumber',
            width: 150,
            title: '单号',
            readonly: true,
            sort: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'datetime',
            fieldName: 'examineat',
            width: 100,
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '日期',
            readonly: false,
            sort: true
        },{
            dataType: 'number',
            fieldName: 'costMoney',
            width: 100,
            title: '采购金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: true
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 100,
            title: '应付金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
            sort: true
        }
    ] as TableColumnsType[]
    public  ResColumns = [
        {
            dataType: 'text',
            fieldName: 'billnumber',
            width: 140,
            title: '单号',
            readonly: true,
            sort: true ,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'datetime',
            fieldName: 'DeliveryAt',
            width: 95,
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日期',
            readonly: false,
            sort: true
        },{
            dataType: 'number',
            fieldName: 'oweMoney',
            width: 100,
            title: '应收金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'saleMoney',
            width: 100,
            title: '销售金额',
            format: '0.00',
            align: 'right',
            readonly: true,
            sort: true
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
            sort: true
        }
    ] as TableColumnsType[]
    public getParams: object = {};
    constructor(dataSource: DataSourceType, instanceRefs: MoneyPayResInstanceRefs, type: string){ 
        super(dataSource, instanceRefs)
        this.type = type;
        type=='pay'?this.Columns = this.PayColumns:this.Columns = this.ResColumns
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'PayOrRes',sep: true,expand: false,opt:false,parger:false,readOnly: true,gridFooter: true
        })
        this.PagerConfig.pageSize = 0;
        this.Methods = $Utils.deepObjectMerge(this.Methods,<TableMethodsType>{
            customColor:(rowItem: any,cellItem: Object)=>{
                if (rowItem.owemoney<0) return 'red'; else return '';
            },
            sumCalculated:{
                MoneyCalc:(datas: any): number=> {
                    const _M = $Utils.sumArray(datas,'owemoney')
                    this.instanceRefs.headerData!.value.money = _M
                    return _M
                },
            }
        })
        this.Events = $Utils.deepObjectMerge(this.Events,<TableEventsType>{
            rowDbClick: async (datas: any[],rowdata: any,rowIndex: number,cellIndex: number,fieldName: string)=>{
               this.ToList(rowdata)
               this.dataSource.dataSet.splice(rowIndex,1)
            },
        })
    }
    public async ToList(rowdata: any){
        const res = await this.instanceRefs.gridAction?.insert(false)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('curbillnumber',rowdata.billnumber)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('curmoney',this.type=='pay'?rowdata.costmoney:rowdata.salemoney)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('owemoney',rowdata.owemoney)

        this.instanceRefs.gridAction?.dataSource.setFieldValue('money',rowdata.owemoney)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('freemoney',0)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('mrat',this.type=='pay'?rowdata.examineat:rowdata.deliveryat)
        this.instanceRefs.gridAction?.dataSource.setFieldValue('settlementat',this.type=='pay'?rowdata.examineat:rowdata.settlementat)
    }
    public async ToListPuls(data: any[]){
        for  (let i = 0;i<data.length;i++){
            const rowdata = data[i]
            const res = await this.instanceRefs.gridAction?.insert(false)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('curbillnumber',rowdata.billnumber)

            this.instanceRefs.gridAction?.dataSource.setFieldValue('curmoney',this.type=='pay'?rowdata.costmoney:rowdata.salemoney)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('owemoney',rowdata.owemoney)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('money',rowdata.owemoney)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('freemoney',0)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('mrat',this.type=='pay'?rowdata.examineat:rowdata.deliveryat)
            this.instanceRefs.gridAction?.dataSource.setFieldValue('settlementat',this.type=='pay'?rowdata.examineat:rowdata.settlementat)
            this.instanceRefs.gridMoneyListAction!.dataSource.dataSet = []
        }
    }
    public setPower(){
        return false
    }
    public async afterOpen(dataSet: any[]) {
        this.curDataset = [...dataSet]
    }
}
