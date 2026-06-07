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
        <template #headerPanel>
            <div class="hearderPanel">
                <lkx-input class="Input-At"
                    name="startat"
                    :config="startDateState.config"
                    v-model="ToDayDateCode"
                />
                <span class="note">期初指的是昨天的余数，期未指当天经过出入库计算的余数</span>
                <LkxButton class="opbut"  Type="Danger"   Radius=6  Height="30" Width="80" Caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
            </div>

        </template>
    </LkxGrid>
</template>
<script setup lang="ts">
import { reactive, ref, onMounted, markRaw } from 'vue'
import { InputOptionsType, LkxGrid } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { LkxButton } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'
import { MessageBox } from '@v4x/ui'
import { TStockHistory } from "./action"
import type { StockHistoryInstanceRefs } from './types'

defineOptions({
    name: 'stocks/stockHistory'
})

const lkxGrid = ref<null | HTMLElement>(null)
const MaxGroupAt = ref($Util.getDate())
const ToDayDateCode = ref($Util.getDate())
const startDateState = ref<InputOptionsType>({
    config: {
        caption: '日期', 
        captionWidth: 60,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    }
})

const instanceRefs = markRaw<StockHistoryInstanceRefs>({
    ToDayDateCode,
    MaxGroupAt,
    startDateState,
    detailDataSource: null
})

const Win = reactive(new TWinForm<StockHistoryInstanceRefs>(instanceRefs))
const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/stocks/history/',
            KeyFieldName: 'productcode',
            NotAllowOperationList: [],
            getParmars: {
                totalFieldSql: `count(productcode) as count,
                    sum(StartNum) as StartNum,sum(StartMoney) as StartMoney,
                    sum(EndNum) as EndNum,sum(EndMoney) as EndMoney`
            }
        }
    )
)
const gridAction = reactive(new TStockHistory(dataSource, instanceRefs))

const handleApplay = async () => {
    MessageBox.loading({
        moreText: '正在生成报表...',
        mask: true
    })
    const res = await $api.comonRequest('/masterApi/disApi/stocks/history/', 'buildReport', {
        ToDay: ToDayDateCode.value
    })
    if (res.errCode == 0) {
        gridAction.openSerarchWin()
    }
    MessageBox.closeAllLoading()
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
})
</script>

<style lang="scss" scoped>
 .grid{
    position: absolute;
    left: 0;
    right: 0;
}
.hearderPanel{
    display: flex;
    align-items: center;
    height: 40px;
    padding: 3px 20px ;
    .Input-At{
        width: 200px;
    }
    input{
       outline-color: blue;
    }
    .note{
        margin-left: 10px;
        color: red;
    }
    .opbut{
        margin-left: 100px;

    }
}
</style>
