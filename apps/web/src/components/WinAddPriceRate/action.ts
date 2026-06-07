import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import type { AddPriceRateInstanceRefs } from './types'
import { DataSourceType, TableRowDataType } from '@v4x/ui';

export class TAction extends TGridAction<AddPriceRateInstanceRefs>{
    private maxKeyValue = -1;
    public getParams: object = {};
    
    constructor(dataSource: DataSourceType, instanceRefs: AddPriceRateInstanceRefs){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            fieldName: 'name',
            width: 200,
            title: '名称',
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'
            }
        },{
            dataType: 'number',
            fieldName: 'addPriceRate',
            width: 100,
            title: '加价率',
            format: '0.00%',
            align: 'right'
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id: 'AddPriceRate-set',
            sep: true,
            expand: false,
            opt: false,
            parger: false,
            readOnly: false
        }); 
        this.PowerList.allowedEdit = true;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            notAllowEdit: (row: TableRowDataType): boolean => {
               return ['0', '1'].indexOf(row.idcode) > -1
            },
            notAllowDel: (row: TableRowDataType): boolean => {
               return ['0', '1'].indexOf(row.idcode) > -1 || !this.PowerList.allowedDelete
            },
            sumCalculated:{
                countCalc: (datas: any): number => {
                    return (this.dataSource.totalData as any).count
                },
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string) => {
               datas.splice(rowIndex, 1)
            },
        });
    }

    public setPower(){
        return false
    }
}
