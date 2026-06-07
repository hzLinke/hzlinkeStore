
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType, CommondDatasParamType, TableRowDataType, SetFieldValueType } from '@v4x/ui';
import { WinPrintStyleSetInstanceRefs } from './types';

export class TPrintStyleSetAction extends TGridAction<WinPrintStyleSetInstanceRefs> {
    constructor(dataSource: DataSourceType, instanceRefs: WinPrintStyleSetInstanceRefs, type = 'order') {
        super(dataSource, instanceRefs)
        this.Columns = [{
            fieldName: 'stylename',
            width: 230,
            title: '格式名称',
            readonly: true,
            sort: false
        }, {
            fieldName: 'style',
            width: 300,
            title: '格式内容',
            readonly: true,
            sort: false
        }, {
            fieldName: 'relationcode',
            width: 230,
            title: '关联',
            sort: false,
            inputType: 'drop',
            dropListConfig: {
                allowFilter: false,
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '50|200',
                dropListDatasName: 'LtdDatas',
            },
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig, {
            id: 'PrintStyleSet',
            sep: true,
            expand: false,
            opt: false,
            parger: false,
            readOnly: false,
            optWidth: 280,
            allowedOperations: {
                alopInsert: false
            }
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            rowCalculated: {
                calculaMoney: (rowItem: any): number => {
                    return rowItem.numex * rowItem.costprice
                }
            },
            sumCalculated: {
                countCalc: (datas: any): number => {
                    return datas.length
                },
                numCalc: (datas: any): number => {
                    return $Utils.sumArray(datas, 'num')
                },
                numExCalc: (datas: any): number => {
                    return $Utils.sumArray(datas, 'numex')
                },
                moneyCalc: (datas: any): number => {
                    const _Money = $Utils.sumArray(datas, 'money')
                    return _Money
                },
            },
            customFormater: {
                unitFormat: (value: string, rowItem: TableRowDataType) => {
                    return rowItem.saletype == 2 ? (rowItem.downunit || '') + '/' + (rowItem.unit || '') : (rowItem.unit || '')
                }
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events, {

        })
    }

    public async onSetFieldValue(data: SetFieldValueType, rowItem: TableRowDataType): Promise<boolean> {
        if (data.fieldName == 'num') {
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = Math.abs(data.fieldValue as number * rowItem.downwg);
            this.dataSource.setFieldValue('numex', _NumEx, data.editRowIndex);
            return true
        }
        return super.onSetFieldValue(data, rowItem)
    }

    protected async beforedEdit(): Promise<boolean> {
        return new Promise((resolve, reject) => {
            resolve(true)
        })
    }
}
