
import $Utils from '@v4x/utils/lkxUtil'
import {TStockListGridAction,TStockDetailGridAction} from "../StockAction"
import type { StockViewsInstanceRefs } from '../types'
import { DataSourceType, TableRowDataType, SetFieldValueType } from '@v4x/ui';
import useAppStore from '@/stores';

export class TListGridAction extends TStockListGridAction<StockViewsInstanceRefs>{
    public billType = 8;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = 'ExamineUserCode=0'
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
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
            width: 200,//宽度
            title: '仓库',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: false,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'AreaDatas',
               // dropListDatas: this.commonDatas.value.AreaDatas
            },
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'ExamineAt',//字段名
            width: 180,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd HH:mm:ss',
            title: '日期',//标题
            readonly: true,
        },{
            fieldName: 'ExamineUserCode',//字段名
            width: 80,//宽度
            title: '审核',//标题
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName:'UserDatas',
               // dropListDatas: this.commonDatas.value.UserDatas
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'costMoney',//字段名
            width: 120,//宽度
            title: '金额',//标题
            format: '0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'saleMoneyCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'status',//字段名
            width: 80,//宽度
            title: '状态',//标题
            customFormater:'statusFormat',
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|150',
                dropListDatas: [{idcode:0,name:'未生效'},{idcode:1,name:'生效'}]
            },
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
        }];
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'StockViews-StockReceive',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "areacode",caption: "仓位",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        }) ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            }
        }); 
    }
    /*public Methods: LkxTableMethodsType = $Utils.deepObjectMerge(this.Methods,{
        allowEdit:(row: TableRowDataType): boolean=>{
            return row.examineusercode==0
        },
        allowDel:(row: TableRowDataType): boolean=>{
            return row.examineusercode==0
        }
    })*/
}

export class TDetailGridAction extends TStockDetailGridAction<StockViewsInstanceRefs>{
    public billType = 8;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockViewsInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 80,//宽度
            title: '货号',//标题
            allowInputString: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorButtonEvent'
        },{
            fieldName: 'barcode',//字段名
            width: 100,//宽度
            title: '条码',//标题
            readonly: true,
        },{
            fieldName: 'name',//字段名
            width: 200,//宽度
            title: '品名',//标题
            readonly: true,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'CountCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '规格',//标题
            readonly: true,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center'
        },{
            dataType: 'number',
            fieldName: 'stocknum',//字段名
            width: 80,//宽度
            title: '存量',//标题
            format:'0.00',
            align: 'right',
            readonly: true,
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'StockCalc'//计算方法
            }
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
            dataType: 'number',
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '数量',//标题
            format:'0.00',
            align: 'right',
            numberFlg:'+',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.0000',
            align:'right',
            sort: false,
            readonly: true
        },{
            fieldName: 'money',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '金额',//标题
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'CalculaMoney',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'MoneyCalc'//计算方法
            }
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'StockViews-StockReceiveDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopSubmit: true
            }
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "name",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            rowCalculated:{
                CalculaMoney:(rowItem: any): number=>{
                    return rowItem.num * rowItem.costprice
                }
            },
            sumCalculated:{
                CountCalc:(datas: any): number=> {
                    return  this.dataSource.dataSetRowCount
                },
                StockCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'stocknum')
                },
                NumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'num')
                },
                MoneyCalc:(datas: any): number=> {
                    const _Money = $Utils.sumArray(datas,'money')
                    if(this.instanceRefs.headerData?.value) this.instanceRefs.headerData.value.salemoney = _Money
                    return  _Money
                },
            },
            customFormater:{
    
            }
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: (_datas: TableRowDataType[],rowdata: TableRowDataType,_rowIndex: number,_cellIndex: number,_fieldName: string)=>{
                if (_fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(_rowIndex);
                    }
                }
        });   
    }
    
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = data.fieldValue as number - rowItem.stocknum;
            this.dataSource.setFieldValue('changenum',_NumEx);
            return true
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
    }
}

