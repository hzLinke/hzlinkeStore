import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { defineComponent, reactive, ref ,onMounted, toRefs,inject } from 'vue'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType } from '@v4x/ui';
export class TListGridAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.defaultCondition = ''
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.Columns = [{
            dataType: 'text',//数据类型
            fieldName: 'sep',//字段名
            width: 30,//宽度
            title: '#',//标题
            align:'center',
            readonly: true,
        },{
            fieldName: 'idcode',//字段名
            width: 60,//宽度
            title: '编码',//标题
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '名称',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'tel',//字段名
            width: 100,//宽度
            align: 'left',
            title: '电话',//标题
        },{
            fieldName: 'addr',//字段名
            width: 200,//宽度
            title: '地址',//标题
        },{
            fieldName: 'person',//字段名
            width: 120,//宽度
            title: '联系人',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'DisViews-disReport',sep: true,expand: false,opt:false,parger:true,readOnly: false
        });
    }
}
