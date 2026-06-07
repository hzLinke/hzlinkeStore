
import $Utils from '@v4x/utils/lkxUtil'
import {TBasicAction} from "../basicAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
import { InstanceRefsBase } from '../../types';
export class TUserGridAction extends TBasicAction<InstanceRefsBase>{
    
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<InstanceRefsBase>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'idcode',//字段名
            width: 60,//宽度
            title: '编码',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            fieldName: 'name',//字段名
            width: 250,//宽度
            title: '名称',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'addr',//字段名
            width: 200,//宽度
            title: '地址',//标题
        },{
            fieldName: 'tel',//字段名
            width: 150,//宽度
            title: '电话',//标题
        },{
            fieldName: 'person',//字段名
            width: 100,//宽度
            title: '联系人',//标题
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'text',
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Ltd',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "addr",caption: "地址",filterType: "fsLike"},
                {fieldName: "tel",caption: "电话",filterType: "fsLike"},
                {fieldName: "person",caption: "联系人",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1//||!gridAction.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
               return ['0','1'].indexOf(row.idcode)>-1||!this.PowerList.allowedDelete
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
            indicatorButtonEvent:(data: any)=>{
               // console.log(data)
            }
        })
    }

    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_User_Tab',fieldName: 'max(idcode)',condition:''});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 + 1;} 
        }
        return new Promise((resolve)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('post',0);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('status',0);
        this.fieldToColIndex('name')
        return super.afterInsert(rowItem,rowIndex)
    }  
    public afterUpdate(dataSet: any): any{
        this.commonDatas.LtdDatas = dataSet;
    }
}