
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType } from '@v4x/ui';
export class TStockHistory extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'ProductCode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            }
        },{
            dataType: 'text',//数据类型
            fieldName: 'barcode',//字段名
            width: 120,//宽度
            title: '条码',//标题
        },{
            fieldName: 'name',//字段名
            width: 150,//宽度
            title: '品名',//标题
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
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
            fieldName: 'areacode',//字段名
            width: 80,//宽度
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
            fieldName: 'qualityGrade',//字段名
            width: 80,//宽度
            title: '质量',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [
                    {
                        idcode: '1',
                        name: '标准'
                    },
                    {
                        idcode: '2',
                        name: '次级'
                    },
                    {
                        idcode: '3',
                        name: '高级'
                    },
                ]
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'startNum',//字段名
            width: 100,//宽度
            title: '期初|数量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StartNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'startMoney',//字段名
            width: 100,//宽度
            title: '期初|金额',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StartMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'endNum',//字段名
            width: 100,//宽度
            title: '期末|数量',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'EndNumCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'EndMoney',//字段名
            width: 100,//宽度
            title: '期末|金额',//标题
            align: 'right',
            format:'0.00',
            sort: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'EndMoneyCalc'//计算方法
            }
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'stockViews-stocks-stockHistory',sep: true,expand: false,opt:false,
            parger:true,readOnly: true,
            allowedOperations:{alopSearch: false}
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[
                {fieldName: "areacode",caption: "仓位",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "QualityGrade",caption: "质量",filterType: "fsIn",inList:[{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]},
                {fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsstrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"}                     
            ],
        }) 
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customFormater:{
            
            },
            sumCalculated:{
                countCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).count
                },
                StartNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).startnum
                },
                EndNumCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).endnum
                },
                StartMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).startmoney
                },
                EndMoneyCalc:(datas: any): number=> {
                    return (this.dataSource.totalData as any).endmoney
                },
            
            },
        })  
    }
    

}