import $Utils from '@v4x/utils/lkxUtil'

import {TGridAction} from "@/usehook/gridAction"
import {dataIsExist} from "@/usehook/dataAction"
import { DataSourceType, MessageBox, SetFieldValueType, TableRowDataType } from '@v4x/ui';
import type { ProjectInstanceRefs } from './types'
export class TProjectGridAction extends TGridAction<ProjectInstanceRefs>{
    private maxKeyValue = -1;
    
    constructor(dataSource: DataSourceType,instanceRefs: ProjectInstanceRefs){ 
        super(dataSource,instanceRefs)  
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 80,//宽度
            title: '编码',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '名称',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'addr',//字段名
            width: 150,//宽度
            title: '地址',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'person',//字段名
            width: 100,//宽度
            title: '联系人',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'tel',//字段名
            width: 150,//宽度
            title: '电话',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 80,//宽度
            title: '状态',//标题
            customFormater:'statusFormat',
            inputType: 'drop',
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'正常'},{idcode:1,name:'停用'}]
            },
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Cate',sep: true,expand: false,opt:false,parger:true,readOnly: false, draggable: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "tel",caption: "电话",filterType: "fsLike"},
                {fieldName: "addr",caption: "地址",filterType: "fsLike"},
                {fieldName: "person",caption: "联系人",filterType: "fsLike"},
                {fieldName: "status",caption: "状态",filterType: "fsIn",inList:[{idcode:0,name:'正常'},{idcode:1,name:'停用'}]},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customFormater:{
               
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
            },
        }); 
    }

    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_Project_Tab',fieldName: 'max(idcode)',condition:'idcode<10000'});
            if (fieldValue != -1){
                this.maxKeyValue = fieldValue*1 + 1;
            } 
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('status',0);
        this.fieldToColIndex('name')
        return super.afterInsert(rowItem,rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'name'){
            const _DataisExist = await dataIsExist(this.dataSource.apiPath, `idcode >90000 and name='${data.fieldValue.toString()}'`);
           if (_DataisExist){
               MessageBox.warning({
                   title:'出错',
                   content:`客户名称"${data.fieldValue}"已存在，不可以重复`,
                   messageType:'warning',
                   showCancel: false
               })
               return false
           }
       }
        return super.onSetFieldValue(data,rowItem)
    }
}

