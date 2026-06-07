
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, ModalResultEnum, TableColumnsType, TableRowDataType } from '@v4x/ui';
import {BatchInSelectInstanceRefs} from './types'

export class TAction extends TGridAction<BatchInSelectInstanceRefs>{
    public getParams: object = {};
    constructor(dataSource: DataSourceType,instanceRefs: BatchInSelectInstanceRefs){ 
        super(dataSource,instanceRefs)
         this.TableConfig = Object.assign(this.TableConfig,{
            id:'batch-in-select',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 60,//宽度
            title: '编码',//标题
            align:'center',
            readonly: true,
            sort: false
            
        },{
            fieldName: 'Name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            sort: false,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            sort: false,
        },{
            fieldName: 'numex',//字段名
            width: 80,//宽度
            dataType:'number',
            title: '数量',//标题
            align: 'right',
            sort: false,
            format:'0.00'
        },{
            fieldName: 'BatchNumber',//字段名
            width: 200,//宽度
            sort: false,
            title: '批次',//标题
        },{
            fieldName: 'downunit',//字段名
            width: 40,//宽度
            title: '单位',//标题
            sort: false,
        },{
            fieldName: 'costprice',//字段名
            width: 80,//宽度
            dataType:'number',
            title: '单价',//标题
            align: 'right',
            sort: false,
            format:'0.00'
        }] as TableColumnsType[]
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
            },
            customColor:(rowItem: TableRowDataType,cellItem: object): string=>{
                if (rowItem.isquotedprice==0) return 'red';
                return ''
            },
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
               const _Params =  {
                    procName:'Sp_GetSaleBatchNotMatch',
                    procParmars:{BillNumber: ''}
                }
                const BatchRes = await $api.comonRequest('/masterApi/PublicApi/','getFromProc',_Params);
                if (BatchRes&&BatchRes.errCode==0&&BatchRes.datas.length>0){
                    this.instanceRefs.detailGridAction.dataSource.dataSet = BatchRes.datas;
                }
            },
        })
    }
   
    
    public setPower(){
        return false
    }
    public async open(){
        const res = await $api.comonRequest(this.dataSource.apiPath,'getFromProc',this.getParams)
        if (res&&res.errCode==0){
            this.dataSource.dataSet = res.datas;
            this.dataSource.totalData = res.total;
            this.dataSource.dataSetRowCount = res.total.count;
        }
    }
}

export class TBatchAction extends TGridAction<BatchInSelectInstanceRefs>{
    public getParams: object = {};
    constructor(dataSource: DataSourceType,instanceRefs: BatchInSelectInstanceRefs){ 
        super(dataSource,instanceRefs)
         this.TableConfig = Object.assign(this.TableConfig,{
            id:'batch-in-select',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
        this.Columns = [{
                fieldName: 'deliveryat',//字段名
                width: 100,//宽度
                sort: false,
                title: '日期',//标题
                dataType:'date',
            },{
                fieldName: 'numex',//字段名
                width: 80,//宽度
                dataType:'number',
                title: '数量',//标题
                align: 'right',
                sort: false,
                format:'0.00'
            },{
                fieldName: 'customercode',//字段名
                width: 200,//宽度
                title: '客户',//标题
                inputType: 'drop',
                dropListConfig:{
                    allowFilter: true,
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|100',
                    dropListDatasName:'CustomerDatas',
                // dropListDatas: this.commonDatas.value.CustomerDatas
                },
            },{
                fieldName: 'billnumber',//字段名
                width: 150,//宽度
                dataType:'text',
                title: '单号',//标题
                sort: false,

            }
        ] as TableColumnsType[]
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
            },
            customColor:(rowItem: TableRowDataType,cellItem: object): string=>{
                if (rowItem.isquotedprice==0) return 'red';
                return ''
            },
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
               await this.batchNumberMatch(this.instanceRefs.gridAction.dataSource.thisRowData,rowdata,rowIndex);
                // this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance,{action: ModalResultEnum.mrConfirm, data:rowdata}) 
            },
        })
    }
   
    
    public setPower(){
        return false
    }
    public async open(){
        const res = await $api.comonRequest(this.dataSource.apiPath,'getFromProc',this.getParams)
        if (res&&res.errCode==0){
            this.dataSource.dataSet = res.datas;
            this.dataSource.totalData = res.total;
            this.dataSource.dataSetRowCount = res.total.count;
        }
    }
    public async batchNumberMatch(curItem: TableRowDataType,target: TableRowDataType,rowIndex: number){
        console.log(curItem)
        const MatchNum = target.numex>=curItem.numex?curItem.numex:target.numex;
        const procParmars={
                DeliveryAt: curItem.deliveryat,
                SaleIdkey: target.idkey,
                ProductCode: curItem.productcode,
                MatchBatchNumber: curItem.batchnumber,
                MatchsBatchNumber: curItem.sbatchnumber,
                MatchNum: MatchNum,
                MatchCostPrice: curItem.costprice
        }
        const BatchRes = await $api.comonRequest('/masterApi/disApi/purchase/purchase/BillDetail/','matchBatchNumber',procParmars);
       
        if (BatchRes&&BatchRes.errCode==0){
            const _dataSource = this.instanceRefs.gridAction.dataSource;
            _dataSource.setFieldValue('numex',_dataSource.getFieldValue('numex')-MatchNum);
            this.dataSource.dataSet.splice(rowIndex,1);
            if (_dataSource.getFieldValue('numex') <= 0){
                _dataSource.dataSet.splice(_dataSource.activeRowIndex,1);
            }
           // this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance,{action: ModalResultEnum.mrConfirm, data:BatchRes.datas[0]}) 
        }
        
    }
}