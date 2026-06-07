
import {TGridAction} from "@/usehook/gridAction"
import { DataSourceType } from '@v4x/ui';
export class TReportsAction extends TGridAction{
    constructor(dataSource: DataSourceType,instanceRefs: any){ 
        super(dataSource,instanceRefs)
    }
}
