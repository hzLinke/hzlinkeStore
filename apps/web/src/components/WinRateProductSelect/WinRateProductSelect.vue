<template>
<div class="form-container">
    <div class="win-body">
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
                    <div class="headerPanel">
                        <lkx-input class="Reate-input"
                            name="ElRateInput"
                            :config="rateState.config"
                            :dropConfig="rateState.dropConfig"
                            v-model="mateRate"
                        />
                        <label>过滤x：<input class="Serarch-input" placeholder="请输入过滤名称" @keypress="handelSearch"/></label>
                    </div>
                </template>
            </LkxGrid>
    </div>
</div>
</template>
<script setup lang="ts">
/**商品选择弹窗 */
import { ref, reactive, onMounted, nextTick, getCurrentInstance, markRaw, useTemplateRef } from 'vue'
import { LkxGrid, LkxButton, LkxInput, ModalResultEnum, TableRowDataType, InputOptionsType } from '@v4x/ui'
import { TDataSource } from '@/usehook/dataSource'
import { TAction } from './action'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import { RateProductSelectInstanceRefs, RateProductSelectOptions } from './types'

defineOptions({
    name: 'WinRateProductSelect'
})

const props = withDefaults(defineProps<RateProductSelectOptions>(), {
    customerCode: 0,
    billType: 'order',
    inputname: ''
})

const mateRate = ref(0.5)

const rateState = ref<InputOptionsType>({
    config: {
        caption: '相似度',
        captionWidth: 70,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            console.log(data);
            (gridAction.getParams as any).procParmars.rate = data.idcode
            gridAction.open()
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: false,
        indentation: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '100|200',
        dropListDatas: [{ idcode: 0.1, name: '10%' }, { idcode: 0.2, name: '20%' }, { idcode: 0.3, name: '30%' },
            { idcode: 0.4, name: '40%' }, { idcode: 0.5, name: '50%' }, { idcode: 0.6, name: '60%' },
            { idcode: 0.7, name: '70%' }, { idcode: 0.8, name: '80%' }, { idcode: 0.9, name: '90%' }
        ]
    }
})
const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/PublicApi/',
        KeyFieldName: 'idcode',
        NotAllowOperationList: [],
        getParmars: {}
    })
)
const handelSearch = (Event: KeyboardEvent) => {
    if (Event.key != "Enter") return
    const _InputEl = Event.target as HTMLInputElement
    if (!_InputEl.value) {
        gridAction.dataSource.dataSet = gridAction.dataSource.CurDataSet
        return
    }
    gridAction.dataSource.dataSet = gridAction.dataSource.CurDataSet.filter((item: any) => {
        return item.name.indexOf(_InputEl.value) > -1
    })
    _InputEl.value = ''
}

const parentInstance = getCurrentInstance()?.parent


const instanceRefs = markRaw({
    parentInstance,
    modalActionConfirm,
    modalActionCancel,
    customercode: props.customerCode,
    inputname: props.inputname
}) as RateProductSelectInstanceRefs

const gridAction = reactive(new TAction(dataSource, instanceRefs))



nextTick(() => {

})

onMounted(() => {
    gridAction.getParams = {
        procName: 'sp_getRate ',
        procParmars: {
            customerCode: props.customerCode,
            InputName: props.inputname,
            rate: mateRate.value
        }
    }
    gridAction.open()
})
</script>
<style lang="scss" scoped>
.form-container{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-hearder{
            height: 45px;
            flex-shrink: 0;
            border-bottom: 1px solid #e4e7ed ;
            display: flex;
            align-items: center;
            .Input-At{
                margin-left: 10px ;
                width: 250px;
            }
            .shipper-input{
                width: 300px;
            }
            button{
                margin-left: 10px ;
                width: 100px;
            }
        }
        .win-body{
            flex: 1;
            min-height: 0;
            .grid{
                height: 100%;
            }
        }
        .win-action{
            height: 40px;
            flex-shrink: 0;
            padding: 5px 16px;
            border-top:1px solid #e4e7ed;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
        }
    }
</style>