
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import { defineComponent, reactive, ref ,onMounted, toRefs,inject } from 'vue'
import {TStockListGridAction,TStockDetailGridAction} from "../StockAction"
import {getProduct,dataIsExist} from "@/usehook/dataAction"
import { DataSourceType, MessageBox, ModalResultEnum, SetFieldValueType, TableRowDataType } from '@v4x/ui'
import { WinCateSelect } from '@/components'
import { StockSplitInstanceRefs } from './types';
import useAppStore from '@/stores';

export class TListGridAction extends TStockListGridAction<StockSplitInstanceRefs>{
    public billType = 12;
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockSplitInstanceRefs>){ 
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
            readonly: false,
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
            fieldName: 'changeat',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd HH:mm:ss',
            title: '拆分日期',//标题
            readonly: false,
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'ExamineAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd HH:mm:ss',
            title: '审核日期',//标题
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
                //dropListDatas: this.commonDatas.value.UserDatas
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
            id:'StockViews-StockChange',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "areacode",caption: "仓位",filterType: "fsIn",inList:this.commonDatas.AreaDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "changeat",caption: "损溢日",filterType: "fsDate"},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })  ;
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            allowEdit:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            },
            allowDel:(row: TableRowDataType): boolean=>{
                return row.examineusercode==0
            }
        })
    }
    /*
    public Methods: LkxTableMethodsType = $Utils.deepObjectMerge(this.Methods,{
        allowEdit:(row: TableRowDataType): boolean=>{
            return row.examineusercode==0
        },
        allowDel:(row: TableRowDataType): boolean=>{
            return row.examineusercode==0
        }
    })*/
}

export class TDetailGridAction extends TStockDetailGridAction<StockSplitInstanceRefs>{
    public billType = 12;
    
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockSplitInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.toolsBarItems.push( {
            title:'<F8>调入库存',
            idCode:'_copyStock',
            index:1,
            dropDown:false}
        );
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 60,//宽度
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
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '加工量',//标题
            format:'0.00',
            numberFlg:'+',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'NumCalc'//计算方法
            }
        },{
            dataType: 'number',
            fieldName: 'splitnum',//字段名
            width: 80,//宽度
            title: '成品量',//标题
            format:'0.00',
            readonly: true,
            numberFlg:'+',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'SplitNumCalc'//计算方法
            }
        },{
            dataType: 'number',
            fieldName: 'lostnum',//字段名
            width: 80,//宽度
            title: '损耗量',//标题
            format:'0.00',
            readonly: true,
            numberFlg:'+',
            align: 'right',
            footers: {
                align: 'right',
                valueType: 'fvtSum',
                calculationer: 'LostNumCalc'//计算方法
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
            id:'StockViews-StockChangeDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
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
        })   
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
                LostNumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'lostnum')
                },
                SplitNumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'splitnum')
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
            gridDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                //打开拆分明细
                const res = await this.update(false)
                if (!res) return;
                if(this.instanceRefs.toPick?.value != null) this.instanceRefs.toPick.value = !this.instanceRefs.toPick.value;
            }
        });
    }
    
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = data.fieldValue as number - rowItem.stocknum;
            return true
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
        
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
    }
    
    public async copyStock(cateList: any){
        if (!this.TableConfig.allowedOperations?.alopSubmit) return;
        const updateRes = await this.update(false)
        if (!updateRes) return;

        
        const selectCateList = cateList.filter((item: any)=>{
            return item.checked == true;
        })
        const selectCateCodeList: any[] = [];
        selectCateList.forEach((element: any) => {
            selectCateCodeList.push(element.idcode)
        })
        if (selectCateCodeList.length==0) return;
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要调入所选分类对应商品库存？'
        })
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在调入...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'copyStock',{
            billNumber: this.instanceRefs.headerData?.value?.billnumber,
            areaCode: this.instanceRefs.headerData?.value?.areacode,
            cateCodeList: selectCateCodeList.join(',')
           
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async ToolsBarItemClick(data: any){
        if (data.idCode == '_copyStock'){
            const result = await WinCateSelect.show({
                CateListDatas: this.commonDatas.CateDatas
                
            })
            if (result.action !== ModalResultEnum.mrConfirm || result.data.datas.length == 0) return false
            this.copyStock(result.data.datas)
        } else {
            super.ToolsBarItemClick(data)
        }
    }
}

export class TPickGridAction extends TStockDetailGridAction<StockSplitInstanceRefs>{
    public billType = 12;
    
    constructor(dataSource: DataSourceType, instanceRefs: Partial<StockSplitInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.allPower = true;
        this.toolsBarItems.push( {
            title:'<F8>调入库存',
            idCode:'_copyStock',
            index:1,
            dropDown:false}
        );
        this.Columns = [{
            dataType: 'number',//数据类型
            fieldName: 'productcode',//字段名
            width: 60,//宽度
            title: '货号',//标题
            allowInputString: true,
            readonly: true,
            footers: {
                align: 'center',
                value: '合计',
                valueType: 'fvtNone',
            },
            indicatorButtons:[{iconType:'more'}],//自定义指示器按钮
            indicatorButtonEventName:'indicatorButtonEvent'
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
            fieldName: 'num',//字段名
            width: 80,//宽度
            title: '数量',//标题
            format:'0.00',
            numberFlg:'+',
            align: 'right',
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
            id:'StockViews-StockChangeDetail',sep: true,expand: false,opt:false,parger:false,readOnly: false,
            allowedOperations: {
                alopSubmit: true
            }
        }); 
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
                ChangeNumCalc:(datas: any): number=> {
                    return  $Utils.sumArray(datas,'changenum')
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
    }
    
    public async onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        if (data.fieldName == 'num'){
            data.fieldValue = Math.abs(data.fieldValue as number);
            const _NumEx = data.fieldValue as number - rowItem.stocknum;
            return true
        } else {
            return super.onSetFieldValue(data,rowItem)
        }
        
        //注：此处this会指向dataSource 因为创建时将些方法付于dataSource的onSetFieldValue
    }
}

