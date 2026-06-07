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
import { reactive, ref, onMounted } from 'vue'
import { LkxGrid } from '@v4x/ui'
import {TDataSource} from "@/usehook/dataSource"
import {TWinForm} from "@/usehook/win"
import {TUserGridAction} from "./action"
defineOptions({
    name:'disReport'
})

const lkxGrid = ref<null | HTMLElement>(null)

const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
            ApiPath:'/masterApi/disApi/dis/disReport/',
            KeyFieldName: 'deliveryAt',
            NotAllowOperationList: [],
            getParmars: {sortFields:'deliveryAt,Idkey',
            totalFieldSql:'count(productcode) as count,sum(orderNum) as OrderNum,sum(distributionnum) as distributionnum'}
        }
    )
)
const gridAction = reactive(new TUserGridAction(dataSource,{}))

onMounted(()=>{
    Win.switchGrid(false,gridAction,lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>
<style lang="scss" scoped>
.win-hearder{
    height: 40px;
    display: flex;
    align-items: center;
    .Input-At-Start{
        margin-left: 10px ;
        width: 300px;
    }
    .Input-At-End{
        width: 200px;
    }
    .shipper-input{
        width: 300px;
    }
    button{
        margin-left: 10px ;
        width: 100px;
    }
}
.expand-body{
    padding-left: 60px;
}

    
</style>
