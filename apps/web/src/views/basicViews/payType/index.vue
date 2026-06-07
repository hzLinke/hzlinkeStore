<template>
    <LkxGrid ref='lkxGrid' class="grid" 
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
</template>
<script setup lang="ts">
    import { reactive, ref, onMounted, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import { TDataSource } from "@/usehook/dataSource"
    import { TAreaGridAction } from "./action"
    import { TWinForm } from "@/usehook/win"
    import { InstanceRefsBase } from '../../types'

    defineOptions({
        name: 'payType'
    })

    const lkxGrid = ref<null | HTMLElement>(null)
    const instanceRefs = markRaw<InstanceRefsBase>({})
    const Win = reactive(new TWinForm<InstanceRefsBase>(instanceRefs))
    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/payType/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0', '201', '202', '203', '204'],
            getParmars: {}
        })
    )
    const gridAction = reactive(new TAreaGridAction(dataSource, instanceRefs))
    gridAction.TableConfig.title = Win.Caption

    onMounted(() => {
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    defineExpose({ lkxGrid, Win, dataSource, gridAction })
</script>

<style lang="scss" scoped>

</style>
