<template>
    <div class="order-container">
        <div class="order-header">
            <div class="header-left">
                <div class="header-item">
                    <span class="label">送货日期：</span>
                    <span class="value">{{ orderInfo.deliveryDate }}</span>
                </div>
                <div class="header-item">
                    <span class="label">单号：</span>
                    <span class="value">{{ orderInfo.billNumber }}</span>
                </div>
            </div>
            <button class="refresh-btn" @click="fetchOrderData">刷新</button>
        </div>
        <table class="order-table" v-if="orderItems.length > 0">
            <thead>
                <tr>
                    <th class="th-name">品名</th>
                    <th class="th-quality">质量</th>
                    <th class="th-total">总数</th>
                    <th class="th-num">包装情况</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in mergedItems" :key="index" :class="{ 'group-end': item.isLastInGroup }">
                    <td class="td-name" v-if="item.showName" :rowspan="item.rowSpan">{{ item.name }}</td>
                    <td class="td-quality" v-if="item.showName" :rowspan="item.rowSpan">{{ item.qualitygradename }}</td>
                    <td class="td-total" v-if="item.showName" :rowspan="item.rowSpan">{{ item.totalNum }}</td>
                    <td class="td-num">{{ getPackTxt(item) }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import { useRoute } from 'vue-router'
import api from '@/request/api'
import { clearDecimal } from '@v4x/utils'
import { MessageBox } from '@v4x/ui'

defineOptions({
    name: 'OrderList'
})

const route = useRoute()
const billNumber = sessionStorage.getItem('billNumber') || route.query.billNumber as string || ''

interface OrderItem {
    name: string
    unit: string
    qualitygrade: string
    qualitygradename: string
    customername: string
    numex: string
    note: string
    productcode: string
}

interface OrderInfo {
    deliveryDate: string
    billNumber: string
}

const orderInfo = ref<OrderInfo>({
    deliveryDate: '2024-04-23',
    billNumber: billNumber || 'DJ202404230001'
})

const orderItems = ref<OrderItem[]>([])

const mergedItems = computed(() => {
    const result: (OrderItem & { rowSpan: number; showName: boolean; totalNum: number; isLastInGroup: boolean })[] = []
    const groupMap: Record<string, { startIndex: number; count: number; total: number }> = {}

    // 第一遍：统计每个分组的数量和总数（以productcode+qualitygrade分组）
    for (const item of orderItems.value) {
        const groupKey = `${item.productcode}-${item.qualitygrade}`
        if (!groupMap[groupKey]) {
            groupMap[groupKey] = {
                startIndex: result.length,
                count: 0,
                total: 0
            }
        }
        groupMap[groupKey].count++
        groupMap[groupKey].total += parseFloat(item.numex) || 0
        result.push({ ...item, rowSpan: 0, showName: false, totalNum: 0, isLastInGroup: false })
    }

    // 第二遍：设置rowspan、totalNum和isLastInGroup
    for (const [groupKey, info] of Object.entries(groupMap)) {
        result[info.startIndex].rowSpan = info.count
        result[info.startIndex].showName = true
        result[info.startIndex].totalNum = info.total
        // 标记该组的最后一行
        result[info.startIndex + info.count - 1].isLastInGroup = true
    }
    return result
})

const getPackTxt = (item: OrderItem) => {
    
    const notePart = item.note ? `(${item.note})` : ''
    return `${item.customername} 【${clearDecimal(item.numex)}${item.unit}】${notePart}`
}

const fetchOrderData = async () => {
    const loadingMsg = MessageBox.loading({
        moreText: '数据加载中...',
    })
    try {
        const res = await api.getData('/masterApi/disApi/orderList/', {
            fields: '*',
            sortFields: 'productcode,idkey',
            page: 1,
            pageSize: 0,
            condition: `billNumber = '${billNumber}'`
        })
        if (res.errCode === 0 && res.datas) {
            orderItems.value = res.datas
            // 更新送货日期
            if (res.datas.length > 0 && res.datas[0].deliveryat) {
                orderInfo.value.deliveryDate = res.datas[0].deliveryat
            }
        }
    } catch (error) {
        console.error('获取数据失败:', error)
    } finally {
        loadingMsg.close()
    }
}

onMounted(() => {
    fetchOrderData()
})
</script>

<style lang="scss" scoped>
.order-container {
    width: 100%;
    min-height: 100vh;
    background-color: #f5f5f5;
    padding: 10px;
    box-sizing: border-box;
}

.order-header {
    background-color: #fff;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    display: flex;
    justify-content: space-between;
    align-items: center;

    .header-left {
        flex: 1;
    }

    .header-item {
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
        border-bottom: 1px solid #eee;

        &:last-child {
            border-bottom: none;
        }

        .label {
            color: #666;
            font-size: 14px;
        }

        .value {
            color: #333;
            font-size: 14px;
            font-weight: 500;
        }
    }

    .refresh-btn {
        padding: 8px 20px;
        background-color: #409eff;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        margin-left: 10px;

        &:hover {
            background-color: #66b1ff;
        }
    }
}

.order-table {
    width: 100%;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-collapse: collapse;

    thead {
        background-color: #409eff;
        color: #fff;
        font-size: 13px;
        font-weight: 500;

        th {
            padding: 12px 8px;
            text-align: center;
        }
    }

    tbody {
        font-size: 13px;

        tr {
            border-bottom: 1px solid #eee;

            &:last-child {
                border-bottom: none;
            }

            &.group-end {
                border-bottom: 1px solid #409eff;
            }
        }

        td {
            padding: 12px 8px;
            text-align: left;
            vertical-align: middle;
            word-break: break-all;
        }
    }
}

.th-name, .td-name {
    width: 30%;
}

.th-quality, .td-quality {
    width: 12%;
    text-align: center;
     border-left: 1px solid #eee;
}

.th-num, .td-num {
    width: 46%;
}

.th-total, .td-total {
    width: 12%;
    text-align: center;
    border-left: 1px solid #eee;
    border-right: 1px solid #eee;
}


@media (max-width: 480px) {
    .order-container {
        padding: 8px;
    }

    .order-header {
        padding: 12px;

        .header-item {
            .label, .value {
                font-size: 13px;
            }
        }
    }

    .order-table {
        th, td {
            padding: 8px 4px;
            font-size: 12px;
        }
    }
}
</style>