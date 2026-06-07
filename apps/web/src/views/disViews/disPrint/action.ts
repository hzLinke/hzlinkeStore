
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, MessageBox, TableColumnsType } from '@v4x/ui';
import useAppStore from '@/stores';
export class TListGridAction extends TGridAction{
    public getParams: object = {};
    public printDatas= [];
    public ChildrenColumns: TableColumnsType[] =[];
    public OrderPrintColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        dataType: 'number',//数据类型
        fieldName: 'productcode1',//字段名
        width: 80,//宽度
        title: '货号',//标题
    },{
        fieldName: 'barcode1',//字段名
        width: 150,//宽度
        title: '条码',//标题
        readonly: true,
    },{
        fieldName: 'name1',//字段名
        width: 250,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'printnumex1',//字段名
        width: 80,//宽度
        align: 'right',
        title: '数量',//标题
    },{
        fieldName: 'note1',//字段名
        width: 150,//宽度
        title: '备注',//标题
    }];
    public CateColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name1',//字段名
        width: 120,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist1',//字段名
        width: 330,//宽度
        align: 'left',
        title: '配货明细',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalnum1',//字段名
        width: 60,//宽度
        align: 'right',
        title: '总数',//标题
    },{
        dataType: 'text',//数据类型
        fieldName: 'sep2',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name2',//字段名
        width: 120,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist2',//字段名
        width: 330,//宽度
        align: 'left',
        title: '配货明细',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalnum2',//字段名
        width: 60,//宽度
        align: 'right',
        title: '总数',//标题
    }];
    public CustomerColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name1',//字段名
        width: 150,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'numex1',//字段名
        width: 100,//宽度
        align: 'right',
        title: '数量',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist1',//字段名
        width: 250,//宽度
        align: 'left',
        title: '来源',//标题
    },{
        dataType: 'text',//数据类型
        fieldName: 'sep2',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name2',//字段名
        width: 150,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'numex2',//字段名
        width: 100,//宽度
        align: 'right',
        title: '数量'
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist2',//字段名
        width: 250,//宽度
        align: 'left',
        title: '来源',//标题
    }];
    public StockColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'productcode1',//字段名
        width: 80,//宽度
        title: '编码',//标题
        align:'left',
    },{
        fieldName: 'name1',//字段名
        width: 180,//宽度
        title: '品名',//标题
        align:'left',
    },{
        fieldName: 'spec1',//字段名
        width: 80,//宽度
        title: '规格',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'stockNum1',//字段名
        width: 80,//宽度
        align: 'right',
        title: '存货量',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 80,//宽度
        align: 'right',
        title: '清点量',//标题
    },{
        dataType: 'text',//数据类型
        fieldName: 'sep2',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'productcode2',//字段名
        width: 80,//宽度
        title: '编码',//标题
        align:'left',
    },{
        fieldName: 'name2',//字段名
        width: 180,//宽度
        title: '品名',//标题
        align:'left',
    },{
        fieldName: 'spec2',//字段名
        width: 80,//宽度
        title: '规格',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'stockNum2',//字段名
        width: 80,//宽度
        align: 'right',
        title: '存货量',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 80,//宽度
        align: 'right',
        title: '清点量',//标题
    }];



    public CateColumnsOne: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 50,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name1',//字段名
        width: 150,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist1',//字段名
        width: 550,//宽度
        align: 'left',
        title: '配货明细',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: 'totalnum1',//字段名
        width: 100,//宽度
        align: 'right',
        title: '总数',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 100,//宽度
        align: 'right',
        title: '分拣核对',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 100,//宽度
        align: 'right',
        title: '主管核对',//标题
    }];
    public CustomerColumnsOne: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep1',//字段名
        width: 50,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'name1',//字段名
        width: 150,//宽度
        title: '品名',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'numex1',//字段名
        width: 180,//宽度
        align: 'right',
        title: '数量',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: 'fromlist1',//字段名
        width: 500,//宽度
        align: 'left',
        title: '来源',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 100,//宽度
        align: 'right',
        title: '分拣核对',//标题
    },{
        dataType: 'number',//数据类型
        fieldName: '',//字段名
        width: 100,//宽度
        align: 'right',
        title: '主管核对',//标题
    }];
   

    public LabelPrintColumns: TableColumnsType[] = [{
        dataType: 'text',//数据类型
        fieldName: 'sep',//字段名
        width: 30,//宽度
        title: '#',//标题
        align:'center',
        readonly: true,
    },{
        fieldName: 'deliveryAt',//字段名
        width: 100,//宽度
        title: '送货日',//标题
        align:'left',
    },{
        fieldName: 'name',//字段名
        width: 200,//宽度
        title: '品名',//标题
        align:'left',
    },{
        fieldName: 'spec',//字段名
        width: 100,//宽度
        title: '规格',//标题
        align:'left',
    },{
        fieldName: 'shippershortname',//字段名
        width: 150,//宽度
        title: '供货商名称',//标题
        align:'left',
    },{
        fieldName: 'customershortname',//字段名
        width: 150,//宽度
        title: '客户名称',//标题
        align:'left',
    },{
        fieldName: 'linename',//字段名
        width: 100,//宽度
        title: '路线',//标题
        align:'left',
    },{
        dataType: 'number',//数据类型
        fieldName: 'numex',//字段名
        width: 100,//宽度
        align: 'right',
        title: '数量',//标题
    }];
    public arrGroupFieldName: string = 'catecode';
    public PrintColumns = 2;
    public PrintFontSize = 14;
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
        const { accountBookCode } = useAppStore();
        this.dataSource.getParams.defaultCondition = ''
        this.dataSource.getParams.mustCondition = `accountBookCode=${accountBookCode}`
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.PrintColumns = this.commonDatas.SysParamDatas[0].disprintcolumns;
        this.PrintFontSize = this.commonDatas.SysParamDatas[0].disprintfontsize;
        this.Columns = this.PrintColumns==1?this.CateColumnsOne: this.CateColumns;
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'DisViews-disPrint',sep: true,expand: false,opt:false,parger:true,readOnly: false
        });
    }

    private buildCustomerPrintData=(data: any)=>{
        const _data = data
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        _data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,this.PrintColumns,'sep')
        })
        const _TempArr = data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    private buildCatePrintData = (data: any)=>{
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,this.PrintColumns,'sep')
        })
        const _TempArr = data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    private buildShipperPrintData=(data: any)=>{
        const _data = data
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        _data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,this.PrintColumns,'sep')
        })
        const _TempArr = data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    private buildCheckStockPrintData = (data: any)=>{
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,2,'sep')
        })
        const _TempArr = data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    private buildOrderPrintData = (data: any)=>{
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,1,'sep',true)
        })
        const _TempArr = data;
        let _TempDatas = []
        for (let i=0;i<_TempArr.length;i++){
            _TempDatas.push(_TempArr[i])
            _TempDatas = _TempDatas.concat(_TempArr[i].children)
        }
        return _TempDatas;
    }
    public async open(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        const res = await $api.comonRequest('/masterApi/disApi/dis/disPrint/','getFromProc',this.getParams)
        if (res.errCode==0){
            this.printDatas = res.datas;
            if (+(this.commonDatas as any).SysParamDatas[0].multilineout===1){//明细多行输出
                res.datas.map((item: any)=>{
                    if (item.fromlist){
                        item.fromlist = item.fromlist.replace(/；/g,'\n')
                    }
                })
            }
            /*res.datas.map((item: any)=>{
                if (item.fromlist){
                     item.fromlist = item.fromlist.replace(/(([^；]*；){3}[^；]*)；/g, '$1；\n')
                }
            })*/
            this.dataSource.dataSet = this.arrGroupFieldName=='none'?res.datas: $Utils.arrGroup(res.datas,this.arrGroupFieldName)
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
            switch (this.arrGroupFieldName){
                case 'catecode':
                    {
                        if (this.instanceRefs.disType==3)
                            this.dataSource.dataSet = this.buildCheckStockPrintData(this.dataSource.dataSet);
                        else                     
                            this.dataSource.dataSet = this.buildCatePrintData(this.dataSource.dataSet);
                        break;
                    }
                case 'customercode':
                    if (this.instanceRefs.disType==5)
                        this.dataSource.dataSet = this.buildOrderPrintData(this.dataSource.dataSet);
                    else
                        this.dataSource.dataSet = this.buildCustomerPrintData(this.dataSource.dataSet);
                    break;
                case 'shippercode':
                    this.dataSource.dataSet = this.buildShipperPrintData(this.dataSource.dataSet);
                    break;
            }
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
}
