import {
    DataSourceType,
    TableRowDataType,
} from '@v4x/ui';
import { InstanceRefsBase } from '../../types';
import $Utils from '@v4x/utils/lkxUtil'
import {TBasicAction} from "../basicAction"
export class TAreaGridAction extends TBasicAction<InstanceRefsBase>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<InstanceRefsBase>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
                dataType: 'number',//数据类型
                fieldName: 'idcode',//字段名
                width: 100,//宽度
                title: '编码',//标题
                align:'center',
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
                fieldName: 'note',//字段名
                width: 100,//宽度
                title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Area',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
              fields:[{fieldName: "idcode",caption: "编码",filterType: "fsNone"},
                {fieldName: "name",caption: "名称",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ]
        }) ;

        this.Methods =   $Utils.deepObjectMerge(this.Methods,{
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
        })
    }

    protected async beforeInsert(): Promise<boolean> {
        const res =  await super.beforeInsert()
        if (res){
            const fieldValue = await this.dataSource.getFieldValueFormServer({fieldName: 'max(idcode)',condition:''});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 + 1;} 
        }
        return new Promise((resolve, reject)=>{
            resolve(res&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.fieldToColIndex('name');
        return super.afterInsert(rowItem,rowIndex)
    }
}