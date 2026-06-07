import {ref, getCurrentInstance, inject, type Ref, type UnwrapNestedRefs} from 'vue'
import { useRoute } from "vue-router"
import {
    LkxGrid,MessageBox,ModalResultEnum,type PowerListType
} from '@v4x/ui'

import {TGridAction} from "@/usehook/gridAction"

import $api from '@/request/api'

import type { InstanceRefsBase } from '@/views/types'
import { useAppStore } from '../stores';

type LkxGridInstance = InstanceType<typeof LkxGrid>

export class TWinForm<T extends InstanceRefsBase = InstanceRefsBase> {
    public PowerList: PowerListType = {
            allowedInsert: true,
            allowedEdit: true,
            allowedDelete: true,
            allowedPrint: true,
            allowedViewCostPrice: true,
            allowedSubmit: true,
            allowedUnSubmit: true,
            allowedExport: true,   //导出数据
            allowedSaveStyle: true, //保存样式
            allowedClearStyle: true,//清除样式
            allowedCancelCol: true,//取消列
            allowedRecoveryCol: true,//恢复列
            allowedTableSet: true//表格设置
    }
    public CloseTab: any = inject('CloseTab') ;
    public ActiveGridAction: UnwrapNestedRefs<TGridAction<any>> | null = null;
    public ActiveGridDom: Ref<LkxGridInstance | null> | null = null;
    public printDom: any = null;
    public instanceRefs: Partial<T>;
    public Caption = '';
    public PrintStyleList: any[] = [];
    constructor(instanceRefs: Partial<T>){        
        const route = useRoute(); 
        this.Caption = route.query.title as any

        this.instanceRefs = instanceRefs;

        useAppStore().winList.set(route.query.idcode as string,this as any);
        useAppStore().activeWin = this as any;
        this.initPower()
    }
       
    public async beforePrint(){
        return true    
    }
    public switchGrid<U1 extends TGridAction<any>, U2 extends TGridAction<any>>(
        switchValue: boolean,
        gridAction1: UnwrapNestedRefs<U1>,
        gridDom1: Ref<LkxGridInstance | null>,
        gridAction2?: UnwrapNestedRefs<U2>,
        gridDom2?: Ref<LkxGridInstance | null>
    ){
        
        if (switchValue) {
            this.ActiveGridAction = gridAction2 as UnwrapNestedRefs<TGridAction<any>>;
            this.ActiveGridDom = gridDom2 as Ref<LkxGridInstance | null>;
            gridDom2?.value?.active()
        } else {
            this.ActiveGridAction = gridAction1;
            this.ActiveGridDom = gridDom1;
            gridDom1.value?.active()
        }
       /// this.setPower()
       this.ActiveGridAction.PowerList = this.PowerList
       this.ActiveGridAction.dataSource.PowerList = this.PowerList
    }
    public async closeWin():Promise<void>{
         const doClose = () => {
            if (this.instanceRefs?.detailVisabled&&this.instanceRefs.detailVisabled.value) {
                this.instanceRefs.detailVisabled.value = false
            } else {
                (this.CloseTab as any)()
            }
        }
        if (this.ActiveGridAction?.dataSource?.datasetIsChange()){
            const res = await MessageBox.question({
                title: '提问',content:'数据有改变是否保存？',
                showAbort: true,
                okText: '保存',
                abortText: '不保存'
            })
            switch (res.action){
                case ModalResultEnum.mrCancel:
                    break;
                case ModalResultEnum.mrAbort: //不保存
                    this.ActiveGridAction?.dataSource.emptyDetaiSet();
                    doClose();
                    break;
                case ModalResultEnum.mrConfirm: {        
                    const res = await this.ActiveGridAction.update() 
                    if (res) {
                     doClose()
                    }
                    break;
                }  
                   
            }
        } else {doClose()}
        
    }
    public async getPrintStyle(relationcode?: number,funcCode?: number){
        let _FuncCode
        if (!funcCode){
            const route = useRoute(); 
            _FuncCode = funcCode||route.query.idcode
        } else {
            _FuncCode = funcCode
        }
        
        const _relationcode = relationcode||0;
        const basicParam = {
            tableName: 'l_PrintStyle_tab',
            fields:'xh,styleName,style',
            sortFields:'xh',
            condition:`funcCode=${_FuncCode} and relationcode=${_relationcode}`,
            returnTotal:false,
            totalFieldSql:'',
            page:1,
            pageSize:0
        };
        const res = await $api.getData('/masterapi/publicApi/',basicParam)
        return res.datas;
    }
    /**
     * 获取权限
     */
    public initPower(){
        const route = useRoute(); 
        const funcCode = route.query.idcode
        const powerDatas = useAppStore().commonDatas.PowerDatas
        if (!powerDatas) return
        const postList = powerDatas.filter((item: any)=>{
            return item.pcode==funcCode 
        })
        
        if (!postList) return
        
        postList.forEach((item: any) => {
            const permissionType = parseInt(item.idcode.slice(-2))
            const hasPermission = item.vis == '1'
            
            switch (permissionType){
                case 1:
                    this.PowerList.allowedInsert = hasPermission
                    break
                case 2:
                    this.PowerList.allowedEdit = hasPermission
                    break
                case 3:
                    this.PowerList.allowedDelete = hasPermission
                    break
                case 4:
                    this.PowerList.allowedPrint = hasPermission
                    break
                case 5:
                    this.PowerList.allowedExport = hasPermission
                    break
                case 6:
                    this.PowerList.allowedSubmit = hasPermission
                    break
                case 7:
                    this.PowerList.allowedUnSubmit = hasPermission  
                    break
            } 
        })
    }
}
