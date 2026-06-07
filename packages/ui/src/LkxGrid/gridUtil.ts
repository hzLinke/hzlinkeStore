import { TableColumnsType } from '@v4x/ui';
import {export2Excel as export2ExcelUtil} from '@v4x/utils'
import {arraySwapRows} from '@v4x/utils'
import {computed} from 'vue'

export  function useComputed(fn:Function) {
    const cache = new Map();
    const getCache = (args: any)=>{
        return cache.get(JSON.stringify(args))
    }
    return function(...args: any){
        const cacheResult = getCache(args);
        if (cacheResult){
            return cacheResult.value;
        }
       
        const result = computed(()=>fn(...args))
        cache.set(JSON.stringify(args),result)
       // console.log('fn',result)
        return result.value;
    }
    
}

export function getStringWidth(s: string){
	const span = document.createElement("span");
	span.innerHTML = s;
	document.body.appendChild(span);
	const width = span.offsetWidth;
	document.body.removeChild(span);
	return width;
}
/**
 * 冻结行列CSS*
 * @param item Object 列参数
 * @param rowIndex 行号
 * @returns 
 */
 export function fixedTheadCls(item: TableColumnsType,rowIndex: number){
    let res: any = []
    switch  (item.fixed){
        case undefined:
            res = [
                'fixed',
                'fixed-top',
                'fixed-top-'+ rowIndex
            ]
            break
        default :
            if (item.fieldKind == 'sep'||item.fieldKind == 'opt'){ //序号
                res = [
                    'fixed',
                    'fixed-'+item.fixed,
                    'fixed-'+item.fixed+'-1',
                    'fixed-top',
                    'fixed-top-1'
                ]
            } else {
                res = [
                    'fixed',
                    'fixed-'+item.fixed,
                    'fixed-'+item.fixed+'-1',
                ]
            }
            
            break
    }
    return res;
} 

/**
 * 冻结表格合计CSS*
 * @param item Object 列参数
 * @param rowIndex 行号
 * @returns 
 */
 export function fixedTfootCls(item: TableColumnsType,rowIndex: number,cellIndex: number){
    let res: any = []
    switch  (item.fixed){
        case undefined:
            res = [
                'fixed',
                'fixed-bottom',
                'fixed-bottom-'+ rowIndex
            ]
            break
        default :
            if (item.fieldKind == 'sep'||item.fieldKind == 'expand'){ //序号
                res = [
                    'fixed',
                    'fixed-'+item.fixed,
                    'fixed-'+item.fixed+'-'+cellIndex,
                    'fixed-bottom',
                    'fixed-bottom-1'
                ]
            } else {
                res = [
                    'fixed',
                    'fixed-'+item.fixed,
                    'fixed-'+item.fixed+'-1',
                    'fixed-bottom',
                    'fixed-bottom-1'
                ]
            }
            
            break
    }
    return res;
} 
/**
 * 列位置移动
 * @param columns 列头数组
 * @param fromCellIndex 原列
 * @param toCellIndex 位置列
 * @returns 
 */
export function swapCell(columns: TableColumnsType[],  fromCellIndex: number, toCellIndex: number): void{
   // console.log(fromCellIndex,toCellIndex)
    if (fromCellIndex == undefined||fromCellIndex<0||!toCellIndex==undefined||toCellIndex<0) return
    if (fromCellIndex==toCellIndex) return;
    if (fromCellIndex<toCellIndex){
        toCellIndex-- //向右 减一
    }
    if (fromCellIndex==toCellIndex) return;
    const bakvalue = columns[fromCellIndex]
    columns.splice(fromCellIndex,1)
    columns.splice(toCellIndex,0,bakvalue)
}
/**
 * 获取传入标签的,指定名称父级标签
 *
 * @param  { HTMLElement } startTag 初始dom节点
 * @param  {String} NodeName|classNmae 查找的节点名称或类名
 * @return {type} 递归/初始dom节点的指定父级节点
 */
 export function getParentNode(startNode: HTMLElement,NodeName: string): any {
    if (!(startNode instanceof HTMLElement)) return //console.error('无效节点');
    if (startNode.nodeName == NodeName||startNode.className == NodeName){
        return startNode
    } else {
        return getParentNode((startNode as any).parentNode, NodeName)
    }
}
/**
 * 根据字段名得到列号
 * @param columns 列头数组
 * @param fieldName 字段名
 * @returns number
 */
export function fieldToColIndex (columns: TableColumnsType[],fieldName: string): number{
    let _inx = 0
    if (!fieldName) return _inx   
    for (let i=0;i<columns.length;i++){
        if (columns[i].fieldName == fieldName){
            _inx = i
            break
        }
    }
    return _inx
}

/*根据title 中的"|"返回最大行数
    @columns Array  设置的列参数
    @return Number 行数
*/
export function getRowNumber(columns: any): number{
    const _tempArr: number[] =[];
    for (let i=0;i<columns.length;i++){
        const _colList = columns[i].title.split('|')
        _tempArr.push(_colList.length)
    }
    return Math.max(..._tempArr)
}

/*返回每行的新参数 
    控制colspan,rowsapn
    @columns Array  设置的列参数
    @rwoNumber Number 行数
    @rowIndex  number 行号
    @return  Array 行列参数
*/
const getRowOptions = (columns: TableColumnsType[],rowNumber: number,rowIndex: number): TableColumnsType[]=> {
    const arr: any = []
    const _Columns = columns.filter((item: any)=>{
        return item.title.split('|').length > rowIndex
    })
    const maxRow = getRowNumber(columns)
   // console.log('row'+rowIndex,_Columns)
    for (let i=0;i<_Columns.length;i++){
        const columnObj = Object.assign({colspan: 1,rowspan:1},_Columns[i])
        if (columnObj.visible == false){
            continue
        }
        const capList = columnObj.title.split('|')
        const caption = capList[rowIndex]
        columnObj.title = caption
        columnObj.rowspan = capList.length==1?maxRow-rowIndex:1
        if (arr.length>0 && caption){
            if (arr[arr.length-1].title == caption){
                arr[arr.length-1].colspan = arr[arr.length-1].colspan+1
                continue
            }
        }
        arr.push(columnObj)
    }
    return arr;
}
/*返回表头格式数据 
    @columns  设置的列参数

    @return Array(二维) 
*/
export function getHeadColumns(columns: TableColumnsType[]): TableColumnsType[]{
    const _rowNumber: number = getRowNumber(columns);
    const res: any = []
    for (let i=0;i<_rowNumber;i++){
        const _rowOptions = getRowOptions(columns,_rowNumber,i)
        res.push(_rowOptions)
    }
    return res; 
}

/**
 * 返回指定列前面列宽度和
 * @param columns :Array 表头参数 
 * @param cellIndex :列号
 * @returns 
 */
export function getBeforeCellTotalWidth(columns: TableColumnsType[],cellIndex: number): string{
    let _width = 0
    if (cellIndex ==0 ) return _width+'px'
    for (let i=0;i<cellIndex;i++){
       _width = _width + (columns[i].width as number)
    }
    return _width+'px'
}
/**
 * 导出Excel
 * @param columns 表头Array，
 * @param list 数据Array
 */
export function export2Excel(columns: any,list: any){
    // 使用 @v4x/utils 中的导出函数，直接传递列定义和数据
    export2ExcelUtil(columns, list);
}

export function dragStart(e: DragEvent){
    if ((e.target as any).tagName === 'TR') {
        (e.dataTransfer as any).effectAllowed = 'move';
       /* e.dataTransfer.setData('IdCode', idcode);
        e.dataTransfer.setData('RowIndex',rowIndex)
        console.log(idcode,rowIndex)
        */
    }
}
export function dragOver(e: any){
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
   // console.log('Drag',e.target.parentNode.parentNode)
}

export function drop(e: any,tagrgetIdCode: number,tagrgetRowIndex: number,datas: any,callback: Function){
    e.preventDefault();
    /*const curIdCode =  e.dataTransfer.getData('IdCode')
    const curRowIndex =  e.dataTransfer.getData('RowIndex')
    if (curRowIndex == tagrgetRowIndex) return;
    const _val = datas.splice(curRowIndex,1)
    _val[0]['idcode'] = tagrgetIdCode;
    datas.splice(tagrgetRowIndex,0,_val[0])
    callback&&callback({datas,tagrgetRowIndex,curRowIndex,tagrgetIdCode,curIdCode})*/
}

export function dragEndCallBack(...args: any[]){
    const tagrgetRowIndex = args[0].tagrgetRowIndex;
    const curRowIndex = args[0].curRowIndex
    if (tagrgetRowIndex<curRowIndex){//向上
        for (let i=tagrgetRowIndex+1;i<=curRowIndex;i++){
            args[0].datas[i].idcode = (+args[0].datas[i].idcode) +1 
        }
    } else {
        for (let i=tagrgetRowIndex-1;i>=curRowIndex;i--){
            args[0].datas[i].idcode = (+args[0].datas[i].idcode) -1 
        }
    }
   
   // console.log(args[0].datas)
}
