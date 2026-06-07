<template>
    <div class="form">
        <vue-qr class="qrCode" :text="qrCodeData" :size='200'></vue-qr>
        <div style="padding-bottom: 10px;">{{ shipperName }}</div>
        <div style="padding-bottom: 10px;">开单日期:{{ deliveryAt }}</div>
    </div>
</template>

<script setup lang="ts">
import { getCurrentInstance } from "vue"
import VueQr from 'vue-qr'
import { OrderQrCodeOptions } from './types'
import { ModalResultEnum } from "@v4x/ui";

defineOptions({
    name: 'WinOrderQrCode'
})

const props = withDefaults(defineProps<OrderQrCodeOptions>(), {
    shipperName: '',
    deliveryAt: '',
    qrCodeData: ''
})

const parentInstance = getCurrentInstance()?.parent

const handleClose = async () => {
    const { modalActionCancel } = await import('@v4x/utils')
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
</script>

<style lang="scss" scoped>
.form{
    display: flex;
    flex-direction: column;
    height: 100%;
    align-items: center;
    justify-content: center;
}
.qrCode {
    margin-bottom: 20px;
}
</style>
