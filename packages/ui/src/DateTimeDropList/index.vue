 <template>
    <div class="dropList" ref="dropList" :style="{top: offsetTop+'px',left: offsetLeft+'px'}">
        <!--年月部份-->
        <!--操作部分-->
        <div class="datepick-opt" >
            <div class="datepick-opt-ym" @click="yearSelectVisable=!yearSelectVisable">
                <span>{{thisDate.year+'年'+padstr(thisDate.month+1)+'月'}}</span>
                <Icons class="arrow" type="down" size="10"></Icons>
            </div>
            <div class="datepick-opt-updown" v-if="!yearSelectVisable">
                <Icons class="arrow" type="arrowDown" size="10" @butClick="handleChangeMonth('dec')"></Icons>
                <Icons class="arrow" type="arrowUp" size="10" @butClick="handleChangeMonth('add')"></Icons>
            </div>
        </div>
        <div class="droplist-ymbody" ref="DroplistYmBody" v-if="yearSelectVisable">
            <div class="droplist-ym" v-for="(item,index) in yearText" :key="index" @click="handleYearClick(item,+index)">
                <div class="droplist-y" :class="{thisActive: selectYear == index}" >{{item}}年</div>
                <table cellpadding="0" cellspacing="0" border="0" v-if="selectYear==index">
                    <tbody>
                        <tr v-for="rowindex in 3" :key="rowindex">
                            <td v-for="(item,index) in monthText.slice((rowindex-1)*4,(rowindex)*4)" :key="index"
                                class="monthTxt"
                                @click.stop="handleMonethClick(item)"
                            >
                                {{item}}月
                            </td>
                        </tr>
                    </tbody>
                </table> 
            </div>
            
        </div>
        <!--日期部份-->
        <div class="dropList-item" v-if="!yearSelectVisable">
            <div class="datepick">
                <div class="datepick-date">
                    
                    <table cellpadding="0" cellspacing="0" border="0">
                        <thead>
                            <tr>
                                <td v-for="(item,index) in weekText" :key="index">{{item}}</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="rowindex in 6" :key="rowindex">
                                <td v-for="(item,index) in dateList.slice((rowindex-1)*7,(rowindex)*7)" :key="index"
                                    class="crrrentMonth"
                                    :class="[{'otherMonth':item.nextMonth||item.previousMonth},
                                        {'thisActive':item.currentMonth&& thisDate.day==item.value}]"
                                    @click.stop="handleDateClick(item)"
                                >
                                    {{item.value}}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--<div class="datepick-time">
                    <div class="datepick-time-value">
                        <span>{{thisDate.h+':'+thisDate.m+':'+thisDate.s}}</span>
                    </div>
                    <div  class="datepick-time-select">
                        <div class="datepick-time-scroll datepick-time-h">
                            <div v-for="h in 24" :key="h" :class="[{'thisActive':thisDate.h==h-1}]" @click="handleHClick">{{padstr(h-1)}}</div>
                        </div>
                        <div class="datepick-time-scroll datepick-time-m">
                            <div v-for="m in 60" :key="m" :class="[{'thisActive':thisDate.m==m-1}]" @click="handleMClick">{{padstr(m-1)}}</div>
                        </div>
                        <div class="datepick-time-scroll datepick-time-s">
                            <div v-for="s in 60" :key="s" :class="[{'thisActive':thisDate.s==s-1}]"  @click="handleSClick">{{padstr(s-1)}}</div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
        <div class="footer" v-if="!yearSelectVisable">
            <span @click="handleGoToday">今天</span>
            <!--
            <button @click="handleClose('mrOk')">确定</button>
            <button @click="handleClose('mrClose')">关闭</button>
            -->
        </div>
	</div>
</template>
<script setup lang="ts">
import { reactive, ref, computed, watch } from 'vue'
import $Uitl from '@v4x/utils/lkxUtil'
import Icons from '../LkxIcons/Icons.vue'

// 定义组件名
defineOptions({
    name: 'DateTimeDropList'
})

interface Position {
    top: number
    left: number
    width: number
    height: number
}

interface Props {
    dropListPosition?: Position
    date?: string
    showTime?: boolean
}

const props = withDefaults(defineProps<Props>(), {
    dropListPosition: () => ({
        top: 0,
        left: 0,
        width: 0,
        height: 0
    }),
    date: '',
    showTime: false
})

const emit = defineEmits<{
    dropListClose: [date: Object]
}>()

const DroplistYmBody = ref<null | HTMLElement>(null)
const offsetTop = ref(props.dropListPosition.top)
const offsetLeft = ref(props.dropListPosition.left)
const elWidth = 240
const elHeight = 270

if ((offsetLeft.value + elWidth) > document.documentElement.clientWidth) {
    offsetLeft.value = offsetLeft.value - (elWidth - props.dropListPosition.width)
}
if (offsetTop.value + elHeight > document.documentElement.clientHeight) {
    offsetTop.value = offsetTop.value - (elHeight + props.dropListPosition.height)
}

const yearSelectVisable = ref(false)
const yearText = ref([] as any)
const y = $Uitl.getDatePart('Y')
for (let i = y - 50; i <= (y + 50); i++) {
    yearText.value.push(i)
}
const monthText = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
const weekText = ['日', '一', '二', '三', '四', '五', '六']
const thisDate = reactive({
    year: 2021,
    month: 4,
    day: 14,
    h: 22,
    m: 15,
    s: 30
})
const selectYear = ref(0)

const initDate = (e?: string) => {
    const _d = e ? new Date(e) : new Date()
    thisDate.year = _d.getFullYear()
    thisDate.month = _d.getMonth()
    thisDate.day = _d.getDate()
    thisDate.h = _d.getHours()
    thisDate.m = _d.getMinutes()
    thisDate.s = _d.getSeconds()
}

const padstr = (str: any) => {
    return (str.toString()).padStart(2, '0')
}

const dateList = computed(() => {
    const currentMonthLength = new Date(thisDate.year, thisDate.month + 1, 0).getDate()
    const dList = Array.from({ length: currentMonthLength }, (_val, index) => {
        return {
            previousMonth: false,
            currentMonth: true,
            nextMonth: false,
            value: index + 1
        }
    })
    const startDay = new Date(thisDate.year, thisDate.month, 1).getDay()
    const previousMongthLength = new Date(thisDate.year, thisDate.month, 0).getDate()

    for (let i = 0, len = startDay; i < len; i++) {
        dList.unshift({ previousMonth: true, currentMonth: false, nextMonth: false, value: previousMongthLength - i })
    }
    for (let i = currentMonthLength + startDay, item = 1; i < 42; i++, item++) {
        dList.push({ previousMonth: false, currentMonth: false, nextMonth: true, value: item })
    }
    return dList
})

const handleDateClick = (e: any) => {
    if (e.nextMonth) {
        if (thisDate.month == 11) {
            thisDate.year++
            thisDate.month = 0
        } else {
            thisDate.month++
        }
    }
    if (e.previousMonth) {
        if (thisDate.month == 0) {
            thisDate.year--
            thisDate.month = 11
        } else {
            thisDate.month--
        }
    }
    thisDate.day = e.value
    if (!props.showTime) {
        const _datetime = thisDate.year + '-' + (thisDate.month * 1 + 1) + '-' + thisDate.day + ' ' + thisDate.h + ':' + thisDate.m + ':' + thisDate.s
        emit('dropListClose', { action: 'mrOk', datetime: _datetime })
    }
}

const handleYearClick = (year: any, index: number) => {
    selectYear.value = index
    thisDate.year = year
}

const handleMonethClick = (e: any) => {
    thisDate.month = e - 1
    yearSelectVisable.value = false
}

const handleClose = (flg: string) => {
    const _datetime = thisDate.year + '-' + (thisDate.month * 1 + 1) + '-' + thisDate.day + ' ' + thisDate.h + ':' + thisDate.m + ':' + thisDate.s
    emit('dropListClose', { action: flg, datetime: _datetime })
}

const handleGoToday = (_e: MouseEvent) => {
    initDate()
}

const handleChangeMonth = (flg: string) => {
    if (flg == 'add') {
        if (thisDate.month == 11) {
            thisDate.year++
            thisDate.month = 0
        } else {
            thisDate.month++
        }
    }
    if (flg == 'dec') {
        if (thisDate.month == 0) {
            thisDate.year--
            thisDate.month = 11
        } else {
            thisDate.month--
        }
    }
}

initDate(props.date)

watch(
    () => yearSelectVisable.value,
    (n, _o) => {
        if (n) {
            selectYear.value = yearText.value.indexOf(thisDate.year)
            setTimeout(() => {
                const thisYear = (DroplistYmBody.value as HTMLDivElement)?.querySelector('.thisActive') as HTMLDivElement | null
                const thisTable = (DroplistYmBody.value as HTMLDivElement)?.querySelector('table') as HTMLTableElement | null
                if (thisYear && thisTable && DroplistYmBody.value) {
                    (DroplistYmBody.value as HTMLDivElement).scrollTop = thisYear.offsetTop - thisYear.clientHeight - thisTable.clientHeight
                }
            }, 0)
        }
    }
)

watch(
    () => selectYear.value,
    (_n, _o) => {
        setTimeout(() => {
            const thisYear = (DroplistYmBody.value as HTMLDivElement)?.querySelector('.thisActive') as HTMLDivElement | null
            const thisTable = (DroplistYmBody.value as HTMLDivElement)?.querySelector('table') as HTMLTableElement | null
            if (thisYear && thisTable && DroplistYmBody.value) {
                (DroplistYmBody.value as HTMLDivElement).scrollTop = thisYear.offsetTop - thisYear.clientHeight - thisTable.clientHeight
            }
        }, 0)
    }
)

watch(
    () => thisDate.month,
    (_n, _o) => {
        const LastAt = $Uitl.getMonthLast(thisDate.year + '-' + padstr(thisDate.month + 1) + '-01')
        const LastDay = $Uitl.getDatePart('d', LastAt)
        if (LastDay < thisDate.day) {
            thisDate.day = LastDay
        }
    }
)

defineExpose({
    DroplistYmBody,
    offsetTop,
    offsetLeft,
    yearSelectVisable,
    selectYear,
    dateList,
    thisDate,
    yearText,
    monthText,
    weekText,
    padstr,
    handleDateClick,
    handleYearClick,
    handleMonethClick,
    handleGoToday,
    handleClose,
    handleChangeMonth
})
</script>

<style lang="scss" scoped>
    .dropList{
        position: absolute;
        height: 270px;
        width: 240px;
		z-index:999999999;
		border:1px solid #DCDCDC;
		background: #FFFFFF;
        display: flex;
        flex-direction: column;
        font-size: $font-size;
        .datepick-opt{
            display: flex;
            height: 35px;
            align-items: center;
            padding:0 10px;
            border-bottom: 1px solid #DCDCDC;
            &-ym{
                flex: 1;
            }
            &-updonw{
                width: 20px;
            }
            .arrow{
                padding: 0 3px;
                &:hover{
                    border: 1px solid #cedeee;
                    border-radius: 50%;
                }
            }
        }
        .droplist-ymbody{
            flex: 1;
            overflow-y: auto;
        }
        .droplist-ym{
            padding: 0 5px;
            .droplist-y{
                padding: 2px 0;
                &:hover{
                    background:#CCEEFF;
                }
            }
            table{
                padding: 5px 0;
            }
            tr{
                height: 24px;
                td{
                    &:hover{
                        background:#CCEEFF;
                    }
                }
            }
            .monthTxt{
                width: 60px;
                text-align: center;
            }
        }
        /*.droplist-y{
            background-color: #DCDCDC;
        }*/
        .thisActive{
            background:#0066FF ;
            border-radius: 5px;
        }
        .footer{
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding-top: 3px ;
            border-top: 1px solid #DCDCDC;
            span,button{
                margin-right: 10px;
            }
            &:hover{
                cursor: pointer;
            }
        }
        .datepick{
            display: flex;
            flex: 1;
            &-date{
                flex: 1;
                padding-left: 10px;
                padding-right: 10px;
                border-right: 1px solid #cedeee;
                
                table{
                    td{
                        width: 30px;
                        height: 30px;
                        line-height: 30px;
                        text-align: center;
                        
                    }
                    .otherMonth{
                            color: #cedeee;
                        }
                        .crrrentMonth{
                            &:hover{
                                background:#CCEEFF;
                                color: red;
                            }
                        }
                }
            }
            &-time{
                display: flex;
                width: 40px;
                flex-direction: column;
                height: 240px;
                width: 110px;
                padding: 0 5px;
                &-value{
                    height: 35px;
                    line-height: 35px;
                    text-align: center;
                }
                &-select{
                    display: flex;
                    flex-direction: row;
                    flex: 1;
                    height: 0;
                    .datepick-time-scroll{
                        display: flex;
                        flex: auto;
                        position: relative;
                        overflow: auto;
                        text-align: center;
                        height: 100%;
                        flex-direction: column;
                        &::-webkit-scrollbar { width: 0 !important }
                        div{
                            padding: 3px 0;
                            &:hover{
                                background:#CCEEFF;
                            }
                        }
                    }
                }
            }
        }
    }
</style>