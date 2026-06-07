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
            <div class="hearderPanel">
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
                        :config="AreaState.config"
                        :dropConfig="AreaState.dropConfig"
                        v-model="AreaCode"
                    />
                    <label>请输入商品
                        <input style="height: 26px;" :value='ProductCode'
                            @change="handleProductCodeChange"
                        />
                    </label>
                    <lkx-input class="QualityGrade-input"
                        :config="QualityGradeState.config"
                        :dropConfig="QualityGradeState.dropConfig"
                        v-model="QualityGradeCode"
                    />
                    <LkxButton class="opbut" type="default" radius=6 height="30" width="80" caption="应用" IconCls="iconfont iconSearch" @click="handleApplay"></LkxButton>
                </div>
                <div class="tow">
                    <label>编码</label><label class="v v_code">{{Info.ProductCode}}</label>
                    <label>条码</label><label class="v v_barcode">{{Info.BarCode}}</label>
                    <label>名称</label><label class="v v_name">{{Info.Name}}</label>
                    <label>规格</label><label class="v v_spec">{{Info.Spec}}</label>
                    <label>单位</label><label class="v v_unit">{{Info.Unit}}</label>
                </div>
            </div>
        </template>
    </LkxGrid>
</template>

<script setup lang="ts">
import { reactive, ref, onMounted, useTemplateRef } from 'vue'
import {  useRoute } from "vue-router"
import { LkxGrid, LkxButton, LkxInput, MessageBox, InputOptionsType, ModalResultEnum } from '@v4x/ui'
import { TDataSource } from "@/usehook/dataSource"
import { TWinForm } from "@/usehook/win"
import { getProduct } from "@/usehook/dataAction"
import { TProductHistory } from "./action"
import $api from '@/request/api'
import $Util from '@v4x/utils/lkxUtil'
import { WinProductSelect } from '@/components'

defineOptions({
    name: 'InoutReports/ProductHistory'
})

const lkxGrid = useTemplateRef('lkxGrid')
const Win = reactive(new TWinForm({}))
const route = useRoute()

const AreaCode = ref(0)
const QualityGradeCode = ref(1)
const StartDateCode = ref($Util.getMonthFirst())
const EndDateCode = ref($Util.getDate())
const ProductCode = ref('')

const dataSource = reactive(
    new TDataSource({
        ApiPath: '/masterApi/disApi/reports/InOutReports/ProductHistory/',
        KeyFieldName: 'At',
        NotAllowOperationList: [],
        getParmars: {}
    })
)

const gridAction = reactive(new TProductHistory(dataSource, {}))


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

const AreaState = ref<InputOptionsType> ({
    config: {
        caption: '仓位',
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
        dropListDatas: gridAction.commonDatas.AreaDatas
    }
})

const QualityGradeState = ref<InputOptionsType> ({
    config: {
        caption: '质量等级',
        captionWidth: 80,
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
        dropListDatas: [{idcode:0,name:'不定'},{idcode:1,name:'标准'},{idcode:2,name:'次级'},{idcode:3,name:'高级'}]
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
    if (res.length == 1) {
        setInfo(res[0])
        return
    }
    const _SelectRes = await WinProductSelect.show({ title: '商品选择', defaultDatas: res })
    if (_SelectRes.action == ModalResultEnum.mrConfirm) {
        setInfo(_SelectRes.data)
    }
}

const handleApplay = async () => {
    if (!Info.ProductCode) {
        MessageBox.information({
            content: '请输入商品',
            title: '提示',
            showCancel: false
        })
        return
    }
    try {
        MessageBox.loading({
            moreText: '正在生成报表...',
            mask: true
        })
        const res = await $api.comonRequest('/masterApi/disApi/reports/InOutReports/ProductHistory/', 'buildReport', {
            StartAt: StartDateCode.value,
            EndAt: EndDateCode.value,
            AreaCode: AreaCode.value,
            ProductCode: Info.ProductCode,
            QualityGradeCode: QualityGradeCode.value,
            IsExtend: 0
        })
        if (res.errCode == 0) {
            gridAction.open()
        }
    } finally {
        MessageBox.closeAllLoading()
    }
}

onMounted(() => {
    Win.switchGrid(false, gridAction, lkxGrid as any)
})

if (route.query.productInfo) {
    const _Info = JSON.parse(route.query.productInfo as string)
    Info.ProductCode = _Info.productcode
    Info.BarCode = _Info.barcode
    Info.Name = _Info.name
    Info.Spec = _Info.spec
    Info.Unit = _Info.Unit
    QualityGradeCode.value = _Info.qualitygrade || 1
    handleApplay()
}
</script>

<style lang="scss" scoped>
.grid {
    position: absolute;
    left: 0;
    right: 0;
}

.hearderPanel {
    display: flex;
    flex-direction: column;

    padding: 3px 20px;

    .one {
        display: flex;
        flex-direction: row;
        align-items: center;

        .Input-At {
            width: 180px;
        }

        .Area-input {
            width: 150px;
        }

        QualityGrade-input {
            width: 230px;
        }
        input {
            outline-color: blue;
        }

        .opbut {
            margin-left: 20px;
        }
    }

    .tow {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin: 10px 0 5px 0;

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
}
</style>
