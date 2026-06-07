import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import type { ShipperSetInstanceRefs } from './types'
import { DataSourceType, TableRowDataType } from '@v4x/ui';

export class TAction extends TGridAction<ShipperSetInstanceRefs>{
    public getParams: object = {};
    constructor(dataSource: DataSourceType, instanceRefs: ShipperSetInstanceRefs){ 
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
            fieldName: 'DefaultShipperCode',
            width: 200,
            title: '供货商',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName: 'idcode',
                displayFieldName: 'name',
                displayFields: 'idcode|name',
                displayFieldWidths: '50|200',
                dropListDatasName: 'ShipperDatas',
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id: 'Shipper-set',
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
    }
}
