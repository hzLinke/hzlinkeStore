
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableRowDataType } from '@v4x/ui';
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
               // dropListDatas: this.commonDatas.value.AreaDatas
            },           
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'at',//字段名
            width: 130,//宽度
            title: '清点日期',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'changeat',//字段名
            width: 130,//宽度
            title: '损溢日期',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
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
                //dropListDatas: this.commonDatas.value.UserDatas
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
                //dropListDatas: this.commonDatas.value.CateDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'QualityGrade',//字段名
            width: 100,//宽度
            title: '质量',//标题
            sort: true,
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [{idcode:0,name:'不定'},{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'stocknum',//字段名
            width: 80,//宽度
            title: '存量',//标题
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '实量',//标题
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
            fieldName: 'changenum',//字段名
            width: 80,//宽度
            title: '盈亏量',//标题
            align: 'right',
            format:'0.00',
            sort: false,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'ChangeNumCalc'//计算方法
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
            fieldName: 'SumMoney',//字段名
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
                {fieldName: "billnumber",caption: "订单号",filterType: "fsStrList"},
                {fieldName: "shippercode",caption: "供货商",filterType: "fsIn",inList:this.commonDatas.ShipperDatas},
                {fieldName: "at",caption: "清点日期",filterType: "fsDate"},
                {fieldName: "changeat",caption: "损溢日期",filterType: "fsDate"},
                {fieldName: "makingusercode",caption: "制单",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineusercode",caption: "审核",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "QualityGrade",caption: "质量",filterType: "fsIn",inList:[{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]},
                {fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsstrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        });
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: any): string=>{
                if (rowItem.changenum<0&&(cellItem.fieldName == 'changenum'||cellItem.fieldName == 'SumMoney')) return 'red';
                return ''
            },
            customFormater:{
               
            },
            sumCalculated:{
                CountCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                StockNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).stocknum
                },
                NumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).num
                },
                ChangeNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).changenum
                },
                SumMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).summoney
                },
            },
        });
    }
    /*
    public Methods: LkxTableMethodsType = $Utils.deepObjectMerge(this.Methods,{
        customColor:(rowItem: TableRowDataType,cellItem: any): string=>{
            if (rowItem.changenum<0&&(cellItem.fieldName == 'changenum'||cellItem.fieldName == 'SumMoney')) return 'red';
            return ''
        },
        customFormater:{
           
        },
        sumCalculated:{
            CountCalc:(datas: any): number=> {
                return (this.dataSource.totalData as any).count
            },
            StockNumCalc:(datas: any): number=> {
                return (this.dataSource.totalData as any).stocknum
            },
            NumCalc:(datas: any): number=> {
                return (this.dataSource.totalData as any).num
            },
            ChangeNumCalc:(datas: any): number=> {
                return (this.dataSource.totalData as any).changenum
            },
            SumMoneyCalc:(datas: any): number=> {
                return (this.dataSource.totalData as any).summoney
            },
        },
    })
    public Events: LkxTableEventsType = $Utils.deepObjectMerge(this.Events,{
        gridKeyDown:(e: KeyboardEvent)=>{
            if (e.key=='Escape'){
                this.thisInstance.Win.closeWin()
            }
        }
    })*/

}