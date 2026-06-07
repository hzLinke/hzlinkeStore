
import $api from '@/request/api';
import commonParam from '@/config'
import $Utils from '@v4x/utils/lkxUtil';
import {getProduct,dataIsExist} from "@/usehook/dataAction";
import { defineComponent, reactive, ref ,onMounted, toRefs,inject } from 'vue'
import {TBasicAction} from "../basicAction"
import { CommondDatasParamType, DataSourceType, MessageBox, SetFieldValueType, TableRowDataType } from '@v4x/ui';
import { InstanceRefsBase } from '../../types';
import { WinProductSelect } from '@/components';

export class TKProductGridAction extends TBasicAction<InstanceRefsBase>{
    private maxKeyValue = -1;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<InstanceRefsBase>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '货号',//标题
            sort: true,
            allowInputString: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorButtonEvent'
        },{
            fieldName: 'barcode',//字段名
            width: 100,//宽度
            title: '条码',//标题
            sort: true,
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            readonly: true,
            sort: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            sort: true,
            readonly: true,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: true,
            align:'center'
        },{
            dataType: 'num',
            fieldName: 'SerialNumber',//字段名
            width: 80,//宽度
            title: '序号',//标题
            sort: true,
            align: 'right',
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'basicViews-Kporduct',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            sumCalculated:{
                countCalc:(_datas: any): number=> {
                   // console.log('计算')
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            indicatorButtonEvent:(data: any)=>{
              //  console.log(data)
            },
            rowDbClick: (_datas: TableRowDataType[],_rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
              
            }
        })
    }
    /*
    public Methods: LkxTableMethodsType = $Utils.deepObjectMerge(this.Methods,{
        sumCalculated:{
            countCalc:(_datas: any): number=> {
                console.log('计算')
                return (this.dataSource.totalData as any).count
            },
        },
    })
    public Events: LkxTableEventsType = $Utils.deepObjectMerge(this.Events,{
        indicatorButtonEvent:(data: any)=>{
            console.log(data)
        },
        rowDbClick: (_datas: TableRowDataType[],_rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
          
        }
    })*/
    public  changeRowValue = async (data: any,editRowIndex?: number)=>{
        const _DataisExist = await dataIsExist(this.dataSource.apiPath, `ProductCode=${data.idcode}`);
        if (_DataisExist){
            MessageBox.information({
                title:'提问',
                content:`编码${data.idcode}已存在，不能重复录入`,
                showCancel: false
            })
            return false
        }
        const _DataSource = this.dataSource;
        _DataSource.setFieldValue('productcode',data.idcode,editRowIndex);
        _DataSource.setFieldValue('barcode',data.barcode,editRowIndex);
        _DataSource.setFieldValue('name',data.name,editRowIndex);
        _DataSource.setFieldValue('spec',data.spec,editRowIndex);
        _DataSource.setFieldValue('unit',data.unit,editRowIndex);
        _DataSource.setFieldValue('num',0,editRowIndex);
        _DataSource.setFieldValue('inprice',data.inprice,editRowIndex);
        return false
    }
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        if (updateRes){
            const fieldValue = await this.dataSource.getFieldValueFormServer({tableName:'L_Basic_K_Tab',fieldName: 'isnull(max(SerialNumber),0)+1',condition:''});
            if (fieldValue != -1){this.maxKeyValue = fieldValue*1 ;} 
        }
        return new Promise((resolve, _reject)=>{
            resolve(updateRes&&this.maxKeyValue!=-1)
        })
    }
    public async afterInsert(_rowItem: TableRowDataType,_rowIndex: number): Promise<boolean> {
        this.dataSource.setFieldValue('SerialNumber',this.maxKeyValue);//rowItem['idcode'] = 50;
        this.fieldToColIndex('productcode') 
        return super.afterInsert(_rowItem,_rowIndex)
    }
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
        if (data.fieldName == 'productcode'){
            const res = await getProduct({inputText: data.fieldValue.toString(),customerCode:0})
            if (res.length==0){
                MessageBox.toast({
                    content:'无此商品',
                    messageType:'warning'
                })
                setTimeout(()=>{
                    this.fieldToColIndex('productcode')
                },100)
                return false    
            }
            if (res.length==1){return await this.changeRowValue(res[0])}
            const _SelectRes = await WinProductSelect.show({title:'商品选择',defaultDatas: res,customerCode:0})
            if (_SelectRes){
                return this.changeRowValue(_SelectRes,data.editRowIndex);
            }
            return false
        }
        return super.onSetFieldValue(data,rowItem)
    }
}