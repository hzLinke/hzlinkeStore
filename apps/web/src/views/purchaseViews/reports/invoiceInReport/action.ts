
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import type { PurchaseViewsInstanceRefs } from '../../types'
import { TableColumnsType, DataSourceType, MessageBox } from '@v4x/ui';
import useAppStore from '@/stores';

export class TListGridAction extends TGridAction<PurchaseViewsInstanceRefs>{
    constructor(dataSource: DataSourceType,instanceRefs: PurchaseViewsInstanceRefs){ 
        super(dataSource,instanceRefs)

        this.dataSource.getParams.defaultCondition = ''
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'sep',//字段名
            width: 50,//宽度
            title: '序号',//标题
            align:'center'
        },{
            fieldName: 'name',//字段名
            width: 250,//宽度
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
            width: 150,//宽度
            title: '平均单价',//标题
            align:'right',
            customFormater:(val,rowItem)=>{
                //return $Utils.numberFormat($Utils.clearDecimal(val as string),'0.00')
                return $Utils.clearDecimal(val as string)
            }
        },{
            fieldName: 'costmoney',//字段名
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
            id:'SaleViews-Reports-SaleCheck',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }
    public async open(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        const res = await this.dataSource.open(
            this.PagerConfig,
            ()=>{return this.beforeOpen()},
            (deataSet)=>{this.afterOpen(deataSet)}
        )
        if (res){
            this.dataSource.dataSet = $Utils.arrGroup(this.dataSource.dataSet,'catename')
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
}
