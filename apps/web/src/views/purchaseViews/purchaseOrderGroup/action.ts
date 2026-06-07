
import $api from '@/request/api';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"


import { DataSourceType, MessageBox, ModalResultEnum, TableColumnsType, TableRowDataType, WinModal } from '@v4x/ui';
import type { PurchaseOrderGroupInstanceRefs } from './types';
import { ref } from 'vue';
import { WinChangeProduct,WinProductSelect } from '@/components'
import useAppStore from '@/stores';

export class TListGridAction extends TGridAction<PurchaseOrderGroupInstanceRefs>{
    public ChildrenColumns: TableColumnsType[] =[];
    public printData = ref([] as any)
    constructor(dataSource: DataSourceType, instanceRefs: Partial<PurchaseOrderGroupInstanceRefs>){ 
        super(dataSource, instanceRefs)

        this.dataSource.getParams.defaultCondition = ''
        this.Columns = [{
            dataType: 'text',
            fieldName: 'sep',
            width: 50,
            title: '序号',
            align:'center',
            readonly: true,
        },{
            fieldName: 'name',
            width: 150,
            title: '品名',
        },{
            fieldName: 'spec',
            width: 100,
            title: '规格',
        },{
            dataType: 'number',
            fieldName: 'owenum',
            width: 120,
            align: 'right',
            title: '欠数',
            customFormater:(fieldVal,rowItem)=>{
                if (rowItem.saletype==2)
                    return $Utils.clearDecimal(rowItem.owenum)+rowItem.downunit+'/'+ $Utils.clearDecimal(rowItem.owenumex)+rowItem.unit
                else 
                    return $Utils.clearDecimal(rowItem.owenumex)+rowItem.downunit
            }  
        },{
            fieldName: 'detail',
            width: 650,
            title: '明细',
        },{
            fieldName: 'note',
            width: 100,
            title: '备注',
        }];
        this.ChildrenColumns = [{
            dataType: 'number',
            fieldName: 'num',
            width: 120,
            align: 'right',
            title: '数量',
            customFormater:(fieldVal,rowItem)=>{
                let res
                if (rowItem.saletype==2)
                    res = $Utils.clearDecimal(rowItem.num)+rowItem.downunit+'/'+ $Utils.clearDecimal(rowItem.numex)+rowItem.unit
                else 
                    res = $Utils.clearDecimal(rowItem.numex)+rowItem.downunit
                return res
            }  
        },{
            fieldName: 'customerShortname',
            width: 200,
            title: '客户名',
        },{
            fieldName: 'note',
            width: 60,
            title: '备注',
        },{
            fieldName: 'shippername',
            width: 150,
            title: '供货商',
        },{
            fieldName: 'owenum',
            width: 160,
            title: '欠数',
            align: 'right',
            customFormater:(fieldVal,rowItem)=>{
                let res 
                if (rowItem.saletype==2)
                    res = $Utils.clearDecimal(fieldVal as string)+rowItem.downunit+'/'+ $Utils.clearDecimal(rowItem.owenumex)+rowItem.unit
                else 
                    res = $Utils.clearDecimal(fieldVal as string)+rowItem.downunit
                return res
            }
        },{
            dataType: 'text',
            fieldName: 'chk',
            width: 50,
            title: '选',
            align:'center',
            readonly: true,
        },{
            dataType: 'text',
            fieldName: 'opt',
            width: 150,
            title: '操作',
            align:'center',
            readonly: true,
        }];
        this.PagerConfig = {curPage:1,pageSize:0,total:0}
        this.TableConfig = Object.assign(this.TableConfig,{
            id:'purchaseOrderGroup',sep: true,expand: false,opt:false,parger:true,readOnly: false
        });  
    }

    private getOrderList(Item: any) {
        let rs = '';
       // console.log(Item)
        Item.forEach((item: any)=>{
            rs = rs + item.customershortname +'['+ $Utils.clearDecimal(item.numex as string)+ (item.note?`(${item.note})`:'')+'];'
        })
        rs = rs.substring(0,rs.length-1)
        return rs;
    }
    private getStocknum(stockNum: number): string{
        if (stockNum!=0)
           return  $Utils.clearDecimal(stockNum)
        else 
            return '/'
    }
    private buildPrintData=(data: any)=>{
        const purchasegridprintcol = this.commonDatas.SysParamDatas[0].purchasegridprintcol;
        const _data = data;
        //if (_data.length>0&&!_data.children) return [];
        _data.map((item: any)=>{
            item.children?.map((p: any)=>{
                p.orderlist = this.getOrderList(p.detail)
            })
        })
        let _LineObj = {} as any;
        let _LineArr = [] as any;
        //纵向序号，
        _data.map((item: any)=>{ 
            item.children = $Utils.datasRowToColumns(item.children,purchasegridprintcol,'seq')
        })
       /* _data.map((item: any)=>{ 
            _LineArr = []
            const rowNum = Math.ceil(item.children.length/purchasegridprintcol);//行数
            for (let i=0;i<rowNum;i++){
                _LineObj = {}
                _LineObj['unit1'] =item.children[i]['downunit'];
                _LineObj['o1'] = this.getStocknum(item.children[i]['stock']);
                _LineObj['sep1'] = i+1;
                _LineObj['name1'] =  item.children[i]['name']+item.children[i]['spec'];
                _LineObj['orderlist1'] = item.children[i]['orderlist'];
                _LineObj['numex1'] = item.children[i]['numex'];

                if (i+rowNum < item.children.length){
                    _LineObj['unit2'] =item.children[i+rowNum]['downunit'];
                    _LineObj['o2'] = this.getStocknum(item.children[i+rowNum]['stock']);
                    _LineObj['sep2'] = i+rowNum+1;
                    _LineObj['name2'] =  item.children[i+rowNum]['name']+item.children[i+rowNum]['spec'];
                    _LineObj['orderlist2'] = item.children[i+rowNum]['orderlist'];
                    _LineObj['numex2'] = item.children[i+rowNum]['numex'];
                }
                if (purchasegridprintcol >2){
                    if (i+rowNum*2 < item.children.length){
                        _LineObj['unit3'] =item.children[i+rowNum*2]['downunit'];
                        _LineObj['o3'] = this.getStocknum(item.children[i+rowNum*2]['stock']);
                        _LineObj['sep3'] = i+rowNum*2+1;
                        _LineObj['name3'] = item.children[i+rowNum*2]['name']+item.children[i+rowNum*2]['spec'];
                        _LineObj['orderlist3'] = item.children[i+rowNum*2]['orderlist'];
                        _LineObj['numex3'] = item.children[i+rowNum*2]['numex'];
                    }
                }
                _LineArr.push(_LineObj)
            }
            
            item.children = _LineArr
        })*/
        return _data;
    }
    public async open(){
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
            
            this.dataSource.dataSet.map(item=>{/**送入明细 */
                item.detail = this.dataSource.extendDataSet.filter((itemEx: any)=>{
                    return itemEx.productcode == item.productcode && itemEx.saletype == item.saletype && itemEx.qualitygrade == item.qualitygrade
                })
            })
            /**保存一份用于打印 连无下单的商品*/
            const _data = JSON.parse(JSON.stringify(this.dataSource.dataSet))
            /**将无下单的部分删除，不显示出来 */
            this.dataSource.dataSet = this.dataSource.dataSet.filter((item)=>item.billtype!=999)
            this.dataSource.dataSet = $Utils.arrGroup(this.dataSource.dataSet,'catename')
            this.dataSource.dataSet.map(item=>{
                item.checked = false;
                item.hideDetail = true;
            }) 
           
            this.dataSource.activeRowIndex = 0;
            this.PagerConfig.total = this.dataSource.dataSetRowCount
            this.printData.value = this.buildPrintData($Utils.arrGroup(_data,'catename'))
            
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},300);
    }
    public async acceptMergeProduct(cateData: any,cateIndex: number,shipperCode: number,userCode: number){
        const _childrenDatas = cateData['children'];
        const _CheckDatas = _childrenDatas.filter((item: any)=>{
            return item.checked == true 
        })
        if (_CheckDatas.length==0){MessageBox.toast({content: '请选中商品'}); return;}
        if (shipperCode==0){MessageBox.toast({content: '请选择供货商'}); return;}
        const res = await MessageBox.question({
            title:'提问',
            content:'是否要进行合并下单？',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        MessageBox.loading({
            moreText: '正在处理...',
            mask: true
        })
        for (let i=0;i<_childrenDatas.length;i++){
            if (!_childrenDatas[i].checked||_childrenDatas[i].owenum<=0) continue;
            const orderList = [] as any;
            const productData = _childrenDatas[i]
            const detailArr = productData.detail;        
            productData.detail.forEach((item: any)=>{
                if(item.checked==true){
                    orderList.push(item.billnumber)
                }
            })
            const Parmars={
                productcode:productData.idcode,
                shippercode:shipperCode,
                num:productData.owenum,
                numex: productData.owenumex,
                price:productData.costprice,
                deliveryat:productData.deliveryat,
                usercode: userCode,
                orderlist:orderList.join(','),
                SaleOrderIdKey: productData.detail[0].idkey,
                free:0,
                type:0
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'AccetpProduct',Parmars)   
            if (submitRes.errCode==0){  
                for (let j=0;j<detailArr.length;j++){
                    if (detailArr[j].checked ==true){
                        detailArr.splice(j--,1);
                        if (detailArr.length==0){
                            cateData['children'].splice(i--,1)
                            if (cateData['children'].length==0){
                                this.dataSource.dataSet.splice(cateIndex,1)
                            }
                        }
                    }   
                }
            }  
        
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},50);

    }
    public async acceptProduct(acceptData: TableRowDataType,shipperCode: number,acceptFree: boolean,userCode: number,cateIndex: number,productIndex: number){
          const Parmars={
			productcode:acceptData.productcode,
			shippercode:acceptData.shippercode,
			num:  acceptData.num,
			numex: acceptData.numex,// data.numex,
			price: acceptData.price,
			deliveryat:acceptData.deliveryat,
			usercode: userCode,
			orderlist:acceptData.orderlist,
			free:Number(acceptFree),
            SaleOrderIdKey: acceptData.idkey,
			type:0
		}
        MessageBox.loading({
            moreText: '正在处理...',
            mask: true
        })
      
     const submitRes = await $api.comonRequest(this.dataSource.apiPath,'AccetpProduct',Parmars)   
        if (submitRes.errCode==0){  
           // console.log(this.dataSource.dataSet[cateIndex].children[productIndex].detail)
           // console.log(acceptData.numex,this.dataSource.dataSet[cateIndex].children[productIndex].owenumex)
            this.dataSource.dataSet[cateIndex].children[productIndex].owenum = 
                parseFloat(this.dataSource.dataSet[cateIndex].children[productIndex].owenum) - 
                Parmars.num;//商品欠数=欠数- 选中商品应采数
            this.dataSource.dataSet[cateIndex].children[productIndex].owenumex = 
                parseFloat(this.dataSource.dataSet[cateIndex].children[productIndex].owenumex) - 
                Parmars.numex;//商品欠数=欠数- 选中商品应采数
            const detailArr = this.dataSource.dataSet[cateIndex].children[productIndex].detail;
            let yNum = parseFloat(acceptData.inputnum);
            for (let i=0;i<detailArr.length;i++){
                if (detailArr[i].checked ==true){
                    yNum = yNum - parseFloat(detailArr[i].owenum)
                    if (yNum >= 0){
                        detailArr.splice(i--,1);
                        if (detailArr.length==0)
                            this.dataSource.dataSet[cateIndex].children.splice(productIndex,1)
                        if (this.dataSource.dataSet[cateIndex].children.length==0){
                            this.dataSource.dataSet.splice(cateIndex,1)
                        }
                    } else {
                        detailArr[i].owenum =  Math.abs(yNum)
                        detailArr[i].owenumex =  Math.abs(yNum)*detailArr[i].downwg;
                    }
                    if (yNum<=0) break; 
                }   
            }
            if (this.dataSource.dataSet[cateIndex]){
                this._CheckedAll(acceptData,false);
                //if (free!=0)//免采时将可用量减少
                //    this.dataSource.dataSet[cateIndex].children[productIndex].stock = this.dataSource.dataSet[cateIndex].children[productIndex].stock -parseFloat(acceptData.inputnum)
                const _num =  this._CaclTotal(acceptData);
                if (this.dataSource.dataSet[cateIndex].children[productIndex]){
                    this.dataSource.dataSet[cateIndex].children[productIndex].checked = false
                    //const _num =  this._CaclTotal(groupIndex,subIndex);
                    this.dataSource.dataSet[cateIndex].children[productIndex].pruchasenum = _num
                }
                
            }
           
        }  
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
       // return submitRes;
    }
    public async changeProductNumber(data: TableRowDataType,groupIndex: number,subIndex: number,packIndex: number,value: any){
        MessageBox.loading({
            moreText: '正在处理...',
            mask: true
        })
        const {inputNum, inputRNum, inputNote} = value
        const Parmars={
            billnumber:data.billnumber,
            idkey:data.idkey,
            num:inputNum,
            replaceNum:inputRNum,
            numex: inputNum,
            note: inputNote
        }
        const submitRes = await $api.comonRequest(this.dataSource.apiPath,'ChangeProductNumber',Parmars)   
        if (submitRes.errCode==0){  

            const _V = parseFloat(this.dataSource.dataSet[groupIndex].children[subIndex].num) -
            parseFloat(this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].num) +
            parseFloat(inputNum);//-parseFloat(inputRNum)
            const _OV = parseFloat(inputNum);//-parseFloat(inputRNum);
            
            this.dataSource.dataSet[groupIndex].children[subIndex].num= _V
            this.dataSource.dataSet[groupIndex].children[subIndex].numex = _V;//*this.dataSource.dataSet[groupIndex].children[subIndex].downwg
            this.dataSource.dataSet[groupIndex].children[subIndex].owenum = _V;
            this.dataSource.dataSet[groupIndex].children[subIndex].owenumex = _V;//*this.dataSource.dataSet[groupIndex].children[subIndex].downwg
            
            this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].note= inputNote;
            this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].owenum= _OV
            this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].owenumex= _OV;//*this.dataSource.dataSet[groupIndex].children[subIndex].downwg
            this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].num= _OV
            this.dataSource.dataSet[groupIndex].children[subIndex]['detail'][packIndex].numex= _OV;//*this.dataSource.dataSet[groupIndex].children[subIndex].downwg

        }  
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    public async cancelProduct(groupIndex: number,subIndex: number){
        const detailArr = this.dataSource.dataSet[groupIndex].children[subIndex].detail;
        const _CheckDatas = detailArr.filter((item: any)=>{
            return item.checked == true
        })
        if (_CheckDatas.length==0){MessageBox.toast({content: '请选中商品'}); return;}
        const res = await MessageBox.question({
            title:'提问',
            content:'是否要取消该商品？',
            defaultButton: ModalResultEnum.mrCancel
        })
        if (res.action === ModalResultEnum.mrCancel) return false
        
        MessageBox.loading({
            moreText: '正在处理...',
            mask: true
        })
        for (let i=0;i<_CheckDatas.length;i++){
            const data = _CheckDatas[i];
            const Parmars={
                billnumber:data.billnumber,
                idkey:data.idkey,
                cancelnum: +$Utils.clearDecimal(data.owenum),
                cancelnumex: +$Utils.clearDecimal(data.owenum),
                productcode:data.productcode
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'CancelProduct',Parmars)   
            if (submitRes.errCode==0){  
                const delIndex = $Utils.getIndexFromArray(this.dataSource.dataSet[groupIndex].children[subIndex]['detail'],'idkey',data.idkey)
                this.dataSource.dataSet[groupIndex].children[subIndex]['detail'].splice(delIndex,1)
                if (this.dataSource.dataSet[groupIndex].children[subIndex]['detail'].length==0){
                    this.dataSource.dataSet[groupIndex].children.splice(subIndex,1)
                }
            }  
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    public async changeProduct(groupIndex: number,subIndex: number){
        let oneRecord = false;
        let inputData:TableRowDataType = {}
        const detailArr = this.dataSource.dataSet[groupIndex].children[subIndex].detail;
        const _CheckDatas = detailArr.filter((item: any)=>{
            return item.checked == true
        })
        if (_CheckDatas.length==0){MessageBox.toast({content: '请选中商品'}); return;}
        const _SelectRes = await WinProductSelect.show({
            title:'换货商品选择',
            customerCode: _CheckDatas[0].customercode,
            billType:3,
            defaultDatas:[]
        });
        if (_SelectRes.action !== ModalResultEnum.mrConfirm) return false   
        const  _SelectDatasData = _SelectRes.data as TableRowDataType
        if (_CheckDatas.length == 1){
            const res = await WinChangeProduct.show({
                title:'换货参数',
                inputNum: +$Utils.clearDecimal(_CheckDatas[0].owenum),
                inputDoMethod: _CheckDatas[0].note
            })
            if (res.action !== ModalResultEnum.mrConfirm) return false
            console.log(res.data)
            inputData = res.data
            oneRecord = true;
        }
        MessageBox.loading({
            moreText: '正在处理...',
            mask: true
        })
        for (let i=0;i<_CheckDatas.length;i++){
            const data = _CheckDatas[i];
            const Parmars={
                billnumber:data.billnumber,
                idkey:data.idkey,
                productcode: _SelectDatasData.idcode,
                barcode: _SelectDatasData.barcode,
                name: _SelectDatasData.name,
                spec: _SelectDatasData.spec,
                unit: _SelectDatasData.unit,
                downunit: _SelectDatasData.downunit,
                areacode: _SelectDatasData.areacode,
                stock: _SelectDatasData.stock,
                inprice: _SelectDatasData.inprice,
                costprice: _SelectDatasData.inprice,
                saleprice: _SelectDatasData.saleprice,
                saletype: _SelectDatasData.saletype,
                domethod: _SelectDatasData.domethod,
                downwg: _SelectDatasData.saletype==2||_SelectDatasData.saletype==3?_SelectDatasData.downwgspec||1:1,
                num: oneRecord?inputData.inputNum: +$Utils.clearDecimal(data.owenum),
                numex: oneRecord?inputData.inputNum*(_SelectDatasData.saletype==2||_SelectDatasData.saletype==3?_SelectDatasData.downwgspec||1:1): +$Utils.clearDecimal(data.owenumex),
                numlist:'',
                note: oneRecord?inputData.inputDoMethod:data.note,
                defaultShipperCode: _SelectDatasData.defaultshippercode,
            }
            const submitRes = await $api.comonRequest(this.dataSource.apiPath,'ChangeProduct',Parmars)   
            if (submitRes.errCode==0){  
                 this.open()
            }  
        }
        setTimeout(()=>{MessageBox.closeAllLoading();},50);
    }
    public _CheckedAll(rowItem: TableRowDataType,checked: boolean){
        const _datas = rowItem['detail']||rowItem['children'];
        if (_datas.length==0){ return;}
        _datas.map((item: TableRowDataType)=>{
            item.checked = checked;
        })
        
    }
    public _IsCheckedAll(rowItem: TableRowDataType){
        const _datas = rowItem['detail']||rowItem['children'];
        const _checkDatas = _datas.filter((item: TableRowDataType)=>{
            return item.checked == true
        })
        return _datas.length == _checkDatas.length
    }
    
    public _CaclTotal(rowItem: TableRowDataType){
        const _datas = rowItem['detail'];
        const _checkDatas = _datas.filter((item: any)=>{
            return item.checked == true
        })
        return $Utils.sumArray(_checkDatas,'owenumex');
    }
}
