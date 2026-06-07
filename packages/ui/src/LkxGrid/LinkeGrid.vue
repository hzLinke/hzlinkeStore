<template>

<div class="lkx-table-wrapper" >
    <div v-if="loading" class="mask">
        <loading :moreText='loadText'></loading>
    </div>
    <slot name="serachBox">
        <SearchBox v-if="serachBoxConfig.open"
            :config="serachBoxConfig"
            @close="serachBoxConfig.handleClose"
        />
    </slot>
    <!--<lkx-popup-menu ref="LkxPopupMenu" :items="popupMenuData.items" :open="popupMenuData.open" :pointXy="popupMenuData.pointXy" :cellIndex="popupMenuData.cellIndex" @item-click="handlePopupItemClick"/>
    --扩展行-->
    <tr v-show="expanded" ref = "ExpandRow" class="lkx-table-body-row-expand" style="height:100px">
        <td class="lkx-table-body-column-expand" :colspan="visibleColumns.length">
            <slot name="expand" :row="datas?datas[dataSource.activeRowIndex]:{}"></slot>
        </td>
    </tr>
    
    <slot name="toolsbar">
        <lkx-tools-bar v-if="tableConfig.toolsbar" :toolsBarItems="toolsBarConfig.toolsBarItems" @item-click="toolsBarConfig.handleClick"/>
    </slot>
    <slot name="headerPanel"></slot>  
    <slot name="funcToolsbar"></slot>
    <slot name="container">
        <div class="lkx-table-container">
            <div class="lkx-table-slave-wrapper"  @dblclick="handleGriddblClick">
                <slot name='slaveLeft'></slot>
            </div>
            <div class="lkx-table-main-wrapper" @dblclick="handleGriddblClick">
                <div v-if="!$slots.TableContent" class="lkx-table-content" ref="lkxTableWrapper" :tabindex="1" :id = "tableConfig.id" 
                    @keydown.stop.prevent="handleKeyDown"
                    @keyup.stop.prevent autofoucs 
                    @focus="handleGridFocus"
                    @contextmenu="hanadleRightClick"
                >
                    <div ref="resizeStatusBox" :style="{left: stateParmars.resizeStatusBoxLeft+'px',top:stateParmars.resizeStatusBoxTop+'px',display:stateParmars.mouseIsDown?'block':'none'}" class="lkx-resize-box"></div>
                    <table class="lkx-table" ref="Table" :border="0" cellpadding="0" cellspacing="0" 
                    
                    >
                        <colgroup>
                            <col v-for="(citem,cindex) in visibleColumns" :name="citem.fieldName" :key="cindex" :width="citem.width+'px'"/>
                        </colgroup>
                        <thead>
                            <tr class="lkx-table-head-row" v-for="(rowitems,rowindex) in headColumns" :key="rowindex" >  
                                <th v-for="(item,index) in rowitems" :name="item.fieldName" :key="index" 
                                        class="lkx-cell lkx-table-head-column"
                                        :class="fixedTheadCls(item,rowindex+1)"
                                        :colspan="item.colspan"
                                        :rowspan="item.rowspan"
                                        @mousedown="handleHeadCellMouseDown"
                                >
                                    <div :name="item.fieldName" class="lkx-header-cell lkx-cell-value  lkx-ellipsis" >
                                        <span>{{item.title}}</span>
                                        <div v-if="item.sort==true&&item.colspan==1" class="lkx-table-head-column-sort no-print">
                                            <div class="lkx-table-head-column-sort-up">
                                                <LkxIcons 
                                                    type="up"
                                                    size="10"
                                                    @butClick.stop="handleSort('asc',item)"
                                                    :class="{'sortActive':item.sortStyle=='asc'}"
                                                />
                                            </div>
                                            <div class="lkx-table-head-column-sort-down no-print">
                                                <LkxIcons 
                                                    type="down"
                                                    size="10"
                                                    :class="{'sortActive':item.sortStyle=='desc'}"  
                                                    @butClick.stop="handleSort('desc',item)"
                                                />
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div v-if="!item.fixed" class="lkx-resize" @mousedown.stop="handleResizeBoxMouseDown"/>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="empty" v-if="datas.length==0" style="height:1px;">
                                <td  :colspan="visibleColumns.length">
                                </td>
                            </tr>
                            <tr class="lkx-table-body-row" 
                                :draggable="allowedDraggble"
                                :class="{'lkx-row-select': dataSource.selectLists.indexOf(rowIndex)!=-1}" 
                                v-for="(rowItem,rowIndex) in datas" :key="rowIndex"
                                @click="handleRowClick"
                                @dblclick="handleRowDbClick"
                                @dragstart = "handleDragStart($event,rowItem,rowIndex)"
                                @dragover ="handleDragOver"
                                @drop="handleDragDrop($event,rowItem,rowIndex)"
                            >
                                <td v-for="(cellItem,cellIndex) in visibleColumns" 
                                    :name="cellItem.fieldName"
                                    :value="rowItem[cellItem.fieldName]" 
                                    :key="cellIndex" 
                                    class="lkx-cell lkx-table-body-column"
                                    :class="{'fixed-left-1':cellItem.fieldKind=='sep','fixed-left-2':cellItem.fieldKind=='expand','fixed':cellItem.fixed,'fixed-optright':cellItem.fieldKind=='opt','lkx-cell-select':dataSource.activeRowIndex==rowIndex&&stateParmars.activeColIndex==cellIndex,'lkx-row-select': dataSource.selectLists.indexOf(rowIndex)!=-1}"
                                    :style="[
                                        {'text-align':cellItem.align,
                                        'color': ['opt','sep','expand'].indexOf(cellItem.fieldKind||'fkData')!=-1? undefined : methods['customColor']&&methods['customColor'](rowItem,cellItem),
                                        'background':['opt','sep','expand'].indexOf(cellItem.fieldKind||'fkData') !=-1 ? undefined :methods['customBgColor']&&methods['customBgColor'](rowItem,cellItem)
                                        },
                                        cellItem.fieldKind=='sep'?{left:'0px'}:'',
                                        cellItem.fieldKind=='expand'?{left:visibleColumns[0].width+'px'}:'',
                                        cellItem.fieldKind=='opt'?{right:'0px'}:'',
                                    ]"
                                    @mousedown="handleBodyCellMouseDown"
                                >
                                    <div v-if="cellItem.fieldKind=='opt'" class="lkx-opt-cell lkx-ellipsis no-print">
                                        <slot name="optbut" :datas="datas" :rowItem="rowItem" :rowIndex ="rowIndex">
                                            <lkx-button IconCls="iconfont iconReg" Caption="修改" Type="Primary"  @ButClick.prevent="handleOptClick('edit',rowItem,rowIndex)" :disabled="methods.notAllowEdit&&methods.notAllowEdit(rowItem)"></lkx-button>
                                            <lkx-button IconCls="iconfont iconDelete" Caption="删除" Type="Danger" @ButClick.prevent="handleOptClick('delete',rowItem,rowIndex)" :disabled="methods.notAllowDel&&methods.notAllowDel(rowItem)">删除</lkx-button>
                                        </slot>
                                    </div>
                                    <div v-if="cellItem.fieldKind=='sep'" class="lkx-sep-cell lkx-ellipsis">
                                        <span class="lkx-sep-cell-serial">{{(pagerConfig.curPage -1)*pagerConfig.pageSize + rowIndex+1}} </span>
                                        <LkxIcons
                                            class="lkx-sep-cell-indicator lkx-icon no-print" 
                                            :class="{'lkx-icon-right': dataSource.activeRowIndex==rowIndex}"/>
                                    </div>
                                    <div v-if="cellItem.fieldKind=='expand'" class="lkx-sep-cell lkx-ellipsis  no-print">
                                        <LkxIcons
                                            class="lkx-sep-cell-expand lkx-icon lkx-icon-arrowRight" 
                                            :class= "[(rowItem.expanded == true)?'lkx-icon-arrowDown':'lkx-icon-arrowRight']"/>
                                    </div>
                                    <div class="lkx-ellipsis lkx-cell-value">
                                        <InputIndicator  ref="lkxInputIndicator"   v-if="getVisibleInputIndicator(rowItem,cellItem,cellIndex,rowIndex)" class="no-print"
                                            :dataSource="dataSource" :gridAction="gridAction" :rowData="rowItem" :fieldName="cellItem.fieldName" 
                                            :inputType="cellItem.inputType"
                                            :dataType="cellItem.dataType"
                                            :inputFormat="cellItem.format"
                                            :allowInputString="cellItem.allowInputString"
                                            :numberFlg="cellItem.numberFlg"
                                            :indicatorButtons="cellItem.indicatorButtons"
                                            :dropListConfig="cellItem.dropListConfig"
                                            @indicatorButtonClick="handleIndicatorButtonClick($event,cellItem)"
                                            v-model="rowItem[cellItem.fieldName.toLocaleLowerCase()]"
                                        />
                                        <span v-else>{{formater(rowItem,cellItem,rowIndex)}}</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot v-if="tableConfig.gridFooter">
                            <tr class="lkx-table-foot-row">
                                <td v-for="(item,index) in visibleColumns" :name="item.fieldName" :key="index" 
                                    class="lkx-cell lkx-table-foot-column "
                                    :class="fixedTfootCls(item,1,index+1)"
                                    :style="{
                                        textAlign:(item.footers&&item.footers.align)||item.align,
                                        left:item.fieldKind=='expand'?visibleColumns[0].width+'px':''
                                    }"
                                >
                                    <div class="lkx-cell-value  lkx-ellipsis">{{footerFormater(item,datas)}}</div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                
                </div>
                <slot name ="TableContent"> </slot>
                <slot v-if="!$slots.TableContent" name="footer">
                    <LkxParger v-if="tableConfig.parger" :whereStr="pagerConfig.whereStr" :pageSize="pagerConfig.pageSize" :curPage="pagerConfig.curPage" :total="Number(dataSource.dataSetRowCount)" 
                        @setPage="handleSetPage"
                        @setPageSize="handleSetPageSize"
                    />
                </slot>
            </div>
            <div class="lkx-table-slave-wrapper"  @dblclick="handleGriddblClick">
                <slot name='slave'></slot>
            </div>
        </div>
    </slot>
    <div v-if="startPrint"  ref = "PrintDom" class="Print">
        <LkxPrint 
            :Columns="visibleColumns" 
            :DataSet="printDataSet" 
            :HeaderData="headerData" 
            :Title="tableConfig.title" 
            :Config="gridAction.PrintConfig" 
            :CommonDatas="gridAction.commonDatas"
            :UserName = "tableConfig.userName"
        ></LkxPrint>
    </div>
</div>

</template>

<script setup lang="ts"> 
import {reactive,watch,ref, onMounted, onUnmounted,computed, toRefs, nextTick} from 'vue'
import {getStringWidth,swapCell,getParentNode,fieldToColIndex,fixedTheadCls,fixedTfootCls,getHeadColumns,
    getBeforeCellTotalWidth,getRowNumber,export2Excel,useComputed} from './gridUtil'
import lkxUitl from '@v4x/utils/lkxUtil'
import {TableColumnsType,PagerConfigType,TablePropsType,TableRowDataType,TableMethodsType,
    TalbeStatusType,PopupMenuDataType,TableConfigType,DataSourceType,
    TableEventsType,ToolsBarConfigType,ModalConfigType,SearchBoxConfigType} from '@v4x/ui'
import LkxToolsBar from '../LkxToolsBar/lkxToolsBar.vue';
import LkxParger from '../LkxPager/pager.vue';
import SearchBox from '../SearchWin/SearchBox.vue';
import LkxPrint from '../LkxPrint/index.vue';
import LkxIcons from '../LkxIcons/Icons.vue';
import LkxButton from '../LkxButton/button.vue'
import InputIndicator from '../InputIndicator/index.vue'
import {popupMenu} from "@v4x/ui";
import type { GridProps } from './types'

const props = withDefaults(defineProps<GridProps>(), {
    columns: () => [],
    power: () => ({
        allowedExport: true,
        allowedSaveStyle: true,
        allowedClearStyle: true,
        allowedCancelCol: true,
        allowedRecoveryCol: true,
        allowedTableSet: true
    }),
    dataSource: () => ({} as DataSourceType),
    gridAction: () => null,
    printConfig: () => null,
    headerData: () => null,
    loading: false,
    loadText: '数据加载中...',
    methods: () => ({} as TableMethodsType),
    events: () => ({} as TableEventsType),
    tableConfig: () => ({
        id: '',
        sep: true,
        sepWidth: 50,
        expand: false,
        expandWidth: 30,
        opt: true,
        toolsbar: false,
        parger: true,
        gridFooter: true,
        readOnly: false,
        title: '',
        draggable: false,
        userName:''
    } as TableConfigType),
    toolsBarConfig: () => ({} as ToolsBarConfigType),
    serachBoxConfig: () => ({ open: false, title: '万能查询器' }),
    pagerConfig: () => ({ pageSize: 20, curPage: 1, total: 0 })
})
        const PrintDom      =   ref<null | HTMLElement>(null); //dom
        const lkxTableWrapper      =   ref<null | HTMLElement>(null); //dom
        const Table      =   ref<null | HTMLElement>(null); //dom
        const lkxInputIndicator =  ref<null | HTMLElement>(null); //dom
        const ExpandRow =   ref<null | HTMLElement>(null);
        const LkxPopupMenu = ref<null | HTMLElement>(null);
        const expanded = ref(false) 
        const startPrint = ref(false)
        const printDataSet = ref([] as any)
        const popupMenuData: PopupMenuDataType = reactive({
            pointXy:{
                left:0,
                top:0
            },
            items: [
                {code:'_CopyTable',type:'save',caption:'复制表格',children:[]},
                {code:'separate',type:'',caption:'-',children:[]},
                {code:'_CancelCell',type:'cancel',caption:'取消该列',children:[]},
                {code:'_RestoreAllCell',type:'refresh',caption:'恢复所有列',children:[]},
                {code:'separate',type:'',caption:'-',children:[]},
                {code:'_SaveCellStyle',type:'save',caption:'保存表格样式',children:[]},
                {code:'_ClearCellStyle',type:'clear',caption:'清除表格样式',children:[]},
                {code:'separate',type:'',caption:'-',children:[]},
                {code:'_Export',type:'exportOut',caption:'导出数据',children:[]},
                {code:'_TableSet',type:'tableSet',caption:'表格设置',children:[]}
            ],
            cellIndex: -1
        })
        const visibleInputIndicator = ref(false);
        const stateParmars: TalbeStatusType = reactive({
            headRowNumber           :   1,  //表头行数
           // activeRowIndex          :   0,//当前激活行
            activeColIndex          :   0,//当前激活列
            expandRowIndex          :   -1,//展开行
           // selectList              :   [0],//当前选中行
            modeVaue                :   false, //模态窗口是否打开
            mouseIsDown             :   false,//按下
            mouseIsDownOfBody       :   false,
            startResize             :   false,//开始拖动列宽
            startSwap               :   false,//开始列交换
            thisCellIndex           :   -1,//当前列号
            fromCellIndex           :   -1,//原列号
            toCellIndex             :   -1,//新列号
            resizeStatusBoxLeft     :   0,//状态线左边界
            resizeStatusBoxTop     :    0,//状态线上边界
            resizeStatusBoxHeight   :   1000,
            curResizeStatusBoxLeft  :   0 //状态线原左边界
        })
        const gridDataState: TablePropsType = reactive({
            columns:[]  as TableColumnsType[],
            datas:props.dataSource?.dataSet as TableRowDataType[],
            allDatas:[] as TableRowDataType[],
            methods:props.methods as TableMethodsType,
            events: props.events as TableEventsType
        })
        const allowedDraggble = ref(false)
        const _SetDefaultColumn=()=>{
            /*调入保存的格式*/
            const _SaveCellStyleStr =localStorage.getItem(props.tableConfig.id||'')
            const _SaveCellStyle = _SaveCellStyleStr?JSON.parse(_SaveCellStyleStr):''
            
            const _Columns = props.columns.map((item)=>{
                return Object.assign(
                        { align: 'left',
                            dataType: 'string',//数据类型
                            fieldKind: 'fkData',//数据方式
                            width: 100,//宽度
                            visible: true,//是否显示
                            readonly: false,//只读
                            sort:true,
                            sortStyle:'',
                            footers: {
                            }
                        },item 
                    )
            })
            gridDataState.columns = _SaveCellStyle||_Columns;
            if (!_SaveCellStyle){
                if (props.tableConfig.expand){
                    gridDataState.columns.unshift({
                        align: 'center',
                        dataType: 'number',//数据类型
                        fieldKind: 'expand',//数据方式
                        fieldName: 'expand',//字段名
                        width: props.tableConfig.expandWidth||24,//宽度
                        title: '#',//标题
                        fixed: 'left',
                    })     
                }
                if (props.tableConfig.sep){
                    gridDataState.columns.unshift({
                        align: 'center',
                        dataType: 'number',//数据类型
                        fieldKind: 'sep',//数据方式
                        fieldName: 'sep',//字段名
                        width: props.tableConfig.sepWidth||'50',//宽度,//宽度
                        title: '#',//标题
                        fixed: 'left',
                    })     
                }
                if (props.tableConfig.opt){
                    gridDataState.columns.push({
                        align: 'center',
                        dataType: 'number',//数据类型
                        fieldKind: 'opt',//数据方式
                        fieldName: 'opt',//字段名
                        width: props.tableConfig.optWidth||135,//宽度
                        title: '操作',//标题
                        fixed: 'right',
                    })  
                }   
            }
            stateParmars.activeColIndex=  Number(props.tableConfig.sep)+Number(props.tableConfig.expand||0)
        }
        _SetDefaultColumn();
        
        
        const headColumns = ref([] as any[])//不知为什么用reactive不更新视图
        const getVisibleInputIndicator=(rowItem: any,cellItem: any,cellIndex: number,rowIndex: number)=>{
            const _c = stateParmars.activeColIndex==cellIndex&&props.dataSource?.activeRowIndex==rowIndex
            if (!_c) return false;
            const _ActiveColIndex = fieldToColIndex(gridDataState.columns,cellItem.fieldName);//当前列已排除隐藏列
            const _a = !props.tableConfig.readOnly &&!gridDataState.columns[_ActiveColIndex].readonly
            const _b =  props.dataSource.NotAllowOperationList.indexOf(rowItem[props.dataSource.keyFieldName])==-1&&
                gridDataState.methods.allowEdit(rowItem)
            visibleInputIndicator.value = _a&&_b&&_c
            return _a&&_b&&_c
        }
        /*计算属性*/
        const visibleColumns = computed(()=>{
            const _Columns = gridDataState.columns.filter((item: any)=>{
                return item.visible != false
            })
            return _Columns
        })
        /**左边fiexd宽度 */
        const fiexdLeftCellWidth = computed(()=>{
            const $lkxTable = (Table.value as HTMLTableElement)
            return ($lkxTable.querySelector('.fixed-left') as HTMLElement)?.offsetWidth ||0
        })
         /**右边操作列宽 */
        const fiexdRightCellWidth = computed(()=>{
            const $lkxTable = (Table.value as HTMLTableElement)
            return ($lkxTable.querySelector('.fixed-right') as HTMLElement)?.offsetWidth ||0
           
        })

        const initTableParmars = ()=>{
          //  stateParmars.activeRowIndex = 0
          //  stateParmars.selectList = [0]
        }
        /**表头与页脚总高度 */
        const tableHeadAndFootHeight = computed(()=>{
            const $lkxTable = (Table.value as HTMLTableElement)
            const els = $lkxTable.querySelectorAll('.lkx-table-head-row,.lkx-table-foot-row')
            let res = 0
            for (let i=0;i<els.length;i++){
                res += els[i].clientHeight
            }
            return res
        })
       
        /**计算横向滚动距离,以便将部分隐藏的表格列展示出来
         * watch列改变触发
         * Td宽度+td左边界 > 表格总宽度 - 表格右边操作列宽  --> 横向滚动距离 + td宽度
         */
        const calcuHscroll = ()=>{
            const $lkxTable = (Table.value as HTMLTableElement)
            const thistd = $lkxTable.rows[props.dataSource?.activeRowIndex+stateParmars.headRowNumber].cells[stateParmars.activeColIndex]
            const $lkxTableWrapper = lkxTableWrapper.value as HTMLDivElement
            const lkxTableWrapperRect =  $lkxTableWrapper.getBoundingClientRect() 
            const tdRect = thistd.getBoundingClientRect()
            const hiddenRigthWidth = (tdRect.right)-(lkxTableWrapperRect.right-fiexdRightCellWidth.value)
            const hiddenLeftWidth = (tdRect.left)-(lkxTableWrapperRect.left+fiexdLeftCellWidth.value)
           if (hiddenRigthWidth>=0){
                //右边隐藏
               (lkxTableWrapper.value as HTMLElement).scrollLeft += hiddenRigthWidth+40;
           }
           if (hiddenLeftWidth<=0){
                //左边隐藏
               (lkxTableWrapper.value as HTMLElement).scrollLeft += hiddenLeftWidth-20;
           }

        }
        /**计算纵向滚动距离,以便将部分隐藏的表格行展示出来(注：有展开行时未试过)
         * watch行改变触发
         * 当前行高度+顶部 > 表格容器高度+滚动高度-24(滚动条高度) -->向下
         * 当前行高度< 滚动高度+24(滚动条高度) -->向上
         */
        const calcuVscroll = ()=>{ 
            const $lkxTableWrapper = lkxTableWrapper.value as HTMLDivElement
            const $lkxTable = (Table.value as HTMLTableElement)
            const thisRow = $lkxTable.rows[props.dataSource.activeRowIndex+stateParmars.headRowNumber];
            if (thisRow.offsetTop+thisRow.clientHeight > $lkxTableWrapper.clientHeight+$lkxTableWrapper.scrollTop-24){ //14是滚动条元素调高度
                (lkxTableWrapper.value as HTMLElement).scrollTop += thisRow.clientHeight;
            } 
            if (thisRow.offsetTop<=(lkxTableWrapper.value as HTMLElement).scrollTop+24){ //24是滚动条元素调高度
                (lkxTableWrapper.value as HTMLElement).scrollTop -= thisRow.clientHeight;
            }
        }
        /**
         * 内容格式化
         * @param rowitem Object 行数据
         * @param column LkxColumnsType 列
         * @returns any
         */
        const formater = (rowItem: TableRowDataType,column: TableColumnsType,rowIndex=0): any=>{
            // console.log((lkxTable.value as HTMLTableElement)?.rows[stateParmars.activeRowIndex+1].cells[stateParmars.activeColIndex].getAttribute('value'))
           // console.log(rowIndex)
            let res = ''
            const _fieldName = column.fieldName.toLocaleLowerCase()
            const _format = column.format||''
            if (column.hideDuplicates&& rowIndex>0&&gridDataState.datas[rowIndex-1][_fieldName]==rowItem[_fieldName]) return res;
           // console.log( column.fieldName)
            if (column.fieldKind == 'fkCalculated'){//计算字段
                 if (!column.calculationer){
                    console.error('列属性中无指定计算方法名【calculationer无指定名称】');
                    return '';
                }
                if (!gridDataState.methods['rowCalculated']){
                    console.error('methods中不存在计算方法设置对象rowCalculated');
                    return '';
                }
                const _value = gridDataState.methods['rowCalculated'][column.calculationer](rowItem )
               // const _value = computedCalculated(gridDataState.methods['rowCalculated'][column.calculationer],rowItem)
                rowItem[_fieldName] = _value //更新对应计算字段值
                if (column.customFormater){ //存在自定义格式化方法
                    if (!gridDataState.methods['customFormater']){
                        console.error('methods中不存在自定议格式化方法设置对象customFormater');
                        return '';
                    }
                    if(typeof column.customFormater =='function'){
                        return column.customFormater(_value,rowItem);
                    } else {
                        if (!gridDataState.methods['customFormater'][column.customFormater]){
                            console.error('methods中自定议对象customFormater中不存在方法'+column.customFormater);
                            return '';
                        }
                        return gridDataState.methods['customFormater'][column.customFormater](_value,rowItem)
                    }
                } else {
                    return lkxUitl.numberFormat(_value,_format) 
                }
            }
            if (column.inputType=='drop'){
                 return lkxUitl.getValueFromArray(
                        /**如果来源是数据源名字（dropConfig?.dropListDatasName有值）计算得出，否则直接用 */
                        column.dropListConfig?.dropListDatasName?props.gridAction.commonDatas[column.dropListConfig?.dropListDatasName]:column.dropListConfig?.dropListDatas,
                        column.dropListConfig?.resultFieldName||'idcode',
                        column.dropListConfig?.displayFieldName||'name',
                        rowItem[_fieldName]
                    )
            }
            if (column.customFormater){ //存在自定义格式化方法
                if(typeof column.customFormater =='function'){
                    return column.customFormater(rowItem[_fieldName],rowItem);
                } else {
                    if (gridDataState.methods['customFormater'])
                        return gridDataState.methods['customFormater'][column.customFormater](rowItem[_fieldName],rowItem)
                    else 
                        console.error('自定议格式化【customFormater】中没定议对应方法：'+column.customFormater)
                }
            } else {
                switch (column.dataType?.toLocaleLowerCase()){
                    case 'number':
                        res = lkxUitl.numberFormat(rowItem[_fieldName],_format)
                        break;
                    case 'datetime':
                        res = lkxUitl.dateFormat(rowItem[_fieldName],_format)
                        break;
                    case 'boolean':
                        if (rowItem[_fieldName]=='1'){
                            res = '√'
                        } else {
                            res = '×'
                        }
                        break;
                    default:
                        res = rowItem[_fieldName]
                        break;
                }
            }
           // const d = new Date()
           // d.getMilliseconds()
           // return res+ d.getMilliseconds()
           
           return res
        }
        const rowCalculated = (fn: Function,row: any)=>{
            return fn(row)
        }
        const computedCalculated  = useComputed(rowCalculated)
        const computedFormat = useComputed(formater)
        /**
         * 合计行格式化
         * @param column LkxColumnsType 列
         * @param datas Array 表数据
         * @returns any
         */
        const footerFormater = computed(()=>{
            return (column: TableColumnsType,datas: TableRowDataType[])=>{
                if (!column) return
                if (!column.footers) return
                if (column.footers.calculationer&&gridDataState.methods['sumCalculated']){
                   // console.log(column.footers.calculationer,column.fieldName)
                   try {
                        const _value = gridDataState.methods['sumCalculated'][column.footers.calculationer](datas);
                         return lkxUitl.numberFormat(_value,column.footers.format||column.format||'') 
                   } catch (error) {
                        console.error('字段'+column.fieldName+'的合计方法'+column.footers.calculationer+ '没有定义在methods中sumCalculated对象中')
                   }
                  
                   
                } 
                return column.footers.value||''
            }
        })

        const scroll = (flg: string)=>{
            const $lkxTableWrapper = lkxTableWrapper.value as HTMLDivElement;
            $lkxTableWrapper.scrollTop = $lkxTableWrapper.scrollHeight+500;
        }
        const active = ()=>{
            if (lkxTableWrapper.value){
                (lkxTableWrapper.value as any).focus();
            }
           
        }
        const handleGridFocus = (e: FocusEvent)=>{
            gridDataState.events.gridFocus&&gridDataState.events.gridFocus(props.gridAction,Table);
            if (Array.isArray(lkxInputIndicator.value)) {
                (lkxInputIndicator.value as any[])?.[0]?.active()
            } else {
                (lkxInputIndicator.value as any)?.active()
            }
        }
        const handleHeadCellMouseDown = (e: MouseEvent)=>{
            const _node: any = getParentNode((e.target as HTMLElement),'TH');
            if (['sep','expand','opt'].indexOf(_node.getAttribute('name'))!=-1) return;
            const _scorllNode: any = getParentNode((e.target as HTMLElement),'lkx-table-content')
            stateParmars.thisCellIndex = fieldToColIndex(gridDataState.columns,_node.getAttribute('name'))
            stateParmars.fromCellIndex = stateParmars.thisCellIndex
            stateParmars.toCellIndex = stateParmars.thisCellIndex
            stateParmars.resizeStatusBoxTop = _scorllNode.scrollTop;
            stateParmars.resizeStatusBoxLeft = _node.offsetLeft
            stateParmars.mouseIsDown = true
            stateParmars.startSwap = true
        }
        const handleResizeBoxMouseDown = (e: MouseEvent)=>{
            const _node: any = getParentNode((e.target as HTMLElement),'TH')
            const _scorllNode: any = getParentNode((e.target as HTMLElement),'lkx-table-content')
            stateParmars.resizeStatusBoxTop = _scorllNode.scrollTop;
            stateParmars.resizeStatusBoxLeft = _node.offsetLeft+_node.clientWidth
            stateParmars.curResizeStatusBoxLeft = stateParmars.resizeStatusBoxLeft
            stateParmars.mouseIsDown = true
            stateParmars.startResize = true
            stateParmars.thisCellIndex = fieldToColIndex(gridDataState.columns,_node.getAttribute('name'))
        }
        const handleBodyCellMouseDown = (e: MouseEvent)=>{
            stateParmars.mouseIsDownOfBody = !stateParmars.mouseIsDownOfBody
        }
        const handleMoseUp = (e: MouseEvent)=>{
            stateParmars.mouseIsDown = false
            /*列宽移动*/
            if (stateParmars.startResize){
                stateParmars.startResize = false;
                gridDataState.columns[stateParmars.thisCellIndex].width = gridDataState.columns[stateParmars.thisCellIndex].width as number +  stateParmars.resizeStatusBoxLeft -stateParmars. curResizeStatusBoxLeft
            }
            /*列移动*/
            if (stateParmars.startSwap){
                stateParmars.startSwap = false
                const _node: any = getParentNode((e.target as HTMLElement),'TH');
                if (['sep','expand','opt'].indexOf(_node.getAttribute('name'))!=-1) return;//固定列不可能交换
                stateParmars.toCellIndex = fieldToColIndex(gridDataState.columns,_node.getAttribute('name'))
                if (visibleInputIndicator.value){
                   const _thisCellIndex = fieldToColIndex(visibleColumns.value,_node.getAttribute('name'))
                    stateParmars.activeColIndex = _thisCellIndex 
                }
                swapCell(gridDataState.columns,stateParmars.fromCellIndex,stateParmars.toCellIndex)
            }
        }
        const handleMoseMove = (e: MouseEvent)=>{
           /* const _node: any = getParentNode((e.target as HTMLElement),'TD')
            if (_node&&stateParmars.mouseIsDownOfBody){
                console.log(_node)
                _node.classList.add('lkx-cell-select')
            }
             */  
            /*列宽移动*/
            if (stateParmars.startResize){
                const $lkxTab = (lkxTableWrapper as any).value
                const _nX = e.x - $lkxTab.getBoundingClientRect().left + $lkxTab.scrollLeft
                const _nW = gridDataState.columns[stateParmars.thisCellIndex].width +  _nX - stateParmars.curResizeStatusBoxLeft
                if (_nW>20){
                    stateParmars.resizeStatusBoxLeft = _nX
                }
            }
            /*列移动*/
            if (stateParmars.startSwap){
                const _node: any = getParentNode((e.target as HTMLElement),'TH')
                if (!_node||['sep','expand','opt'].indexOf(_node.getAttribute('name'))!=-1) return //固定列
                stateParmars.resizeStatusBoxLeft = _node.offsetLeft
            }
        }
        /**
         * 生成导出数据，将下接字段的值转换
         */
        const builtExportData = (datas: any)=>{
            const _ExportData = JSON.parse(JSON.stringify(datas))
            for (let i=0;i<gridDataState.columns.length;i++){
                for (let j=0;j<_ExportData.length;j++){
                    const column = gridDataState.columns[i];
                    if (column.inputType == 'drop'){
                        _ExportData[j][column.fieldName.toLocaleLowerCase()] = 
                        lkxUitl.getValueFromArray(
                            /**如果来源是数据源名字（dropConfig?.dropListDatasName有值）计算得出，否则直接用 */
                            column.dropListConfig?.dropListDatasName?props.gridAction.commonDatas[column.dropListConfig?.dropListDatasName]:column.dropListConfig?.dropListDatas,
                            column.dropListConfig?.resultFieldName||'idcode',
                            column.dropListConfig?.displayFieldName||'name',
                            _ExportData[j][column.fieldName?.toLocaleLowerCase()]
                        )
                    }
                }
            }
            return _ExportData;
        }
        const  hanadleRightClick= async (e: MouseEvent)=>{
            const handlePopupItemClick = async (item: any,cellIndex: any)=>{
                switch (item.code){
                    case '_CopyTable':{
                        const _Copy = (event: any)=>{
                             console.log(event,'copy')
                            const clipboardData = event.clipboardData;
                            // 拼接数据 
                            // const first = visibleColumns.value.map(item=>item.title).join('\t')
                                const sec = gridDataState.datas.map(item=> `${item.name}\t${item.distotal}`).join('\n')
                                const selection = `${sec}`
                                clipboardData?.setData('text/plain', selection.toString());
                                event.preventDefault(); 
                            }
                         document.addEventListener("copy", _Copy)
                        document.execCommand('copy')
                        document.removeEventListener("copy",_Copy)
                        break;
                    }
                    case '_CancelCell':
                        if (!props.power.allowedCancelCol) return;
                        if (cellIndex>=0&&!gridDataState.columns[cellIndex].fixed) {
                            gridDataState.columns[cellIndex].visible = false
                        }
                        break;
                    case '_RestoreAllCell':
                        if (!props.power.allowedRecoveryCol) return;
                        gridDataState.columns.map((item)=>{
                            item.visible = true
                        })
                        break;
                    case '_SaveCellStyle':{
                        if (!props.power.allowedSaveStyle) return;
                        const ObjStr = JSON.stringify(gridDataState.columns)
                        localStorage.setItem(props.tableConfig.id||'', ObjStr);
                        break;
                    }
                    case '_ClearCellStyle':
                        if (!props.power.allowedClearStyle) return;
                        localStorage.removeItem(props.tableConfig.id||'');
                        break;
                    case '_Export':
                        if (!props.power.allowedExport) return;
                        if (gridDataState.events.beforeExport){
                            gridDataState.events.beforeExport().then((rs: any)=>{
                                export2Excel(gridDataState.columns,builtExportData(rs))
                            });
                        } else {
                            export2Excel(gridDataState.columns,builtExportData(gridDataState.datas))
                        }
                        break;
                }
            }
            e.preventDefault();
            const _tdNode: any = getParentNode((e.target as HTMLElement),'TD')
            if (_tdNode){
                const activeColIndex = fieldToColIndex(gridDataState.columns,_tdNode.getAttribute('name')) 
                popupMenuData.cellIndex = activeColIndex 
            } else {
                popupMenuData.cellIndex = -1
            } 
            popupMenuData.pointXy = {left:e.x,top: e.y}
            const res = await popupMenu.popup(popupMenuData)
            if (res)
                handlePopupItemClick(res.item,res.cellIndex)
        } 
        const setRowCellIndex = (e: MouseEvent,fieldKind?: string)=>{
            const newRowEl = ExpandRow.value as any
            const _trNode: any = getParentNode((e.target as HTMLElement),'TR')
            const _tdNode: any = getParentNode((e.target as HTMLElement),'TD')
            const _expandRowIndex = newRowEl.rowIndex - stateParmars.headRowNumber
            let  _thisRowIndex: number = _trNode.rowIndex - stateParmars.headRowNumber
            _thisRowIndex = _thisRowIndex - (expanded.value&&_expandRowIndex<_thisRowIndex ?1: 0)
            const _thisCellIndex = fieldToColIndex(visibleColumns.value,_tdNode.getAttribute('name'))
            stateParmars.activeColIndex = _thisCellIndex 
            props.dataSource.setActiveRowIndex(_thisRowIndex,{ctrlKey: e.ctrlKey,shiftKey: e.shiftKey});
            return {rowIndex :_thisRowIndex,cellIndex: _thisCellIndex}
        }
        const handleRowClick = (e: MouseEvent)=>{
            const newRowEl = ExpandRow.value as any
            const doExpand=(curActiveRowIndex: number,thisActiveRowIndex: number)=>{ 
                const _rowIndex =  thisActiveRowIndex + (expanded.value&&stateParmars.expandRowIndex>=0&&stateParmars.expandRowIndex<=props.dataSource.activeRowIndex ?1: 0)
                const thisRowEl = (Table as any).value.getElementsByTagName('tbody')[0].rows[_rowIndex]
                if (curActiveRowIndex == thisActiveRowIndex){ 
                    if (gridDataState.datas[thisActiveRowIndex].expanded == true&&expanded.value){
                        newRowEl.parentNode.removeChild(newRowEl)
                        expanded.value = false
                    } else {
                        expanded.value = true
                    }
                } else {
                    expanded.value = true;
                }
                Object.assign(gridDataState.datas[curActiveRowIndex],{expanded: false})
                Object.assign(gridDataState.datas[thisActiveRowIndex],{expanded: expanded.value})
                
                if (expanded.value){
                   // if (stateParmars.expandRowIndex>=0)
                    //    Object.assign(data.datas[stateParmars.expandRowIndex],{expanded: false})
                    stateParmars.expandRowIndex = thisActiveRowIndex
                    thisRowEl.after(newRowEl)
                }
                gridDataState.events.expand&&gridDataState.events.expand({
                    expanded: expanded.value,
                    datas: gridDataState.datas,
                    rowData: gridDataState.datas[_thisRowCellIndex.rowIndex],
                    rowIndex:props.dataSource.activeRowIndex,
                    colIndex: stateParmars.activeColIndex
                },props.gridAction)
            }
            const _bakActiveRowIndex = props.dataSource.activeRowIndex
            const _bakActiveColIndex = stateParmars.activeColIndex 
            const _thisRowCellIndex = setRowCellIndex(e)
            const _fieldKind = gridDataState.columns[stateParmars.activeColIndex].fieldKind
            allowedDraggble.value = _fieldKind=='sep'&& props.tableConfig.draggable||false
            if (_fieldKind=='expand'||_fieldKind=='sep'||_fieldKind=='opt'){
                if (_fieldKind=='expand'){
                    setTimeout(() => {
                        doExpand(_bakActiveRowIndex,props.dataSource.activeRowIndex)
                    }, 100);
                }
                stateParmars.activeColIndex = _bakActiveColIndex
            }
            const _fieldName = gridDataState.columns[stateParmars.activeColIndex].fieldName
            gridDataState.events.rowClick&&gridDataState.events.rowClick(gridDataState.datas,gridDataState.datas[_thisRowCellIndex.rowIndex],props.dataSource.activeRowIndex,stateParmars.activeColIndex,_fieldName)
        }
        const handleRowDbClick = (e: MouseEvent)=>{
            function getParent(el: any,tagName: string){
                while(el.tagName.toLowerCase()!=tagName){
                    el = el.parentNode;
                }
                return el;
            }
            const _fieldName = getParent(e.target,'td').getAttribute('name');//gridDataState.columns[stateParmars.activeColIndex].fieldName
            gridDataState.events.rowDbClick&&gridDataState.events.rowDbClick(gridDataState.datas,gridDataState.datas[props.dataSource.activeRowIndex],props.dataSource.activeRowIndex,stateParmars.activeColIndex,_fieldName)
        }
        const handleGriddblClick = (e: MouseEvent)=>{
            gridDataState.events.gridDbClick&&gridDataState.events.gridDbClick()
        }
        const handleKeyDown = (e: KeyboardEvent)=>{
          //  console.log(e.key)
            const fixedLeftCellNumber = props.tableConfig.sep&&props.tableConfig.expand?2:props.tableConfig.sep||props.tableConfig.expand?1:0;
                e.preventDefault();
                gridDataState.events.gridKeyDown&&gridDataState.events.gridKeyDown(e)
                /**回车增加行 */
                if (e.key=='Enter'&&gridDataState.datas.length==0&& props.tableConfig.endAutoAppend&&props.gridAction){
                    props.gridAction?.insert();
                    return;
                }
                gridDataState.events.keyDown&&gridDataState.events.keyDown(e, gridDataState.datas[props.dataSource.activeRowIndex])
                switch (e.key){
                    case 'ArrowDown':
                        if (props.dataSource.activeRowIndex == gridDataState.datas.length-1) {
                            if (props.tableConfig.endAutoAppend&&props.gridAction){
                                stateParmars.activeColIndex = fixedLeftCellNumber; 
                                setTimeout(() => {
                                    props.gridAction?.insert()
                                }, 100);
                                
                            } 
                            return
                        }
                        props.dataSource.setActiveRowIndex(props.dataSource.activeRowIndex +1);
                        break;
                    case 'ArrowUp':
                        if (props.dataSource.activeRowIndex == 0) return
                        props.dataSource.setActiveRowIndex(props.dataSource.activeRowIndex -1);
                        break;
                    case 'ArrowRight':
                        if (stateParmars.activeColIndex == visibleColumns.value.length-1-(props.tableConfig.opt?1:0)) return;
                        stateParmars.activeColIndex ++;
                        break;
                    case 'Enter':
                    case 'Tab':
                        do {
                            stateParmars.activeColIndex ++;
                        } while (
                            !props.tableConfig.readOnly&&
                            props.tableConfig.enterJumpReadOnlyCol&&
                            visibleColumns.value[stateParmars.activeColIndex]?.readonly
                        )    
                    
                        if (stateParmars.activeColIndex == visibleColumns.value.length-(props.tableConfig.opt?1:0)) {
                            if (props.dataSource.activeRowIndex == gridDataState.datas.length-1) {
                                if (props.tableConfig.endAutoAppend&&props.gridAction){
                                    stateParmars.activeColIndex = fixedLeftCellNumber; 
                                    setTimeout(() => {
                                        props.gridAction?.insert()
                                    }, 100);
                                } 
                                return
                            }
                            props.dataSource.setActiveRowIndex(props.dataSource.activeRowIndex + 1);
                            stateParmars.activeColIndex = fixedLeftCellNumber;
                            (lkxTableWrapper.value as HTMLElement).scrollLeft = 0;
                        }
                        break;
                    case 'ArrowLeft':
                        if (stateParmars.activeColIndex == fixedLeftCellNumber) return
                        stateParmars.activeColIndex --
                        break;
                    case 'Home':
                        stateParmars.activeColIndex =fixedLeftCellNumber
                        break;
                    case 'End':
                        stateParmars.activeColIndex = visibleColumns.value.length-1
                        break;
                }
        }
        const handleOptClick = (flg: string,rowItem: any,rowIndex: number)=>{
            props.dataSource.setActiveRowIndex(rowIndex);
            switch (flg){
                case 'edit':
                    gridDataState.events.rowEdit&&gridDataState.events.rowEdit(rowItem,rowIndex)
                    break
                case 'delete':
                    gridDataState.events.rowDelete&&gridDataState.events.rowDelete(rowIndex)
                    break
            }
            
        }
        const handleSort = (flg: string,item: any)=>{
            if (flg == item.sortStyle) return
            headColumns.value.forEach((row: any[])=>{
                row.forEach((col: any)=>{
                    col.sortStyle = ''
                })
            })
            item.sortStyle = flg
            gridDataState.events.sort&&gridDataState.events.sort(flg,item.fieldName,initTableParmars)
        }
        const handleSetPage = (curPage: number)=>{
            gridDataState.events.changePage&&gridDataState.events.changePage(curPage,initTableParmars);
            active()
        }
        const handleSetPageSize = (pageSize: number) =>{
            gridDataState.events.changePageSize&&gridDataState.events.changePageSize(pageSize,initTableParmars)
            active()
        }
        const handleIndicatorButtonClick = (data: any,item: any)=>{
            gridDataState.events[item.indicatorButtonEventName]&&gridDataState.events[item.indicatorButtonEventName](data)
        }
        const handleDragStart=(Event: DragEvent,RowItem: any,RowIndex: number) =>{
            if ((Event.target as any).tagName === 'TR') {
                (Event.dataTransfer as any).effectAllowed = 'move';
                gridDataState.events.onDragStart&&gridDataState.events.onDragStart(Event,RowItem,RowIndex)
            }
        }
        const handleDragOver=(Event: DragEvent)=>{
            if ((Event.target as any).parentNode.parentNode.getAttribute('name')=='sep'){
                 Event.preventDefault();
                (Event.dataTransfer as any).dropEffect = 'move';
            }
           
        }
        const handleDragDrop=(Event: DragEvent,TragetRowItem: any,RowIndex: number) =>{
            Event.preventDefault();
            allowedDraggble.value = false;
            gridDataState.events.onDragEnd&&gridDataState.events.onDragEnd(Event,TragetRowItem,RowIndex)
        }
        const print = async (): Promise<boolean>=>{ 
            if (gridDataState.events.beforePrint){
                const res = await gridDataState.events.beforePrint();
                if (res==false){
                    return new Promise((resolve, reject)=>{
                        resolve(true)
                    })
                } else {
                    printDataSet.value = res;
                    startPrint.value = true;
                    return new Promise((resolve, reject)=>{
                        nextTick(() => resolve(true))
                    })
                }            
            } else {
                printDataSet.value = gridDataState.datas;
                startPrint.value = true;
                return new Promise((resolve, reject)=>{
                    nextTick(() => resolve(true))
                })
            }

        }
        stateParmars.headRowNumber = getRowNumber(gridDataState.columns)
        headColumns.value = getHeadColumns(gridDataState.columns)

        /*监听*/
        watch(
            ()=>visibleInputIndicator.value,
            (newVal,oldVal) => {
                if (newVal==false){
                    setTimeout(() => {
                        active()
                    }, 30);
                }
            }
        )
        watch(
            ()=>props.columns,
            (n,o)=>{
               _SetDefaultColumn()
               
            }
        )
        watch(
            () => gridDataState.columns,
            (newColumns, oldColumns) => {
                headColumns.value = getHeadColumns(newColumns)
            },
            {
                deep: true,
            }
        )
        watch(
            () => props.dataSource?.dataSet,
            (newValue , oldValue) => {
                gridDataState.datas = newValue as TableRowDataType[]
            },
            {
                deep: true,
            }
        )
       /* watch(
            ()=>stateParmars.activeRowIndex,
            (nV,oV)=>{
                props.dataSource.setSelectLists(stateParmars.selectList)
                props.dataSource.setActiveRowIndex(stateParmars.activeRowIndex);
                calcuVscroll();
            }
        )*/
        watch(
            ()=>stateParmars.activeColIndex,
            (nV,oV)=>{
                props.gridAction.setActiveColIndex(stateParmars.activeColIndex);
                calcuHscroll();  
            }
        )
        watch(
            ()=>props.pagerConfig.curPage,
            (nv,ov)=>{
                const serial = (props.pagerConfig.curPage-1)*props.pagerConfig.pageSize
                const nW = getStringWidth(serial.toString());
                if (nW>50){
                     gridDataState.columns[0].width = nW;
                }
               
            }
        )
        /**
         * 监听 状态为增加时
         */
        watch(
            ()=>props.dataSource?.status,
            (nV,oV)=>{
               if (nV == 'ins'){
                    setTimeout(() => {
                        scroll('end');
                       // stateParmars.activeRowIndex = props.dataSource?.activeRowIndex;
                      //  stateParmars.selectList = [props.dataSource?.activeRowIndex]
                    }, 0);
               } /*else { 
                    setTimeout(() => {
                       // stateParmars.activeRowIndex = props.dataSource?.activeRowIndex;
                       // stateParmars.selectList = [props.dataSource?.activeRowIndex]
                    }, 0);
                   
               }*/
            }
        )
        watch(
            ()=>props.dataSource?.activeRowIndex,
            (nV,oV)=>{ 
                calcuVscroll();
                gridDataState.events.indexChange&&gridDataState.events.indexChange(gridDataState.datas[nV])
                //stateParmars.activeRowIndex = props.dataSource?.activeRowIndex;
                //stateParmars.selectList = [props.dataSource?.activeRowIndex]
            },
        )
        watch(
            ()=>props.gridAction?.activeColIndex,
            (nV,oV)=>{  
  
                stateParmars.activeColIndex = nV;
            }
        )
        /*生命勾子*/
        onMounted(() => {
            document.addEventListener('mouseup',handleMoseUp)
            document.addEventListener('mousemove',handleMoseMove)
            //lkxUitl.addWaterMarker('已提交',(lkxTableWrapper.value as HTMLDivElement),'','red',200,400)
        })
        onUnmounted(()=>{
            document.removeEventListener('mousedown',handleMoseUp)
            document.removeEventListener('mousemove',handleMoseMove)
        })
        const {datas} = toRefs(gridDataState);
         
        defineExpose({
            gridDataState,
            PrintDom,
            lkxTableWrapper,
            Table,
            startPrint,
            printDataSet,
            lkxInputIndicator,
            ExpandRow,
            LkxPopupMenu,
            allowedDraggble,
            fixedTheadCls,
            fixedTfootCls,
            fieldToColIndex,
            headColumns,
            stateParmars,
            popupMenuData,
            getBeforeCellTotalWidth,
            expanded,
            getVisibleInputIndicator,
            handleGridFocus,
            handleResizeBoxMouseDown,
            handleHeadCellMouseDown,
            handleBodyCellMouseDown,
            hanadleRightClick,
            handleRowClick,
            handleRowDbClick,
            handleGriddblClick,
            handleKeyDown,
            handleOptClick,
            handleSort,
            handleSetPage,
            handleSetPageSize,
            handleIndicatorButtonClick,
            active,
            scroll,
            formater,
            computedFormat,
            visibleColumns,
            visibleInputIndicator,
            footerFormater,
            print,
            handleDragStart,handleDragOver,handleDragDrop
        })
</script>

<style lang="scss"  scoped>
    .emtpy{
       td{text-align: center;}
    }
    /*.lkx-table-slave-wrapper{
        
    }*/
    .lkx-table-main-wrapper{ 
        height: 100%;
        width: 0;
        flex: 1;//width:0; flex:1 同时使用防止父元素宽度被子元素撑开
        position: relative;
        display: flex;
        flex-direction: column;
        overflow: hidden;
       
    }
    .lkx-table-wrapper{
        position: relative;
        height: 100%;
        width: 100%;
        display: flex;
        flex-shrink: 0;
        flex-direction: column;
        overflow: hidden;
        .lkx-table-container{
            width: 100%;
            height:100%;  
            display: flex;
            flex-direction: row;
            position: relative;
            overflow: hidden;
            
        }
        .mask {
            position: absolute;
            width: 100%;
            height: 100%;
            z-index: 10;
            background-color: rgba($color: #000000, $alpha: 0.2);
        }
        .lkx-table-content{
            position: relative;
            flex: 1;
            overflow:scroll;
            width: 100%;
           // border:1px solid gray;
            outline: none;//不显示焦点线
        }
        /*状态指示条*/
        .lkx-resize-box{
            position: absolute;
            z-index: 10;
            height: 100%;
            border-left: 1px solid rgb(47, 0, 255);
            cursor: col-resize;
        }
        /*表格*/
        .lkx-table{
           width: 0;
            table-layout: fixed;
            //border-collapse:collapse;  
            .lkx-cell {
                padding:0 4px;
                height: $table-row-height;
                line-height: $table-row-height;
            }
            /*固定位置  */ 
            .fixed{
                position:sticky;
                background-color:  $table-fixed-basic-color;
                user-select:none;
                /*顶部*/
                &-top{
                    &-1{
                        top:0; 
                       /* border-right: 1px solid grey;
                        border-top: 1px solid grey;
                        border-bottom: 1px solid grey;*/
                    }
                    &-2{
                        top:$table-row-height; 
                       /* border-right: 1px solid grey;
                        border-bottom: 1px solid grey;*/
                    } 
                }
                /* 底部  */
                &-bottom {
                    z-index:1;
                    &-1{
                        bottom:0; 
                    }
                }
                /* 左边  */
                &-left {
                    z-index:2;
                    &-1{
                        left:0; 
                       
                    }
                    &-2{
                        left:auto; 
                       
                    }
                }
                /* 右边  */
                &-right {
                    z-index:2;
                    &-1{
                        right:0; 
                    }
                    border-left: 1px solid sandybrown ;
                }
                 /* 右边  */
                &-optright {
                     z-index:0;
                     &-1{
                        right:0; 
                    }
                    border-left: 1px solid sandybrown ;
                    background-color:  white;
                }
            }
            
            .lkx-table-head-row{
                .lkx-table-head-column{
                   .lkx-header-cell{
                       display: flex;
                       span{
                           flex: 1;
                       }
                       .lkx-table-head-column-sort{
                            display: flex;
                            flex-direction: column;
                            width: 20px;
                            &-up,&-down{
                                height: 12px;
                                line-height: 12px;
                                color: #bcbcc7;
                                font-size: 11px;
                                :hover{
                                    color:$hover-font-color;
                                    cursor: pointer;
                                }
                                :active{
                                    color:red;
                                }
                            }
                            .sortActive{
                                color:red;
                            }
                        }
                   };
                    
                    /*拖动指示条*/
                    .lkx-resize{
                        position: absolute;
                        right: -7px;
                        bottom: 0px;
                        width: 14px;
                        height: 100%;
                        text-align: center;
                        z-index: 3;
                        cursor: col-resize;
                    }
                }
            }
            .lkx-table-body-row{
                .lkx-table-body-column{
                    color: black;
                   .lkx-opt-cell{
                       display: flex;
                       flex-direction: row;
                       justify-content: space-between;
                       align-items:center;
                   }
                   /*#列*/
                   .lkx-sep-cell{
                       display: flex;
                       /*行号*/
                       &-serial{
                           flex: 1;
                           height: $table-row-height;
                           line-height: $table-row-height;
                       }/*状态指示*/
                       &-indicator{
                           width: 16px;
                           margin-left: -5px;
                           padding-left: -5px;
                           font-size: $table-row-height;
                       }
                       /*展开*/
                       &-expand{
                            width: 12px;
                            font-size: $table-row-height;
                       }
                   }
                }
            }
            .lkx-table-foot-row{
                .lkx-table-foot-column{
                     color: black;
                }
            }
            /*扩展行*/
            /*.lkx-table-body-row-expand{
                .lkx-table-body-column-expand{
                   
                }
            }*/
            .lkx-row-select{ //选中
                background: rgb(152, 154, 243);
                /*.lkx-cell-value{
                    color: white;
                }*/
                
            }
            .lkx-cell-select{ //选中
                background:blue;
                span{
                    color: white;
                }
            }
        }
        
    }

     table{
        thead{
            tr:first-child{
                th{
                    border-right: 1px solid grey;
                    border-top: 1px solid grey;
                    border-bottom: 1px solid grey;
                }
                th:first-child{
                    border-left: 1px solid grey;
                }
            }
            tr:not(:first-child){
                th{
                    border-right: 1px solid grey;
                    border-bottom: 1px solid grey;
                }
            }
        }
        tbody{
            tr{
                td{
                    border-right: 1px solid grey;
                    border-bottom: 1px solid grey;
                }
            }
            tr:last-child{
                td{
                    border-bottom: 0;
                }
            }
            td:first-child{
                border-left: 1px solid grey;
            }
        }
        tfoot{
            tr:first-child{
                td{
                    border-top: 1px solid grey;
                    border-right: 1px solid grey;
                    border-bottom: 1px solid grey;
                }
                td:first-child{
                    border-left: 1px solid grey;
                }
            }
        }
    }
    .Print{
        display: none;
    }
    @media print{
        /*table{
            word-break:break-all;
            font-size: 14px;
            font-family: '宋体';
            border-collapse:collapse;  
            table-layout: fixed;
            td,th{
                padding: 5px;
            }
        }*/
        .Print{
            display: block;
        }
    }
</style>