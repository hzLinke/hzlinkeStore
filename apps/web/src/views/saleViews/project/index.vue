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
    /**科目 */
    import { reactive, ref ,onMounted,getCurrentInstance, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import {TDataSource} from "@/usehook/dataSource"
    import {TProjectGridAction} from "./action"
    import {TWinForm} from "@/usehook/win"
    import type { ProjectInstanceRefs } from './types'
    import {useAppStore} from '@/stores'
    
    const appStore = useAppStore()
    defineOptions({ name: 'project' })
    
    const lkxGrid= ref<null | HTMLElement>(null) //dom
    const Win = reactive(new TWinForm({}));
    const isExtend = ref(appStore.isExtend);//是否扩展
    const dataSource = reactive(
        new TDataSource({
                ApiPath:'/masterApi/disApi/sales/project/',
                KeyFieldName: 'idcode',
                NotAllowOperationList: [],
                getParmars: {}
            }
        )
    );
    
    const instanceRefs = markRaw<ProjectInstanceRefs>({});
    
    const gridAction = reactive(new TProjectGridAction(dataSource, instanceRefs));
    gridAction.dataSource.getParams.mustCondition = isExtend.value?'':'Status=0';
    gridAction.TableConfig.title = Win.Caption;
    
    onMounted(()=>{
        Win.switchGrid(false,gridAction,lkxGrid as any)
        Win.ActiveGridAction?.open()
    })
</script>

<style lang="scss" scoped>

</style>