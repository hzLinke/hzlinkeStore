<template>
    <LkxGrid ref='lkxGrid' v-if="!detailVisabled" class="grid" 
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
    <LkxGrid ref='lkxDetailGrid' v-if="detailVisabled" class="grid" 
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
    />
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, onUpdated, watch, markRaw, useTemplateRef } from 'vue'
import { LkxGrid } from '@v4x/ui'
import { TDataSource } from '@/usehook/dataSource'
import { TWinForm } from '@/usehook/win'
import { TAreaGridAction, TDetailAreaGridAction } from './action'
import type { AreaInstanceRefs } from './types'

defineOptions({
    name: 'cate'
})


const lkxGrid = useTemplateRef('lkxGrid')
const lkxDetailGrid = useTemplateRef('lkxDetailGrid')

const detailVisabled = ref(false)
const headerData = ref({} as any)

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/basic/Pcate/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: ['0', '1'],
        getParmars: {}
    })
)
const detailDataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/basic/cate/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const sharedInstanceRefs = markRaw<AreaInstanceRefs>({
    headerData,
    detailVisabled
})

const Win = reactive(new TWinForm<AreaInstanceRefs>(sharedInstanceRefs))
const gridAction = reactive(new TAreaGridAction(dataSource, sharedInstanceRefs))
const gridDetailAction = reactive(new TDetailAreaGridAction(detailDataSource, sharedInstanceRefs))
gridAction.TableConfig.title = Win.Caption

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid)
    Win.ActiveGridAction?.open()
})

onUpdated(() => {
    Win.switchGrid(detailVisabled.value, gridAction, lkxGrid, gridDetailAction, lkxDetailGrid)
})

watch(
    () => detailVisabled.value,
    (n) => {
        if (n) {
            detailDataSource.getParams.sortFields = 'idcode'
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
    Win,lkxGrid,lkxDetailGrid
})
</script>

<style lang="scss" scoped>


</style>
