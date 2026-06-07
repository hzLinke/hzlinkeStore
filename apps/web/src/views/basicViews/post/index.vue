<template>
    <div class="winBody">
        <div class="gridBody">
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
            />
        </div>
        <div class="powerBody">
           <div class="powerBody-header"><button @click="handelSavePower">保存</button></div>
           <LkxTree :data="powerTreeDatas"></LkxTree>
        </div>
    </div>
</template>
<script setup lang="ts">
    import { reactive, ref, onMounted, markRaw,useTemplateRef } from 'vue'
    import { LkxGrid, LkxTree, MessageBox, TableRowDataType } from '@v4x/ui'
    import $api from '@/request/api'
    import { TDataSource } from "@/usehook/dataSource"
    import { TWinForm } from "@/usehook/win"
    import { TPostGridAction } from "./action"
    import type { PostInstanceRefs } from './types'
    defineOptions({
        name: 'post'
    })

    const lkxGrid = useTemplateRef('lkxGrid')
    const powerTreeDatas = ref([])

    const instanceRefs = markRaw<PostInstanceRefs>({powerTreeDatas})

    const Win = reactive(new TWinForm<PostInstanceRefs>(instanceRefs))
    const dataSource = reactive(
        new TDataSource({
            ApiPath: '/masterApi/disApi/basic/post/',
            KeyFieldName: 'idcode',
            NotAllowOperationList: ['0', '1'],
            getParmars: {}
        })
    )
    const gridAction = reactive(new TPostGridAction(dataSource, instanceRefs))
    gridAction.TableConfig.title = Win.Caption

    const splitArr = (TreeArr: any[]) => {
        const LevelA = [] as any
        const LevelB = [] as any
        const LevelC = [] as any
        const LevelD = [] as any
        for (let i = 0; i < TreeArr.length; i++) {
            const Temp = Object.assign({}, TreeArr[i])
            delete Temp.children
            Temp.checked = Temp.checked == true || Temp.checked == 1 ? "1" : '0'
            LevelA.push({ idkey: Temp.idkey, checked: Temp.checked })
            const B = TreeArr[i].children
            for (let j = 0; j < B.length; j++) {
                const Temp = Object.assign({}, B[j])
                delete Temp.children
                Temp.checked = Temp.checked == true || Temp.checked == 1 ? "1" : '0'
                LevelB.push({ idkey: Temp.idkey, checked: Temp.checked })
                const C = B[j].children
                for (let j = 0; j < C.length; j++) {
                    const Temp = Object.assign({}, C[j])
                    delete Temp.children
                    Temp.checked = Temp.checked == true || Temp.checked == 1 ? "1" : '0'
                    if (Temp.level == '2') {
                        if (Temp.showmodel != 1 && Temp.title != '-' && C[j].children) {
                            const D = C[j].children
                            for (let i = 0; i < D.length; i++) {
                                const Temp = Object.assign({}, D[i])
                                delete Temp.children
                                Temp.checked = Temp.checked == true || Temp.checked == 1 ? "1" : '0'
                                LevelD.push({ idkey: Temp.idkey, checked: Temp.checked })
                            }
                        }
                        LevelC.push({ idkey: Temp.idkey, checked: Temp.checked })
                    }
                    if (Temp.level == '3') {
                        LevelD.push({ idkey: Temp.idkey, checked: Temp.checked })
                    }
                }
            }
        }
        return { LevelA, LevelB, LevelC, LevelD }
    }

    const handelSavePower = async () => {
        const data = splitArr(gridAction.treeDatas)
       MessageBox.loading({
            moreText: '正在设置权限....',
            mask: true
        })

        const param = {
            LevelADetailJson: JSON.stringify(data.LevelA),
            LevelBDetailJson: JSON.stringify(data.LevelB),
            LevelCDetailJson: JSON.stringify(data.LevelC),
            LevelDDetailJson: JSON.stringify(data.LevelD),
        }
        setTimeout(() => {
            $api.comonRequest('/masterApi/disApi/basic/post/', 'updatePower', param).then((rs) => {
                if (rs.errCode == 0) {
                    MessageBox.information({
                        title: '信息',
                        content: '权限设置成功，重新进入系统生效',
                        showCancel: false,
                    })
                }
                MessageBox.closeAllLoading()
            })
        }, 100)
    }

    onMounted(() => {
        Win.switchGrid(false, gridAction, lkxGrid as any)
        Win.ActiveGridAction?.open()
    })

    defineExpose({ lkxGrid, Win, dataSource, gridAction, handelSavePower })
</script>

<style lang="scss" scoped>
.winBody {
    width: 100%;
    height: 100%;
    display: flex;

    .gridBody {
        flex: 1;

    }

    .powerBody {
        width: 400px;
        display: flex;
        flex-direction: column;

        .powerBody-header {
            height: 40px;
            padding: 0 20px;
            display: flex;
            border-bottom: 1px solid #eeee;
            align-items: center;

            button {
                width: 100px;
            }
        }
    }
}
</style>
