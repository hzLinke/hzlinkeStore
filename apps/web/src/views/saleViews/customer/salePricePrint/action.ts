
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import type { CustomerInstanceRefs } from '../types'
import { TableColumnsType, DataSourceType } from '@v4x/ui';
import useAppStore from '@/stores';

export class TListGridAction extends TGridAction<CustomerInstanceRefs>{
    public ChildrenColumns: TableColumnsType[] =[];
    constructor(dataSource: DataSourceType,instanceRefs: CustomerInstanceRefs){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.defaultCondition = ''

        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'sep1',//字段名
            width: 42,//宽度
            title: '序号',//标题
            align:'center',
            sort: false
        },{
            fieldName: 'name1',//字段名
            width: 100,//宽度
            title: '品名',//标题
            sort: false
        },{
            fieldName: 'spec1',//字段名
            width: 60,//宽度
            title: '规格',//标题
            sort: false
        },{
            fieldName: 'price1',//字段名
            dataType: 'number',//数据类型
            width: 65,//宽度
            title: '单价',//标题
            sort: false,
            format:'0.00',
            customFormater:(fieldVal,rowItem)=>{
                return fieldVal?$Utils.clearDecimal(fieldVal as string)+'/'+rowItem.unit1:''
            } ,
            align:'right'
        },{
            dataType: 'number',//数据类型
            fieldName: 'sep2',//字段名
            width: 42,//宽度
            title: '序号',//标题
            align:'center',
            sort: false
        },{
            fieldName: 'name2',//字段名
            width: 100,//宽度
            title: '品名',//标题
            sort: false
        },{
            fieldName: 'spec2',//字段名
            width: 60,//宽度
            title: '规格',//标题
            sort: false
        },{
            fieldName: 'price2',//字段名
            dataType: 'number',//数据类型
            width: 65,//宽度
            title: '单价',//标题
            sort: false,
            format:'0.00',
            customFormater:(fieldVal,rowItem)=>{
                return fieldVal?$Utils.clearDecimal(fieldVal as string)+'/'+rowItem.unit2:''
            } ,
            align:'right'
        },{
            dataType: 'number',//数据类型
            fieldName: 'sep3',//字段名
            width: 42,//宽度
            title: '序号',//标题
            align:'center',
            sort: false
        },{
            fieldName: 'name3',//字段名
            width: 100,//宽度
            title: '品名',//标题
            sort: false
        },{
            fieldName: 'spec3',//字段名
            width: 60,//宽度
            title: '规格',//标题
            sort: false
        },{
            fieldName: 'price3',//字段名
            dataType: 'number',//数据类型
            width: 65,//宽度
            title: '单价',//标题
            sort: false,
            format:'0.00',
            customFormater:(fieldVal,rowItem)=>{

                return fieldVal?$Utils.clearDecimal(fieldVal as string)+'/'+rowItem.unit3:''
            } ,
            align:'right'
        }];
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'SaleViews-SaleOrder',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }
}
