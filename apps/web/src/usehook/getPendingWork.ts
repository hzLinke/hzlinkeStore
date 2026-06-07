import api from '@/request/api'
import {useAppStore} from '@/stores'
const appStore = useAppStore()
export async function getPendingWork(){
    const loginDatas = appStore.loginDatas
	const basicParam = {
        fieldName:'count(*) as count',
        condition:'status=0',
	}
    const saleCondition = loginDatas.postcode==-1?`shipperCode='${loginDatas.idcode}' and status<2`:`status<2`;
    const exChangeNum = await api.comonRequest('/masterapi/publicApi/','getFieldValue',
        Object.assign(basicParam,{tableName:'V_IntegralExChange_Apply_Tab'}))
    const saleNum = await api.comonRequest('/masterapi/publicApi/','getFieldValue',
        Object.assign(basicParam,{tableName:'L_Bill_Sale_tab',condition:saleCondition}))
    const productApplayNum = await api.comonRequest('/masterapi/publicApi/','getFieldValue',
        Object.assign(basicParam,{tableName:'L_Basic_Product_tab',condition:'status=-1'}))
   
    const pendingWork = {
        exChnageNum :   exChangeNum.val,
        shipperNum  :   0,
        productNum  :   productApplayNum.val,
        outNum      :   saleNum.val
    }
    return await pendingWork
}
