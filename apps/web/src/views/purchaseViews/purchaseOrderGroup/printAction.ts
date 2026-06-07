
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType, TableColumnsType } from '@v4x/ui';
import { PurchaseOrderGroupInstanceRefs } from './types';
export class TPrintAction extends TGridAction<PurchaseOrderGroupInstanceRefs>{
    public ChildrenColumns: TableColumnsType[] =[];
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseOrderGroupInstanceRefs>){ 
        super(dataSource, instanceRefs)
        this.dataSource.getParams.defaultCondition = '';
        const purchasegridprintcol = this.commonDatas.SysParamDatas[0].purchasegridprintcol;
        if (purchasegridprintcol ==2){
            this.Columns = [{
                fieldName: 'seq1',//字段名
                width: 25,//宽度
                title: '#',//标题
                align:'center',
                sort: false
            },{
                fieldName: 'stock1',//字段名
                width: 50,//宽度
                title: '存',//标题
                sort: false,
                align:'center'
            },{
                fieldName: 'ng1',//字段名
                width: 100,//宽度
                title: '品名',//标题
                sort: false
            },{
                fieldName: 'orderlist1',//字段名
                width: 300,//宽度
                title: '明细',//标题
                sort: false
            },{
                fieldName: 'numex1',//字段名
                dataType: 'number',//数据类型
                width: 65,//宽度
                title: '总数',//标题
                sort: false,
                format:'0.00',
                customFormater:(fieldVal,rowItem)=>{
                    return fieldVal?$Utils.clearDecimal(fieldVal as string)+rowItem.unit1:''
                } ,
                align:'right'
            },{
                fieldName: 'price1',//字段名
                width: 50,//宽度
                title: '单价',//标题
                sort: false
            },{
                fieldName: 'moeny1',//字段名
                width: 50,//宽度
                title: '金额',//标题
                sort: false
            },{
                fieldName: 'seq2',//字段名
                width: 25,//宽度
                title: '#',//标题
                align:'center',
                sort: false
            },{
                fieldName: 'stock2',//字段名
                width: 50,//宽度
                title: '存',//标题
                sort: false,
                align:'center'
            },{
                fieldName: 'ng2',//字段名
                width: 100,//宽度
                title: '品名',//标题
                sort: false
            },{
                fieldName: 'orderlist2',//字段名
                width: 300,//宽度
                title: '明细',//标题
                sort: false
            },{
                fieldName: 'numex2',//字段名
                dataType: 'number',//数据类型
                width: 65,//宽度
                title: '总数',//标题
                sort: false,
                format:'0.00',
                customFormater:(fieldVal,rowItem)=>{
                    return fieldVal?$Utils.clearDecimal(fieldVal as string)+rowItem.unit2:''
                } ,
                align:'right'
            },{
                fieldName: 'price2',//字段名
                width: 50,//宽度
                title: '单价',//标题
                sort: false
            },{
                fieldName: 'moeny2',//字段名
                width: 50,//宽度
                title: '金额',//标题
                sort: false
            }];
        } else {
            this.Columns = [{
                fieldName: 'f1',//字段名
                width: 25,//宽度
                title: '完',//标题
                sort: false
            },{
                fieldName: 'o1',//字段名
                width: 50,//宽度
                title: '存',//标题
                sort: false,
                align:'center'
            },{
                fieldName: 'name1',//字段名
                width: 100,//宽度
                title: '品名',//标题
                sort: false
            },{
                fieldName: 'orderlist1',//字段名
                width: 250,//宽度
                title: '明细',//标题
                sort: false
            },{
                fieldName: 'numex1',//字段名
                dataType: 'number',//数据类型
                width: 65,//宽度
                title: '总数',//标题
                sort: false,
                format:'0.00',
                customFormater:(fieldVal,rowItem)=>{
                    return fieldVal?$Utils.clearDecimal(fieldVal as string)+rowItem.unit1:''
                } ,
                align:'right'
            },{
                fieldName: 'price1',//字段名
                width: 50,//宽度
                title: '单价',//标题
                sort: false
            },{
                fieldName: 'moeny1',//字段名
                width: 50,//宽度
                title: '金额',//标题
                sort: false
            },{
                fieldName: 'f2',//字段名
                width: 25,//宽度
                title: '完',//标题
                sort: false
            },{
                fieldName: 'o2',//字段名
                width: 50,//宽度
                title: '存',//标题
                sort: false,
                align:'center'
            },{
                fieldName: 'name2',//字段名
                width: 100,//宽度
                title: '品名',//标题
                sort: false
            },{
                fieldName: 'orderlist2',//字段名
                width: 250,//宽度
                title: '明细',//标题
                sort: false
            },{
                fieldName: 'numex2',//字段名
                dataType: 'number',//数据类型
                width: 65,//宽度
                title: '总数',//标题
                sort: false,
                format:'0.00',
                customFormater:(fieldVal,rowItem)=>{
                    return fieldVal?$Utils.clearDecimal(fieldVal as string)+rowItem.unit2:''
                } ,
                align:'right'
            },{
                fieldName: 'price2',//字段名
                width: 50,//宽度
                title: '单价',//标题
                sort: false
            },{
                fieldName: 'moeny2',//字段名
                width: 50,//宽度
                title: '金额',//标题
                sort: false
            },{
                fieldName: 'f3',//字段名
                width: 25,//宽度
                title: '完',//标题
                sort: false
            },{
                fieldName: 'o3',//字段名
                width: 50,//宽度
                title: '存',//标题
                sort: false,
                align:'center'
            },{
                fieldName: 'name3',//字段名
                width: 100,//宽度
                title: '品名',//标题
                sort: false
            },{
                fieldName: 'orderlist3',//字段名
                width: 250,//宽度
                title: '明细',//标题
                sort: false
            },{
                fieldName: 'numex3',//字段名
                dataType: 'number',//数据类型
                width: 65,//宽度
                title: '总数',//标题
                sort: false,
                format:'0.00',
                customFormater:(fieldVal,rowItem)=>{
                    return fieldVal?$Utils.clearDecimal(fieldVal as string)+rowItem.unit3:''
                } ,
                align:'right'
            },{
                fieldName: 'price3',//字段名
                width: 50,//宽度
                title: '单价',//标题
                sort: false
            },{
                fieldName: 'moeny3',//字段名
                width: 50,//宽度
                title: '金额',//标题
                sort: false
            }];
        }
        
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'SaleViews-SaleOrder',sep: true,expand: false,opt:false,parger:true,readOnly: false
        }); 
    }
   /* public async open(){
        MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        const res = await this.dataSource.open(
            this.PagerConfig,
            ()=>{return this.beforeOpen()},
            (deataSet)=>{this.afterOpen(deataSet)}
        )
        if (res){
            this.dataSource.dataSet = $Utils.arrGroup(this.dataSource.dataSet,'catecode')
            console.log('wwwww',this.dataSource.dataSet)
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
            let _LineObj = {} as any;
            let _LineArr = [] as any;
            //纵向序号，
            this.dataSource.dataSet.map((item: any)=>{ 
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
        setTimeout(()=>{MessageBox.closeLoading();},300);
    }
    */
}
