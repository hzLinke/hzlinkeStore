/**
 * 返回字符串中指定字符之前的数字然后和单位相连
 * @param str    字符串
 * @param unitChar  单位字符
 * @returns 数字+单位或''
 * @example getNumberAndUnit('可乐300ML4件分开装', '件') // 4件
 */
const getNumberAndUnit=(str: string, unitChar: string): string=>{
    const regex = new RegExp(`(\\d+)\\${unitChar}`);
    const match = str.match(regex);
    return match ? match[1]+unitChar : '';
  }
/**
 * 在指定字符之前插入字符
 * @param str  字符串
 * @param insChar  插入的字符
 * @param unitList  计量单位数组
 * @returns 插入后的字符串
 * @example insertCharAt('可乐300ML4件分开装', '|',['kg','件']) // 可乐300ML|4|件分开装
 */
 export const insertCharAt=(str: string, insChar: string,unitList: string[]): string=> {
    let opStr = str.toUpperCase(),numUnitStr = '',unitChar='';
    if (!opStr) return '';
    opStr =  opStr.replace(/\t|\s/g, '')//过滤掉制表符和空格
    // 查找数字和单位
    for (let i=0;i<unitList.length;i++){
        unitChar = unitList[i].toUpperCase();
        numUnitStr = getNumberAndUnit(opStr, unitChar);
        if (numUnitStr){
            break;
        }  // 若找到符合要求的单位，立即返回。
    }
    if (!numUnitStr){
        return opStr;  // 若没有找到数字和单位，返回原字符串不作处理。
    }
    // 获取数字和单位原字符串的位置。
    const numberIndex = opStr.indexOf(numUnitStr);
    // 单位的位置
    const unitIndex = numUnitStr.indexOf(unitChar);
    // 在数字和单位之间插入字符（将数量与单位分隔)
    const splitNumUnitStr = numUnitStr.slice(0, unitIndex) + insChar +numUnitStr.slice(unitIndex);
    // 在原字符串中插入字符
    return opStr.slice(0, numberIndex) + insChar + splitNumUnitStr+insChar+opStr.slice(numberIndex+numUnitStr.length);
}