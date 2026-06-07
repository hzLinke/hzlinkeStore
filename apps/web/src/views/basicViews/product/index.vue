<template>
<div class="win">
    <div v-if="!detailVisabled" class="LeftPanel">
        <div class="LeftPanel-search">
            <input name="ElSearch" placeholder="请输入品名回车查询" @keypress="handleSearch"/>
        </div>
        <div class="LeftPanel-CatePanel">
            <div class="LeftPanel-CatePanel-item" :class="{'active':cateActiveIndex==index,'indent':item.pcode>100}" v-for="(item,index) in cateDatas" :key="index" @click.stop.prevent="handleCateClick($event,item,index)">{{item.name}}</div>
        </div>
    </div>
    <LkxGrid v-if="!detailVisabled" ref='lkxGrid' class="grid" 
        :columns= "gridAction.Columns" 
        :dataSource= "dataSource" 
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
            <div class="heaerPanelTitle">商品拆零配置</div>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
    </LkxGrid>

</div>
</template>

<script setup lang="ts">
    import { reactive, ref, onMounted, onUnmounted, onUpdated, getCurrentInstance, watch, markRaw } from 'vue'
    import { LkxGrid, LkxButton } from '@v4x/ui'
    import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
    import { TDataSource } from "@/usehook/dataSource"
    import { TWinForm } from "@/usehook/win"
    import { TProductGridAction, TProductGridDetailAction } from "./action"
    import { useAppStore } from "@/stores"
    import { ProductInstanceRefs } from './types'


    defineOptions({
        name: 'product'
    })

    const appStore = useAppStore()
    const lkxGrid = ref<null | HTMLElement>(null)
    const lkxDetailGrid = ref<null | HTMLElement>(null)
    const detailVisabled = ref(false)
    const headerData = ref({} as any)
    const cateActiveIndex = ref(-1)
    const cateActiveCode = ref(0)

    const headerConfig = ref<HeaderConfigType>({
        items:[
            [{fieldName: 'idcode',
                span:3,
                config:{
                    caption:  '货号', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            },{fieldName: 'barcode',
                span:4,
                config:{
                    caption:  '条码', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            },{fieldName: 'name',
                span:7,
                config:{
                    caption:  '品名', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            },{fieldName: 'spec',
                span:4,
                config:{
                    caption:  '规格', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            }], [{fieldName:'note',
                span:16,
                config:{
                    caption: '备注', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                }
            },{fieldName:'unit',
                span:2,
                config:{
                    caption: '单位', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                }
            }]
        ]
    })

    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/product/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0','1'],
            getParmars: {}
        })
    )
    const detailDataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/productSwap/',
            KeyFieldName: 'idkey',
            NotAllowOperationList: [],
            getParmars: {}
        })
    )
    const cateDataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/Cate/',
            KeyFieldName: 'idCode',
            NotAllowOperationList: [],
            getParmars: {sortFields:'serialNum'}
        })
    )
    const cateDatas = appStore.commonDatas.AllCateDatas

    const instanceRefs = markRaw<ProductInstanceRefs>({ detailVisabled, headerData,detailDataSource })
    const Win = reactive(new TWinForm<ProductInstanceRefs>(instanceRefs))
        
    const gridAction = reactive(new TProductGridAction(dataSource, instanceRefs))
    const gridDetailAction = reactive(new TProductGridDetailAction(detailDataSource, instanceRefs))
    gridAction.dataSource.getParams.mustCondition = appStore.isExtend ? '' : 'Status=0'
    gridAction.TableConfig.title = Win.Caption

    const handleSearch = (e: KeyboardEvent) => {
        const _InputEl = e.target as HTMLInputElement
        if (!_InputEl.value) return
        gridAction.dataSource.getParams.condition = `name like '%${_InputEl.value}%'`
        gridAction.open()
        _InputEl.value = ''
    }

    const handleCateClick = (e: MouseEventInit, item: any, index: number) => {
        cateActiveIndex.value = index
        cateActiveCode.value = item.idcode
        gridAction.PagerConfig.curPage = 1
        if (item.idcode==0 || item.pcode>100)
            gridAction.dataSource.getParams.condition = `CateCode=${item.idcode}`
        else 
            gridAction.dataSource.getParams.condition = `CateCode / 100 =${item.idcode}`
        gridAction.open()
    }

    onMounted(() => {
        cateDataSource.open({pageSize:0,curPage:1,total: 1})
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    onUpdated(() => {
        Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
    })

    onUnmounted(() => {
        gridAction.dataSource.dataSet = []
        gridDetailAction.dataSource.dataSet = []
    })

    watch(
        () => detailVisabled.value,
        (n) => {
            if (n){
                detailDataSource.getParams.sortFields = 'idkey'
                gridDetailAction.PagerConfig.curPage = 1
                gridDetailAction.dataSource.getParams.condition = ''
                gridDetailAction.dataSource.getParams.mustCondition = `Pcode='${headerData.value.idcode}'`
                gridDetailAction.open()
            } else {
                detailDataSource.close()
            }
        }
    )

    defineExpose({ 
        Win
    })
</script>

<style lang="scss" scoped>
.win{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: row;
    .LeftPanel{
        display: flex;
        flex-direction: column;
        width: 180px;
        &-search{
            border-bottom: 1px solid #eee;
            padding: 3px;
            input{
                border: 1px solid blue;
                width: 95%;
                outline: 0;
            }
        }
        &-CatePanel{
            margin: 5px 0;
            overflow: auto;
            flex: 1;
            &-item{
                cursor: pointer;
                padding: 5px 10px;
                &:hover{
                    background: blueviolet;
                    color: white;
                }
            }
            .active{
                background: blue;
                color: white;
            }
        }
        &-action{
            border-top: 1px solid #eee;
            padding: 10px;
            height: 150px;
            button{
                cursor: pointer;
                width: 100%;
                height: 30px;
                margin: 3px 0;
            }
        }
        &-btn{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
    }
    .grid{
        flex: 1;
    }
    .heaerPanelTitle{
        background: $basic-bg-color;
        padding: 5px 10px;
    }
    .indent{
        padding-left: 30px;
    }
}
</style>
