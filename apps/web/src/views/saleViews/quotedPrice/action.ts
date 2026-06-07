import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil' 
import {TSalesListGridAction,TSalesDetailGridAction} from "../SaleAction"
import { DataSourceType, InputBox, MessageBox, ModalResultEnum, PagerConfigType, TableRowDataType } from '@v4x/ui';
import type { QuotedPriceInstanceRefs } from './types'
import { ExportTableToExcel, Print } from '@v4x/utils';
import { WinShipperSet, WinAddPriceRate, WinCateSelect, WinImportWin } from '@/components'
import useAppStore from '@/stores';

export class TListGridAction extends TSalesListGridAction<QuotedPriceInstanceRefs>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<QuotedPriceInstanceRefs>){ 
        super(dataSource, instanceRefs)
        const { accountBookCode } = useAppStore();
        this.billType = 302;
        this.dataSource.getParams.defaultCondition = '(ExamineUserCode=0 or DATEDIFF(d,EndAt,GETDATE())<=0)'
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
            fieldName: 'customercode',//字段名
            width: 200,//宽度
            title: '客户',//标题
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|projectname|name',
                displayFieldWidths:'50|100|300',
                dropListDatasName:'customerFromProjDatas',
               // dropListDatas: this.commonDatas.value.CustomerDatas
               onFilter:(filterValue: string,dropListDatas: any[])=>{
                    return dropListDatas.filter((item: any)=>{
                        return item.projectname.indexOf(filterValue)!=-1||item.name.indexOf(filterValue)!=-1
                    })
                }
            },
            indicatorButtonEventName:'indicatorButtonEvent',
            indicatorButtons:[{iconType:'more'}],
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            dataType: 'number',//数据类型
            fieldName: 'Pcode',//字段名
            width: 150,//宽度
            title: '项目名称',//标题
            sort: false,
            readonly:true,
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
            fieldName: 'startAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '开始日期',//标题
        },{
            dataType: 'datetime',//数据类型
            fieldName: 'endAt',//字段名
            width: 120,//宽度
            inputType: 'datetime',
            format:'yyyy-MM-dd',
            title: '结束日期',//标题
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
            dataType: 'datetime',//数据类型
            fieldName: 'ExamineAt',//字段名
            width: 120,//宽度
            title: '审核日',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
        },{
            fieldName: 'MakingUserCode',//字段名
            width: 80,//宽度
            title: '制单',//标题
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
            dataType: 'datetime',//数据类型
            fieldName: 'MakingAt',//字段名
            width: 120,//宽度
            title: '制单日',//标题
            format:'yyyy-MM-dd hh:mm:ss',
            readonly: true,
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
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-quotedPrice',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "billnumber",caption: "单号",filterType: "fsStrList"},
                {fieldName: "billnumber",caption: "模糊单号",filterType: "fsLike"},
                {fieldName: "customercode",caption: "客户",filterType: "fsIn",inList:this.commonDatas.CustomerDatas},
                {fieldName: "examineusercode",caption: "审核人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "examineat",caption: "审核日",filterType: "fsDate"},
                {fieldName: "MakingUserCode",caption: "制单人",filterType: "fsIn",inList:this.commonDatas.UserDatas},
                {fieldName: "MakingAt",caption: "制单日",filterType: "fsDate"},
                {fieldName: "startat",caption: "开始日",filterType: "fsDate"},
                {fieldName: "endat",caption: "结束日",filterType: "fsDate"},
                {fieldName: "note",caption: "备注",filterType: "fsLike"}                       
            ],
        })   
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,cellItem: object): string=>{
                const thisAt = $Utils.getDate();
               // const diffAt = $Utils.diffDay(thisAt,rowItem.endat)
    
                const diffAt = $Utils.diffAt(thisAt,rowItem.endat)
              //  console.log(rowItem.billnumber,diffAt)
                if (diffAt>=-2&&rowItem.status==1) return 'red';
                return ''
            },
        })
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean>{
        this.dataSource.setFieldValue('StartAt',$Utils.getDate('d'));
        this.dataSource.setFieldValue('EndAt',$Utils.getDate('d',15));
        return super.afterInsert(rowItem,rowIndex);
    }
}

export class TDetailGridAction extends TSalesDetailGridAction<QuotedPriceInstanceRefs>{
    public BasicBarItems=[
        {title:'<F5>上传报价',
            idCode:'_Import',
            index:1,
            dropDown:false},
        {title:'<F6>调入商品',
            idCode:'_Load',
            index:1,
            dropDown:false},
        {title:'<F7>复制报价',
            idCode:'_Copy',
            index:1,
            dropDown:false},
        {title:'<F8>清空报价',
            idCode:'_Clear',
            index:2,
            dropDown:false},
        {title:'<F9>批量货商',
            idCode:'_SetShipper',
            index:2,
            dropDown:false},
        {title:'<F10>批量加价',
            idCode:'_SetPriceRate',
            index:2,
            dropDown:false},
        {title:'<F11>打印导出',
            idCode:'_PrintExport',
            index:2,
            dropDown:false},
        {title:'<F12>合并报价',
            idCode:'_MergePrice',
            index:2,
            dropDown:false}]
    public PrintBarItems=[{title:'<F5>录入修改',
            idCode:'_List',
            index:1,
            dropDown:false},
        {title:'<F6>打印',
            idCode:'_Print',
            index:1,
            dropDown:false},
        {title:'<F9>导出',
            idCode:'_Export',
            index:2,
            dropDown:false}]
    constructor(dataSource: DataSourceType, instanceRefs: Partial<QuotedPriceInstanceRefs>){ 
        super(dataSource, instanceRefs);
        this.PagerConfig={curPage:1,pageSize:50,total:0};
        this.toolsBarItems= this.BasicBarItems;
        this.billType = 302;
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
            fieldName: 'SerialNumber',//字段名
            width: 50,//宽度
            title: '序号',//标题
        },{
            fieldName: 'CustomerProcudeCode',//字段名
            width: 100,//宽度
            title: '客编码',//标题
        },{
            fieldName: 'barcode',//字段名
            width: 100,//宽度
            title: '条码',//标题
            readonly: true,
        },{
            fieldName: 'Name',//字段名
            width: 150,//宽度
            title: '标准品名',//标题
            readonly: true,
        },{
            fieldName: 'AliasName',//字段名
            width: 150,//宽度
            title: '客户别名',//标题
            readonly: false,
            footers: {
                align: 'center',
                valueType: 'fvtCount',
                calculationer: 'countCalc'//计算方法
            }
        },{
            fieldName: 'spec',//字段名
            width: 100,//宽度
            title: '标准规格',//标题
            readonly: true,
        },{
            fieldName: 'AliasSpec',//字段名
            width: 100,//宽度
            title: '客户规格',//标题
            readonly: false,
        },{
            fieldName: 'unit',//字段名
            width: 60,//宽度
            title: '单位',//标题
            readonly: true,
            sort: false,
            align:'center',
            customFormater:'unitFormat'
        },{
            dataType: 'number',//数据类型
            fieldName: 'saleType',//字段名
            width: 100,//宽度
            title: '商品类型',//标题
            sort: true,
            readonly: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatas: [{idcode:0,name:'称重(斤)'},{idcode:1,name:'按量'},{idcode:2,name:'按量+称重'},{idcode:3,name:'按件'},{idcode:4,name:'称重(公斤)'}]
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
            fieldName: 'costprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '最新进价',//标题
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'MinPriceLast',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '最低进价',//标题
            format:'0.00',
            align:'right',
            readonly: true,
            sort: false
        },{
            fieldName: 'cursaleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '上期报价',//标题
            format:'0.00',
            align:'right',
            sort: false,
            readonly: true
        },{
            fieldName: 'saleprice',//字段名
            dataType: 'number',//数据类型
            width: 80,//宽度
            title: '单价',//标题
            format:'0.00',
            align:'right',
            sort: true
        },{
            fieldName: 'ProfitRate',//字段名
            fieldKind: 'fkCalculated',
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '毛利率',//标题
            format:'0.00%',
            align:'right',
            readonly: true,
            sort: false,
            calculationer:'calculaProfitRate',
        },{
            dataType: 'number',//数据类型
            fieldName: 'defaultshippercode',//字段名
            width: 150,//宽度
            title: '默认货商',//标题
            sort: true,
            inputType: 'drop',
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'ShipperDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               //dropListDatas: this.commonDatas.value.ShipperDatas
            },
        },{
            dataType: 'number',//数据类型
            fieldName: 'CateCode',//字段名
            width: 150,//宽度
            title: '分类',//标题
            sort: true,
            inputType: 'drop',
            readonly: true,
            dropListConfig:{
                allowFilter: true,
                resultFieldName:'idcode',/**下拉返回字段 */
                displayFieldName: 'name',/**下拉显示字段 */
                displayFields:'idcode|name',
                displayFieldWidths:'50|200',
                dropListDatasName: 'CateDatas',//用dropListDatasName不用dropListDatas 为防止保存格式时后面增加的行无法带出
               //dropListDatas: this.commonDatas.value.ShipperDatas
            },
        },{
            fieldName: 'tensalenum',//字段名
            dataType: 'number',//数据类型
            width: 100,//宽度
            title: '30日销量',//标题
            format:'0.00',
            align:'right',
            readonly: true,
        },{
            fieldName: 'note',//字段名
            width: 100,//宽度
            title: '备注',//标题
            sort: false,
        }];
        this.TableConfig = $Utils.deepObjectMerge(this.TableConfig,{
            id:'SaleViews-QuotedPriceDetail',sep: true,expand: false,opt:false,parger:true,readOnly: false,
            allowedOperations: {
                alopSubmit: true
            }
        }); 
        this.SerachBoxConfig = $Utils.deepObjectMerge(this.SerachBoxConfig,{
            fields:[{fieldName: "productcode",caption: "货号",filterType: "fsNone"},
                {fieldName: "barcode",caption: "条码",filterType: "fsStrList"},
                {fieldName: "AliasName",caption: "品名",filterType: "fsLike"},
                {fieldName: "spec",caption: "规格",filterType: "fsLike"},
                {fieldName: "catecode",caption: "分类",filterType: "fsIn",inList:this.commonDatas.CateDatas},
                {fieldName: "note",caption: "备注",filterType: "fsLike"},
                {fieldName: "changeprice",caption: "变价",filterType: "fsNone"}                      
            ],
        })   
        this.Methods = $Utils.deepObjectMerge(this.Methods,{
            customColor:(rowItem: TableRowDataType,_cellItem: object): string=>{
                if (rowItem.catecode==='') return 'blueviolet';
                if (rowItem.cursaleprice!=rowItem.saleprice) return 'red';
               
                return ''
            },
            rowCalculated:{
                calculaProfitRate:(rowItem: any): number=>{
                    return rowItem.saleprice > 0 ? (rowItem.saleprice - rowItem.costprice) /  rowItem.saleprice*100 : 0;
                }
            },
        });
        this.Events = $Utils.deepObjectMerge(this.Events,{
            rowDbClick: async (datas: TableRowDataType[],rowdata: TableRowDataType,rowIndex: number,cellIndex: number,fieldName: string)=>{
                if (fieldName.toLowerCase() == 'qualitygrade'){
                    this.changeQualityGrade(rowIndex);
                    return
                 }
                if (this.instanceRefs.headerData?.value.examineusercode==0)
                    this.changeAliasName(rowdata.aliasnamelist,rowIndex)
            },
            indexChange: (rowItem: TableRowDataType)=>{
                if (!rowItem) return
                const PagerConfig: PagerConfigType={curPage:1,pageSize:3,total:0};
                if (!rowItem.productcode) return;

                const qualityGrade = +rowItem.qualitygrade !== 0 ? rowItem.qualitygrade : this.instanceRefs.headerData?.value.qualitygrade || 1;
                this.instanceRefs.priceListDataSource.getParams = { 
                    sortFields: 'deliveryAt desc',
                    condition: `productcode='${rowItem.productcode}' AND qualitygrade=${qualityGrade}`
                }
                this.instanceRefs.priceListDataSource.open(PagerConfig)
            }
        })
    }
    public async changeRowValue(data: TableRowDataType, editRowIndex?: number): Promise<boolean> {
        await super.changeRowValue(data, editRowIndex);
        const PagerConfig: PagerConfigType={curPage:1,pageSize:3,total:0};
        this.instanceRefs.priceListDataSource.getParams = { 
            sortFields: 'deliveryAt desc',
            condition: `productcode='${data.idcode}'`
        }
        this.instanceRefs.priceListDataSource.open(PagerConfig)
        return false
       
    }
    public async afterInsert(rowItem: TableRowDataType,rowIndex: number): Promise<boolean> {
        super.afterInsert(rowItem,rowIndex)
        this.dataSource.setFieldValue('SerialNumber',this.dataSource.dataSetRowCount);
        this.dataSource.setFieldValue('defaultshippercode',1)
        this.fieldToColIndex('productcode');
        return super.afterInsert(rowItem,rowIndex)
    }
    
    public async BatchChangeShipper(datas: any){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要批量更新默认供货商？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在更新...',
            mask: true
        })
        for (let i=0;i<datas.length;i++){
            $api.comonRequest(this.dataSource.apiPath,'BatchChangeShipper',{
                BillNumber: this.instanceRefs.headerData?.value.billnumber,
                CustomerCode: this.instanceRefs.headerData?.value.customercode,
                CateCode: datas[i].idcode,
                ShipperCode: datas[i].defaultshippercode
            })   
        }
        this.open() 
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }

    public async BatchChangePriceRate(datas: any){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要批量加价？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在更新...',
            mask: true
        })
        for (let i=0;i<datas.length;i++){
            $api.comonRequest(this.dataSource.apiPath,'BatchSetPriceRate',{
                BillNumber: this.instanceRefs.headerData?.value.billnumber,
                CustomerCode: this.instanceRefs.headerData?.value.customercode,
                CateCode: datas[i].idcode,
                PirceRate: datas[i].addpricerate
            })   
        }
        this.open() 
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    
    public async QuotedImport(cateList: any){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要导入商品报价？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在导入...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceImport',{
            BillNumber: this.instanceRefs.headerData?.value.billnumber
           
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }


    public async QuotedPriceLoad(cateList: any){
       
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
            content: '是否要调入所选分类对应商品？'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在调入...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceLoad',{
            BillNumber: this.instanceRefs.headerData?.value.billnumber,
            CateCodeList: selectCateCodeList.join(',')
           
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async QuotedPriceClear(){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要清空报价',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在清空...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceClear',{
            BillNumber: this.instanceRefs.headerData?.value.billnumber,
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async QuotedPriceCopy(CurCustomerCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要复制报价'
        })
 
        if (res.action !== ModalResultEnum.mrConfirm) return false
        MessageBox.loading({
            moreText: '正在复制...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceCopy',{
            BillNumber: this.instanceRefs.headerData?.value.billnumber,
            CurCustomerCode: CurCustomerCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }

    public async QuotedPriceMerge(CurCustomerCode: number){
        const res = await MessageBox.question({
            title:'提问',
            content: '是否要全并报价，合并后，原客户的报价将删除'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在合并...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'QuotedPriceMerge',{
            BillNumber: this.instanceRefs.headerData?.value.billnumber,
            CurCustomerCode: CurCustomerCode
        })   
        if (submitRes.errCode==0){
            this.open() 
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
    public async openQuotedPrice(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        this.instanceRefs.detailOfferDataSource.getParams.condition = `billnumber='${this.instanceRefs.headerData.value.billnumber}'`;
        const res = await this.instanceRefs.detailOfferDataSource.open(
            {pageSize:0,curPage:1,total:1}
        )
        if (res){
            this.instanceRefs.detailOfferDataSource.dataSet = $Utils.arrGroup(this.instanceRefs.detailOfferDataSource.dataSet,'catename')
            let _LineObj = {} as any;
            let _LineArr = [] as any;
           // console.log(this.instanceRefs.detailOfferDataSource.dataSet)
            //纵向序号，
            this.instanceRefs.detailOfferDataSource.dataSet.map((item: any)=>{ 
                 _LineArr = []
                
                const rowNum = Math.ceil(item.children.length/3);//行数
                for (let i=0;i<rowNum;i++){ 
                    _LineObj = {}
                    _LineObj['unit1'] =item.children[i]['unit'];
                    _LineObj['sep1'] = i+1;
                    _LineObj['name1'] = item.children[i]['name'];
                    _LineObj['spec1'] = item.children[i]['spec'];
                    _LineObj['price1'] = item.children[i]['saleprice'];
                    _LineObj['color1'] = item.children[i]['saleprice']!=item.children[i]['cursaleprice']?'red':'';
                    if (i+rowNum < item.children.length){
                        _LineObj['unit2'] =item.children[i+rowNum]['unit'];
                         _LineObj['sep2'] = i+rowNum+1;
                        _LineObj['name2'] = item.children[i+rowNum]['name'];
                        _LineObj['spec2'] = item.children[i+rowNum]['spec'];
                        _LineObj['price2'] = item.children[i+rowNum]['saleprice'];
                        _LineObj['color2'] = item.children[i+rowNum]['saleprice']!=item.children[i+rowNum]['cursaleprice']?'red':'';
                    }
                   
                    if (i+rowNum*2 < item.children.length){
                        _LineObj['unit3'] =item.children[i+rowNum*2]['unit'];
                        _LineObj['sep3'] = i+rowNum*2+1;
                        _LineObj['name3'] = item.children[i+rowNum*2]['name'];
                        _LineObj['spec3'] = item.children[i+rowNum*2]['spec'];
                        _LineObj['price3'] = item.children[i+rowNum*2]['saleprice'];
                        _LineObj['color3'] = item.children[i+rowNum*2]['saleprice']!=item.children[i+rowNum*2]['cursaleprice']?'red':'';
                    }

                    
                    
                    _LineArr.push(_LineObj)
                }
               
                item.children = _LineArr
            })
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
    public async ToolsBarItemClick(data: any){
        switch (data.idCode){
            case '_Import':
                if (this.instanceRefs.headerData.value.examineusercode == 0) {
                    await WinImportWin.show({
                        datas: this.instanceRefs.headerData.value
                    })
                    
                    this.open()
                }
                break;
            case '_Load':
                if (this.instanceRefs.headerData.value.examineusercode == 0) {
                    const result = await WinCateSelect.show({
                        CateListDatas: this.commonDatas.CateDatas,
                    })
                    if (result.action === ModalResultEnum.mrConfirm && result.data.datas.length > 0) {
                        this.QuotedPriceLoad(result.data.datas)
                    }
                }
                break;
            
            case '_Copy':
                if (this.instanceRefs.headerData.value.examineusercode ==0){
                    const res = await InputBox.show({
                        title:'报价复制',
                        description: '请选择要复制的报价的客户',
                        defaultValue: this.instanceRefs.headerData.value.customercode,
                        inputType: 'drop',
                        dropDataList: this.commonDatas.CustomerDatas
                    })
                    if (res.action !== ModalResultEnum.mrConfirm) return false
                    this.QuotedPriceCopy(res.data)
                }
                break;
            case '_SetShipper':
                if (+this.instanceRefs.headerData.value.examineusercode === 0) {
                    const result = await WinShipperSet.show({
                        datas: this.instanceRefs.headerData.value,
                    })
                    if (result.action === ModalResultEnum.mrConfirm) {
                        this.BatchChangeShipper(result.data.datas)
                    }
                }
                break;
            case '_SetPriceRate':
                if (this.instanceRefs.headerData.value.examineusercode == 0) {
                    const result = await WinAddPriceRate.show({
                    })
                    if (result.action === ModalResultEnum.mrConfirm) {
                        this.BatchChangePriceRate(result.data.datas)
                    }
                }
                break;
            case '_Clear':
                if (this.instanceRefs.headerData.value.examineusercode ==0)
                    this.QuotedPriceClear();
                break;
            case '_PrintExport':
                this.toolsBarItems= this.PrintBarItems;
                this.openQuotedPrice()
                this.instanceRefs.printVisabled.value = true;
                break;
            case '_MergePrice':
                if (this.instanceRefs.headerData.value.examineusercode !=0) return
                   // this.instanceRefs.mergeConfig.open = true;
                break;
            case '_List':
                this.toolsBarItems= this.BasicBarItems;
                this.instanceRefs.printVisabled.value = false;
                break;
            case '_Print':
                Print(this.instanceRefs.printDomEx.value.printDom);
                break;
            case '_Export':
                ExportTableToExcel(this.instanceRefs.printDomEx.value.printDom);
                break;
            default:
                super.ToolsBarItemClick(data)
        }
       
    }

    public async submit(submitType: number){
        if (!this.TableConfig.allowedOperations?.alopSubmit) return;
        const updateRes = await this.update(false)
        if (!updateRes) return;
        const res = await MessageBox.question({
            title:'提问',
            content: submitType==1?'是否要审核单据,审核后将更新对应客户的报价单':'是否要反签单据,反签后对应客户报价按上价报价更新'
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: submitType==1?'正在审核单据...':'正在反签单据...',
            mask: true
        })
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'submit',{
            billnumber: this.instanceRefs.headerData.value.billnumber,
            UserCode:this.instanceRefs.userCode,
            updatetype: submitType
        })   
        if (submitRes.errCode==0){
            this.instanceRefs.headerData.value.examineusercode = submitType==1?this.instanceRefs.userCode:0;
            this.instanceRefs.headerData.value.status = submitType==1?1:0;
            this.instanceRefs.headerDisabled!.value = submitType==1?true:false;
            this.TableConfig.readOnly = submitType==1?true:false;  
        }   
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return submitRes;
    }
}