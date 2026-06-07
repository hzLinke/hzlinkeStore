
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, ModalResultEnum, TableColumnsType, TableRowDataType } from '@v4x/ui';
import {ProductSelectInstanceRefs} from './types'

export class TAction extends TGridAction<ProductSelectInstanceRefs>{
    public getParams: object = {};
    public  OutColumns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 60,//宽度
            title: '编码',//标题
            align:'center',
            readonly: true,
            sort: false,
            hideDuplicates:false,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            
        },{
            fieldName: 'BasicName',//字段名
            width: 200,//宽度
            title: '品名',//标题
            sort: false,
            hideDuplicates:false,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            hideDuplicates:false,
            sort: false,
        },{
            fieldName: 'downunit',//字段名
            width: 40,//宽度
            title: '单位',//标题
            sort: false,
            align:'center',
            hideDuplicates:false,
        },{
            fieldName: 'saleprice',//字段名
            width: 80,//宽度
            title: '单价',//标题
            align: 'right',
            sort: false,
            format:'0.00'
        },{
            fieldName: 'note',//字段名
            width: 60,//宽度
            sort: false,
            title: '备注',//标题
            hideDuplicates:true,
    },{
        fieldName: 'AliasNameList',//字段名
        width: 200,//宽度
        title: '别名',//标题
        sort: false,
        hideDuplicates:true,
    },{
        fieldName: 'name',//字段名
        width: 90,//宽度
        title: '客户别名',//标题
        sort: false,
        hideDuplicates:true,
    }] as TableColumnsType[]
    public  InColumns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 60,//宽度
            title: '编码',//标题
            align:'center',
            readonly: true,
            sort: false,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            
        },{
            fieldName: 'BasicName',//字段名
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
            fieldName: 'downunit',//字段名
            width: 40,//宽度
            title: '单位',//标题
            sort: false,
        },{
            fieldName: 'inprice',//字段名
            width: 80,//宽度
            title: '单价',//标题
            align: 'right',
            sort: false,
            format:'0.00'
        },{
            fieldName: 'note',//字段名
            width: 60,//宽度
            sort: false,
            title: '备注',//标题
    },{
        fieldName: 'AliasNameList',//字段名
        width: 200,//宽度
        title: '别名',//标题
        sort: false,
    },{
        fieldName: 'name',//字段名
        width: 90,//宽度
        title: '客户别名',//标题
        sort: false,
    }] as TableColumnsType[]
    constructor(dataSource: DataSourceType,instanceRefs: ProductSelectInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.Columns = this.OutColumns;
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'product-select',sep: true,expand: false,opt:false,parger:false,readOnly: true
        }); 
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
                this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance,{action: ModalResultEnum.mrConfirm, data:rowdata}) 
            },
            keyDown: (e: KeyboardEvent, rowdata: TableRowDataType)=>{
                e.stopPropagation()
                switch (e.key){
                    case 'Enter':
                        this.instanceRefs.modalActionConfirm?.(this.instanceRefs.parentInstance,{action: ModalResultEnum.mrConfirm, data:rowdata}) 
                        break;
                    case 'Escape':
                        this.instanceRefs.modalActionCancel?.(this.instanceRefs.parentInstance,{action: ModalResultEnum.mrCancel,data:null})
                        break;
                    case 'F3':
                        this.instanceRefs.searchBoxInstance?.focus?.()                       
                        break;
                }
            }
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