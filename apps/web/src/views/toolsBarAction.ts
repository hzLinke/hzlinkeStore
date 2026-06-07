import { defineComponent,toRaw,ref,reactive,getCurrentInstance,provide,inject,ComponentPublicInstance} from 'vue'
import { useRouter,Router} from "vue-router";
import {MessageBox,ModalResultEnum} from '@v4x/ui'
import { useAppStore } from '../stores'
import {Print} from '@v4x/utils'
/**
 * 
 * @param Instance 当前Vue
 * @param router 路由
 * @param data 单击项目属性
 * @returns 
 */
export async function toolsBarClick(Instance: ComponentPublicInstance,router: Router,data: any){
    //const thisInstance = Instance as any;// (router.currentRoute.value.matched[1].instances.default as any);
    const appStore = useAppStore();
    if (data.idCode == '_Close'){
        if (appStore.activeWin){
            appStore.activeWin.closeWin()
        } else {
            MessageBox.question({
                title:'提问',
                content:'是否退出系统？'
            }).then(res=>{
               // console.log(res)
                if (res.action == ModalResultEnum.mrConfirm){
                    sessionStorage.clear();
                    router.replace({
                        name:'Login'
                    })
                }
            })
        }
        return
    }
    if (!appStore.activeWin) return
     if (data.idCode == '_Print'){
        //用于打印没有表格组件的页面 
        if (appStore.activeWin?.printDom){
            if (appStore.activeWin.beforePrint){
                appStore.activeWin.beforePrint().then(()=>{
                    setTimeout(()=>{
                        Print(appStore.activeWin?.printDom);
                        //@ts-ignore
                        appStore.activeWin!.instanceRefs!.startPrint!.value = false;
                    },100)
                })
            } else {
                Print(appStore.activeWin.printDom)
            }
            return
        }
    }
    if (!appStore.activeWin.ActiveGridAction) return
     
    switch (data.idCode){
        case '_Insert':
            console.log('insert',appStore.activeWin.ActiveGridAction)
            appStore.activeWin.ActiveGridAction?.insert()
            break;
        case '_Delete':
            appStore.activeWin.ActiveGridAction?.delete()
            break;
        case '_Cancel':
            appStore.activeWin.ActiveGridAction?.cancel()
            break;
        case '_Save':
            appStore.activeWin.ActiveGridAction?.update()
            break;
        case '_Examine':
           // if (thisInstance.Win.ActiveGridAction.alowSubmit)
                appStore.activeWin.ActiveGridAction?.submit(1)
            break;
        case '_UnExamine':
           // if (thisInstance.Win.ActiveGridAction.alowSubmit)
                appStore.activeWin.ActiveGridAction?.submit(-1)
            break;
        case '_Search':
            if (appStore.activeWin.ActiveGridAction?.TableConfig?.allowedOperations?.alopSearch)
                await appStore.activeWin.ActiveGridAction?.openSerarchWin();
            break;
        case '_Print':
            if (!appStore.activeWin.ActiveGridAction?.PowerList.allowedPrint){
                MessageBox.warning({
                    title:'警告',
                    content:'对不起您没有权限，请找系统员分配',
                    showCancel: false
                })
                return
            }
            const res = await appStore.activeWin?.ActiveGridAction?.beforePrint()
            if (!res) return
            if (!appStore.activeWin?.ActiveGridAction?.TableConfig.title){
                appStore.activeWin.ActiveGridAction.TableConfig.title = appStore.activeWin?.Caption;
            }
           
            appStore.activeWin?.ActiveGridDom?.print().then((rs: boolean)=>{
                if (!rs) return;
                setTimeout(() => {
                    if (appStore.activeWin){
                        const printDom = appStore.activeWin.ActiveGridDom?.PrintDom
                        if (printDom){
                            Print(printDom)
                        }
                        appStore.activeWin.ActiveGridDom!.startPrint = false
                    }
                }, 100);
            })
            break;
    }
}