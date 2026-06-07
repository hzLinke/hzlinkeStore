import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType } from '@v4x/ui'
export class TUserGridAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        this.dataSource.getParams.defaultCondition = "datediff(day,At,getDate())=0"
        this.Columns = [{
            dataType: 'text',//数据类型
            fieldName: 'billnumber',//字段名
            width: 150,//宽度
            title: '单号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            fieldName: 'areacode',//字段名
            width: 100,//宽度
            title: '仓库',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'AreaDatas',
                //dropListDatas: this.commonDatas.value.AreaDatas
            },           
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'at',//字段名
            width: 130,//宽度
            title: '日期',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'number',//数据类型
            fieldName: 'type',//字段名
            width: 80,//宽度
            title: '类型',//标题
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:-1,name:'拆出'},{idcode:1,name:'拆入'}]
            },
        },{
            fieldName: 'examineUserCode',//字段名
            width: 80,//宽度
            title: '审核人',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
               // dropListDatas: this.commonDatas.value.UserDatas
            },           
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
            dataType: 'text',//数据类型
            fieldName: 'selfcode',//字段名
            width: 120,//宽度
            title: '自编码',//标题
        },{
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '品名',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'CountCalc'//计算方法
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
        },{
            dataType: 'text',//数据类型
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            align: 'center',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'catecode',//字段名
            width: 100,//宽度
            title: '分类',//标题
            customFormater:'cateFormat',
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'CateDatas',
               // dropListDatas: this.commonDatas.value.CateDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '数量',//标题
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'costprice',//字段名
            width: 80,//宽度
            title: '单价',//标题
            align: 'right',
            format:'0.000',
            sort: false,
        },{
            dataType: 'number',//数据类型
            fieldName: 'SumCostMoney',//字段名
            width: 120,//宽度
            title: '金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SumMoneyCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            inputType: 'datetime',
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stockViews-reports-stockChangeReport',sep: true,expand: false,opt:false,parger:true,readOnly: true
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "查糊单号",filterType: "fsLike"},
                {fieldName: "at",caption: "日期",filterType: "fsDate"},{fieldName: "examineusercode",caption: "操作人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customFormater:{
               
            },
            sumCalculated:{
                CountCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                SumMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).summoney
                },
            },
        });   
    }

}