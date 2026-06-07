<template>
    <LkxGrid v-show="!detailVisabled" ref='lkxGrid' class="grid" 
        :columns= "gridAction.Columns" 
        :dataSource= "listDataSource" 
        :gridAction= "gridAction"
        :methods= "gridAction.Methods" 
        :events= "gridAction.Events"
        :tableConfig= "gridAction.TableConfig"
        
        :serachBoxConfig= "gridAction.SerachBoxConfig"
        :pagerConfig= "gridAction.PagerConfig"

        :power= "gridAction.PowerList"
        :loading = "gridAction.Loading"
        :loadText = "gridAction.LoadText"
    />
    <LkxGrid v-if="detailVisabled" ref='lkxDetailGrid' class="grid" 
        :columns= "gridDetailAction.Columns" 
        :dataSource= "detailDataSource" 
        :gridAction= "gridDetailAction"
        :methods= "gridDetailAction.Methods" 
        :events= "gridDetailAction.Events"
        :tableConfig= "gridDetailAction.TableConfig"
        :serachBoxConfig= "gridDetailAction.SerachBoxConfig"
        :pagerConfig= "gridDetailAction.PagerConfig"
        :power= "gridDetailAction.PowerList"
        :loading = "gridDetailAction.Loading"
        :loadText = "gridDetailAction.LoadText"
        :printConfig= "gridDetailAction.PrintConfig"
        :headerData="headerData"
    >
        <template #headerPanel>
            <div class="headerPanel" v-if="detailVisabled&&!printVisabled" >
                <header-panel class="headerPanel_left"  :rowData="headerData" :config="headerConfig"></header-panel>
                <div class="priceList">
                    <div v-for="value in priceListDataSource.dataSet">
                        {{value.deliveryat}} {{clearDecimal(value.costprice*value.pack)}}元
                    </div>
                </div>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "gridDetailAction.ToolsBarItemClick($event)"/>
                <input name="ElQuotedPricesSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
            </div>
        </template>
        <template #TableContent v-if="detailVisabled&&printVisabled" >
             <SalePricePrint ref='printDomEx' :DataSet="detailOfferDataSource.dataSet" :HearderData="headerData" />
        </template>
    </LkxGrid>
    <img v-if="detailVisabled&&headerData.examineusercode!=0&&!printVisabled" class="updatePng" src="../../../assets/fh.png" />


   <!-- <CopyMemu v-if="config.open" :config="config" :listDatas="gridAction.commonDatas.CustomerDatas" :customerCode="headerData.customercode"/>-->
</template>
<script setup lang="ts">
    /**销售报价 */
    import { reactive, ref ,onMounted,onUnmounted,onUpdated,watch, markRaw } from 'vue'
    import { clearDecimal } from '@v4x/utils'
    import { LkxGrid } from '@v4x/ui'
    import { LkxToolsBar as ToolsBar } from '@v4x/ui'
    import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
    import SalePricePrint from './salePricePrint/index.vue'
    import {TDataSource} from "@/usehook/dataSource"
    import {TWinForm} from "@/usehook/win"
    import {TListGridAction,TDetailGridAction} from "./action"
    import type { QuotedPriceInstanceRefs } from './types'
    import useAppStore from '@/stores'
    const appStore = useAppStore();

    defineOptions({ name: 'quotedPrice' })

    const lkxGrid= ref<null | HTMLElement>(null) //dom
    const lkxDetailGrid= ref<null | HTMLElement>(null) //dom
    const printDomEx= ref<null | HTMLElement>(null) //dom
    const userCode = appStore.loginDatas.idcode;
    const detailVisabled = ref(false);
    const headerDisabled = ref(false);
    const printVisabled = ref(false);
    const headerData = ref({} as any);
    
    const priceListDataSource = reactive(    
        new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/reports/purchaseReports/' ,
            KeyFieldName: 'deliveryAt',
            NotAllowOperationList: [],
            getParmars: { sortFields: 'deliveryAt desc',pageSize:3}
        
        })
    )

    const listDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/quotedPrice/BillList/',
                KeyFieldName: 'billNumber',
                NotAllowOperationList: [],
                getParmars: {totalFieldSql:'count(billnumber) as count'}
            }
        )
    );
    const detailDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/quotedPrice/BillDetail/',
                KeyFieldName: 'IdKey',
                NotAllowOperationList: [],
                getParmars: {sortFields:'IdKey',pageSize:0}
            }
        )
    );
    const detailOfferDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/quotedPrice/BillDetail/',
                KeyFieldName: 'IdKey',
                NotAllowOperationList: [],
                getParmars: {sortFields:'cateSerialNum,SerialNumber'}
            }
        )
    );
    
    
    const instanceRefs = markRaw<QuotedPriceInstanceRefs>({
        detailVisabled,
        headerDisabled,
        headerData,
        printVisabled,
        detailOfferDataSource,
        printDomEx,
        detailDataSource,
        priceListDataSource,
        userCode
    });
    
    const Win = reactive(new TWinForm(instanceRefs))
    
    const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs));
    gridAction.TableConfig.title = '客户报价单列表';
    const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs));
    gridDetailAction.instanceRefs.headerGridAction = gridAction;

    const headerConfig = ref<HeaderConfigType>({
        disabled: false,
        items:[
            [
                {
                    fieldName:'customercode',
                    span:7,
                    config:{
                        caption: '客户', 
                        captionAlign:'right',
                        disabled:()=>{return headerDisabled.value},
                        align: 'left',
                        inputType:'drop',
                        onChange:(data: any)=>{
                            /* if (data.pcode>0){
                                const _arr = gridAction.commonDatas.customerFromProjDatas.filter((item: any)=>{
                                    return item.pcode == data.pcode
                                })
                                if (_arr[0].idcode!==data.idcode){
                                    gridAction.$MessageBox.warning({
                                        title:'警告', 
                                        content:`特定项目"${_arr[0].projectname}"，请用"${_arr[0].name}"来报价`,
                                        showCancel:false})
                                }
                            } */
                            gridAction.dataSource.setFieldValue('customercode',data.idcode)
                            gridAction.dataSource.setFieldValue('relationcode',data.relationcode)
                            gridAction.dataSource.setFieldValue('pcode',data.pcode)
                            gridAction.dataSource.setFieldValue('qualitygrade',data.qualitygrade)
                            gridAction.dataSource.setFieldValue('dr',data.dr)
                            gridAction.dataSource.setFieldValue('decimalbit',data.decimalbit)
                        }
                    },dropConfig:{
                        allowInput: false,
                        allowFilter: true,
                        dropListPosition:{},/**下拉组件位置 */
                        resultFieldName:'idcode',/**下拉返回字段 */
                        displayFieldName: 'name',/**下拉显示字段 */
                        displayFields:'idcode|projectname|name',
                        displayFieldWidths:'50|100|400',
                        dropListDatas: gridAction.commonDatas.customerFromProjDatas,
                        onFilter:(filterValue: string,dropListDatas: any[])=>{
                            return dropListDatas.filter((item: any)=>{
                                return item.projectname.indexOf(filterValue)!=-1||item.name.indexOf(filterValue)!=-1
                            })
                        }
                    
                    }
                },{
                    fieldName:'examineusercode',
                    span:3,
                    config:{
                        caption: '审核', 
                        captionAlign:'left',
                        align: 'left',
                        disabled:true,
                        inputType:'drop',
                    },dropConfig:{
                        allowInput: false,
                        allowFilter: true,
                        dropListPosition:{},/**下拉组件位置 */
                        resultFieldName:'idcode',/**下拉返回字段 */
                        displayFieldName: 'name',/**下拉显示字段 */
                        displayFields:'idcode|name',
                        displayFieldWidths:'70|300',
                        dropListDatas: gridAction.commonDatas.UserDatas,
                    
                    }
                },{
                    fieldName:'examineat',
                    span:4,
                    config:{
                        caption: '审核日', 
                        captionWidth:55,
                        captionAlign:'right',
                        align: 'left',
                        disabled:true,
                    }
                },{
                    fieldName:'billnumber',
                    span:4,
                    config:{
                        caption: '单号', 
                        captionAlign:'right',
                        disabled:true,
                        align: 'left',
                        inputType:'text',
                    }
                }
            ],[
                {fieldName:'pcode',
                    span:5,
                    config:{
                        caption: '项目', 
                        captionAlign:'right',
                        captionWidth:34,
                        align: 'left',
                        disabled:true,
                        inputType:'drop'
                    },dropConfig:{
                        allowInput: false,
                        allowFilter: false,
                        dropListPosition:{},/**下拉组件位置 */
                        resultFieldName:'idcode',/**下拉返回字段 */
                        displayFieldName: 'name',/**下拉显示字段 */
                        displayFields:'idcode|name',
                        displayFieldWidths:'70|100',
                        dropListDatas: gridAction.commonDatas.ProjectDatas
                    }
                },{fieldName:'startat',
                    span:4,
                    config:{
                        caption:'开始日',
                        captionAlign:'right',
                        captionWidth:55,
                        align: 'left',
                        disabled:()=>{return headerDisabled.value},
                        inputType:'datetime',
                        onChange:(data: any)=>{
                            gridAction.dataSource.setFieldValue('startat',data)
                        }
                    }
                },{fieldName:'endat',
                    span:4,
                    config:{
                        caption:'结束日',
                        captionAlign:'right',
                        captionWidth:55,
                        align: 'left',
                        disabled:()=>{return headerDisabled.value},
                        inputType:'datetime',
                        onChange:(data: any)=>{
                            gridAction.dataSource.setFieldValue('endat',data)
                        }
                    }
                },{fieldName:'note',
                    span:5,
                    config:{
                        caption: '备注', 
                        captionAlign:'right',
                        align: 'left',
                        disabled:()=>{return headerDisabled.value},
                        inputType:'text',
                        onChange:(data: any)=>{
                            gridAction.dataSource.setFieldValue('note',data)
                        }
                    }
                }
            ]
        ]
    })
    
    const handleNameSearch = (Event: KeyboardEvent)=>{
        if (Event.key != 'Enter') return
        const _InputEl = Event.target as HTMLInputElement;
        detailDataSource.getParams.condition = _InputEl.value?`AliasName like '%${_InputEl.value}%'`:''
        gridDetailAction.open()
        _InputEl.value = '';

    }
    
    onMounted(()=>{
        Win.switchGrid(false,gridAction,lkxGrid as any)
        Win.ActiveGridAction?.open()
    })
    
    onUnmounted(()=>{
        gridAction.dataSource.dataSet = []
        gridDetailAction.dataSource.dataSet = []
    })
    
    onUpdated(()=>{
        if (printVisabled.value) return;
        detailDataSource.getParams.sortFields = 'idkey';
        Win.switchGrid(detailVisabled.value,gridAction,lkxGrid as any,gridDetailAction,lkxDetailGrid as any)
    })
    
    watch(
        ()=>detailVisabled.value,
        (n,o)=>{
            if (n){
                detailDataSource.getParams.sortFields = 'idkey';
                headerDisabled.value = parseInt(headerData.value.examineusercode) !=0;
                gridDetailAction.PagerConfig.curPage = 1;
                gridDetailAction.TableConfig.readOnly = headerDisabled.value;
                gridDetailAction.dataSource.getParams.condition = '';
                gridDetailAction.dataSource.getParams.mustCondition = `billNumber='${headerData.value.billnumber}'`;
                gridDetailAction.open();
                if (printVisabled.value){
                    printVisabled.value = false;
                    gridDetailAction.toolsBarItems= gridDetailAction.BasicBarItems;
                }
            } else {
                detailDataSource.close()
            }
        }
    )
</script>

<style lang="scss" scoped>
    .search{
        outline-color: blue;
    }
    .funcToolsBar{
        display: flex;
        flex-direction: row;
        border-bottom: 1px solid #eeee;
        align-items: center;
        .toolsBar{
            padding-left: 30px;
            background-color: white;
            width: 80%;
        }
        .printStyle-input{
            width: 300px;
        }
    }
    .headerPanel{
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    .headerPanel_left{
        flex:1;
    }
    .priceList{
       border: 1px solid #eeee;
       width: 140px;
       height: 70px;
       div{
        padding: 3px;
       }
    }
    
</style>
