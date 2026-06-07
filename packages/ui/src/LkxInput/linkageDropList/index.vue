 <template>
    <div class="dropList" :style="{top: offsetTop+'px',left: offsetLeft+'px'}">
        <div class="dropList-header">
            <div class="dropList-header-name">
                {{provinceDatas.length>0&&provinceDatas[selects.provinceIndex].n||''}}
                {{cityDatas.length>0&&cityDatas[selects.cityIndex].n||''}}
                {{countyDatas.length>0&&countyDatas[selects.countyIndex].n||''}}
                {{townDatas.length>0&&townDatas[selects.townIndex].n||''}}
            </div>
            <div class="dropList-header-code">
                 {{provinceDatas.length>0&&provinceDatas[selects.provinceIndex].s||''}}
                {{cityDatas.length>0&&cityDatas[selects.cityIndex].s||''}}
                {{countyDatas.length>0&&countyDatas[selects.countyIndex].s||''}}
                {{townDatas.length>0&&townDatas[selects.townIndex].s||''}}
            </div>
        </div>
        <div class="dropList-item">
            <!--省-->
            <div class="dropList-item-col dropList-item-province">
                <div v-for="(item,index) in provinceDatas" :key="index" 
                    :class="{'active':selects.provinceIndex==index}"
                    @mousedown.prevent="handleSelect('province',item,index)"
                >
                    {{item.n}}
                </div>
            </div>
            <!--市-->
            <div class="dropList-item-col dropList-item-city">
                <div v-for="(item,index) in cityDatas" :key="index"  
                    :class="{'active':selects.cityIndex==index}"
                     @mousedown.prevent="handleSelect('city',item,index)"
                >
                    {{item.n}}
                </div>
            </div>
            <!--区-->
            <div class="dropList-item-col dropList-item-county">
                <div v-for="(item,index) in countyDatas" :key="index"  
                    :class="{'active':selects.countyIndex==index}"
                     @mousedown.prevent="handleSelect('county',item,index)">{{item.n}}</div>
            </div>
            <!--镇-->
            <div class="dropList-item-col dropList-item-town">
                <div v-for="(item,index) in townDatas" :key="index" 
                :class="{'active':selects.townIndex==index}"
                 @mousedown.prevent="handleSelect('town',item,index)"
                >{{item.n}}</div>
            </div>
        </div>
        <div class="dropList-footer">
            <button class="dropList-footer-but" @mousedown.prevent="handleClose('mrOk')">确定</button>
            <button  class="dropList-footer-but" @mousedown.prevent="handleClose('mrClose')">关闭</button>
        </div>
	</div>
</template>
<script lang="ts">
import { defineComponent, reactive,ref, watch } from 'vue'
interface AreaType{
    i: string;
    n: string;
    s: string;
}
export default defineComponent({
    components:{
    },
    props: {
        dropListDatas:{
            type: Array,
            default:()=>{
                return [] as AreaType[]
            }
        },
        dropListPosition:{
            type:Object,
            default:()=>{
                return {
                    top:0,
                    left:0,
                    width:0,
                    height:0
                }
            }
        },
        keyValue:{
            type: String,
            default:''
        }
    },
    setup(props,ctx) {
        const provinceDatas     =   ref([] as  AreaType[]);
        const cityDatas         =   ref([] as  AreaType[]);
        const countyDatas       =   ref([] as  AreaType[]);
        const townDatas         =   ref([] as  AreaType[]);
        const keyValueArr       =   ref(props.keyValue?props.keyValue.split('-'):[])

        const offsetTop = ref(props.dropListPosition.top);
        const offsetLeft = ref(props.dropListPosition.left);
        const elWidth = 330;//下拉高度
        const elHeight = 280;//下拉宽度
        if ((offsetLeft.value + elWidth) > document.documentElement.clientWidth){
            offsetLeft.value = offsetLeft.value -(elWidth - props.dropListPosition.width)
        }
        if (offsetTop.value +elHeight > document.documentElement.clientHeight){
            offsetTop.value = offsetTop.value - (elHeight + props.dropListPosition.height)
        }
        const selects           = reactive({/**注意取最后两位数为序号时，如果编码中断序号混乱，待解决 */
            provinceIndex   :   keyValueArr.value.length!=0?parseInt(keyValueArr.value[0].slice(-2)) -1:0,
            cityIndex       :   keyValueArr.value.length!=0?parseInt(keyValueArr.value[1].slice(-2)) -1:0,
            countyIndex     :   keyValueArr.value.length!=0?parseInt(keyValueArr.value[2].slice(-2)) -1:0,
            townIndex       :   keyValueArr.value.length!=0?parseInt(keyValueArr.value[3].slice(-2)) -1:0,
        })
        const selectCode           = reactive({
            provinceCode :1,
            cityCode :101,
            countyCode: 10101
        })
        const getProvinceDatas = (): AreaType[]=>{
            return (props.dropListDatas as AreaType[]).filter((item: AreaType)=>{
                return Math.floor(parseInt(item.i) / 100) == 0
            })
        }
        const getSubDatas = (idcode: number): AreaType[]=>{ 
            return (props.dropListDatas as AreaType[]).filter((item: AreaType)=>{
                return Math.floor(parseInt(item.i) / 100) == idcode
            })
        }
        const handleSelect = (type: string,item: any,index: number)=>{
            switch (type){
                case 'province':
                    selects.provinceIndex = index
                    selectCode.provinceCode = item.i
                    break;
                case 'city':
                    selects.cityIndex = index
                    selectCode.cityCode = item.i
                    break;
                case 'county':
                    selects.countyIndex = index
                    selectCode.countyCode = item.i
                    break;
                case 'town':
                    selects.townIndex = index
                    break;
            }
        }
        const handleClose = (flg: string)=>{
            const provinceCode  =   provinceDatas.value.length>0&&provinceDatas.value[selects.provinceIndex].i||'' ;
            const cityCode      =   cityDatas.value.length>0&&cityDatas.value[selects.cityIndex].i||'';
            const countyCode    =   countyDatas.value.length>0&&countyDatas.value[selects.countyIndex].i||''
            const townCode      =   townDatas.value.length>0&&townDatas.value[selects.townIndex].i||''

            const provinceShortCode  =   provinceDatas.value.length>0&&provinceDatas.value[selects.provinceIndex].s||'' ;
            const cityShortCode      =   cityDatas.value.length>0&&cityDatas.value[selects.cityIndex].s||'';
            const countyShortCode    =   countyDatas.value.length>0&&countyDatas.value[selects.countyIndex].s||''
            const townShortCode      =   townDatas.value.length>0&&townDatas.value[selects.townIndex].s||''

            const provinceName  =   provinceDatas.value.length>0&&provinceDatas.value[selects.provinceIndex].n||'' 
            const cityName      =   cityDatas.value.length>0&&cityDatas.value[selects.cityIndex].n||''
            const countyName    =   countyDatas.value.length>0&&countyDatas.value[selects.countyIndex].n||''
            const townName      =   townDatas.value.length>0&&townDatas.value[selects.townIndex].n||''
            const _v = provinceCode+'-'+cityCode+'-'+countyCode+'-'+townCode+'|'+
                    provinceName+'-'+cityName+'-'+countyName+'-'+townName+'|'+
                    provinceShortCode+cityShortCode+countyShortCode+townShortCode
            ctx.emit('dropListClose',{action:flg,value:_v})
        }
        provinceDatas.value = getProvinceDatas()
        cityDatas.value = getSubDatas(1)
        countyDatas.value = getSubDatas(101)
        townDatas.value = getSubDatas(10101)
        watch(
            ()=>selectCode.provinceCode,
            (n)=>{
                cityDatas.value = getSubDatas(n)
                selects.cityIndex = 0
                selectCode.cityCode = cityDatas.value.length>0?parseInt(cityDatas.value[selects.countyIndex].i):-1
            }
        )
        watch(
            ()=>selectCode.cityCode,
           (n)=>{
                countyDatas.value = getSubDatas(n)
                selects.countyIndex = 0
                selectCode.countyCode = countyDatas.value.length>0?parseInt(countyDatas.value[selects.countyIndex].i):-1
            }
        )
        watch(
            ()=>selectCode.countyCode,
            (n)=>{
                townDatas.value = getSubDatas(n)
                selects.townIndex = 0
            }
        )
        return {
            provinceDatas,
            cityDatas,
            countyDatas,
            townDatas,
            selects,
            offsetTop,
            offsetLeft,
            keyValueArr,
            handleSelect,
            handleClose
        }
    }
})
</script>

<style lang="scss" scoped>
    .dropList{
        position: absolute;
        display: flex;
        flex-direction: column;
        height: 285px;
        width: 430px;
		z-index:999999999;
		border:1px solid #DCDCDC;
		background: #FFFFFF;
        font-size: $font-size;
        &-header{
            height: 30px;
            line-height: 30px;
            padding: 0 10px;
            display: flex;
            &-name{
                flex: 1;
            }
            &-code{
                width: 120px;
            }
        }
        &-footer{
            height:40px;
            display: flex; 
            flex-direction: row-reverse;
            &-but{
                 margin: 5px 10px;
                 width: 80px;
            }
        }
        &-item{
            flex: 1;
            display: flex;
            height: 95px;
            &-col{
                overflow-x: hidden;
                overflow-y: scroll;
                position: relative;
                padding: 5px ;
                border-right:1px solid #DCDCDC;
                border-top:1px solid #DCDCDC;
                border-bottom:1px solid #DCDCDC;
                &:last-child{
                    border-right: 0;
                }
                &::-webkit-scrollbar { width: 0 !important }
                .active{
                    background: rgb(108, 108, 172);
                    color: white;
                }
                div{
                    padding: 3px 5px;
                    &:hover{
                        background: #CCEEFF;
                    }
                }
            }
            &-province{
              width: 100px;
            }
            &-city{
               width: 100px;
            }
            &-county{
               width: 100px;
            }
            &-town{
               flex: 1;
            }
        }
        
    }
</style>