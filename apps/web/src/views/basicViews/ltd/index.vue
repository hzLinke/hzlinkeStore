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
    >
    </LkxGrid>
</template>
<script setup lang="ts">
    import { reactive, ref, onMounted, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import { TDataSource } from "@/usehook/dataSource"
    import { TWinForm } from "@/usehook/win"
    import { TUserGridAction } from "./action"
    import { InstanceRefsBase } from '../../types'

    defineOptions({
        name: 'ltd'
    })

    const lkxGrid = ref<null | HTMLElement>(null)
    const instanceRefs = markRaw<InstanceRefsBase>({})
    const Win = reactive(new TWinForm<InstanceRefsBase>(instanceRefs))
    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/ltd/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0'],
            getParmars: {}
        })
    )
    const gridAction = reactive(new TUserGridAction(dataSource, instanceRefs))
    gridAction.TableConfig.title = Win.Caption

    onMounted(() => {
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    defineExpose({ Win, dataSource, gridAction, lkxGrid })
</script>

<style lang="scss" scoped>
</style>
