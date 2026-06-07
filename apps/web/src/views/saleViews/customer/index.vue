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
        :dataSource= "gridDetailAction.dataSource" 
        :gridAction= "gridDetailAction"
        :methods= "gridDetailAction.Methods" 
        :events= "gridDetailAction.Events"
        :tableConfig= "gridDetailAction.TableConfig"
        :serachBoxConfig= "gridDetailAction.SerachBoxConfig"
        :pagerConfig= "gridDetailAction.PagerConfig"
        :power= "gridDetailAction.PowerList"
        :loading = "gridDetailAction.Loading"
        :loadText = "gridDetailAction.LoadText"
    >
        <template #headerPanel v-if="detailVisabled&&!printVisabled">
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar">
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "gridDetailAction.ToolsBarItemClick($event)"/>
                <input name="ElSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
            </div>
        </template>
        <template #TableContent v-if="detailVisabled&&printVisabled" >
             <SalePricePrint ref='printDomEx' :DataSet="detailOfferDataSource.dataSet" :HearderData="headerData" />
        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
    /**客户档案 */
    import { reactive, ref ,onMounted,watch,onUpdated,useTemplateRef, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
    import { LkxToolsBar as ToolsBar } from '@v4x/ui'
    import {TDataSource} from "@/usehook/dataSource"
    import {TWinForm} from "@/usehook/win"
    import SalePricePrint from './salePricePrint/index.vue'
    import {TListGridAction,TDetailGridAction} from "./action"
    import type { CustomerInstanceRefs } from './types'
    import {useAppStore} from '@/stores'

    const appStore = useAppStore()
    defineOptions({ name: 'customer' })
    
    const lkxGrid= useTemplateRef('lkxGrid') ; //dom
    const lkxDetailGrid= useTemplateRef('lkxDetailGrid') ; //dom
    const printDomExEl= useTemplateRef('printDomEx') as any; //dom
    const detailVisabled = ref(false);
    const printVisabled = ref(false);
    const isExtend = ref(appStore.isExtend);//是否扩展
    const userCode = ref(appStore.loginDatas.idcode);
    const headerData = ref({} as any);
    const headerDisabled = ref(false);
    const config=reactive(
        {
            title:'选择复制来源',
            width: '400px',
            open: false,
            handleClose:(data: any)=>{
                config.open = false;
                if (data.type=='mrOk'&&data.datas!=0){
                    gridDetailAction.offerCopy(data.datas)
                }
            }
        } 
    )
    const listDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/customer/customerList/',
                KeyFieldName: 'idcode',
                NotAllowOperationList: ['0','90001'],
                getParmars: {}
            }
        )
    );
    const detailDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/customer/customerDetail/',
                KeyFieldName: 'IdKey',
                NotAllowOperationList: [],
                getParmars: {sortFields:'SerialNumber'}
            }
        )
    );
    const detailOfferDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/customer/customerDetail/',
                KeyFieldName: 'IdKey',
                NotAllowOperationList: [],
                getParmars: {sortFields:'cateSerialNum,SerialNumber'}
            }
        )
    );
    
    const instanceRefs = markRaw<CustomerInstanceRefs>({
        headerDisabled,
        detailVisabled,
        printVisabled,
        headerData,
        config,
        userCode: userCode.value,
        detailOfferDataSource,
        printDomEx: printDomExEl ,
        detailDataSource
    });
    const Win = reactive(new TWinForm(instanceRefs));
    const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs));
    gridAction.dataSource.getParams.mustCondition = isExtend.value?'':'Status=0';
    gridAction.TableConfig.title = '客户列表';
    const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs));
    
    const headerConfig = ref<HeaderConfigType>({
        items:[
            [{fieldName:'name',
                span:5,
                config:{
                    caption: '客户', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                }
            },{fieldName:'settlementtype',
                span:3,
                config:{
                    caption: '结算', 
                    captionAlign:'left',
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
                    dropListDatas: gridAction.commonDatas.SettlementTypeDatas
                }
            },{fieldName:'tel',
                span:4,
                config:{
                    caption: '联系', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                }
            },{fieldName:'person',
                span:2,
                config:{
                    captionAlign:'right',
                    captionWidth:50,
                    align: 'left',
                    disabled:true,
                    inputType:'text',
                }
            },{fieldName:'addr',
                span:4,
                config:{
                    caption: '', 
                    captionAlign:'right',
                    align: 'left',
                    disabled:true,
                    inputType:'text',
                }
            }], [{fieldName:'pcode',
                span:5,
                config:{
                    caption: '项目', 
                    captionAlign:'left',
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
                span:5,
                config:{
                    caption: '报价时段', 
                    captionAlign:'right',
                    captionWidth:70,
                    align: 'left',
                    inputType:'datetime',
                    onChange:(data: any)=>{
                        gridAction.dataSource.setFieldValue('startat',data)
                    }
                }
            },{fieldName:'endat',
                span:3,
                config:{
                    captionAlign:'right',
                    align: 'left',
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
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                }
            }]
        ]
    })
    
    const handleNameSearch = (Event: KeyboardEvent)=>{
        if (Event.key != 'Enter') return
        const _InputEl = Event.target as HTMLInputElement;
        detailDataSource.getParams.condition = _InputEl.value?`Name like '%${_InputEl.value}%'`:''
        gridDetailAction.open()
        _InputEl.value = '';

    }
    
    onMounted(()=>{
        console.log('printDom',printDomExEl.value)
        Win.switchGrid(false,gridAction,lkxGrid as any)
        Win.ActiveGridAction?.open()
    })
    
    onUpdated(()=>{
        if (printVisabled.value) return
        Win.switchGrid(detailVisabled.value,gridAction,lkxGrid as any,gridDetailAction,lkxDetailGrid as any)
    })
    
    watch(
        ()=>detailVisabled.value,
        (n,o)=>{
            if (n){
                detailDataSource.getParams.sortFields = 'SerialNumber';
                gridDetailAction.PagerConfig.curPage = 1;
                gridDetailAction.dataSource.getParams.condition = '';
                gridDetailAction.dataSource.getParams.mustCondition = `Pcode='${headerData.value.idcode}'`;
                gridDetailAction.open();
                gridDetailAction.toolsBarItems= gridDetailAction.BasicBarItems
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
        height: 40px;
        .toolsBar{
            padding-left: 30px;
            background-color: white;
            width: 550px;
        }
        .printStyle-input{
            width: 350px;
        }
    }
    
</style>