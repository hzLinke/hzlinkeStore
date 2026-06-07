import $api from '@/request/api'
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType, SetFieldValueType, MessageBox, ModalResultEnum } from '@v4x/ui'
import type { MateWinInstanceRefs } from './types'
import { WinRateProductSelect } from '../WinRateProductSelect'

export class TAction extends TGridAction<MateWinInstanceRefs> {
    constructor(dataSource: DataSourceType, instanceRefs: MateWinInstanceRefs, type = 'order') {
        super(dataSource, instanceRefs)
        this.PowerList.allowedEdit = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedDelete = true
        this.PowerList.allowedInsert = true
        this.PowerList.allowedPrint = true
        this.PowerList.allowedExport = true
        this.Columns = [{
            fieldName: 'seq',
            width: 40,
            title: '序号',
            readonly: true,
            sort: false,
            align: 'center'
        }, {
            fieldName: 'inputname',
            width: 180,
            title: '输入|品名 ',
            readonly: true,
            sort: false,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        }, {
            dataType: 'number',
            fieldName: 'num',
            width: 70,
            title: '输入|数量',
            format: '0.00',
            align: 'right',
            sort: false,
            numberFlg: '+',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'numCalc'
            }
        }, {
            fieldName: 'unit',
            width: 50,
            title: '输入|单位',
            align: 'center',
            sort: false,
            readonly: true,
        }, {
            fieldName: 'note',
            width: 90,
            title: '输入|备注',
            sort: false,
        }, {
            fieldName: 'productcode',
            width: 60,
            title: '匹配|编码',
            readonly: true,
            sort: false,
        }, {
            fieldName: 'name',
            width: 180,
            title: '匹配|品名',
            readonly: true,
            sort: false,
        }, {
            fieldName: 'spec',
            width: 80,
            title: '匹配|规格',
            readonly: true,
            sort: false,
        }, {
            dataType: 'number',
            fieldName: 'saleprice',
            width: 80,
            title: '匹配|单价',
            readonly: true,
            sort: false,
            align: 'right'
        }]
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig, {
            id: 'OrderPackDetail',
            sep: false,
            expand: false,
            opt: true,
            parger: false,
            readOnly: false,
            optWidth: 80,
            allowedOperations: {
                alopInsert: false
            }
        })
        this.Methods = $Utils.deepObjectMerge(this.Methods, {
            customColor: (rowItem: TableRowDataType, _cellItem: object): string => {
                if (rowItem.ismate == 0) return 'red'
                return ''
            },
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
        })
        this.Events = $Utils.deepObjectMerge(this.Events, {
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
                this.dataSource.setFieldValue('saleprice',res.data.saleprice);
                this.dataSource.setFieldValue('ismate',1);

                this.aiAutoStudy(
                    this.instanceRefs.customercode,
                    rowdata.inputname||'',
                    res.data.name, res.data.idcode, res.data.saletype
                )
            }
        })
    }
    public async onSetFieldValue(data: SetFieldValueType, rowItem: TableRowDataType): Promise<boolean> {
        if (data.fieldName == 'num') {
            data.fieldValue = Math.abs(data.fieldValue as number)
            const _NumEx = Math.abs(data.fieldValue as number * rowItem.downwg)
            this.dataSource.setFieldValue('numex', _NumEx, data.editRowIndex)
            return true
        }
        return super.onSetFieldValue(data, rowItem)
    }
    protected async beforedEdit(): Promise<boolean> {
        return new Promise((resolve, reject) => {
            resolve(true)
        })
    }
    public async aiMate(customerCode: number, InputJson: string, userCode: number) {
        MessageBox.loading({
            moreText: '正在匹配...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath, 'aiToMate', {
            customerCode: customerCode,
            inputJson: InputJson,
            userCode: userCode
        })
        if (submitRes.errCode == 0) {}
        setTimeout(() => { MessageBox.closeAllLoading() }, 50)
        return submitRes
    }
    public async aIMateToBill(billNumber: string, userCode: string) {
        const res = await MessageBox.question({
            title: '提问',
            content: '是否要生成订单数据？'
        })
        if (res.action == ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在生成...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath, 'aIMateToBill', {
            type: 'toSaleOrder',
            billNumber: billNumber,
            userCode: userCode,
        })
        setTimeout(() => { MessageBox.closeAllLoading() }, 50)
        return submitRes
    }
    public async aiAutoStudy(customerCode: number, inputName: string, sysName: string, sysCode: string, saleType: number) {
        const submitRes = await $api.comonRequest(this.dataSource.apiPath, 'aiAutoStudy', {
            customerCode: customerCode,
            inputName: inputName,
            sysName: sysName,
            sysCode: sysCode,
            saleType: saleType
        })
        if (submitRes.errCode == 0) {}
        return submitRes
    }
}
