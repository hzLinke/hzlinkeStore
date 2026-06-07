import api from '@/request/api'
export async function getNavItems(postCode: number) {
    const PostPar = {
        tableName:'L_Nav_Func_Power_tab',
        fields:'IdCode,PCode,Vis',
        sortFields:'idCode',
        condition:'PostCode='+postCode,
        returnTotal:false,
        totalFieldSql:'',
        page:1,
        pageSize:0
    }
    const PostRes = await api.getData('/masterapi/publicApi/',PostPar)
    const PostItem = PostRes.datas;
	const par = {
			tableName:'L_Nav_Func_header_tab',
			fields:'0 as level,idcode,pcode,vis as checked,title,viewpath,iconcls,showModel',
			sortFields:'idCode',
			condition:'postCode='+postCode+' and sysVis = 1 and vis=1',
			returnTotal:false,
			totalFieldSql:'',
			page:1,
			pageSize:0
	}
	const headerRes = await api.getData('/masterapi/publicApi/',par)
	const navItems = headerRes.datas;
	const detailPar = {
			tableName:'L_Nav_Func_Detail_tab',
			fields:'1 as level,idcode,pcode,vis as checked,title,viewpath,iconcls,showModel',
			sortFields:'idCode',
			condition:'postCode='+postCode+' and sysVis = 1 and vis=1',
			returnTotal:false,
			totalFieldSql:'',
			page:1,
			pageSize:0
	}
	const detailRes = await api.getData('/masterapi/publicApi/',detailPar)

    const detailChildrenPar = {
        tableName:'L_Nav_Func_Detail_children_Tab',
        fields:'2 as level,idcode,pcode,vis as checked,title,viewpath,iconcls,showModel',
        sortFields:'idCode',
        condition:'postCode='+postCode+' and sysVis = 1 and vis=1',
        returnTotal:false,
        totalFieldSql:'',
        page:1,
        pageSize:0
    }
    const detailChildrenRes = await api.getData('/masterapi/publicApi/',detailChildrenPar)
    for (let i=0;i<navItems.length;i++){
		const arr = detailRes.datas.filter(function(item: any){
			return item.pcode==navItems[i].idcode
		})
        for (let i=0;i<arr.length;i++){
            const childrenArr = detailChildrenRes.datas.filter(function(item: any){
                return item.pcode==arr[i].idcode
            })
            arr[i].children = childrenArr
        }
		navItems[i].children = arr
	}
	return {navDatas:navItems,postDatas:PostItem}
}
