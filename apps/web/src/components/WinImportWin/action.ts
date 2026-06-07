
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import type { ImportWinInstanceRefs } from './types'
import { DataSourceType, TableRowDataType, MessageBox, ModalResultEnum } from '@v4x/ui';
import { WinRateProductSelect } from '../WinRateProductSelect';

export class TAction extends TGridAction<ImportWinInstanceRefs>{
    public getParams: object = {};
    constructor(dataSource: DataSourceType, instanceRefs: ImportWinInstanceRefs){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
                dataType: 'number',//数据类型
                fieldName: 'isMate',//字段名
                width: 50,//宽度
                title: '匹配',//标题
                inputType: 'drop',
                sort:false,
                readonly: true,
                align:'center',
                dropListConfig:{
                    resultFieldName:'idcode',/**下拉返回字段 */
                    displayFieldName: 'name',/**下拉显示字段 */
                    displayFields:'idcode|name',
                    displayFieldWidths:'50|150',
                    dropListDatas: [{idcode:0,name:'否'},{idcode:1,name:'是'}]
                },
            },{
                dataType: 'number',
                fieldName: 'SerialNumber',
                width: 50,
                title: '输入|序号',
                align:'center',
                readonly: true,
                sort: false,
                footers: {
                    align: 'center',
                    value: '合计',
                    valueType: 'fvtNone',
                },
            },{
                dataType: 'number',
                fieldName: 'InputCode',
                width: 80,
                title: '输入|客户编码',
                align:'center',
                readonly: true,
                sort: false,
            },{
                fieldName: 'InputName',
                width: 150,
                title: '输入|客户品名',
                sort: false,
                footers: {
                    align: 'center',
                    valueType: 'fvtCount',
                    calculationer: 'countCalc'
                }
            },{
                fieldName: 'InputSpec',
                width: 100,
                title: '输入|规格',
                sort: false,
            },{
                inputType: 'number',
                fieldName: 'InputPrice',
                width: 100,
                title: '输入|单价',
                align: 'right',
                sort: false,
                format:'0.00'
            },{
                fieldName: 'InputNote',
                width: 80,
                sort: false,
                title: '输入|备注',
        },{
                dataType: 'number',
                fieldName: 'productCode',
                width: 80,
                title: '匹配|标准编码',
                align:'center',
                readonly: true,
                sort: false,
            },{
                fieldName: 'name',
                width: 150,
                title: '匹配|标准品名',
                 readonly: true,
                sort: false,
            },{
                fieldName: 'spec',
                width: 100,
                title: '匹配|规格',
                sort: false,
                readonly: true,
            }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id: 'product-select',
            sep: true,
            expand: false,
            opt: true,
            parger: false,
            readOnly: false,
            optWidth: 80,
            allowedOperations: {
                alopDelete: true,   
                alopInsert: false
            }
        }); 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor: (rowItem: TableRowDataType, _cellItem: object): string => {
                if (rowItem.ismate == 0) return 'red'
                return ''
            },
            notAllowEdit: (row: TableRowDataType): boolean => {
               return ['0', '1'].indexOf(row.idcode) > -1
            },
            notAllowDel: (row: TableRowDataType): boolean => {
               return ['0', '1'].indexOf(row.idcode) > -1 || !this.PowerList.allowedDelete
            },
            sumCalculated:{
               countCalc: (datas: any): number => {
                    return datas.length
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
                const res = await WinRateProductSelect.show({
                    customerCode: this.instanceRefs.customercode,
                    inputname: rowdata.inputname,
                    keepExisting: true
                })
                if (res.action !== ModalResultEnum.mrConfirm) return false
                this.dataSource.setFieldValue('productcode',res.data.idcode);
                this.dataSource.setFieldValue('name',res.data.name);
                this.dataSource.setFieldValue('saletype',res.data.saletype);
                this.dataSource.setFieldValue('unit',res.data.downunit);
                this.dataSource.setFieldValue('spec',res.data.spec);
               // this.dataSource.setFieldValue('saleprice',res.data.saleprice);
                this.dataSource.setFieldValue('ismate',1);
                this.update()
            }
        })
    }

    public async open(): Promise<any>{
        const res = await $api.comonRequest(this.dataSource.apiPath,'getFromProc',this.getParams)
        if (res&&res.errCode==0){
            this.dataSource.dataSet = res.datas;
            this.dataSource.dataSetRowCount = res.datas.length;
            
        }
        return res
    }
    public async updateImportData(apiPath: string, JsonData: string){
        const res = await $api.comonRequest(apiPath,'UpdateImportData',{JsonData:JsonData})
        return res;
    }

    public async QuotedImport(apiPath: string, billnumber: string){
        const res = await MessageBox.question({
            title: '提问',
            content: '是否要上传商品报价？'
        })
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在上传...',
            mask: true
        })
        const submitRes = await $api.comonRequest(apiPath,
            'QuotedPriceImport',
            {
            BillNumber: billnumber
            }
        )   
        setTimeout(() => { MessageBox.closeAllLoading(); }, 500);
        return submitRes;
    }
}
