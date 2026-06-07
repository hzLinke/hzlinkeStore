import api from '@/request/api'
import pako from 'pako'
import atob from 'atob'
import { defineComponent,provide,ref } from 'vue';
const buildAllCate = (CateDatas: [])=>{
    let newCateDatas: any[] = []
    //1.将一级分类取出
    const PCateDatas = CateDatas.filter((item: any)=>{
        return item.pcode<100
    })
    for (let i=0;i<PCateDatas.length;i++){
        newCateDatas.push(PCateDatas[i]);
        const SubCateDatas = CateDatas.filter((item: any)=>{
            return item.pcode == (PCateDatas[i] as any).idcode
        })
        newCateDatas = [...newCateDatas,...SubCateDatas]
    }
    return newCateDatas
   // console.log(newCateDatas)
}
export async function getCommonDatas(PostCode: number){
    const resCommon = await api.comonRequest('/masterApi/disApi/commonDatas/','get',{PostCode:PostCode})
    
    const comonDatas = {
        SysParamDatas: resCommon.datas[0].sysParamDatas,
        AccountBookDatas: resCommon.datas[0].accountBookDatas,
        PostDatas:   resCommon.datas[0].postDatas,
        UserDatas: resCommon.datas[0].userDatas,
        ProjectDatas: resCommon.datas[0].projectDatas,
        CustomerDatas: resCommon.datas[0].customerDatas,
        customerFromProjDatas: resCommon.datas[0].customerFromProjDatas,
        ShipperDatas: resCommon.datas[0].shipperDatas,
        CateDatas:  resCommon.datas[0].cateDatas.filter((item: any)=>item.pcode==-1||item.pcode>100),
        PCateDatas: resCommon.datas[0].cateDatas.filter((item: any)=>item.pcode<100),
        AllCateDatas:  buildAllCate(resCommon.datas[0].cateDatas),
        AreaDatas:  resCommon.datas[0].areaDatas,
        SettlementTypeDatas:  resCommon.datas[0].settlementTypeDatas,
        PayTypeDatas:  resCommon.datas[0].payTypeDatas,
        AccountsDatas:  resCommon.datas[0].accountsDatas,
        SubjectInDatas:  resCommon.datas[0].subjectInDatas,
        SubjectOutDatas:  resCommon.datas[0].subjectOutDatas,
        PowerDatas:  resCommon.datas[0].powerDatas,
        LtdDatas:  resCommon.datas[0].ltdDatas

    }
   //console.log(comonDatas)
    return comonDatas
}
