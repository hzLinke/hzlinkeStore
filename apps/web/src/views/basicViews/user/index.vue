<template>
    <LkxGrid  v-if="!detailVisabled" ref='lkxGrid' class="grid" 
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
    ></LkxGrid>
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
            <div class="heaerPanelTitle">用户管理分类配置</div>
            <div class="headerPanel"  >
                <header-panel :rowData="headerData" :config="headerConfig"></header-panel>
            </div>
        </template>
    </LkxGrid>   
</template>

<script setup lang="ts">
    import { reactive, ref, onUnmounted, onMounted, getCurrentInstance, onUpdated, watch, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
    import { TDataSource } from "@/usehook/dataSource"
    import { TWinForm } from "@/usehook/win"
    import { TUserGridAction, TUserGridDetailAction } from "./action"
    import { useAppStore } from '@/stores'
    import { InstanceRefsBase } from '../../types'

    defineOptions({
        name: 'user'
    })

    const appStore = useAppStore()
    const lkxGrid = ref<null | HTMLElement>(null)
    const lkxDetailGrid = ref<null | HTMLElement>(null)
    const detailVisabled = ref(false)
    const headerData = ref({} as any)
    const instanceRefs = markRaw<InstanceRefsBase>({ detailVisabled, headerData })
    const headerConfig = ref<HeaderConfigType>({
        items:[
            [{fieldName: 'idcode',
                span:3,
                config:{
                    caption:  '编码', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            },{fieldName: 'name',
                span:4,
                config:{
                    caption:  '姓名', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            },{fieldName: 'tel',
                span:7,
                config:{
                    caption:  '电话', 
                    captionAlign:'right',
                    disabled:true,
                    align: 'left',
                    inputType:'text',
                },
            }]
        ]
    })
    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/user/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0','1'],
            getParmars: {tableName: 'L_Basic_User_Tab'}
        })
    )
    const detailDataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/userCateManage/',
            KeyFieldName: 'idkey',
            NotAllowOperationList: [],
            getParmars: {}
        })
    )
    const Win = reactive(new TWinForm<InstanceRefsBase>(instanceRefs))
    const gridAction = reactive(new TUserGridAction(dataSource, instanceRefs))
    const gridDetailAction = reactive(new TUserGridDetailAction(detailDataSource, instanceRefs))

    gridAction.dataSource.getParams.mustCondition = appStore.isExtend ? '' : 'Status=0'
    gridAction.TableConfig.title = Win.Caption

    onMounted(() => {
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    onUnmounted(() => {
    })

    onUpdated(() => {
        Win.switchGrid(detailVisabled.value, gridAction, lkxGrid as any, gridDetailAction, lkxDetailGrid as any)
    })

    watch(
        () => detailVisabled.value,
        (n) => {
            if (n){
                detailDataSource.getParams.sortFields = 'idkey'
                gridDetailAction.PagerConfig.curPage = 1
                gridDetailAction.PagerConfig.pageSize = 0
                gridDetailAction.dataSource.getParams.condition = ''
                gridDetailAction.dataSource.getParams.mustCondition = `Pcode='${headerData.value.idcode}'`
                gridDetailAction.open()
            } else {
                detailDataSource.close()
            }
        }
    )

    defineExpose({ 
        Win,
    })
</script>

<style lang="scss" scoped>
    @use "@/assets/css/printStyle.scss" as *;
    .heaerPanelTitle{
        background: $basic-bg-color;
        padding: 5px 10px;
    }
</style>
