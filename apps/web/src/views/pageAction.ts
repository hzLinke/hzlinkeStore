import {ref,reactive,getCurrentInstance} from 'vue'
import {Router} from "vue-router";
import $Util from '@v4x/utils/lkxUtil';
import {MessageBox,ModalResultEnum,type MenuDataType} from '@v4x/ui'
import { useAppStore } from '../stores';


/**是否有权 */
const powerAllowed = (item: any)=>{
    if (item.AllPower) return true;
    const _Inx = $Util.getIndexFromArray(navItems.value,'idcode',Math.trunc(item.pcode/100));
    const List = parseInt(item.pcode)<100?navItems.value:navItems.value[_Inx].children;
    const _Pinx = $Util.getIndexFromArray(List,'idcode',item.pcode);
    if (_Pinx<0) return false
    const _SubInx = $Util.getIndexFromArray(List[_Pinx].children,'idcode',item.idcode);
    return _SubInx>=0
}
export const navItems = ref([] as MenuDataType[])
/**打开的窗口列表 */
export let tabList= ref([{idcode:0,title:'常用功能',iconcls:'iconfont iconShop',path:'/home',viewpath:'Home'}])
/**用于保存对应路油接口*/
export const tabListInstance = reactive([] as any);
/**当前窗口序号 */
export const curIndex = ref(0);
/**当前窗口的ID */
export const curValue = ref(0);
/**要缓存的路由列表 */
export const caches = ref(['Home'] as string[])
/**打开新窗口 */
export function toPage(router: Router, item: any){
    if (!powerAllowed(item)){
        MessageBox.warning({
            title:'警告',
            content:'对不起您没有权限，请找系统员分配',
            showCancel: false
        })
        return
    }
    if (caches.value.indexOf(item.viewpath)==-1){//如果缓存不存在
        caches.value.push(item.viewpath)//开启缓存 页面的name必须与此viewpath相同
    }

    console.log(item)

    router.replace({name:item.viewpath,query: item}).catch(err => {
        console.error('Route navigation failed:', err)
    })
    const _l = tabList.value.filter((row)=>{return row.idcode == item.idcode})
    if (_l.length==0){//新打开窗口
        setTimeout(() => {
            const matched = router.currentRoute.value.matched;
            if (matched.length >= 2 && matched[1].instances?.default) {
                const thisInstance = matched[1].instances.default;
                tabListInstance.push(thisInstance);//保存当前路由接口
            }
        }, 500);
        tabList.value.push(item)
        curIndex.value = tabList.value.length -1
        curValue.value = item.idcode
    } else {//窗口已打开
        const _Inx = $Util.getIndexFromArray(tabList.value,'idcode',item.idcode);
        curIndex.value = _Inx
      //  console.log(_Inx,tabList)
        curValue.value = item.idcode;

    }

   
   // console.log('caches.value',caches.value,tabList)
}
/**
 * 路由（窗口）切换 
 * @param router 路由对象
 * @param itemParams 对应页面参数
 * @param index 窗口序号
 */
export const tabChange = (router: Router,itemParams: any,index: number)=>{
    curValue.value = itemParams.idcode;
    curIndex.value = index;
    router.replace({
        name:itemParams.viewpath,
        query:itemParams
    }).catch(err => {
        console.error('Route change failed:', err)
    })

    const appStore = useAppStore();
    appStore.activeWin = appStore.winList.get(itemParams.idcode);

}
/**关闭窗口 */
export const tabClose = async (router: Router,index: number)=>{
    const doClose = ()=>{
        caches.value.splice(caches.value.indexOf(tabList.value[index].viewpath),1)

        const appStore = useAppStore();
        appStore.winList.delete(tabList.value[index].idcode.toString());

        tabList.value.splice(index,1);
        tabListInstance.splice(index-1,1);

        if (curIndex.value == index){
            const item = tabList.value[tabList.value.length-1]
            curValue.value = item.idcode
            curIndex.value = tabList.value.length -1
            router.replace({
                name:item.viewpath,
                query:item
            }).catch(err => {
                console.error('Route replace failed:', err)
            })
            appStore.activeWin = appStore.winList.get(item.idcode.toString());
        } 
    }
    doClose()
   
}
/**初始化 */
export function initTabList(router: Router){
    /**必须用一个一个关闭，不能直接初始，不然换帐套时操作会失效 */
    for (let i=tabList.value.length-1;i>0;i--){
        tabClose(router,i)
    }
   // tabList.value = [{idcode:0,title:'常用功能',iconcls:'iconfont iconShop',path:'/home',viewpath:'Home'}];
   // curIndex.value = 0;
   // curValue.value = 0;
}
export default {
    tabList: tabList,
    toPage: toPage,
    tabChange: tabChange,
    tabClose:tabClose,
    initTabList: initTabList
}