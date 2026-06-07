<template>
<div class="win">
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
</div>

</template>
<script setup lang="ts">
    import { reactive, ref, onMounted, onUnmounted, markRaw } from 'vue'
    import { LkxGrid } from '@v4x/ui'
    import { TDataSource } from "@/usehook/dataSource"
    import { TWinForm } from "@/usehook/win"
    import { TKProductGridAction } from "./action"
    import { InstanceRefsBase } from '../../types'

    defineOptions({
        name: 'kProduct'
    })

    const lkxGrid = ref<null | HTMLElement>(null)
    const instanceRefs = markRaw<InstanceRefsBase>({})
    const Win = reactive(new TWinForm<InstanceRefsBase>(instanceRefs))
    const detailVisabled = ref(false)
    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/Kproduct/',
            KeyFieldName: 'SerialNumber',
            NotAllowOperationList: [],
            getParmars: {}
        })
    )
    const gridAction = reactive(new TKProductGridAction(dataSource, instanceRefs))
    gridAction.TableConfig.title = Win.Caption

    onMounted(() => {
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    onUnmounted(() => {
        gridAction.dataSource.dataSet = []
    })

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
