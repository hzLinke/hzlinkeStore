<template>
    <div class="mainWin" >
         <div class="header">
            <div class="header-logo">
            <img src="../assets/logo.png" style="padding-left:8px;"/>
            </div>
            <div class="header-caption">
                <span style="padding-left:15px;color:white;font-size: 22px;" >配送管理系统--配货端</span>
            </div> 
           
            <div class="header-user" ref="userBox"  @click="hanadleUserClick">
                <i  class="header-user-icon iconfont iconUser"></i>
                <span class="header-user-nick">{{loginDatas.name}}</span>
                <span class="iconfont iconArrawDown" ></span>
            </div> 
            <div class="header-user" ref="userBox"  @click="hanadlePrintClick">
                <i  class="header-user-icon iconfont iconPrint"></i>
                <span class="header-user-nick">打印送货单</span>
            </div>
            <div class="header-search" v-if="showSearchInput">
                <input class="search-input" v-model="searchText" placeholder="请输入品名 回车搜索" @keypress="handleSearch" />
            </div>
        </div>
        <div class="menu" v-if="showToolsBar">
            <ToolsBar :toolsBarItems="toolsBarItems" @itemClick = "handleToolsBarClick"/>
        </div>
        <div class="content">
            <div class="work" ref="work">
                <div class="work-n">
                    <router-view  v-slot="{ Component }">
                        <keep-alive include="disAction">
                            <component :is="Component" />
                        </keep-alive>
                    </router-view>
                    
                </div>
            </div>
        </div>
        <div class="footer" ref = "footer">
            <div class="footer-left">
                <span>【{{ltdname}}】帐套:【{{bookname}}】</span>
            </div>
            <div class="footer-right" v-if="showMsg">
                <LkxTextScroll 
                    :text="msgTxt" 
                    :speed="40"
                    direction="left"
                    :loop="true"
                    :hoverPause="true"
                    width="300"
                    height="40"
                    :fontSize="14"
                    color="red"
                    backgroundColor="transparent"
                    @click="handleProlongService"
                />
            </div>
        </div>
    </div>
    <ChangePwd v-if="hasChangePwd" :open = "hasChangePwd" @close="hasChangePwd=false"/>
</template>

<script setup lang="ts">
import { ref, reactive, provide } from 'vue'
import { useRouter } from "vue-router"
import ChangePwd from "@/views/common/changePwd/changePwd.vue"
import { popupMenu, PopupMenuDataType, ToolsBarConfigType, ToolsBarItemType } from "@v4x/ui"
import { LkxToolsBar as ToolsBar, LkxTextScroll } from '@v4x/ui'
import lkxUtil from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import { getCommonDatas } from '@/usehook/getCommonDatas'
import { toolsBarClick } from './toolsBarAction'
import { useAppStore } from '../stores'

const appStore = useAppStore()
const router = useRouter()
const userBox = ref<null | HTMLElement>(null)
const hasChangePwd = ref(false)
const showToolsBar = ref(false)
const showSearchInput = ref(false)
const searchText = ref('')
const bookname = ref(commonParam.$bookname)
const ltdname = ref(commonParam.$ltdname)
const showMsg = commonParam.$endDat < 30
const msgTxt = `系统服务将在${lkxUtil.getDate('d', commonParam.$endDat)}到期，请续费`

const handleSearch = (e: KeyboardEvent) => {
    if (e.key === 'Enter') {
        emitSearch(searchText.value)
        searchText.value = ''
    }
}

const toolsBarItems = reactive<ToolsBarItemType[]>([
    { title: '首页', idCode: '_Top', index: 1, iconCls: 'iconfont iconTop', dropDown: false },
    { title: '上页', idCode: '_Upward', index: 3, iconCls: 'iconfont iconUpward', dropDown: false },
    { title: '下页', idCode: '_Next', index: 2, iconCls: 'iconfont iconNext', dropDown: false },
    { title: '尾页', idCode: '_Bottom', index: 4, iconCls: 'iconfont iconBottom', dropDown: false },
    { title: '分隔', idCode: '_Separate', index: -1, iconCls: 'iconfont iconSeparate', dropDown: false, Separate: true },
    { title: '增加', idCode: '_Insert', index: 5, iconCls: 'iconfont iconInsert', dropDown: false },
    { title: '删除', idCode: '_Delete', index: 6, iconCls: 'iconfont iconDelete', dropDown: false },
    { title: '取消', idCode: '_Cancel', index: 7, iconCls: 'iconfont iconCancel', dropDown: false },
    { title: '保存', idCode: '_Save', index: 8, iconCls: 'iconfont iconSave', dropDown: false },
    { title: '分隔', idCode: '_Separate', index: -1, iconCls: 'iconfont iconSeparate', dropDown: false, Separate: true },
    { title: '审核', idCode: '_Examine', index: 9, iconCls: 'iconfont iconExamine', dropDown: false },
    { title: '反签', idCode: '_UnExamine', index: 10, iconCls: 'iconfont iconUnExamine', dropDown: false },
    { title: '打印', idCode: '_Print', index: 11, iconCls: 'iconfont iconPrint', dropDown: false },
    { title: '查询', idCode: '_Search', index: 12, iconCls: 'iconfont iconSearch', dropDown: false },
    { title: '外接', idCode: '_Interface', index: 13, iconCls: 'iconfont iconInterface', dropDown: false },
    { title: '分隔', idCode: '_Separate', index: -1, iconCls: 'iconfont iconSeparate', dropDown: false, Separate: true },
    { title: '正常', idCode: '_Base', index: 14, iconCls: 'iconfont iconBase', dropDown: false },
    { title: '同步', idCode: '_Synchronization', index: 20, iconCls: 'iconfont iconExChange', dropDown: false },
    { title: '分隔', idCode: '_Separate', index: -1, iconCls: 'iconfont iconSeparate', dropDown: false, Separate: true },
    { title: '退出', idCode: '_Close', index: 21, iconCls: 'iconfont iconClose', dropDown: false },
])

const popupMenuData: PopupMenuDataType = reactive({
    pointXy: { left: 0, top: 0 },
    items: [
        { code: '_ChangePwd', type: 'cancel', caption: '修改密码', children: [] },
        { code: '_RestoreAllCell', type: 'refresh', caption: '修改信息', children: [] },
        { code: 'separate', type: '', caption: '-', children: [] },
        { code: '_Close', type: 'tableSet', caption: '安全退出', children: [] }
    ],
    cellIndex: -1
})

const loginDatas = JSON.parse(sessionStorage.getItem('loginDatas') || '{}')
const PowerCode = ref(parseInt(loginDatas.post) || 0)
const commonDatas = ref({})

const tabClose = () => {
    showToolsBar.value = false
    router.replace({ name: 'disAction', query: {} })
}

getCommonDatas(PowerCode.value).then(res => {
    appStore.commonDatas = Object.assign(commonDatas.value, res)
})

provide('commonDatas', commonDatas)
provide('CloseTab', tabClose)

// 搜索事件相关
const searchHandlers = ref<Set<(text: string) => void>>(new Set())
const registerSearchHandler = (handler: (text: string) => void) => {
    searchHandlers.value.add(handler)
    showSearchInput.value = true
}
const unregisterSearchHandler = (handler: (text: string) => void) => {
    searchHandlers.value.delete(handler)
    if (searchHandlers.value.size === 0) {
        showSearchInput.value = false
        searchText.value = ''
    }
}
const emitSearch = (text: string) => {
    searchHandlers.value.forEach(handler => handler(text))
}

provide('registerSearchHandler', registerSearchHandler)
provide('unregisterSearchHandler', unregisterSearchHandler)

const handlePopupItemClick = (item: any) => {
    switch (item.code) {
        case '_ChangePwd':
            hasChangePwd.value = true
            break
        case '_Close':
            sessionStorage.clear()
            router.replace({ name: 'Login' })
    }
}

const hanadleUserClick = async () => {
    const position = (userBox.value as any).getBoundingClientRect()
    popupMenuData.pointXy = { left: position.left, top: position.bottom - 6 }
    const res = await popupMenu.popup(popupMenuData)
    if (res) handlePopupItemClick(res.item)
}

const hanadlePrintClick = () => {
    showToolsBar.value = true
    router.replace({ name: 'sale', query: { title: '送货单', idcode: 306, pcode: 3 } })
}

const handleProlongService = () => {
    console.log('续费窗口')
}

const handleToolsBarClick = (e: any) => {
    toolsBarClick(router.currentRoute.value.matched[1].instances.default as any, router, e)
}

// 阻止后退的所有动作
history.pushState(null, 'null', document.URL)
window.addEventListener('popstate', () => {
    history.pushState(null, 'null', document.URL)
})
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style lang="scss" scoped>
	.mainWin{
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 100vh;
		overflow: hidden;
		.header{
			z-index: 10;
            position: relative;
			background-color: $basic-bg-color;
            //display: flex;
           // align-items: center;
            &:after{
                position: absolute;
                z-index: 39000;
                right: 0;
                bottom: 0;
                left: 0;
                height: 1px;
                content: '';
                -webkit-transform: scaleY(.5);
                transform: scaleY(.5);
                background-color:#c8c7cc;
            }
            &-logo {
                float: left;
                width: 100px;
                height: 50px;
                line-height: 50px;
                img {
                    height: 40px;
                    margin-top: 5px;
                    margin-left: 2px;
                }
            } 
            &-caption{
                float: left;
                line-height: 50px;
                color: $basic-color;
                font-size: 16px;
                font-style:italic;
            }
            &-user{
                float: right;
                cursor:pointer;
                line-height: 50px;
                color: $basic-color;
                margin-right: 30px;
                &-nick{
                    padding: 0 5px;
                }
                &-icon{
                    font-size: 20px;
                }
            }
            &-exchange{
                float: right;
                cursor:pointer;
                position: relative;
               
                color: $basic-color;
                margin-right: 30px;
                &-nick{
                    padding: 0 5px;
                    height:50px;
                    line-height: 50px;
                }
                &-icon{
                    height:50px;
                    line-height: 50px;
                    font-size: 25px;
                }
                &-horn{
                    position: absolute;  
                    right: -8px;
                    top:10px;
                    width:15px;
                    height:15px;
                    line-height: 15px;
                    border-radius: 50%; 
                    background: red;
                    text-align: center;
                    color:#ffff;
                    font-size: 12px;
                }
            }
		}
		.content{
			flex: 1;
			height: 0;
			display: flex;
			position: relative;
			.nav{
				width: 200px;
				border-right: 1px solid #EEE8D5;
				background: $basic-bg-color;;
				z-index: 10;
				height: 100%;
				overflow-y: auto;
				&::-webkit-scrollbar {
					display: none;
				}
			}
			.work{
				flex: 1;
				display: flex;
				position: relative;
                flex-direction: column;
                &-n{
                    position: relative;
                    flex:1;
                    overflow: hidden;
                    display: flex;
                }
			}
		}
		.footer{
			background-color: $basic-bg-color;
            border-top: 1px solid #EEE8D5 ;
            padding: 0 10px;
			height: 40px;
			z-index: 10;
            line-height: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            &-left {
                flex: 1;
                overflow: hidden;
                white-space: nowrap;
            }
            &-right {
                cursor: pointer;
            }
		}
	}
    .header-search {
        float: right;
        margin-right: 20px;
        line-height: 50px;
        .search-input {
            height: 30px;
            width: 200px;
            padding: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline-color: blue;
        }
    }
</style>
