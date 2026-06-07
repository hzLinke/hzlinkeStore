import {ref, reactive,getCurrentInstance,inject,provide,watch} from 'vue'
import { useRoute, useRouter } from "vue-router"
import $api from '@/request/api'
import comomParam from '@/config'
import { MessageBox, ModalResultEnum, TableMethodsType, TableRowDataType } from '@v4x/ui';
/**
*  @param {string} tableName 表名
*  @param {string} sortFields 排序字段名
*  @param {string} condition||'' 条件
*  @param {string} fields||'*' 字段列表
*  @param {boolean} retrunTotal||false 是否返回合计
*  @param {string} totalFieldSql||'' 统计字段sum(xx)，count(ss)
*  @param {number} page||1 页号
*  @param {number} pageSize||20 页行数 0代表不分页
 */
interface DataGetParamType{
    tableName?:      string;
    fieldName?:     string;
    sortFields?:     string;
    condition?:     string;
    returnTotal?:   boolean;
    totalFieldSql?: string;
    pageSize?: number;
}

/**
*  @param {string} tableName 表名
*  @param {string} keyFieldName 最大值字段
*  @param {string} condition||'' 条件
*  @param {TableRowDataType} rowData 数据
 */
interface DataInsertParamType{
    tableName?:      string;
    keyFieldName:     string;
    condition?:     string;
    rowData: TableRowDataType;
}
/**
*  @param {string} tableName 表名
*  @param {string} keyFieldName 最大值字段
*  @param {string} keyFieldValue 值
 */
interface DataDeleteParamType{
    tableName?:      string;
    keyFieldName?:     string;
    keyFieldValue?: string;
}
/**
*  @param {string} tableName 表名
*  @param {string} keyFieldName 最大值字段
*  @param {string} keyFieldValue 值
 */
interface DataEditParamType{
    tableName?:      string;
    keyFieldName?:     string;
    keyFieldValue?: string;
    rowData?: TableRowDataType;
}

interface CommondDatasParamType{
    PowerList: any[];//功限
    sysParam: any[];
    wxParam: any[];
    store: any[];//发货地
    post: any[];
    user: any[];
    worker: any[];
    allUser: any[];
    factory: any[];
    workShop: any[];
    facortyWorkShop: any[];
    shipperCate: any[];
    areaDatas: any[];
    subjectIn: any[];
    subjectOut: any[];
    payType: any[];
    accounts: any[];
    insureLtd: any[];
    onLineUserList: any[];//在线用户
}
const userOpts = () => { 
    const _loginDatas = JSON.parse(sessionStorage.getItem('loginDatas')||'')
    const router = useRoute();
    /**路由参数 */
    const routerParam =router.params
    const Instance = getCurrentInstance();
    const proxy: any = Instance&&Instance.proxy
    const $print = proxy.$print;
    const commonDatas=ref(inject('commonDatas') as CommondDatasParamType)
    const CloseTab = inject('CloseTab') 

    const state = reactive({
        lkxGridx: ref<null | HTMLElement>(null), //dom
        printEl: ref<null | HTMLElement>(null), //dom
        loading: false,
        loadText: '数据加载中...',
        routerParams: routerParam,//路由传入参数
        loginDatas: _loginDatas,//当前登录信息
        http: comomParam.$http,
        ApiPath:'',
        allowSearch: true,
        allowRefresh: true,
        allowInsert: true,
        keyFieldName:'',//主键
        getMaxCondition:'',//最大值条件
        mustCondition:routerParam.defaultCondition,//必须条件
        defaultCondition:'',//默认条件
        PowerList:{ //权限
            allowedInsert: true,
            allowedEdit: true,
            allowedDelete: true,
            allowedPrint: true,
            allowedViewCostPrice: true,
            allowedExport: true,   //导出数据
            allowedSaveStyle: true, //保存样式
            allowedClearStyle: true,//清除样式
            allowedCancelCol: true,//取消列
            allowedRecoveryCol: true,//恢复列
            allowedTableSet: true//表格设置
        },
        getDefaultParam:{
            fieldName       :   '*',
            sortFields      :   'idCode',
            returnTotal     :   true,
            totalFieldSql   :   '',
        } as DataGetParamType,
        commonDatas:commonDatas,
        thisRowIndex: 0, //行号此处不一定准小心使用 推荐用 $Grid.stateParmars.activeRowIndex
        totalDatas:{},
        datas: [] as TableRowDataType[],
        methods: {
            notAllowEdit:(row: TableRowDataType): boolean=>{
                return !state.PowerList.allowedEdit
            },
            notAllowDel:(row: TableRowDataType): boolean=>{
                return !state.PowerList.allowedDelete
            },
            /*events:{
                toolsBarClick:(data: any)=>{
                    switch (data.idCode){
                        case '_Insert':  
                            if (!state.allowInsert) return;
                            if (!state.PowerList.allowedInsert){
                                $MessageBox.warning({
                                    title:'警告',
                                    content:'对不起您没有权限',
                                    showCancel: false
                                })
                                return
                            }       
                            break;
                        case '_Serach':{
                            console.log(state.allowSearch)
                            
                            break;
                        }
                        case '_Refresh':{
                            if (state.allowRefresh)
                                funcList.getData(state.getDefaultParam);
                            break;
                        }
                        case '_Print':{
                            console.log('print');
                            if (!state.PowerList.allowedPrint){
                                $MessageBox.warning({
                                    title:'警告',
                                    content:'对不起您没有权限',
                                    showCancel: false
                                })
                                return false
                            }
                            const $grid = state.printEl as any
                            $print(state.printEl as any)
                            break
                        }
                        case '_PrintDesign':{
                            console.log('_PrintDesign');
                            break
                        }
                        case '_Close':    
                            console.log(state.methods.events)
                           
                            break;              
                    }
                }, 
  
                changePage:(curPage: number)=>{
                    
                    funcList.getData(state.getDefaultParam)
                },
                changePageSize:(pageSize: number)=>{
                    funcList.getData(state.getDefaultParam)
                    const $Grid = state.lkxGridx as any
                    $Grid.active()
                },
                sort:(flg: string,fieldName: string)=>{
                    if (flg == 'desc'){
                        state.getDefaultParam.sortFields = fieldName+ ' desc'
                    } else {
                        state.getDefaultParam.sortFields = fieldName
                    }
                    funcList.getData(state.getDefaultParam)
                },
 
              
            }*/
        } as TableMethodsType
    })
    //条件组合
    const conditionComb=(a: string,b: string)=>{
        if (!a&&!b) return ''
        if (!a&&b) return b
        if (a&&!b) return a
        if (a&&b) return a+' and '+b
    }
    /**
     * 获取权限
     */
    const setPower=(): any=>{
        const route = useRoute(); 
        const funcCode = route.params.idcode //功能编码
        const postList = commonDatas.value.PowerList.filter((item: any)=>{
            return item.pcode==funcCode 
        })
        postList.map((item: any)=>{
           
            switch (parseInt(item.idcode)){
                case 1:
                    state.PowerList.allowedInsert = item.vis == '1';
                    break;
                case 2:
                    state.PowerList.allowedEdit = item.vis == '1';
                    break;
                case 3:
                    state.PowerList.allowedDelete = item.vis == '1';
                    break;
                case 4:
                    state.PowerList.allowedPrint = item.vis == '1';
                    break;
                case 5:
                    state.PowerList.allowedExport = item.vis == '1';
                    break;
            } 
        })
    }
    const funcList = {
        setSearchParam:async ()=>{ 
            const res = await $api.getSearchParam(state.ApiPath)
            if (res&&res.errCode==0){
                //state.serachBoxConfig.fields = res.datas
               /* state?.serachBoxConfig?.fields?.map((item: any)=>{
                    if (item.inListItem){//设置fsIn的数据源
                        item.inList = (state.commonDatas as any)[item.inListItem]
                    } 
                    if (item.inCustomListItem){
                        item.inList =item.inCustomListItem
                    }
                })*/
            }
        },
        getData:async (param: DataGetParamType)=>{
            const Param = Object.assign({
                
            },param)
            /**必须条件与默认条件组合 */
            let _condition = conditionComb((state.mustCondition as string),state.defaultCondition)||''
            _condition = conditionComb(_condition,Param.condition||'')||''
            Param.condition = _condition

           // state.loading = true;
            const res = await $api.getData(state.ApiPath,Param)
            if (res&&res.errCode==0){
                state.datas = res.datas
                state.totalDatas = res.total
               // state.pagerConfig.total = res.total.count
                return res.datas;
            }
           /* setTimeout(() => {
                state.loading = false;
               
            }, 100);*/
        },
        deleteData: async (param: DataDeleteParamType,rowIndex: number) =>{
            if (!state.PowerList.allowedDelete){
                await MessageBox.warning({
                    title:'警告',
                    content:'对不起您没有权限',
                    showCancel: false
                })
                return false
            }
            const x = await MessageBox.question({
                title:'提问',
                content:'是否要删除数据？'
            })
            if (x.action!=ModalResultEnum.mrConfirm) return false
            MessageBox.loading({
                moreText: '正在提交数据...',
                mask: true
            })
            
            const res = await $api.deleteData(state.ApiPath,param)
            MessageBox.closeAllLoading();
            if (res&&res.errCode == 0){
                (state.totalDatas as any).count = (state.totalDatas as any).count*1 - 1
                state.datas.splice(rowIndex,1)
                return true;
            }
            return false;
        },
        insertData: async (param: DataInsertParamType) =>{
            if (!state.PowerList.allowedInsert){
                await MessageBox.warning({
                    title:'警告',
                    content:'对不起您没有权限',
                    showCancel: false
                })
                return false
            }
            MessageBox.loading({
                moreText: '正在提交数据...',
                mask: true
            })
            const res = await $api.insertData(state.ApiPath,{
                tableName: param.tableName,
                datas:[param.rowData]
            })
            MessageBox.closeAllLoading()
            if (res&&res.errCode ==0){
                (state.totalDatas as any).count = (state.totalDatas as any).count*1 + 1
                Object.assign(param.rowData,{[param.keyFieldName.toLocaleLowerCase()]:res.maxCode})
                state.datas.push(param.rowData)
                return res.maxCode
            } 
            return false
        },

        editData: async (param: DataEditParamType,rowIndex: number)=>{
            if (!state.PowerList.allowedEdit){
                await MessageBox.warning({
                    title:'警告',
                    content:'对不起您没有权限',
                    showCancel: false
                })
                return false
            }
            MessageBox.loading({
                moreText: '正在提交数据...',
                mask: true
            })
            const res = await $api.editData(state.ApiPath,{
                tableName:      param.tableName,
                keyFieldName:   param.keyFieldName,
                keyFieldValue:  param.keyFieldValue,
                datas:          [param.rowData]
            })
            MessageBox.closeAllLoading();
            if (res&&res.errCode == 0){
                if (rowIndex!=-1){
                    Object.assign(state.datas[rowIndex],param.rowData)
                }
                return true
            }
            return false
        }
    }
    watch(
        ()=>state.ApiPath,
        (nV,oV)=>{
            if (state.allowSearch){
                funcList.setSearchParam();
            }
        }
    )
    setPower();
    return {state,commonDatas,MessageBox,funcList,$print};
}

export default userOpts