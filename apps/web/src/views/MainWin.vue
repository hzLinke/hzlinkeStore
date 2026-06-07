<template>
    <div class="mainWin" >
         <div class="header">
            <div class="header-logo">
            <img src="../assets/logo.png" style="padding-left:8px;"/>
            </div>
            <div class="header-caption">
                <span style="padding-left:15px;color:white;font-size: 22px;" >配送管理系统 {{ commonParam.$version }}</span>
            </div> 
            <div class="header-exchange" ref="qrBox" @click="hanadleMessageClick(2)">
                <i  class="header-exchange-icon iconfont iconQrCode"></i>
                <span class="header-exchange-nick">小程序</span>
            </div> 
            <div class="header-user" ref="userBox"  @click="hanadleUserClick">
                <i  class="header-user-icon iconfont iconUser"></i>
                <span class="header-user-nick">{{loginDatas.name}}</span>
                <span class="iconfont iconArrawDown" ></span>
            </div> 
            <div class="header-exchange" ref="toolsBox"  @click="hanadleToolsClick">
                <i  class="header-exchange-icon iconfont iconSys_Parmars"></i>
                <span class="header-exchange-nick">附助工具</span>
            </div> 
        </div>
        <div class="menu">
            <LkxToolsBar :toolsBarItems="toolsBarItems" @itemClick = "handleToolsBarClick"/>
        </div>
        <div class="content">
            <div class="nav" ref="nav" >
              <LkxMainMenu direction='h' :nemuDatas="navItems" :itemClick="(onToPage as any)"></LkxMainMenu>
            </div>
            <div class="work" ref="work">
                <LkxTabs class="work-tabs" :defaultValue="curValue" :tabList="tabList" closeBut @tabClick="onTabClick" @tabClose="onTabClose"/>
                <div class="work-n">
                    <router-view  v-slot="{ Component }">
                        <keep-alive :include="WinArr">
                            <component :is="Component"  />
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
    <NotOrder v-if="hasNotOrder" :open = "hasNotOrder" @close="hasNotOrder=false"/>
</template>

<script setup lang="ts">
import { ref, reactive, shallowReactive, getCurrentInstance, provide, computed } from 'vue'
import { useRouter } from "vue-router"
import { LkxToolsBar, LkxTabs, LkxMainMenu, popupMenu, MessageBox, LkxTextScroll, type PopupMenuDataType, type MenuDataType, ToolsBarItemType } from '@v4x/ui'
import { getNavItems } from '../usehook/getNavItems'
import { buildRouter } from '../usehook/buildRouter'
import { getCommonDatas } from '@/usehook/getCommonDatas'
import { toolsBarClick } from './toolsBarAction'
import lkxUtil from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import pageAction, { tabList, tabListInstance, curIndex, curValue, caches, navItems, initTabList } from './pageAction'
import { useAppStore } from '../stores'
import { WinChangePwd, WinUploadReports } from '@/components'
import NotOrder from "@/views/common/NotOrder/NotOrder.vue"

defineOptions({
    name: 'MainWin'
})

interface NavItemData {
    rowid: string
    level: string
    idcode: string
    pcode: string
    checked: string
    title: string
    viewpath: string
    iconcls: string
    showmodel: string
    guid: string
    children: any[]
    open: boolean
    AllPower?: boolean
}

const appStore = useAppStore()
const router = useRouter()
const currentInstance = getCurrentInstance()

const loginDatas = appStore.loginDatas
const PowerCode = ref(parseInt(loginDatas.post))

const userBox = ref<HTMLElement | null>(null)
const toolsBox = ref<HTMLElement | null>(null)
const qrBox = ref<HTMLElement | null>(null)
const hasNotOrder = ref(false)

const bookname = ref(commonParam.$bookname)
const ltdname = ref(commonParam.$ltdname)
const showMsg = commonParam.$endDat < 30
const msgTxt = `系统服务将在${lkxUtil.getDate('d', commonParam.$endDat)}到期，请续费`

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

const popupToolsMenuData: PopupMenuDataType = shallowReactive({
    pointXy: { left: 0, top: 0 },
    items: [
        { code: '_NotDownCustomer', type: 'shrink', size: '20', color: 'black', caption: '未下单客户', children: [] },
        { code: 'separate', type: '', size: '20', color: 'black', caption: '-', children: [] },
        { code: '_bathUpload', size: '20', color: 'black', type: 'expand', caption: '报告批量上传', children: [] },
        { code: '_SaleSplit', size: '20', color: 'black', type: 'swap', caption: '单据拆分', children: [] },
        { code: '_SaleReplace', size: '20', color: 'black', type: 'expand', caption: '单据代打', children: [] },
        { code: '_SaleChange', size: '20', color: 'black', type: 'expand', caption: '外帐单据', children: [] },
        { code: '_ProductSplit', size: '20', color: 'black', type: 'expand', caption: '商品加工拆分', children: [] },
        { code: 'separate', type: '', size: '20', color: 'black', caption: '-', children: [] },
        { code: '_KProduct', size: '20', color: 'black', type: 'expand', caption: '定位商品', children: [] },
        { code: 'separate', type: '', size: '20', color: 'black', caption: '-', children: [] },
        { code: '_SaleTrend', size: '20', color: 'black', type: 'swap', caption: '销售走势', children: [] },
        { code: 'separate', type: '', size: '20', color: 'black', caption: '-', children: [] },
        { code: '_Shop', size: '20', color: 'black', type: 'swap', caption: '商城配置', children: [] },
    ],
    cellIndex: -1
})

const popupMenuData: PopupMenuDataType = shallowReactive({
    pointXy: { left: 0, top: 0 },
    items: [
        { code: '_ChangePwd', type: 'cancel', caption: '修改密码', children: [] },
        { code: '_RestoreAllCell', type: 'refresh', caption: '修改信息', children: [] },
        { code: 'separate', type: '', caption: '-', children: [] },
        { code: '_Close', type: 'tableSet', caption: '安全退出', children: [] }
    ],
    cellIndex: -1
})

const popupMenuQrcode: PopupMenuDataType = shallowReactive({
    pointXy: { left: 0, top: 0 },
    items: [
        { code: 'qrCode', type: 'img', src: `${commonParam.$http}Qrcode/wxQrCode.jpg`, caption: '', children: [] }
    ],
    cellIndex: -1
})

const WinArr = computed(() => caches.value)

provide('commonDatas', appStore.commonDatas)
provide('CloseTab', () => pageAction.tabClose(router, curIndex.value))

const checkVersion = (): boolean => {
    if (+commonParam.$useVersion < 1) {
        MessageBox.information({
            content: '对不起，你的版本过低，请升级到标准版以上',
            title: '提示',
            showCancel: false
        })
        return false
    }
    return true
}

const createNavItem = (config: Partial<NavItemData>): MenuDataType => ({
    id: '', name: '', title: '', path: '', url: '', icon: '',
    children: [], level: 0,
    ...config as any
} as any)

const setNavItems = async () => {
    const res = await getNavItems(loginDatas.powercode || loginDatas.post||1)
    navItems.value = res.navDatas as any[];
    (appStore.commonDatas as any).PowerList = res.postDatas as any
    
    buildRouter(router, res.navDatas)
}

const setComonDatas = async () => {
    const res = await getCommonDatas(PowerCode.value||1)
    appStore.updateCommonDatas(res)
}

const asyncCommonDatas = () => {
    MessageBox.loading({ moreText: '正在同步资料，请稍候...', mask: true })
    setComonDatas().then(() => MessageBox.closeAllLoading())
}

const hanadleUserClick = async () => {
    const handlePopupItemClick = (item: { code: string }) => {
        switch (item.code) {
            case '_ChangePwd':
                WinChangePwd.show({ title: '修改密码' })
                break
            case '_Close':
                sessionStorage.clear()
                caches.value = []
                initTabList(router)
                router.replace({ name: 'Login' })
                break
        }
    }
    const position = userBox.value?.getBoundingClientRect()
    if (position) {
        popupMenuData.pointXy = { left: position.left, top: position.bottom - 6 }
        const res = await popupMenu.popup(popupMenuData)
        if (res) handlePopupItemClick(res.item)
    }
}

const hanadleToolsClick = async () => {
    const handlePopupItemClick = (item: { code: string }) => {
        switch (item.code) {
            case '_bathUpload':
                if (!checkVersion()) return;
                WinUploadReports.show({
                    title: '检测报告批量上传',
                    listDatas: appStore.commonDatas.PCateDatas || []
                })
                /* ;(currentInstance as any).proxy.$BathUploadImage.show({
                    title: '检测报告批量上传',
                    listDatas: appStore.commonDatas.PCateDatas || []
                }) */
                break
            case '_NotDownCustomer':
                hasNotOrder.value = true
                break
            case '_SaleSplit':
                if (!checkVersion()) return
                onToPage(createNavItem({
                    rowid: "26", level: "1", idcode: "308", pcode: "3",
                    title: "单据拆分", viewpath: "saleSplit", iconcls: "iconfont iconAccount",
                    guid: "4d178c20-b66e-450e-a9bd-500fa11219c0"
                }))
                break
            case '_SaleReplace':
                if (!checkVersion()) return
                onToPage(createNavItem({
                    rowid: "26", level: "1", idcode: "308", pcode: "3",
                    title: "单据代打", viewpath: "saleReplace", iconcls: "iconfont iconAccount",
                    guid: "4d178c20-b66e-450e-a9bd-500fa11219c0"
                }))
                break
            case '_SaleChange':
                if (!checkVersion()) return
                onToPage(createNavItem({
                    rowid: "26", level: "1", idcode: "30601", pcode: "3",
                    title: "对外单据", viewpath: "saleChange", iconcls: "iconfont iconAccount",
                    guid: "4d178c20-b66e-450e-a9bd-500fa11219c0", AllPower: true
                }))
                break
            case '_ProductSplit':
                if (!checkVersion()) return
                onToPage(createNavItem({
                    rowid: "26", level: "1", idcode: "403", pcode: "4",
                    title: "商品加工拆分", viewpath: "stockSplit", iconcls: "iconfont iconStock_Change",
                    guid: "4d178c20-b66e-450e-a9bd-500fa11219c0"
                }))
                break
            case '_KProduct':
                if (!checkVersion()) return
                onToPage(createNavItem({
                    rowid: "26", level: "1", idcode: "106", pcode: "1",
                    title: "定位商品", viewpath: "kProduct", iconcls: "iconfont iconAccount",
                    guid: "4d178c20-b66e-450e-a9bd-500fa11219c0"
                }))
                break
            case '_SaleTrend':
                onToPage(createNavItem({
                    rowid: "58", level: "2", idcode: "60301", pcode: "603",
                    title: "销售走势", viewpath: "AnalysisReports/SaleTrendReport",
                    guid: "58805e28-523b-4482-b439-7aaa9e8a2602"
                }))
                break
            case '_Shop':
                onToPage(createNavItem({
                    AllPower: true, rowid: "59", level: "2", idcode: "804", pcode: "8",
                    title: "商城配置", viewpath: "wxSysParams",
                    guid: "58805e28-523b-4482-b439-7aaa9e8a2602"
                }))
                break
        }
    }

    const position = toolsBox.value?.getBoundingClientRect()
    if (position) {
        popupToolsMenuData.pointXy = { left: position.left, top: position.bottom - 6 }
        const res = await popupMenu.popup(popupToolsMenuData)
        if (res) handlePopupItemClick(res.item)
    }
}

const hanadleMessageClick = (type: number) => {
    switch (type) {
        case 1:
            window.open('https://www.baidu.com', '_blank')
            break
        case 2: {
            const position = qrBox.value?.getBoundingClientRect()
            if (position) {
                popupMenuQrcode.pointXy = { left: position.left, top: position.bottom - 6 }
                popupMenu.popup(popupMenuQrcode)
            }
            break
        }
    }
}

const handleToolsBarClick = (e: { idCode: string }) => {
    switch (e.idCode) {
        case '_Base': {
            appStore.isExtend = !appStore.isExtend
            const baseItem = toolsBarItems.find(item => item.idCode === '_Base')
            if (baseItem) {
                baseItem.title = appStore.isExtend ? '<扩展>' : '正常'
            }
            break
        }
        case '_Synchronization':
            asyncCommonDatas()
            break
        default:
            toolsBarClick(tabListInstance[curIndex.value - 1], router, e)
            break
    }
}

const onToPage = (item: MenuDataType) => {
    pageAction.toPage(router, item as any)
}

const onTabClick = (item: any, index: number) => {
    pageAction.tabChange(router, item, index)
}

const onTabClose = (index: number) => {
    pageAction.tabClose(router, index)
}

const handleProlongService = () => {
    console.log('续费窗口')
}

MessageBox.loading({ moreText: '正在加载基本配置，请稍候...', mask: true })
setNavItems().then(() => {
    setComonDatas().then(() => MessageBox.closeAllLoading())
})

history.pushState(null, 'null', document.URL)
window.addEventListener('popstate', () => {
    history.pushState(null, 'null', document.URL)
})
</script>

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
</style>
