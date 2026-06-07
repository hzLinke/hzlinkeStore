import {
    TableRowDataType,
    DataSourceType,
} from '@v4x/ui';
import { InstanceRefsBase } from '../../types';
import $Utils from '@v4x/utils/lkxUtil'
import {TBasicAction} from "../basicAction"
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
            width: 120,//宽度
            title: '姓名',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'tel',//字段名
            width: 150,//宽度
            title: '电话',//标题
        },{
            dataType: 'number',//数据类型
            fieldName: 'post',//字段名
            width: 80,//宽度
            title: '岗位',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'PostDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               // dropListDatas: this.commonDatas.value.PostDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 60,//宽度
            title: '状态',//标题
            inputType: 'drop',
            sort:false,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'在职'},{idcode:1,name:'离职'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'LookSelfOrder',//字段名
            width: 100,//宽度
            title: '只看本人',//标题
            inputType: 'drop',
            align:'center',
            sort:false,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'否'},{idcode:1,name:'是'}]
            },
        },{
            fieldName: 'wxcode',//字段名
            width: 200,//宽度
            title: 'OpenCode',//标题
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'text',
            title: '备注',//标题
        }];
        this.TableConfig = {
            ...this.TableConfig,
            id:'basicViews-user',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }; 
        this.SerachBoxConfig.fields = [
            {fieldName: "idcode", caption: "编码", filterType: "fsNone"},
            {fieldName: "name", caption: "姓名", filterType: "fsLike"},
            {fieldName: "tel", caption: "电话", filterType: "fsLike"},
            {fieldName: "post", caption: "岗位", filterType: "fsIn", inList: this.commonDatas.PostDatas},
            {fieldName: "status", caption: "状态", filterType: "fsIn", inList: [{idcode: 0, name: '在职'}, {idcode: 1, name: '离职'}]},
            {fieldName: "note", caption: "备注", filterType: "fsLike"}
        ] 
        this.Methods = {
            ...this.Methods,
            notAllowEdit: (row: TableRowDataType): boolean => {
                return ['0', '1'].indexOf(row.idcode) > -1
            },
            notAllowDel: (row: TableRowDataType): boolean => {
                return ['0', '1'].indexOf(row.idcode) > -1 || !this.PowerList.allowedDelete
            },
            customColor: (rowItem: TableRowDataType, cellItem: object): string => {
                if (rowItem.status == 1) return 'red'
                return ''
            },
            sumCalculated: {
                ...this.Methods.sumCalculated,
                countCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).count
                }
            }
        } ;
        this.Events = {
            ...this.Events,
            indicatorButtonEvent: (data: any) => {
            },
            rowDbClick: (_datas: TableRowDataType[], rowdata: TableRowDataType, _rowIndex: number, _cellIndex: number, _fieldName: string) => {
                if (rowdata.idcode == 1) return
            }
        }
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
        return new Promise((resolve, reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean>{
        this.dataSource.setFieldValue('idcode',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('post',0);//rowItem['idcode'] = 50;
        this.dataSource.setFieldValue('status',0);
        this.dataSource.setFieldValue('LookSelfOrder',1)
         this.dataSource.setFieldValue('tel','abcd')
        this.fieldToColIndex('name');
        return super.afterInsert(rowItem,rowIndex)
    }  
}
export class TUserGridDetailAction extends TBasicAction<InstanceRefsBase>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<InstanceRefsBase>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'cateCode',//字段名
            width: 300,//宽度
            title: '分类',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'CateDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               // dropListDatas: this.commonDatas.value.PostDatas
            },
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Cate-Manage',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(_datas: any): number=> {
                  //  console.log('计算')
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
                console.log(data)
            },
            
        })
    }
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
           // const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_UserManageCate_Tab',fieldName: 'isnull(max(RIGHT(idkey,4)),0)+1',condition:`PCode='${this.thisInstance.headerData.idcode}'`});
           // if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, _reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(_rowItem: TableRowDataType,_rowIndex: number): Promise<boolean> {
       // this.dataSource.setFieldValue('idKey',this.thisInstance.headerData.idcode+'-'+ $Utils.formatZero(this.maxKeyValue.toString(),4));//rowItem['idcode'] = 50;
       // this.dataSource.setFieldValue('pcode',this.thisInstance.headerData.idcode);
        return super.afterInsert(_rowItem,_rowIndex)

    }
}
