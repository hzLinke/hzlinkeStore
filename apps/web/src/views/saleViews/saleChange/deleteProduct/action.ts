
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType } from "@v4x/ui";
export class TDeleteGridAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs);
        this.Columns = [{
            dataType: 'text',//数据类型
            fieldName: 'billnumber',//字段名
            width: 130,//宽度
            title: '单号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'MainNote',//字段名
            width: 100,//宽度
            title: '单据备注',//标题
            readonly: true
        },{
            fieldName: 'customercode',//字段名
            width: 200,//宽度
            title: '客户',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'CustomerDatas',
                dropListDatas: this.commonDatas.CustomerDatas
            },  
        },{
            dataType: 'number',//数据类型
            fieldName: 'Pcode',//字段名
            width: 120,//宽度
            title: '项目名称',//标题
            sort: false,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'ProjectDatas',
                //dropListDatas: this.commonDatas.value.LtdDatas
            },
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'deliveryAt',//字段名
            width: 100,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '送货日期',//标题
            readonly: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'ProductCode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            readonly: true
        },{
            dataType: 'text',//数据类型
            fieldName: 'barcode',//字段名
            width: 120,//宽度
            title: '条码',//标题
        },{
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '品名',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'unit',//字段名
            width: 80,//宽度
            title: '单位',//标题
            align: 'center',
            sort: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'numex',//字段名
            width: 80,//宽度
            title: '结算量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
           
        },{
            dataType: 'number',//数据类型
            fieldName: 'saleprice',//字段名
            width: 80,//宽度
            title: '单价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'SaleMoney',//字段名
            width: 120,//宽度
            title: '销售金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            
        },{
            fieldName: 'note',//字段名
            width: 200,//宽度
            inputType: 'text',
            title: '备注',//标题
            sort: false
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'saleViews-Reports-DeleteProduct',sep: true,expand: false,opt:true,parger:false,readOnly: true,
        }); 

    }


}