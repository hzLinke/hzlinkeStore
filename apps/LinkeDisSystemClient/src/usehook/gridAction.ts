import {ref} from 'vue'
import {
    TableRowDataType,
    DataSourceType,
    SetFieldValueType,
    CommondDatasParamType,
    TableConfigType,PagerConfigType,ToolsBarItemType,
    TableColumnsType,TableMethodsType,TableEventsType,SearchBoxConfigType,PowerListType,
    InputOptionsType,
    WinSearch,    
} from '@v4x/ui'
import $api from '@/request/api'
import lkxUtil from '@v4x/utils/lkxUtil';
import {useAppStore} from '@/stores';
import {MessageBox,ModalResultEnum} from '@v4x/ui'

export class TGridAction<T = any>{
    public Loading = false;
   // public dom =ref<null | HTMLElement>(null);
    public LoadText = '正在加载数据...';
    public beforeInsertToSaveData = true; 
    public dataSource: DataSourceType;
    public allPower = false;
    public commonDatas= {} as CommondDatasParamType;
    public activeColIndex = 1;
    public instanceRefs: Partial<T>;
    public toolsBarItems: ToolsBarItemType[] = [ 
        {title:'<F5>库存',
            idCode:'_StockList',
            index:1,
            dropDown:false},
        {title:'<F6>采购历史',
            idCode:'_InHistory',
            index:2,
            dropDown:false
        }, {
            title:'<F7>销售历史',
            idCode:'_OutHistory',
            index:3,
            dropDown:false
        }
    ] 
    public TableConfig: TableConfigType={
        id:'basicViews\basicUser',
        sep: true,
        expand: false,
        opt:false,
        parger:true,
        gridFooter:true,
        toolsbar:false,
        readOnly: false,
        enterJumpReadOnlyCol: true,
        endAutoAppend: true,
        allowedOperations: {
            alopDelete: true,
            alopInsert: true,
            alopUpdate: true,
            alopSubmit: false,
            alopSearch: true,
        },
        userName:''
    };

    public PrintConfig = ref({});//打印配置
    public SelectPrintStyleCode = 0;//打印格式编号
    /**打印格式选择框 */
    public PrintStyleState: InputOptionsType = {
        config:{
            caption: '打印格式', 
            captionWidth:70,
            align: 'left',
            captionAlign:'right',
            inputType:'drop',
            buttons:[{iconType:'more',onClick:(data: any)=>{}}],//自定义指示器按钮
            onChange:(data: any)=>{
                if (data['style']){
                    this.PrintConfig.value = JSON.parse(data['style']);   
                } else {
                    this.PrintConfig.value ={}
                }
            }
        },
        dropConfig:{
            allowInput: false,
            allowFilter: false,
            dropListPosition:{},/**下拉组件位置 */
            resultFieldName:'xh',/**下拉返回字段 */
            displayFieldName: 'stylename',/**下拉显示字段 */
            displayFields:'xh|stylename',
            displayFieldWidths:'40|350',
            dropListDatas:[],
           
        }
    }
    public PagerConfig: PagerConfigType={curPage:1,pageSize:50,total:0};

    public SerachBoxConfig:SearchBoxConfigType = {
        width: '400px',
        fields:[]
    }
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
    public Columns: TableColumnsType[] =[];

    public Methods: TableMethodsType ={
        allowEdit:(row: TableRowDataType): boolean=>{
            return true
        },
        allowDel:(row: TableRowDataType): boolean=>{
            return true
        },
        rowCalculated: {},
        sumCalculated: { 
            CountCalc:(datas: TableRowDataType[]): number=> {
                 return this.dataSource.totalData.count||0
            },
        },
        customFormater: {}
    }
    public Events: TableEventsType = {
        gridKeyDown:(e: KeyboardEvent)=>{
            if (e.key=='Escape'){
                useAppStore().activeWin?.closeWin()
            }
        },
        changePage: async (curPage: number,backCall: Function)=>{  
            const doOpen = ()=>{
                this.PagerConfig.curPage = curPage    
                this.open()
            }
            this.questionSave(doOpen)
        },
        changePageSize:async (pageSize: number,backCall: Function)=>{
            const doOpen = ()=>{
                this.PagerConfig.pageSize = pageSize
                this.PagerConfig.curPage = 1;
                this.open()
            }
            this.questionSave(doOpen)
        },
        sort:async (flg: string,fieldName: string,backCall: Function)=>{
            this.PagerConfig.curPage = 1;
            if (flg == 'desc'){
                this.dataSource.getParams.sortFields = fieldName+ ' desc'
            } else {
                this.dataSource.getParams.sortFields = fieldName
            }
            this.questionSave(()=>{this.open()})
        },
        beforeExport: async ()=>{
            MessageBox.loading({
                moreText: '正在生成导出数据...',
                mask: true
            })
            /*const db = new TWebDataBase('printData')
            db.dropTable('swapData');
            db.creteTable('swapData',['id REAL UNIQUE','jsontxt TEXT']);
            db.insertTable('swapData',['id','jsontxt'],[1,'张建明'])*/
            let AllDatas = [] as any
            const totalPage = (this.PagerConfig.pageSize||0)==0?1:Math.ceil(this.dataSource.dataSetRowCount / this.PagerConfig.pageSize);
            if (totalPage == 1){
                AllDatas = this.dataSource.dataSet
            } else {
                for (let i= 1;i<=totalPage;i++){
                    const res = await this.dataSource.openEx({pageSize: this.PagerConfig.pageSize,curPage:i,total:0})
                    AllDatas = AllDatas.concat(res);
                }
            }
  
            this.Columns.map((item: any)=>{
                for (const key in item){
                    if (key=='fieldName'){
                        item[key] = item[key].toLocaleLowerCase()
                    }
                }
            }) 
            /**将下拉字段的值代入原值，导出 */
            AllDatas.map((item: any)=>{
                for (const key in item){
                    const _Inx = lkxUtil.getIndexFromArray(this.Columns,'fieldName',key);
                    const ColumnsObj = this.Columns[_Inx];
                    if (ColumnsObj&&ColumnsObj.inputType == 'drop'){
                        const list = ColumnsObj.dropListConfig?.dropListDatas;
                        const keyFieldName = ColumnsObj.dropListConfig?.resultFieldName||'';
                        const resFieldName = ColumnsObj.dropListConfig?.displayFieldName||'';
                        const resValue = lkxUtil.getValueFromArray(list,keyFieldName,resFieldName,item[key]);
                        item[key] = resValue;
                        
                    }
                }
            })
            setTimeout(()=>{MessageBox.closeAllLoading();},100);
            return new Promise((resolve, reject)=>{
                resolve(AllDatas)
            })
        },
        beforePrint: async ()=>{
            MessageBox.loading({
                moreText: '正在生成打印数据...',
                mask: true
            })
            let AllDatas = [] as any
            const totalPage = this.PagerConfig.pageSize==0?1: Math.ceil(this.dataSource.dataSetRowCount / this.PagerConfig.pageSize);
            if (totalPage == 1){
                AllDatas = this.dataSource.dataSet
            } else {
                for (let i= 1;i<=totalPage;i++){
                    const res = await this.dataSource.openEx({pageSize: this.PagerConfig.pageSize,curPage:i,total:0})
                    AllDatas = AllDatas.concat(res);
                }
            }
            setTimeout(()=>{MessageBox.closeAllLoading();},100);
            return new Promise((resolve, reject)=>{
                resolve(AllDatas)
            })
        }
    }
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>, commonDatas?: CommondDatasParamType){
        this.TableConfig.userName = useAppStore().loginDatas.name
        this.commonDatas = useAppStore().commonDatas;
        this.dataSource = dataSource;
        this.instanceRefs = instanceRefs;
        this.dataSource.onSetFieldValue = this.onSetFieldValue.bind(this);
    }


    /**判断数据是否需要保存 */
    private async questionSave(backCall: Function){
        if (this.dataSource?.datasetIsChange()){
            const res = await MessageBox.question({title: '提问',content:'数据有改变是否保存？',cancelText:'不保存',confirmText:'保存'})
            if (res.action == ModalResultEnum.mrConfirm) {
               const res = await this.update() 
               if (res) {
                    backCall()
               }
               return
            }  
        } 
        backCall()
    }
    public setActiveColIndex(index: number){
        this.activeColIndex = index;
    }
    /**判断是否有审核与反签权限 */
    public checkSubmit(UpdateType: number){
        if (UpdateType==1&&!this.PowerList.allowedSubmit){
            MessageBox.warning({
                title:'警告',
                content:'对不起您没有权限，请找系统员分配',
                showCancel: false
            })
            return false
        }
        if (UpdateType==-1&&!this.PowerList.allowedUnSubmit){
            MessageBox.warning({
                title:'警告',
                content:'对不起您没有权限，请找系统员分配',
                showCancel: false
            })
            return false
        }
        return true;
    }
    /**根据字段获取列号 */
    public fieldToColIndex(fieldName: string): number{
        const _fieldToColIndex =(columns: TableColumnsType[],fieldName: string): number=>{
            let _inx = 0
            const visibleColumns = columns.filter((item: any)=>{
                return item.visible != false
            })
            if (!fieldName) return _inx   
            for (let i=0;i<visibleColumns.length;i++){
                if (visibleColumns[i].fieldName == fieldName){
                    _inx = i
                    break
                }
            }
            return _inx 
        }
        const _ColIndex = _fieldToColIndex(this.Columns,fieldName)+Number(this.TableConfig.sep||0)+Number(this.TableConfig.expand||0);
        

        this.setActiveColIndex(_ColIndex);
        return _ColIndex
    }
    protected async beforeOpen(): Promise<boolean> {return new Promise((resolve, reject)=>{resolve(true)})}
    protected async afterOpen(dataSet: any[]) {/** 子类实现*/}
    protected async beforeInsert(): Promise<boolean> {
        let updateRes = true;
        if (this.beforeInsertToSaveData&&this.dataSource.datasetIsChange()){
            updateRes = await this.update(false);
        }
        return new Promise((resolve, reject)=>{
            resolve(updateRes)
        })
    }
    protected async beforedEdit(rowItem:  TableRowDataType,fieldName: string): Promise<boolean> {
        const allowed = this.allPower||this.PowerList.allowedEdit||this.dataSource.status == 'ins'
        if (!allowed ){
            await MessageBox.warning({
                title:'警告',
                content:'对不起您没有权限，请找系统员分配',
                showCancel: false,
                //activeElement: document.activeElement
            })
        }
        return new Promise((resolve, reject)=>{
            resolve(allowed)
        })
    }
    protected async afterInsert(rowItem: TableRowDataType,rowIndex: number):Promise<boolean> {/** 子类实现*/
        return new Promise((resolve, reject)=>{
            resolve(true)
        })
    }
    protected async beforeDelete(rowItem: TableRowDataType): Promise<boolean> {
        return new Promise((resolve, reject)=>{
            if (this.Methods.allowDel&&this.Methods.allowDel(rowItem))
                resolve(true)
            else 
                resolve(false)
        })
    }
    protected async afterDelete(rowItem: TableRowDataType) {/** 子类实现*/}
    protected async beforeUpdate(): Promise<boolean> {return new Promise((resolve, reject)=>{resolve(true)})}
    protected async afterUpdate(dataSet: any[]) {/** 子类实现*/}
    protected async headerUpdate(): Promise<boolean> {/**保存头部 子类实现*/
        return new Promise((resolve, reject)=>{
            resolve(false)
        })
    }
    public async beforePrint(): Promise<boolean> {
        const res = await this.update(true);
        return new Promise((resolve, reject)=>{resolve(res)})
    }

    public onSetFieldValue(data: SetFieldValueType,rowItem: TableRowDataType): Promise<boolean>{
        return new Promise((resolve, reject)=>{resolve(true)})
    }

    public async changeRowValue(data: TableRowDataType, editRowIndex?: number): Promise<boolean>{
        return true
    }
    /*public closeWin(){
        if (this.Events.back){
            this.Events.back()
        } else {
            (this.CloseTab as any)()
        }
    }*/

    public async openSerarchWin(){
        const res = await WinSearch.show(this.SerachBoxConfig)
        if (res.action !== ModalResultEnum.mrConfirm) return
        this.PagerConfig.curPage = 1;
        this.dataSource.getParams.defaultCondition = ''
        this.dataSource.getParams = Object.assign(this.dataSource.getParams,{condition:res.data.filter})
        this.PagerConfig.whereStr = res.data.filterCaption;
        this.open()

    }

    public async open(loading=true){
        loading&&MessageBox.loading({
            moreText: '正在加载数据...',
            mask: true
        })
        this.dataSource.emptyDetaiSet()
        //this.Loading = true
        const res = await this.dataSource.open(
            this.PagerConfig,
            ()=>{return this.beforeOpen()},
            (deataSet)=>{this.afterOpen(deataSet)}
        )
    
        if (res){
            this.dataSource.activeRowIndex = 0;
        }
        if (loading){
            setTimeout(()=>{MessageBox.closeAllLoading();},100);
        }
        //setTimeout(()=>{this.Loading = false},300);
    }
    public async insert(question=true): Promise<boolean>{
        if (this.TableConfig.readOnly||!this.TableConfig.allowedOperations?.alopInsert) {
            return new Promise((resolve, reject)=>{
                resolve(false)
            });
        }
        if(question&&!this.PowerList.allowedInsert){
            await MessageBox.warning({
                title:'警告',
                content:'对不起您没有权限，请找系统员分配',
                showCancel: false
            })
            return new Promise((resolve, reject)=>{
                resolve(false)
            });
        }
        const res= await this.dataSource.insert(
            ()=>{return this.beforeInsert()},
            (rowItem,rowIndex)=>{this.afterInsert(rowItem,rowIndex)}
        );
        return new Promise( (resolve, reject)=>{
            resolve(res)
        })
       /* return new Promise( (resolve, reject)=>{
            setTimeout( async () => { 
                if (question&&!this.PowerList.allowedInsert){
                    MessageBox.warning({
                        title:'警告',
                        content:'对不起您没有权限，请找系统员分配',
                        showCancel: false
                    })
                    resolve(false)
                } else {
                    const res= await this.dataSource.insert(
                        ()=>{return this.beforeInsert()},
                        (rowItem,rowIndex)=>{this.afterInsert(rowItem,rowIndex)}
                    );
                    resolve(res)
                }
            }, 50);
        })*/
    }
    public async update(loading = true,JumpReadOnly = false): Promise<boolean>{
        //if (this.TableConfig.readOnly||!this.TableConfig.allowedOperations?.alopInsert) return true;
        if (this.TableConfig.readOnly&&!JumpReadOnly) return true;
        await this.headerUpdate();
        if (!this.dataSource.datasetIsChange()) return true;
        loading&&MessageBox.loading({
            moreText: '正在提交数据...',
            mask: true
        })
        const res  = await this.dataSource.update(
            async (apiPath: string,tableName: string,keyFieldName: string,detail: any[])=>{
                return await $api.saveData(apiPath,{
                    tableName: tableName,
                    keyFieldName:keyFieldName,
                    datas: detail
                })      
            },
            ()=>{return this.beforeUpdate()},
            (dataSet)=>{this.afterUpdate(dataSet)}
        )
        loading&&setTimeout(()=>{MessageBox.closeAllLoading();},50);
        return res;
        
    }
    public async delete(question=true): Promise<boolean>{
        if (this.TableConfig.readOnly||!this.TableConfig.allowedOperations?.alopDelete) return false;
        if (this.dataSource.dataSet.length==0) return false
        if (question&&!this.PowerList.allowedDelete){
            MessageBox.warning({
                title:'警告',
                content:'对不起您没有权限，请找系统员分配',
                showCancel: false
            })
            return false
        }
        if (question){
            const res = await MessageBox.question({
                title:'提问',
                content: '是否要删除数据？'
            })
            if (res.action !== ModalResultEnum.mrConfirm) return false
        }
        return await this.dataSource.delete(
            (rowItem: TableRowDataType)=>{return this.beforeDelete(rowItem)},
            (rowItem: TableRowDataType)=>{this.afterDelete(rowItem)}
        )
    }
    public cancel(reLoad = true){
        if (this.dataSource.datasetIsChange())
            this.dataSource.cancel()
        else if (reLoad) {
            this.PagerConfig.curPage = 1
            this.open()
        }
    }

    public async submit(submitType: number): Promise<any> {
       //由子类类实现
    }
    public ToolsBarItemClick(data: any){
      //由子类类实现
    }
    

}