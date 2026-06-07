<template>
    <div class="form">
        <div class="headerPanel"  >
            <header-panel :rowData="headerDatas" :config="headerConfig"></header-panel>
        </div>
        <div class=" win-grid">
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
            <template #optbut>
                <div class="delete-but" @click="handleOptButClick('_Delete')">删除</div>
                <div v-if="billType=='order'" class="Transfer-but" @click="handleOptButClick('_TransferStock')">转存</div>
                <div v-if="billType=='order'" class="delete-but" @click="handleOptButClick('_TransferShipper')">转货商</div>
                <div v-if="billType=='order'" class="Transfer-but" @click="handleOptButClick('_CancelProduct')">取消</div>
                <div v-if="billType=='order'" class="delete-but" @click="handleOptButClick('_ChangeProduct')">换货</div>
                <div v-if="billType=='order'" class="Transfer-but" @click="handleOptButClick('_Free')">免采</div>
            </template>
            </LkxGrid>
        </div>
        <div class="win-action">
            <LkxButton caption="取消" type='default'   @click="handleCancel" ></LkxButton>
            <LkxButton caption="确定" type="default"   @click="handleConfirm" ></LkxButton>
        </div>
    </div>

</template>
<script setup lang="ts">
import { ref, reactive ,getCurrentInstance } from "vue"
import { TDataSource } from "@/usehook/dataSource"
import { TAction } from "./action"
import HeaderPanel, { HeaderConfigType } from '@/views/common/headerPanel.vue'
import { LkxGrid, TableRowDataType ,LkxButton ,ModalResultEnum} from '@v4x/ui'

import { modalActionConfirm,modalActionCancel } from '@v4x/utils'
import {useAppStore} from '@/stores'
import { PackDetailOptions } from './types'

defineOptions({
    name: 'WinPackDetail'
})

const props = withDefaults(defineProps<PackDetailOptions>(), {
    billnumber: '',
    productCode: '',
    saleType: 0,
    qualityGrade: 0,
    billType: 'order',
    showOpt: true,
})


const appStore = useAppStore()
const userCode = appStore.loginDatas.idcode

const headerConfig = ref<HeaderConfigType>({
    disabled: false,
    items: [
        [
            {
                fieldName: 'name',
                span: 10,
                config: {
                    caption: '品名', 
                    captionAlign: 'right',
                    disabled: true,
                    align: 'left',
                    inputType: 'text',
                }
            },
            {
                fieldName: 'tempstock',
                span: 4,
                config: {
                    caption: '可用量', 
                    captionWidth: 55,
                    captionAlign: 'right',
                    align: 'right',
                    disabled: true,
                    inputType: 'text',
                    onChange: (data: any) => {
                    }
                }
            }
        ]
    ]
})


const dataSource = reactive(
    new TDataSource({
            ApiPath: '/masterApi/disApi/purchase/purchaseOrder/PackDetail/',
            KeyFieldName: 'IdKey',
            NotAllowOperationList: [],
            getParmars: { sortFields: 'IdKey', pageSize: 0 }
        }
    )
)
if (!props.batchNumber) {
    dataSource.getParams.condition = `DeliveryAt = '${props.deliveryAt}' AND CHARINDEX(BillNumber,'${props.billnumber}')>0 and idcode=${props.productCode} and saleType=${props.saleType} and qualitygrade=${props.qualityGrade}`
} else {
    dataSource.getParams.condition = `DeliveryAt = '${props.deliveryAt}' AND BatchNumber='${props.batchNumber}' and idcode=${props.productCode} and saleType=${props.saleType} `
}



const gridAction = reactive(new TAction(dataSource,{}, props.billType as string | undefined))
gridAction.PowerList.allowedDelete = true  
gridAction.TableConfig.readOnly = props.billType == 'order'? +props.headerDatas?.examineusercode !== 0 : +props.headerDatas?.mrusercode !== 0
gridAction.TableConfig.opt = props.showOpt
gridAction.open()

const handleOptButClick = (Action: string) => {
    setTimeout(() => {
        const _rowData = gridAction.dataSource.thisRowData
        if (props.billType == 'order' && _rowData.examineusercode != 0) return
        if (props.billType == 'purchase' && _rowData.mrusercode != 0) return
        switch (Action) {
            case '_Delete':
                gridAction.delete()
                break
            case '_TransferStock':
                gridAction.transferStock()
                break
            case '_TransferShipper':
                 gridAction.transferShipper(userCode)
                break
            case '_CancelProduct':
                gridAction.cancelProduct()
                break
            case '_ChangeProduct':
                gridAction.changeProduct()
                break
            case '_Free':
                gridAction.free()
                break
        }
    }, 100)
}



const parentInstance = getCurrentInstance()?.parent

const handleConfirm = async () => {
    const res = await gridAction.update()
    if (res) {
        modalActionConfirm(parentInstance,{ action: ModalResultEnum.mrConfirm, data: null})
    }
   
}

const handleCancel = () => {
    
    modalActionCancel(parentInstance,{ action: ModalResultEnum.mrCancel, data: null })
}

</script>

<style lang="scss" scoped>
.form{
        display: flex;
        flex-direction: column;
        height: 100%;
        .win-hearder{
            height: 40px;
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
        .win-grid{
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
    .delete-but{
        width: 100%;
        text-align: center;
        color: red;
        &:hover{
            cursor: pointer;
        }
    }
    .Transfer-but{
        width: 100%;
        text-align: center;
        color: blue;
        &:hover{
            cursor: pointer;
        }
    }
</style>
