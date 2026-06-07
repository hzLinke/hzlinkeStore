<template>
    <LkxGrid ref="lkxGrid" class="grid" 
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
            <div class="win-grid">
                <div class="one">
                    <lkx-input class="Input-At"
                        name="startat"
                        :config="startDateState.config"
                        v-model="StartDateCode"
                    />
                    <lkx-input class="Input-At"
                        name="endat"
                        :config="endDateState.config"
                        v-model="EndDateCode"
                    />
                    <lkx-input class="Area-input"
                        :config="CustomerState.config"
                        :dropConfig="CustomerState.dropConfig"
                        v-model="CustomerCode"
                    />
                </div>
                <div class="tow">
                    <label>请输入商品
                        <input style="height: 26px;" :value="ProductCode"
                            @change="handleProductCodeChange"
                        />
                    </label>
                    <LkxButton class="opbut" type="primary" radius="6" height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handelApplay"></LkxButton>
                    <LkxButton class="opbut" type="danger" radius="6" height="30" width="120" caption="全部删除" IconCls="iconfont iconDelete" @click="handelDelete"></LkxButton>
                </div>
                <div class="three">
                    <label>编码</label><label class="v v_code">{{ Info.ProductCode }}</label>
                    <label>条码</label><label class="v v_barcode">{{ Info.BarCode }}</label>
                    <label>名称</label><label class="v v_name">{{ Info.Name }}</label>
                    <label>规格</label><label class="v v_spec">{{ Info.Spec }}</label>
                    <label>单位</label><label class="v v_unit">{{ Info.Unit }}</label>
                </div>
            </div>
        </template>
        <template v-slot:optbut="rowItem">
            <lkx-button IconCls="iconfont iconDelete" caption="删除" width="120" type="danger" @ButClick.prevent="handleOptClick(rowItem)"/>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { ref, reactive } from "vue"
import { TDataSource } from "@/usehook/dataSource"
import $api from '@/request/api'
import { LkxInput, LkxButton, LkxGrid, MessageBox, InputOptionsType } from '@v4x/ui'
import { getProduct } from "@/usehook/dataAction"
import { TDeleteGridAction } from "./action"
import { WinProductSelect } from "@/components"

defineOptions({
    name: "deleteProduct"
})

const props = withDefaults(defineProps<{
    customerCode?: string | number
    startAt?: string
    endAt?: string
}>(), {
    customerCode: '',
    startAt: '',
    endAt: ''
})

const CustomerCode = ref(props.customerCode)
const StartDateCode = ref(props.startAt)
const EndDateCode = ref(props.endAt)
const ProductCode = ref('')

const startDateState = ref<InputOptionsType>({
    config: {
        caption: '日期 从',
        captionWidth: 60,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    }
})

const endDateState = ref<InputOptionsType>({
    config: {
        caption: '到',
        captionWidth: 20,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
    }
})



const Info = reactive({
    ProductCode: '',
    BarCode: '',
    Name: '',
    Spec: '',
    Unit: ''
})

const setInfo = (data: any) => {
    Info.ProductCode = data.idcode
    Info.BarCode = data.barcode
    Info.Name = data.name
    Info.Spec = data.spec
    Info.Unit = data.unit
}

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/sales/reports/saleCheckList/',
        KeyFieldName: 'deliveryAt',
        NotAllowOperationList: [],
        getParmars: { totalFieldSql: '', extraData: 'Ex' }
    })
)

const gridAction = reactive(new TDeleteGridAction(dataSource, {}))

const CustomerState = ref<InputOptionsType>({
    config: {
        caption: '客户',
        captionWidth: 40,
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
        displayFieldWidths: '50|200',
        dropListDatas: gridAction.commonDatas.CustomerDatas
    }
})

const handleProductCodeChange = async (e: any) => {
    const res = await getProduct({ inputText: e.target.value.toString(), customerCode: 0, BillType: 6 })
    ProductCode.value = ''
    if (res.length == 0) {
        MessageBox.toast({
            content: '无此商品',
            messageType: 'warning'
        })
        Object.assign(Info, { ProductCode: '', BarCode: '', Name: '', Spec: '', Unit: '' })
        return false
    }
    if (res.length == 1) { setInfo(res[0]); return }
    const _SelectRes = await WinProductSelect.show({ title: '商品选择', defaultDatas: res })
    if (_SelectRes) { setInfo(_SelectRes) }
}

const handelApplay = async () => {
    if (!Info.ProductCode) return
    dataSource.getParams.condition = `CustomerCode = ${CustomerCode.value} AND DeliveryAt BETWEEN '${StartDateCode.value}' AND '${EndDateCode.value}' AND ProductCode = ${Info.ProductCode}`
    gridAction.open()
}

const handleOptClick = async (data: any) => {
    const res = await MessageBox.question({
        title: '提问',
        content: '是否要删除外帐商品？'
    })
    if (res.action === 'mrCancel') return false
    MessageBox.loading({
        moreText: '正删除...',
        mask: true
    })
    await $api.comonRequest('/masterApi/disApi/sales/saleChange/Lists/', 'SingleDelete', {
        IdKey: data.rowItem.idkey
    })
    dataSource.dataSet.splice(data.rowIndex, 1)
    setTimeout(() => { MessageBox.closeAllLoading() }, 50)
}

const handelDelete = async () => {
    if (CustomerCode.value === 0) {
        MessageBox.warning({
            title: '出错',
            content: '请选择需要删除商品的客户！'
        })
        return false
    }
    if (gridAction.dataSource.dataSet.length == 0) return
    const res = await MessageBox.question({
        title: '提问',
        content: '是否要清空对应时段的外帐商品？'
    })
    if (res.action === 'mrCancel') return false
    MessageBox.loading({
        moreText: '正删除...',
        mask: true
    })
    await $api.comonRequest('/masterApi/disApi/sales/saleChange/Lists/', 'BatchDelete', {
        CustomerCode: CustomerCode.value,
        StartAt: StartDateCode.value,
        EndAt: EndDateCode.value,
        ProductCode: Info.ProductCode
    })
    dataSource.dataSet = []
    setTimeout(() => { MessageBox.closeAllLoading() }, 50)
}

</script>

<style lang="scss" scoped>
.form {
    display: flex;
    flex-direction: column;
    height: 100%;
    .win-grid {
        flex: 1;
        position: relative;
    }
}

.delete-but {
    width: 100%;
    text-align: center;
    color: red;
    &:hover {
        cursor: pointer;
    }
}

.Transfer-but {
    width: 100%;
    text-align: center;
    color: blue;
    &:hover {
        cursor: pointer;
    }
}

.one {
    display: flex;
    flex-direction: row;
    align-items: center;
    .Input-At {
        width: 180px;
    }
    .Area-input {
        width: 400px;
    }
    input {
        outline-color: blue;
    }
}

.tow {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 10px 0 5px 0;
    padding: 5px;
    border-bottom: 1px solid #eeee;
    border-top: 1px solid #eeee;
    label {
        margin-left: 330px;
    }
    input {
        outline-color: blue;
    }
    .opbut {
        margin-left: 20px;
    }
}

.three {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 5px 0;
    .v {
        margin-left: 10px;
        display: block;
        border-bottom: 1px solid black;
        height: 22px;
    }
    .v_code {
        width: 100px;
    }
    .v_barcode {
        width: 150px;
    }
    .v_name {
        width: 200px;
    }
    .v_spec {
        width: 200px;
    }
    .v_unit {
        width: 60px;
    }
}
</style>
