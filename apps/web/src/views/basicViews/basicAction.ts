import {
    DataSourceType,
} from '@v4x/ui';
import $Utils from '@v4x/utils/lkxUtil'
import {TGridAction} from "@/usehook/gridAction"
import useAppStore from '@/stores';

export class TBasicAction<T = any> extends TGridAction<T>{
    constructor(dataSource: DataSourceType, instanceRefs: Partial<T>){ 
        super(dataSource, instanceRefs);
        this.Events = $Utils.deepObjectMerge(this.Events,{
            gridKeyDown:(e: KeyboardEvent)=>{
                if (e.key=='Escape'){
                    useAppStore().activeWin?.closeWin()
                }
            }
        });
    }
   
}
