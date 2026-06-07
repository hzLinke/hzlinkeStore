
import $Utils from '@v4x/utils/lkxUtil'
import { defineComponent, reactive, ref ,onMounted, toRefs,inject } from 'vue'
import {TGridAction} from "@/usehook/gridAction"
import type { PurchaseViewsInstanceRefs } from '../../types'
import { TableColumnsType, DataSourceType } from '@v4x/ui';
import useAppStore from '@/stores';



export class TListGridAction extends TGridAction<PurchaseViewsInstanceRefs>{
    public ChildrenColumns: TableColumnsType[] =[];
    constructor(dataSource: DataSourceType,instanceRefs: PurchaseViewsInstanceRefs){ 
        super(dataSource,instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = ''
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'sep',//字段名
            width: 50,//宽度
            title: '序号',//标题
            align:'center'
        },{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '编码',//标题
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            readonly: true,
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            readonly: true,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center',
        },{
            dataType: 'number',
            fieldName: 'numex',//字段名
            width: 80,//宽度
            title: '数量',//标题
            align: 'right',
            format:'0.00',
        },{
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            customFormater:(val,rowItem)=>{
                return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
            }
        },{
            fieldName: 'money',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '金额',//标题
            format:'0.00',
            align:'right',
            customFormater:(val,rowItem)=>{
                return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
            
        }];
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'PurchaseViews-PurchaseCheckReports',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }
    
}
