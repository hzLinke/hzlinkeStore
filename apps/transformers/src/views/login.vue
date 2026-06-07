<template>
    <div class="parser-container">
        <h1>🤖 智能指令解析</h1>
        <p>输入自然语言指令，规则引擎自动解析意图和参数</p>

        <div class="btn-group">
            <button :disabled="isLoading" @click="parseCommand">
                {{ buttonText }}
            </button>
        </div>

        <div class="status" :class="statusClass">{{ statusText }}</div>

        <textarea
            v-model="inputText"
            placeholder="例如：帮我把2026-01-01到2026-02-05白菜的价格修改成12元"
        />

        <div v-if="showResult" class="result">
            <h3>📋 解析结果</h3>
            <p><strong>原始指令：</strong>{{ inputText }}</p>

            <h4>🎯 意图识别</h4>
            <ul>
                <li>主要意图：<strong>{{ result.action }}</strong> (置信度: {{ (result.confidence * 100).toFixed(1) }}%)</li>
            </ul>

            <h4>📊 提取参数</h4>
            <pre>{{ formattedParams }}</pre>

            <template v-if="result.rawEntities && result.rawEntities.length > 0">
                <h4>🔍 识别到的实体</h4>
                <pre>{{ JSON.stringify(result.rawEntities, null, 2) }}</pre>
            </template>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'

// 类型定义
interface DateRange {
    start: string | null
    end: string | null
}

interface ParseResult {
    action: string
    confidence: number
    product: string | null
    dateRange: DateRange
    value: number | null
    rawEntities: any[]
}

// 响应式状态
const inputText = ref('')
const isLoading = ref(false)
const showResult = ref(false)
const statusText = ref('请输入指令进行解析')
const statusClass = ref('loading')
const result = ref<ParseResult>({
    action: '',
    confidence: 0,
    product: null,
    dateRange: { start: null, end: null },
    value: null,
    rawEntities: []
})

// 计算属性
const buttonText = computed(() => {
    if (isLoading.value) return '解析中...'
    return '解析指令'
})

const formattedParams = computed(() => {
    return JSON.stringify({
        操作类型: result.value.action,
        商品: result.value.product,
        时间范围: result.value.dateRange,
        数值: result.value.value
    }, null, 2)
})

// 商品列表
const products = ['白菜', '土豆', '西红柿', '黄瓜', '青菜', '萝卜', '包菜', '苹果', '香蕉', '橙子', '猪肉', '牛肉', '鸡肉']

// 解析指令
async function parseCommand() {
    const text = inputText.value.trim()
    if (!text) {
        alert('请输入指令')
        return
    }

    isLoading.value = true
    showResult.value = false

    try {
        result.value = parseWithRules(text)
        showResult.value = true
    } catch (e: any) {
        result.value = {
            action: '解析失败',
            confidence: 0,
            product: null,
            dateRange: { start: null, end: null },
            value: null,
            rawEntities: [{ error: e.message }]
        }
        showResult.value = true
    }

    isLoading.value = false
}

// 规则引擎解析（纯本地解析，无需网络）
function parseWithRules(text: string): ParseResult {
    // 使用规则引擎提取实体
    const entities = extractEntitiesWithRules(text)
    // 使用规则识别意图
    const intent = recognizeIntentWithRules(text)
    return extractStructuredInfo(text, entities, intent)
}

// 规则引擎识别意图
function recognizeIntentWithRules(text: string): { labels: string[], scores: number[] } {
    const lowerText = text.toLowerCase()
    
    // 定义意图规则
    const intentRules = [
        { keywords: ['修改', '改成', '调成', '改为', '改成', '更新'], intent: '修改价格' },
        { keywords: ['查询', '看看', '查看', '找找', '搜索', '统计'], intent: '查询数据' },
        { keywords: ['导出', '下载', '生成报表'], intent: '导出报表' },
        { keywords: ['删除', '去掉', '移除', '清空'], intent: '删除记录' },
    ]
    
    for (const rule of intentRules) {
        for (const keyword of rule.keywords) {
            if (lowerText.includes(keyword)) {
                return { labels: [rule.intent], scores: [0.9] }
            }
        }
    }
    
    return { labels: ['其他操作'], scores: [0.5] }
}

// 规则引擎提取实体（支持中英文语序）
function extractEntitiesWithRules(text: string) {
    const entities: any[] = []

    // 提取商品（支持"10支生抽"和"生抽10支"两种语序）
    for (const product of products) {
        // 正向匹配：商品在数字前
        const pattern1 = new RegExp(`(\\d+(?:\\.\\d+)?)\\s*(?:个|支|瓶|箱|斤|公斤|千克|kg|克|g)?\\s*${product}`, 'g')
        // 反向匹配：数字在商品后
        const pattern2 = new RegExp(`${product}\\s*(\\d+(?:\\.\\d+)?)\\s*(?:个|支|瓶|箱|斤|公斤|千克|kg|克|g)?`, 'g')

        let match
        while ((match = pattern1.exec(text)) !== null) {
            entities.push({ word: match[0], entity: 'QUANTITY', text: product, value: parseFloat(match[1]) })
        }
        while ((match = pattern2.exec(text)) !== null) {
            entities.push({ word: match[0], entity: 'QUANTITY', text: product, value: parseFloat(match[1]) })
        }
    }

    // 提取价格
    const pricePattern = /(\d+(?:\.\d+)?)\s*(?:块|元|块钱|円)/g
    let match
    while ((match = pricePattern.exec(text)) !== null) {
        entities.push({ word: match[0], entity: 'PRICE', value: parseFloat(match[1]) })
    }

    return entities
}

// 解析相对时间
function parseRelativeTime(text: string): string {
    const now = new Date()
    const year = now.getFullYear()
    const month = now.getMonth() + 1
    const day = now.getDate()

    // 本月
    text = text.replace(/本月/g, `${year}-${String(month).padStart(2, '0')}`)

    // 上月/上个月
    const lastMonth = month === 1 ? 12 : month - 1
    const lastMonthYear = month === 1 ? year - 1 : year
    text = text.replace(/(上|上个)月/g, `${lastMonthYear}-${String(lastMonth).padStart(2, '0')}`)

    // 下月/下个月
    const nextMonth = month === 12 ? 1 : month + 1
    const nextMonthYear = month === 12 ? year + 1 : year
    text = text.replace(/(下|下个)月/g, `${nextMonthYear}-${String(nextMonth).padStart(2, '0')}`)

    // 今年
    text = text.replace(/今年/g, `${year}`)

    // 去年
    text = text.replace(/去年/g, `${year - 1}`)

    // 今天
    text = text.replace(/今天/g, `${year}-${String(month).padStart(2, '0')}-${String(day).padStart(2, '0')}`)

    // 昨天
    const yesterday = new Date(now)
    yesterday.setDate(day - 1)
    text = text.replace(/昨天/g, formatDate(yesterday))

    // 明天
    const tomorrow = new Date(now)
    tomorrow.setDate(day + 1)
    text = text.replace(/明天/g, formatDate(tomorrow))

    // N天后
    text = text.replace(/(\d+)天后/g, (match, days) => {
        const date = new Date(now)
        date.setDate(day + parseInt(days))
        return formatDate(date)
    })

    // N天前
    text = text.replace(/(\d+)天前/g, (match, days) => {
        const date = new Date(now)
        date.setDate(day - parseInt(days))
        return formatDate(date)
    })

    // 本周一/本周二等
    const weekDayMap: Record<string, number> = { '一': 1, '二': 2, '三': 3, '四': 4, '五': 5, '六': 6, '日': 0, '天': 0 }
    text = text.replace(/本(周|星期)([一二三四五六日天])/g, (match, prefix, dayChar) => {
        const targetDay = weekDayMap[dayChar]
        const currentDay = now.getDay()
        const diff = targetDay - currentDay
        const date = new Date(now)
        date.setDate(day + diff)
        return formatDate(date)
    })

    return text
}

function formatDate(date: Date): string {
    const y = date.getFullYear()
    const m = String(date.getMonth() + 1).padStart(2, '0')
    const d = String(date.getDate()).padStart(2, '0')
    return `${y}-${m}-${d}`
}

function extractStructuredInfo(text: string, entities: any[], intent: any): ParseResult {
    const info: ParseResult = {
        action: intent.labels[0],
        confidence: intent.scores[0] || 0.9,
        product: null,
        dateRange: { start: null, end: null },
        value: null,
        rawEntities: entities
    }

    // 从实体中提取商品
    const quantityEntity = entities.find((e: any) => e.entity === 'QUANTITY')
    if (quantityEntity) {
        info.product = quantityEntity.text
    }

    // 从实体中提取价格
    const priceEntity = entities.find((e: any) => e.entity === 'PRICE')
    if (priceEntity) {
        info.value = priceEntity.value
    }

    // 解析日期（支持相对时间）
    const processedText = parseRelativeTime(text)
    const datePattern = /\d{4}[-/]\d{2}[-/]\d{2}/g
    const dates = processedText.match(datePattern)
    if (dates && dates.length >= 1) {
        info.dateRange.start = dates[0]
        if (dates.length >= 2) {
            info.dateRange.end = dates[1]
        }
    }

    // 如果没从实体找到商品，再用简单方式搜索
    if (!info.product) {
        for (const p of products) {
            if (text.includes(p)) {
                info.product = p
                break
            }
        }
    }

    return info
}

onMounted(() => {
    // 无需初始化，直接使用规则引擎
})
</script>

<style lang="scss" scoped>
.parser-container {
    font-family: Arial, sans-serif;
    padding: 20px;
    max-width: 800px;
    margin: 0 auto;
}

h1 {
    margin-bottom: 10px;
}

textarea {
    width: 100%;
    height: 100px;
    margin: 10px 0;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    resize: vertical;
}

.btn-group {
    margin: 10px 0;
}

button {
    padding: 10px 20px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;

    &:disabled {
        background: #ccc;
        cursor: not-allowed;
    }

    &:hover:not(:disabled) {
        background: #0056b3;
    }
}

.status {
    margin: 10px 0;
    padding: 10px;
    border-radius: 4px;
    white-space: pre-line;

    &.loading {
        color: #666;
    }

    &.success {
        color: green;
        background: #d4edda;
    }

    &.error {
        color: red;
        background: #f8d7da;
    }
}

.tips {
    background: #fff3cd;
    padding: 10px;
    border-radius: 5px;
    margin: 10px 0;
    font-size: 14px;
}

.result {
    background: #f5f5f5;
    padding: 15px;
    margin-top: 20px;
    border-radius: 5px;

    h3, h4 {
        margin-top: 15px;
        margin-bottom: 10px;

        &:first-child {
            margin-top: 0;
        }
    }

    ul {
        margin: 10px 0;
        padding-left: 20px;
    }

    pre {
        background: #fff;
        padding: 10px;
        border-radius: 4px;
        overflow-x: auto;
        border: 1px solid #ddd;
    }
}
</style>
