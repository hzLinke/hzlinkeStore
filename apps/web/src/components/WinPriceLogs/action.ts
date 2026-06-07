
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { TGridAction } from "@/usehook/gridAction"
import { DataSourceType, CommondDatasParamType } from '@v4x/ui';
import { PriceLogsInstanceRefs } from './types';

export class TAction extends TGridAction<PriceLogsInstanceRefs>{
    public getParams: object = {};
    constructor(dataSource: DataSourceType,instanceRefs: PriceLogsInstanceRefs){ 
        super(dataSource, instanceRefs) 
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'StockInfBox',sep: true,expand: false,opt:false,parger:false,readOnly: true,endAutoAppend: false
        }); 
        this.PagerConfig.pageSize = 0;
        this.Columns = [{
            dataType: 'date',
            fieldName: 'Date',
            width: 200,
            title: '时间',
            sort: true,
        },{
            fieldName: 'userName',
            width: 90,
            title: '操作人',
            align: 'left',
            format:'0.00',
            sort: true,
        },{
            dataType: 'number',
            fieldName: 'curSalePrice',
            width: 80,
            title: '原价',
            align: 'right',
            format:'0.00',
            sort: true,
        },{
            dataType: 'number',
            fieldName: 'newSalePrice',
            width: 80,
            title: '新价',
            align: 'right',
            format:'0.00',
            sort: true,
        },{
            dataType: 'text',
            fieldName: 'BillNumber',
            width: 180,
            title: '单号',
            sort: true,
        },{
            dataType: 'text',
            fieldName: 'Note',
            width: 300,
            title: '备注',
            sort: true,
        }];

    }
    public async open(){
        const res = await $api.comonRequest(this.dataSource.apiPath,'getFromProc',this.getParams)
        if (res&&res.errCode==0){
            this.dataSource.dataSet = res.datas;
            this.dataSource.totalData = res.total;
            this.dataSource.dataSetRowCount = res.total.count;
        }
    }
}
