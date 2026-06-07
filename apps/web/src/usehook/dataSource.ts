import {ref, reactive,getCurrentInstance,inject,provide,watch} from 'vue'
import { useRoute, useRouter } from "vue-router"
import {
    TableRowDataType,
    DataSourceType,
    DataSourceCreateParmarsType,
    SetFieldValueType,PowerListType,
    PagerConfigType,
    DataGetConfigType

} from '@v4x/ui'

import $api from '@/request/api'


export class TDataSource implements DataSourceType{
    private readonly insertSign: string;
    private PagerConfig: PagerConfigType;//当前数据页参数
    get thisRowData(): TableRowDataType {
        return this.dataSet[this.activeRowIndex] as TableRowDataType
    }
    public thisInstance: null;
    public dataSet: any[] = [];
    public CurDataSet: any[] = [];
    public extendDataSet: any[] = [];
    public detailSet: any[];
    public treeDatas: any[];
    public totalData: object={count:0};
    public activeRowIndex: number;
    public selectLists: number[];
    public dataSetRowCount: number;
    public status: string;
    public apiPath: string;
    public keyFieldName: string;
    public NotAllowOperationList: string[];
    public getParams: DataGetConfigType={
        mustCondition   :   '',
        defaultCondition:   '',
        tableName       :   '',
        fields          :   '*',
        sortFields      :   'idCode',
        returnTotal     :   true,
        totalFieldSql   :   '',
    };
    public PowerList: PowerListType = {
        allowedInsert: true,
        allowedEdit: true,
        allowedDelete: true,
        allowedPrint: true,
        allowedViewCostPrice: true,
        allowedSubmit: true,
        allowedUnSubmit: true,
        allowedExport: true,   //导出数据
        allowedSaveStyle: true, //保存样式
        allowedClearStyle: true,//清除样式
        allowedCancelCol: true,//取消列
        allowedRecoveryCol: true,//恢复列
        allowedTableSet: true//表格设置
    }
    constructor(parmars: DataSourceCreateParmarsType){
        this.insertSign = '#A0123456789abcdefghijklmnopqrstuvwszy$Ins';
        this.dataSet = [];
        this.detailSet = [];
        this.treeDatas = [];
        this.totalData = {};
        this.selectLists = [0];
        this.activeRowIndex = 0;
        this.dataSetRowCount = 0;
        this.status = 'browse';
        this.apiPath = parmars.ApiPath;
        this.keyFieldName = parmars.KeyFieldName.toLocaleLowerCase();
        this.NotAllowOperationList = parmars.NotAllowOperationList;
        this.PagerConfig ={ curPage: 1,pageSize:20,total:0}
        this.getParams = Object.assign(this.getParams,{sortFields: this.keyFieldName},parmars.getParmars);
        const Instance = getCurrentInstance();
        const proxy: any = Instance&&Instance.proxy;
        this.thisInstance = proxy
    }
    //条件组合
    private conditionComb(a: string,b: string): string{
        if (!a&&!b) return ''
        if (!a&&b) return b
        if (a&&!b) return a
        if (a&&b) return a+' and '+b
        return ''
    }
    private getDetailRowIndex(fieldName: string,value: string|number,rowStatus: string): number{
        const index = this.detailSet.findIndex((item,index,arr)=>{
            return item['rowstatus']==rowStatus && item[fieldName] == value
        })
        return index
    }

    public setActiveRowIndex(rowIndex: number,fnKey?: any){
        this.setSelectLists(rowIndex, fnKey);
        this.activeRowIndex = rowIndex;
    }
    private setSelectLists(rowIndex: number,fnKey?: any){
        if ((fnKey?.ctrlKey||fnKey?.shiftKey)&&this.selectLists.indexOf(rowIndex)!=-1) return
        if (fnKey?.ctrlKey)
            this.selectLists.push(rowIndex) 
        else  if (fnKey?.shiftKey){
            const flg = (rowIndex > this.activeRowIndex)?1:-1;
            for (let i=1;i<=Math.abs(rowIndex - this.activeRowIndex);i++){
                this.selectLists.push(this.activeRowIndex+i*flg)   
            }
        } else
            this.selectLists = [rowIndex];
    }
    public datasetIsChange(): boolean{
        const updateData = this.detailSet.filter((item,index)=>{
            return item.rowstatus != 'cur'
        })
        return (updateData.length!=0);
    }
    public onSetFieldValue(data: SetFieldValueType): Promise<boolean>{
        console.log(data,'bbbb');
        return new Promise((resolve, reject)=>{resolve(true)})
    }
    /**
     * 行是否可能删除
     * @param rowItem 行数据
     * @param fieldName 字段右
     * @returns true/false
     */
    public rowAllowedDelete(rowItem: TableRowDataType,fieldName: string): boolean{
        return this.NotAllowOperationList.indexOf(rowItem[fieldName])==-1
    }
    public async getFieldValueFormServer(params: DataGetConfigType): Promise<number>{
        const _Params = Object.assign({},this.getParams,params)
        const res = await $api.comonRequest(this.apiPath,'getFieldValue',_Params)
        if (res&&res.errCode==0){
            return res.val
        }
        return -1
    }

    public async open(PagerConfig: PagerConfigType,beforeOpen?: () => Promise<boolean>,afterOpen?: (dataSet: any[]) => void): Promise<boolean> {
        let allowedAction = true
        this.PagerConfig = PagerConfig;
        if (beforeOpen){allowedAction = await beforeOpen();}
        if (!allowedAction) return false;
        const params = Object.assign(this.getParams,{page: PagerConfig.curPage,pageSize: PagerConfig.pageSize});
         /**必须条件与默认条件组合 */
        let _condition = this.conditionComb((this.getParams.mustCondition as string),this.getParams.defaultCondition||'')
        _condition = params.condition==_condition?_condition:this.conditionComb(_condition,params.condition||'')
        params.condition = _condition
       // console.log('this.apiPath',this.apiPath)
        const res = await $api.getData(this.apiPath,params)
        if (res&&res.errCode==0){
            this.dataSet = res.datas;
            this.CurDataSet = [...this.dataSet];
            this.totalData = res.total;
            this.dataSetRowCount = res.total.count;
            this.extendDataSet = res.detail||[]
            this.setActiveRowIndex(0);
            this.emptyDetaiSet();
            afterOpen&&afterOpen(this.dataSet);
            return true
        }
        return false
    }
    public async openEx(PagerConfig: PagerConfigType): Promise<any> {
        const params = Object.assign(this.getParams,{page: PagerConfig.curPage,pageSize: PagerConfig.pageSize});
         /**必须条件与默认条件组合 */
        let _condition = this.conditionComb((this.getParams.mustCondition as string),this.getParams.defaultCondition||'')
        _condition = params.condition==_condition?_condition:this.conditionComb(_condition,params.condition||'')
        params.condition = _condition
        const res = await $api.getData(this.apiPath,params)
       
        if (res&&res.errCode==0){
            return res.datas;
        }
        return false
    }

    public close(): void {
        this.dataSet = [];
        this.detailSet = [];
        this.totalData = {count:0}
    }
    public async insert(beforeInsert?: () => Promise<boolean>,afterInsert?: (rowItem: TableRowDataType,rowIndex: number) => void): Promise<boolean>{
        let allowedAction = true
        if (beforeInsert){allowedAction = await beforeInsert();}

        if (!allowedAction) return false;
        this.status = 'browse';
        this.dataSet.push({insertSign: this.insertSign});
        this.detailSet.push({rowstatus: 'ins',insertSign: this.insertSign});
        this.setActiveRowIndex(this.dataSet.length-1);
        (this.totalData as any).count = (this.totalData as any).count*1 + 1;
        this.dataSetRowCount = this.dataSetRowCount*1 + 1;
        setTimeout(() => {
            afterInsert&&afterInsert(this.dataSet[this.activeRowIndex],this.activeRowIndex);
            this.status = 'ins';
        }, 10);
        return true;
    }
    public async delete(beforeDelete?: (rowItem: TableRowDataType) => Promise<boolean>,afterDelete?: (rowItem: TableRowDataType) => void): Promise<boolean>{
        let minRowIndex = Math.min(...this.selectLists);
        const firtsRowIndex = this.selectLists[0]
        const len = this.selectLists.length;
        for (let i=0;i<len;i++){
          
            const thisRowObject = this.dataSet[minRowIndex];
            const thisKeyValue = thisRowObject[this.keyFieldName];
            if (!this.rowAllowedDelete(thisRowObject,this.keyFieldName)) {minRowIndex++; continue;}
            let allowedAction = true;
           
            if (beforeDelete){allowedAction = await beforeDelete(thisRowObject);}
            if (!allowedAction) { minRowIndex++;continue;}
            this.status = 'browse';
            const insIndex = this.getDetailRowIndex(this.keyFieldName,thisKeyValue,'ins');
              if (insIndex>=0){//删除行是刚增加的直接删除
                this.detailSet.splice(insIndex,1);
            } else {
                const curIndex = this.getDetailRowIndex(this.keyFieldName,thisKeyValue,'cur');
                if (curIndex>=0){//删除行是修改过的
                    const editIndex = this.getDetailRowIndex(this.keyFieldName,thisKeyValue,'edit');
                    //将原数据置成del状态
                    this.detailSet[curIndex].rowstatus='del';
                    this.detailSet.splice(editIndex,1);
                } else {
                    this.detailSet.push(Object.assign({rowstatus: 'del'},thisRowObject));
                }
            }
          
            this.selectLists.splice(i,1)
            this.dataSet.splice(minRowIndex,1);
            setTimeout(() => {
                afterDelete&&afterDelete(this.dataSet[this.activeRowIndex]);
                this.status = 'del';
            }, 10);
            (this.totalData as any).count = (this.totalData as any).count*1 - 1;
            this.dataSetRowCount = this.dataSetRowCount -1;
        }
        this.setActiveRowIndex(firtsRowIndex>=this.dataSet.length?this.dataSet.length-1: firtsRowIndex||0);
        return true;
    }
    public async cancel(beforeCancel?: () => Promise<boolean>,afterCancel?: (dataSet: any[]) => void): Promise<boolean> {
        if (this.detailSet.length==0){
            return false
        }
        let allowedAction = true
        if (beforeCancel){allowedAction = await beforeCancel();}
        if (!allowedAction) return false;
        this.detailSet.forEach((detailItem,index)=>{ 
            const idx = this.dataSet.findIndex((value, index, arr) => {
                return value[this.keyFieldName] ==detailItem[this.keyFieldName]
            })
            switch (detailItem.rowstatus){
                case 'cur': //修改
                    delete detailItem.rowstatus;
                    Object.assign(this.dataSet[idx], detailItem)
                    break
                case 'ins': //增加
                    this.dataSet.splice(idx,1);
                    (this.totalData as any).count = (this.totalData as any).count*1 - 1;
                    this.dataSetRowCount = this.dataSetRowCount -1;
                    break
                case 'del':{ //删除
                    const curRowIndex = parseInt(detailItem.rowid)- (this.PagerConfig.curPage-1)*this.PagerConfig.pageSize - 1;//原位置
                    (this.totalData as any).count = (this.totalData as any).count*1 + 1;
                    this.dataSetRowCount = this.dataSetRowCount + 1;
                    delete detailItem.rowstatus;
                    this.dataSet.splice(curRowIndex,0,detailItem)//将数据恢复至原位
                    break
                }
            }
        })
        
        this.emptyDetaiSet();
        if (this.activeRowIndex >= this.dataSet.length){
            this.setActiveRowIndex(this.dataSet.length-1);
        }
        setTimeout(() => {
            afterCancel&&afterCancel(this.dataSet);
            this.status = 'browse';
        }, 0);
        return true
    }
    public async update(updateFunction: (apiPath: string,tableName: string,keyFieldName: string,detailSet: any[]) =>  Promise<any>,beforeUpdate?: () => Promise<boolean>,afterUpdate?: (detailSet: any[]) => void): Promise<boolean>{
        let allowedAction = true
        if (beforeUpdate){allowedAction = await beforeUpdate();}
        //console.log(JSON.stringify(this.detailSet))
        if (!allowedAction) return false;
        const updateDataList = this.detailSet.filter((item,index)=>{
            return item.rowstatus != 'cur'
        })
        const updateData = updateDataList.map((item,index)=>{
            if (item.rowstatus==='del'){
                /**删除时只传键值数据，其它不传 2022-11月加 */
                item = {rowstatus:'del',[this.keyFieldName]:item[this.keyFieldName]}
                return item
            } else {
                return item
            }
        })
        const res = await updateFunction(this.apiPath,this.getParams.tableName||'',this.keyFieldName,updateData)
        if (res&&res.errCode==0){
            setTimeout(() => {
                afterUpdate&&afterUpdate(this.dataSet);
                this.status = 'browse';
            }, 0);
            this.emptyDetaiSet();
            return true
        }
        return false
    }
    public changeFieldValue(fieldName: string,fieldVaue: string|number,activeRowIndex: number){

       // const insIndex = this.getDetailRowIndex('insertSign',this.insertSign,'ins');
       const insIndex = this.getDetailRowIndex(this.keyFieldName,this.dataSet[activeRowIndex][this.keyFieldName],'ins');
        if (insIndex>=0/*&&this.dataSet[activeRowIndex]['insertSign']==this.insertSign*/){//当前修改的行是增加的
            this.detailSet[insIndex][fieldName] = fieldVaue;
        } else {
            const curIndex = this.getDetailRowIndex(this.keyFieldName,this.dataSet[activeRowIndex][this.keyFieldName],'cur');
            if (curIndex<0){//不存在，没有修改过
                this.detailSet.push(Object.assign({rowstatus: 'cur'},this.dataSet[activeRowIndex]));
                this.detailSet.push(Object.assign({rowstatus: 'edit'},{[this.keyFieldName]: this.dataSet[activeRowIndex][this.keyFieldName]}));
            }
            const editIndex = this.getDetailRowIndex(this.keyFieldName,this.dataSet[activeRowIndex][this.keyFieldName],'edit');
            this.detailSet[editIndex][fieldName] = fieldVaue;
        }
        this.dataSet[activeRowIndex][fieldName] = fieldVaue;
        this.dataSet = [...this.dataSet];
    }
    public async setFieldValue(fieldName: string,fieldVaue: string|number,rowIndex?: number): Promise<boolean>{
        const saveActiveRowIndex = rowIndex||rowIndex==0? rowIndex:this.activeRowIndex
        this.changeFieldValue(fieldName.toLocaleLowerCase(),fieldVaue,saveActiveRowIndex);
        return true
    }
    public async setFieldValuePlus(rowDatas: any,rowIndex?: number): Promise<boolean>{
        Object.keys(rowDatas).forEach((key)=>{
            this.setFieldValue(key,rowDatas[key],rowIndex);
        })
        return true;
    }
    public getFieldValue(fieldName: string): string|number{
        return  this.dataSet[this.activeRowIndex][fieldName.toLocaleLowerCase()]
    }
    public emptyDetaiSet(){
        this.detailSet = []
    }
}