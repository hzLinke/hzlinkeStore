<template>
    <LkxGrid ref='lkxGrid' class="grid" 
        :columns="gridAction.Columns" 
        :dataSource="dataSource" 
        :gridAction="gridAction"
        :methods="gridAction.Methods" 
        :events="gridAction.Events"
        :tableConfig="gridAction.TableConfig"
        :serachBoxConfig="gridAction.SerachBoxConfig"
        :pagerConfig="gridAction.PagerConfig"
        :power="gridAction.PowerList"
        :loading="gridAction.Loading"
        :loadText="gridAction.LoadText"
    >
        <template #headerPanel>
            <div class="win-hearder">
                <lkx-input class="Input-At-Start"
                    name="startat"
                    :config="startDeliveryState.config"
                    v-model="startDeliveryAt"
                />
                <lkx-input class="Input-At-End"
                    name="endat"
                    :config="endDeliveryState.config"
                    v-model="endDeliveryAt"
                />
                <lkx-input class="shipper-input"
                    :config="shipperState.config"
                    :dropConfig="shipperState.dropConfig"
                    v-model="customerCode"
                />
                <button @click="handleApplay">应用</button>
            </div> 
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted } from 'vue'
import $Utils from '@v4x/utils/lkxUtil'
import { InputOptionsType, LkxGrid } from '@v4x/ui'
import { LkxInput } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { TUserGridAction } from "./action"

defineOptions({
    name: 'reports/saleOrderReports'
})

const lkxGrid = ref<null | HTMLElement>(null)
const Win = reactive(new TWinForm({}))
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/reports/saleOrderReports/',
        KeyFieldName: 'deliveryAt',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: 'count(productcode) as count,sum(numEx) as Num,sum(sumMoney) as sumMoney' }
    })
)
const gridAction = reactive(new TUserGridAction(dataSource, {}))
const startDeliveryAt = ref($Utils.getMonthFirst())
const endDeliveryAt = ref($Utils.getMonthLast())
const customerCode = ref(0)

const startDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '送货日期 从', 
        captionWidth: 120,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
        }
    }
})

const endDeliveryState = ref<InputOptionsType>({
    config: {
        caption: '到', 
        captionWidth: 20,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    }
})

const shipperState = ref<InputOptionsType>({
    config: {
        caption: '客户', 
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '100|300',
        dropListDatas: gridAction.commonDatas.CustomerDatas,
        onFilter: (filterValue: string) => {
            const arr = gridAction.commonDatas.CustomerDatas?.filter((item: any) => {
                return item.name.indexOf(filterValue) != -1
            })
            return arr
        }
    }
})

const handleApplay = (e: Event) => {
    dataSource.getParams.defaultCondition = ''
    if (customerCode.value != 0)
        dataSource.getParams.condition = `deliveryAt between '${startDeliveryAt.value}' and '${endDeliveryAt.value}' and customerCode=${customerCode.value}`
    else
        dataSource.getParams.condition = `deliveryAt between '${startDeliveryAt.value}' and '${endDeliveryAt.value}'`
    gridAction.open()
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
    Win.ActiveGridAction?.open()
})
</script>

<style lang="scss" scoped>
.win-hearder {
    height: 40px;
    display: flex;
    align-items: center;
    .Input-At-Start {
        margin-left: 10px ;
        width: 300px;
    }
    .Input-At-End {
        width: 200px;
    }
    .shipper-input {
        width: 300px;
    }
    button {
        margin-left: 10px ;
        width: 100px;
    }
}
</style>
