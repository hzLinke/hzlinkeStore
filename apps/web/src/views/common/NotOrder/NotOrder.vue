<template>
    <lkx-modal :config= "modalConfig"  @close="handleClose">
        <table  ref="printDom" border="0" cellspacing="0" cellpadding="0">
                <colgroup>
                    <col v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index" :width="item.width+'px'"/>
                </colgroup>
                <thead style="display:table-header-group">
                    <tr>  
                        <th v-for="(item,index) in gridAction.Columns" :name="item.fieldName" :key="index">
                            {{item.title}}
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(rowItem,rowIndex) in dataSource.dataSet" :key="rowIndex" :class="{'active': rowIndex==selectIndex}" @click="selectIndex=rowIndex">
                        <td v-for="(cellItem,cellIndex) in gridAction.Columns" :name="cellItem.fieldName" :key="cellIndex"  
                            :style="{'textAlign':cellItem.align}"
                        >
                            <div v-if="cellItem.fieldName=='sep'">
                                <span >{{rowIndex+1}} </span>
                            </div>
                            <div>{{rowItem[cellItem.fieldName]}}</div>
                        </td>
                    </tr>
                </tbody>
        </table>
    </lkx-modal>
</template>
<script lang="ts">
/**密码修改 */
import { defineComponent,ref,reactive } from "vue";
import { LkxModal } from '@v4x/ui'
import {TDataSource} from "@/usehook/dataSource"
import {TListGridAction} from "./action"
export default defineComponent({
    name: "Notorder",
    components:{
        LkxModal,
       
    },
    props: {
        open: {
            type: Boolean,
            default: false
        }
    },
    setup(props, ctx) {
        const commonDatas = [] as any;
        const selectIndex = ref(0);
        const  modalConfig = ref({
                open: props.open,
                title:'未下单列表',
                type:'edit',
                width:'900px',
                height:'500px'
        })
        const dataSource = reactive(
            new TDataSource({
                    ApiPath:'/masterApi/disApi/NotOrder/',
                    KeyFieldName: 'IdCode',
                    NotAllowOperationList: [],
                    getParmars: {}
                }
            )
        );
        const gridAction = reactive(new TListGridAction(dataSource,commonDatas));
        const handleClose = async (e: any)=>{
           modalConfig.value.open = false
           ctx.emit('close',e)
        }
        gridAction.open()
        return { 
            selectIndex,
            gridAction,
            dataSource,
            modalConfig,
            handleClose
        }; 
    }
});
</script>
<style lang="scss" scoped>
    table{
   // word-break:break-all;
    width: 0;
    font-size: 14px;
    font-family: '宋体';
    border-collapse:collapse;  
    table-layout:fixed;
    tr{
        height: 30px;
    }
    td,th{
        padding: 3px;
        border: 1px solid black;
        
    }
    .active{
        background-color: blue;
        color: white;
    }
}
</style>