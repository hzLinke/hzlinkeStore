import api from '@/request/api'
export async function getPostItems(postCode: number){
	const levelAParam = {
			tableName:'L_Nav_Func_header_tab',
			fields:'IdKey,0 as level,idcode,pcode,vis as checked,title,showModel',
			sortFields:'idCode',
			condition:`postCode=${postCode} and sysVis = 1 and title<>'-'`,
			returnTotal:false,
			totalFieldSql:'',
			page:1,
			pageSize:0
	}
    const levelBParam = {
        tableName:'L_Nav_Func_Detail_tab',
        fields:'IdKey,1 as level,idcode,pcode,vis as checked,title,showModel',
        sortFields:'idCode',
        condition:`postCode=${postCode} and sysVis = 1 and title<>'-'`,
        returnTotal:false,
        totalFieldSql:'',
        page:1,
        pageSize:0
    }
    const levelCParam = {
        tableName:'L_Nav_Func_Detail_children_Tab',
        fields:'IdKey,2 as level,idcode,pcode,vis as checked,title,showModel',
        sortFields:'idCode',
        condition:`postCode=${postCode} and sysVis = 1 and title<>'-'`,
        returnTotal:false,
        totalFieldSql:'',
        page:1,
        pageSize:0
    }
    const levelDParam = {
        tableName:'L_Nav_Func_Power_Tab',
        fields:'IdKey,3 as level,idcode,pcode,vis as checked,title',
        sortFields:'idCode',
        condition:'postCode='+postCode,
        returnTotal:false,
        totalFieldSql:'',
        page:1,
        pageSize:0
    }
	const LevelARes = await api.getData('/masterapi/publicApi/',levelAParam)
	const LevealADatas = LevelARes.datas;
	const LevelBRes = await api.getData('/masterapi/publicApi/',levelBParam)
    const LevealBDatas = LevelBRes.datas;
    const LevelCRes = await api.getData('/masterapi/publicApi/',levelCParam)
    const LevealCDatas = LevelCRes.datas;
    const LevelDRes = await api.getData('/masterapi/publicApi/',levelDParam)
    const LevealDDatas = LevelDRes.datas;

    let NexLevelDatas = [] as any;
    //第三级与第四级关联
    for (let i=0;i<LevealCDatas.length;i++){
        //取下级数据 (只有权限数据)
        NexLevelDatas = LevealDDatas.filter(function(item: any){
            item.children = []
            return item.pcode==LevealCDatas[i].idcode
        })
        LevealCDatas[i].children = NexLevelDatas; 
    }
    //第二级与第三级关联
    for (let i=0;i<LevealBDatas.length;i++){
        //取下级数据
        NexLevelDatas = LevealCDatas.filter(function(item: any){
            return item.pcode==LevealBDatas[i].idcode
        })
        if (NexLevelDatas.length==0){
            const PoweDatas = LevealDDatas.filter(function(item: any){
                return item.pcode==LevealBDatas[i].idcode
            })
            LevealBDatas[i].children = PoweDatas;  
        } else  {
             LevealBDatas[i].children = NexLevelDatas; 
        } 
           
    }
    //第一级与第二级关联
    for (let i=0;i<LevealADatas.length;i++){
        //取下级数据
        NexLevelDatas = LevealBDatas.filter(function(item: any){
            return item.pcode==LevealADatas[i].idcode
        })
        if (NexLevelDatas.length==0){
            const PoweDatas = LevealDDatas.filter(function(item: any){
                return item.pcode==LevealADatas[i].idcode
            })
            LevealADatas[i].children = PoweDatas; 
        }else  {
            LevealADatas[i].children = NexLevelDatas;   
        }
              
    }
    const NavItems = LevealADatas;
	return NavItems
}
