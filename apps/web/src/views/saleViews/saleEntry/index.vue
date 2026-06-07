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
        :headerData= "headerData"
    >
        <template #headerPanel>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
        <template #funcToolsbar>
            <div class="funcToolsBar"> 
                <ToolsBar class="toolsBar" :toolsBarItems="gridDetailAction.toolsBarItems" :showIcon="false" @itemClick = "handleToolsBarItemClick"/>
                <input name="ElSearch" class="search" placeholder="请输入品名查找" @keypress="handleNameSearch"/>
                <lkx-input class="printStyle-input"
                    name="ElPrintStyleInput"
                    :config="gridDetailAction.PrintStyleState.config"
                    :dropConfig="gridDetailAction.PrintStyleState.dropConfig"
                    v-model="gridDetailAction.SelectPrintStyleCode"
                />
            </div>
        </template>
    </LkxGrid>
    <img v-if="detailVisabled&&headerData.examineusercode!=0" class="updatePng" src="../../../assets/fh.png" />
    <img v-if="detailVisabled&&headerData.over!=0" class="payPng" src="../../../assets/sk.png" />
    
</template>
<script setup lang="ts">
    /**销售结算单，包括销售，退货已审核的单据，不可修改 */
    import { reactive, ref ,onMounted,watch,onUpdated, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
    import { LkxInput } from '@v4x/ui'
    import { LkxToolsBar as ToolsBar } from '@v4x/ui'
    import {TDataSource} from "@/usehook/dataSource"
    import {TWinForm} from "@/usehook/win"
    import {TListGridAction,TDetailGridAction} from "./action"
    import type { SaleEntryInstanceRefs } from './types'
    import {useAppStore} from '@/stores'
    const appStore = useAppStore()
    defineOptions({ name: 'saleEntry' })
    const lkxGrid= ref<null | HTMLElement>(null) //dom
    const lkxDetailGrid= ref<null | HTMLElement>(null) //dom
    const userCode = appStore.loginDatas.idcode;
    const detailVisabled = ref(false);
    const headerDisabled = ref(false);
    const headerData = ref({} as any);
    
    const listDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/saleEntry/Lists/',
                KeyFieldName: 'billNumber',
                NotAllowOperationList: [],
                getParmars: {totalFieldSql:'count(billnumber) as count,sum(costMoney) as costMoney,sum(round(saleMoney,2)) as saleMoney,sum(profit) as profitMoney'}
            }
        )
    );
    const detailDataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/saleEntry/Detail/',
                KeyFieldName: 'IdKey',
                NotAllowOperationList: [],
                getParmars: {sortFields:'IdKey',pageSize:0}
            }
        )
    );
    
    const instanceRefs = markRaw<SaleEntryInstanceRefs>({
        detailVisabled,
        headerData,
        detailDataSource: detailDataSource,
        headerDisabled,
        userCode: userCode
    });
    
    const Win = reactive(new TWinForm(instanceRefs));
    const gridAction = reactive(new TListGridAction(listDataSource, instanceRefs));
    const gridDetailAction = reactive(new TDetailGridAction(detailDataSource, instanceRefs));
    gridDetailAction.instanceRefs.headerGridAction = gridAction
    
    const headerConfig = ref<HeaderConfigType>({
        disabled: false,
        items:[
            [
                {fieldName:'customercode',
                    span:5,
                    config:{
                        caption: '客户', 
                        captionAlign:'right',
                        disabled:()=>{return headerDisabled.value},
                        align: 'left',
                        inputType:'drop',
                        onChange:(data: any)=>{
                            gridAction.dataSource.setFieldValue('customercode',data.idcode)
                        }
                    },dropConfig:{
                        allowInput: false,
                        allowFilter: true,
                        dropListPosition:{},/**下拉组件位置 */
                        resultFieldName:'idcode',/**下拉返回字段 */
                        displayFieldName: 'name',/**下拉显示字段 */
                        displayFields:'idcode|shortname|name',
                        displayFieldWidths:'50|100|300',
                        dropListDatas: gridAction.commonDatas.CustomerDatas,
                        onFilter:(filterValue: string,dropListDatas: any[])=>{
                            return dropListDatas.filter((item: any)=>{
                                return item.shortname.indexOf(filterValue)!=-1||item.name.indexOf(filterValue)!=-1
                            })
                        }
                    
                    }
                },{fieldName:'entryusercode',
                    span:3,
                    config:{
                        caption: '入账', 
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
                },{fieldName:'entryat',
                    span:4,
                    config:{
                        caption: '入账日', 
                        captionWidth:55,
                        captionAlign:'right',
                        align: 'left',
                        disabled:true,
                    }
                },{fieldName:'billnumber',
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
                {fieldName:'note',
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
            },{fieldName:'customerorderid',
                span:3,
                config:{
                    caption: '', 
                    captionAlign:'right',
                    align: 'left',
                    placeholder:'请输入客户单号',
                    disabled:()=>{return headerDisabled.value},
                    inputType:'text',
                    onChange:(data: any)=>{
                        gridAction.dataSource.setFieldValue('CustomerOrderId',data)
                    }
                }
            },{fieldName:'deliveryat',
                span:4,
                config:{
                    caption:'送货日',
                    captionAlign:'right',
                    captionWidth:55,
                    align: 'left',
                    disabled:true,//()=>{return headerDisabled.value},
                    inputType:'datetime',
                    onChange:(data: any)=>{
                        gridAction.dataSource.setFieldValue('deliveryat',data)
                    }
                }
            },{fieldName:'salemoney',
                span:4,
                config:{
                    caption: '金额', 
                    captionAlign:'right',
                    disabled:true,
                    format:'0.00',
                    align: 'right',
                    inputType:'text',
                }
            }]
        ]
    })
    
    Win.getPrintStyle().then((res)=>{
        gridDetailAction.PrintStyleState.dropConfig!.dropListDatas = res;
    })
    
    const handleToolsBarItemClick=(data: any)=>{
        gridDetailAction.ToolsBarItemClick(data)
    }
    
    const handleNameSearch = (Event: KeyboardEvent)=>{
        if (Event.key != 'Enter') return
        const _InputEl = Event.target as HTMLInputElement;
        gridDetailAction.dataSource.dataSet = gridDetailAction.dataSource.CurDataSet.filter((item: any)=>{
            return item.name.indexOf(_InputEl.value)>-1
        })
        _InputEl.value = '';

    }
    
    onMounted(()=>{
        Win.switchGrid(false,gridAction,lkxGrid as any)
        Win.ActiveGridAction?.open()
    })
    
    onUpdated(()=>{
        Win.switchGrid(detailVisabled.value,gridAction,lkxGrid as any,gridDetailAction,lkxDetailGrid as any)
    })
    
    watch(
        ()=>detailVisabled.value,
        (n,o)=>{
            if (n){
                detailDataSource.getParams.sortFields = 'idkey';
                headerDisabled.value = parseInt(headerData.value.entryusercode) !=0;
                gridDetailAction.PagerConfig.curPage = 1;
                gridDetailAction.TableConfig.readOnly = headerDisabled.value;
                gridDetailAction.dataSource.getParams.condition = '';
                gridDetailAction.dataSource.getParams.mustCondition = `billNumber='${headerData.value.billnumber}'`;
                gridDetailAction.open();
                const PrintStyleList = gridDetailAction.PrintStyleState.dropConfig?.dropListDatas || []
                if (PrintStyleList.length!=0){
                    gridDetailAction.SelectPrintStyleCode = PrintStyleList[0]['xh']
                    gridDetailAction.PrintConfig = JSON.parse(PrintStyleList[0]['style']);
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
            width: 550px;
        }
        .printStyle-input{
            width: 300px;
        }
    }
    
</style>