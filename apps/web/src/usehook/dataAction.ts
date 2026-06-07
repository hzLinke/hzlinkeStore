import $api from '@/request/api';
import $Util from '@v4x/utils/lkxUtil'
import {MessageBox,ModalResultEnum} from '@v4x/ui'
export async function getProduct(Params?: any){
    const _Params =  {
        procName:'Sp_GetProductInfEx',
        procParmars:Object.assign(
            {
                inputText:'10001',
                mchCode:'',
                customerCode:0,
                StoreCode:1,
                AreaCode:0,
                BillType:0,
                IsS4:false,
                Data: $Util.getDate()
        },Params)
    }
   // console.log(_Params,Params)
    MessageBox.loading({moreText:'正在查询....'})
    const res = await $api.comonRequest('/masterApi/PublicApi/','getFromProc',_Params)
    MessageBox.closeAllLoading()
    if (res.errCode==0)
        return res.datas
    else 
        return false
}

/**
 * 商品是否存在
 * @param ApiPath 
 * @param condition 
 * @returns 
 */
export async function dataIsExist(ApiPath: string,condition: string){
    const _Params =  {
        condition: condition
    }
    const res = await $api.comonRequest(ApiPath,'dataIsExist',_Params)
    if (res.errCode==0)
        return res.datas
    else 
        return false
}
/**
 * 商品是否存在报价
 * @param ApiPath 
 * @param condition 
 * @returns 
 */
export async function dataIsExistQuotedPrice(ApiPath: string,condition: string){
    const _Params =  {
        condition: condition
    }
    const res = await $api.comonRequest(ApiPath,'dataIsExistQuotedPrice',_Params)
    if (res.errCode==0)
        return res.datas
    else 
        return false
}
export default {
    getProduct: getProduct,
    dataIsExist: dataIsExist
}