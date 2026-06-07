/*工个类*/
//import { String } from 'aws-sdk/clients/apigateway';
import {ref} from 'vue'
import { ExportJsonToEexcel }  from './excel/Export2Excel';
/**
*防抖和节流类
*/
export class ActionControl{
    timeout=0;
    fn: any=null;
    wait=0;
    preActionTime=0;
    constructor(fn: any,wait: number){
        this.fn=fn;
        this.wait=wait;
    }
    debounce(): void{
        if(this.timeout!==0) clearTimeout(this.timeout);//清除这个定时器
        this.timeout=window.setTimeout(this.fn,this.wait);
    }
    throttle(): void{
        if(this.preActionTime===0) this.preActionTime = new Date().getTime();
        const timeBetween=new Date().getTime()-this.preActionTime;
        if(timeBetween>=this.wait){
            this.timeout=window.setTimeout(()=>{
                this.fn();
                this.preActionTime=0;
            },this.wait);
        }
    }
}

 /**
 * 是否数字
 * @param {String|number} value
 */
  export function isNumber(value: string|number){ 
   return !isNaN(parseFloat(value as string))
   //return typeof value === 'number'
   /*
	const patrn = /^(-?\d*.?\d*)$/;// /^(-)?\d+(\.\d+)?$/; 
    console.log('value',typeof value)
	if (patrn.exec(value as string) == null || value == "") {
		return false
	} else {
		return true
	}*/
}

/**
 * 判断是否浮点数（包含小数）
 * @param {String|number} value
 * @returns {boolean}
 */
export function isFloat(value: string|number): boolean {
    if (value === null || value === undefined || value === '') return false
    const num = parseFloat(value as string)
    if (isNaN(num)) return false
    // 检查是否有小数点且小数部分不为0
    const str = value.toString()
    if (str.indexOf('.') !== -1) {
        const parts = str.split('.')
        if (parts.length === 2 && parts[1].length > 0 && parseInt(parts[1]) !== 0) {
            return true
        }
    }
    // 整数但可通过科学计数法表示为小数
    return num !== Math.floor(num)
}

/**
 * 不足位补0
 * @param num 数据
 * @param len 长度
 * @returns 
 */
function formatZero(num: string,len: number): string{
    if (num.length>= len) return num;
    return (Array(len).join('0')+num).slice(-len)
}

/**
 * 自定fixed 解决原生fixed四舍五入问题
 * @param data 
 * @param len 
 * @returns 
 */
export function toFixedFun (data: string|number, len: number){
    /// 先处理可能的精度问题
  let number = Number(data);
  
  if (isNaN(number) || number >= Math.pow(10, 21)) {
    return number.toString();
  }
  
  // 解决浮点精度问题的关键步骤
  // 检测并修复明显的浮点误差
  const precision = Math.pow(10, 10); // 使用足够大的精度
  const rounded = Math.round(number * precision) / precision;
  number = rounded;
  
  if (typeof (len) === 'undefined' || len === 0) {
    return (Math.round(number)).toString();
  }
  
  const isNegative = number < 0;
  let result = number.toString();
  const numberArr = result.split('.');

  if (numberArr.length < 2) {
    // 整数的情况
    return padNum(result);
  }
  
  const intNum = numberArr[0]; // 整数部分
  const deciNum = numberArr[1]; // 小数部分
   
  const lastNum = deciNum.substring(len, len + 1); // 最后一个数字
  
  if (deciNum.length === len) {
    // 需要截取的长度等于当前长度
    return result;
  }
  
  if (deciNum.length < len) {
    // 需要截取的长度大于当前长度 1.3.toFixed(2)
    return padNum(result);
  }
  
  // 需要截取的长度小于当前长度，需要判断最后一位数字
  result = `${intNum}.${deciNum.substring(0, len)}`;
  
  if (parseInt(lastNum, 10) >= 5) {
    // 最后一位数字大于5，要进位
    const times = Math.pow(10, len); // 需要放大的倍数
    let changedInt = Math.abs(Number(result.replace('.', ''))); // 截取后转为整数
    changedInt = changedInt + 1; // 整数进位
    changedInt = changedInt / times; // 整数转为小数
    
    if (isNegative) {
      changedInt = changedInt * -1;
    }
    
    result = padNum(`${changedInt}`);
  }
  
  return result;
  
  // 对数字末尾加0
  function padNum(num: any) {
    const dotPos = num.indexOf('.');
    if (dotPos === -1) {
      // 整数的情况
      num += '.';
      for (let i = 0; i < len; i++) {
        num += '0';
      }
      return num;
    } else {
      // 小数的情况
      const need = len - (num.length - dotPos - 1);
      for (let j = 0; j < need; j++) {
        num += '0';
      }
      return num;
    }
  }
  }
/**
 * 数字格式化输出//&0.000%
 * @param {number} number
 * @param {string} dispalyformat
 * @param {boolean} zeroToNull --0输出为空
 */
 function numberFormat(number: string|number,dispalyformat: string,zeroToNull=false): string {
     /*如果第一位数为.前面补0,pdo 会将0.1输出为.1 */
    let _thisNumber = (number as string);
    if (!_thisNumber) return _thisNumber 
    if (!dispalyformat) return _thisNumber
    if (!dispalyformat) {
        return isNumber(_thisNumber)?clearDecimal(_thisNumber): _thisNumber
    } 
    _thisNumber = _thisNumber.substring&&_thisNumber.substring(0,2)=='-.'?_thisNumber.replace(".","0."):_thisNumber
    _thisNumber = _thisNumber.charAt&&_thisNumber.charAt(0)=='.'?'0'+_thisNumber:_thisNumber
    if (!isNumber(_thisNumber)) return _thisNumber
	const getdecimals=function(dispalyformat: string){//小数位
		const decimals = dispalyformat.split('.')
		const numberObj: any ={}
		if (decimals.length==2){
			let data=decimals[1]
			numberObj.decimals= data.replace(/[^\d]/g, "").length //小数位
			data=decimals[1]
			numberObj.per= data.replace(/[\d]/g, "") //后面的%
		}
		numberObj.front = decimals[0].replace(/[\d]/g, "") //前面的
		return numberObj
	}
	const formatData = getdecimals(dispalyformat)
	const decimals = formatData.decimals
	
	//const res = (formatData.front=='￥'?'¥':formatData.front)+ parseFloat(_thisNumber.toString()).toFixed(decimals)+formatData.per;
    const res = (formatData.front=='￥'?'¥':formatData.front)+ toFixedFun(_thisNumber,decimals)+formatData.per;
	if (parseFloat(res)==0&&zeroToNull){
        return ''
    } else {
        return res
    }
}

//| 日期时间有效性检查 
//| 格式为：YYYY-MM-DD HH:MM:SS 
function checkDateTime(str: string): boolean { 
	//补齐全时间
	const tempDate = (str as string).split(' ')
	if (tempDate.length == 1){
		str = str+' 00:00:00'
	} else {
		const  tempTime = tempDate[1].split(':');
		str = str +':00'.repeat(3-tempTime.length)
	}
	
	const reg=/^(\d+)-(\d{1,2})-(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
	const r: any=str.match(reg); 
	if(r==null) return false; 

	r[2]=r[2]-1; 
	const d= new Date(r[1],r[2],r[3],r[4],r[5],r[6]); 
	if(d.getFullYear()!=r[1]) return false; 
	if(d.getMonth()!=r[2]) return false; 
	if(d.getDate()!=r[3]) return false; 
	if(d.getHours()!=r[4]) return false; 
	if(d.getMinutes()!=r[5]) return false; 
	if(d.getSeconds()!=r[6]) return false; 
	return true; 
}

/**
 * 格式化日期
 * @param {Number|string} Data 时间戳数字或者字符串日期
 * @param {String} fmt 格式"yyyy-MM-dd HH:mm:ss"||"yyyy-MM-dd"
 */
 function dateFormat(date: string|number,fmt: string): string{ 
    if (!date) return '';
    const _date = typeof date == 'string'?date.replace(/-/g,'/'):date;
	//_dataStr = _dataStr.replace(/-/g,'/');//将-连接日期转成/连接，不然无输入小时的时候时间会加8*/
	const D = new Date(_date)
    const o: any = {
        "M+" : D.getMonth()+1, //月份
        "d+" : D.getDate(), //日
        "h+" : D.getHours(),//D.getHours()%12 == 0 ? 12 : D.getHours()%12, //12小时制
        "H+" : D.getHours(), //小时(24小时制)
        "m+" : D.getMinutes(), //分
        "s+" : D.getSeconds(), //秒
        "q+" : Math.floor((D.getMonth()+3)/3), //季度
        "S" : D.getMilliseconds() //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (D.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(const k in o)
        if(new RegExp("("+ k +")").test(fmt))
    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
} 
 /**
* 获取当前时间
* @param {string} type 类型  none|y|m|d|h|m|s
* @param {number} diff 基数 加减基数 默认0
* @param {string} format 日期格式yyyy-MM-dd HH:mm:ss 默认 yyyy-MM-dd
* @param {string|number} date 日期字符串或时间戳 date不输时以当前时间无准
*/
export function getDate(type: String='none',diff: number=0,format: string='yyyy-MM-dd',date?: string|number) {
    //formt yyyy-MM-dd 格式小时会加8，yyyy/MM/dd不会
    const _date = date?new Date(date):new Date();
    //const _date = new Date();
    const _diff = Number(diff);
    switch (type){
         case 'y':
             _date.setFullYear(_date.getFullYear()+_diff);
             break;
         case 'm':
             _date.setMonth(_date.getMonth()+_diff);
             break;
         case 'd':

             _date.setDate(_date.getDate()+_diff);
             break;
         case 'h':
             _date.setHours(_date.getHours()+_diff);
             break;
         case 'mi':
            _date.setMinutes(_date.getMinutes()+_diff);
            break;
         case 's':
             _date.setSeconds(_date.getSeconds()+_diff);
             break;
    }
    //_date.valueOf()日期转时间戳
    //return dateFormat(_date.getTime(),'yyyy-MM-dd HH:mm:ss')
    return dateFormat(_date.getTime(),format)
 }
/**
 * 得到第一日数据
 * @param date 日期
 * @param format 格式化yyyy-MM-dd|yyyy-MM-dd HH:mm:ss
 * @returns 日期
 */
 export function getMonthFirst(date?: string|number,format='yyyy-MM-dd'){
    const _date = date?new Date(date):new Date();
    _date.setDate(1);
    return dateFormat(_date.getTime(),format)
 }

 /**
 * 得到第后一日数据
 * @param date 日期
 * @param format 格式化yyyy-MM-dd|yyyy-MM-dd HH:mm:ss
 * @returns 日期
 */
export function getMonthLast(date?: string|number,format='yyyy-MM-dd'){
    const _date = date?new Date(date):new Date();
    const days = new Date(_date.getFullYear(), _date.getMonth()+1, 0).getDate()
    _date.setDate(days);
    return dateFormat(_date.getTime(),format)
}
/**
 * 返回y,m,d,h,n,s
 * @param type y|m|d|h|n|s
 * @param date 日期 无指定时取当前时间
 * @returns 
 */
export function getDatePart(type?: string,date?: string|number): number{
    const _date = date?new Date(date):new Date();
    switch (type?.toUpperCase()){
        case 'Y':
            return _date.getFullYear();
            break;
        case "M":
            return _date.getMonth()+1;
            break;
        case "D":
            return _date.getDate();
            break;
        case "H":
            return _date.getHours();
            break;
        case "N":
            return _date.getMinutes();
            break;
        case "S":
            return _date.getSeconds();
            break;
        default:
            return _date.getDate();
            break;
    }
}
/**
 * 时差
 * @param beginTime 开始时间
 * @param endTime  结束时间
 * @returns 
 */
 export function diffTime(beginTime: string,endTime: string): number{
    const BeginTime = '2021-01-01: '+beginTime;
    const EndTime  = beginTime<=endTime?'2021-01-01: '+endTime: '2021-01-02: '+endTime;
    const _begintime = new Date(BeginTime)
    const _endtime = new Date(EndTime)
    const date3=_begintime.getTime()-_endtime.getTime() //时间差的毫秒数 
    return Math.abs(date3/1000 / 3600)
 }

 /**
 * 日期差
 * @param beginDate 开始时间
 * @param endDate  结束时间
 * @returns 
 */
  export function diffDay(beginDate: string,endDate: string): number{
    const _begintime = new Date(beginDate)
    const _endtime = new Date(endDate)
    //const date3=_endtime.getDate() - _begintime.getDate() //日期差
    const date3=_endtime.getTime() - _begintime.getTime() //时间差的毫秒数 
   // console.log('abcd',date3/1000 / 3600 / 24)
    return date3/1000 / 3600 / 24
 }

 //计算两个时间之间的时间差 多少天时分秒
export function diffAt(startTime: string,endTime: string,flg='d'): number {
    const _begintime = new Date(startTime)
    const _endtime = new Date(endTime)
    const date3=_begintime.getTime()-_endtime.getTime() //时间差的毫秒数 
    let res =  date3/1000 / 3600;
    switch (flg){
        case 'y':
            res = date3/1000 / 3600 /24;
            break;
        case 'm':  
        res = date3/1000 / 3600 /24;
            break;
        case 'd':
            res = date3/1000 / 3600 /24;
            break; 
        case 'h':
            res = date3/1000 / 3600;
            break;  
    }
    return res;
    
}

/**
 * 数组求和
 * @param datas 数组
 * @param fieldName  字段名
 * @returns 
 */
 export function sumArray(datas: any,fieldName?: string): number{
    function addNum (num1: number, num2: number) {
        let sq1,sq2;
        try {
         sq1 = num1.toString().split(".")[1].length;
        }
        catch (e) {
         sq1 = 0;
        }
        try {
         sq2 = num2.toString().split(".")[1].length;
        }
        catch (e) {
         sq2 = 0;
        }
        const m = Math.pow(10,Math.max(sq1, sq2));
        return (num1 * m + num2 * m) / m;
       }
    let res = 0
    if (fieldName){
        for (let i=0;i<datas.length;i++){
            res = addNum(res, parseFloat(datas[i][fieldName]||0))
        }
    } else {
        for (let i=0;i<datas.length;i++){
            res = addNum(res, parseFloat(datas[i]))
        }
    }
    
    return res||0
}

/**
 * 根据 keyvalue 从数组返回值
 * @param {Array} arr
 * @param {String} keyFieldName
 * @param {String} resFieldName
 * @param {String} keyValue
 * @return {any}
 */
 export function getValueFromArray(arr: any,keyFieldName: string,resFieldName: string,keyValue: string|number): string|number{
	if (!arr){
		return keyValue
	} 
    const _arr = arr.filter((item: any)=>{
		return item[keyFieldName.toLocaleLowerCase()]==keyValue
	})
	if (_arr.length==0){
		return keyValue
	} 
	return _arr[0][resFieldName.toLocaleLowerCase()]
}

/**
 * 根据 val 从数组返行号
 * @param {Array} arr
 * @param {String} keyFieldName
 * @param {String} keyValue
 * @return {any}
 */
 export function getIndexFromArray(arr: any[],keyFieldName: string,keyValue: string|number): number{
	if (!arr||arr.length==0){
		return -1 
	}
    let index = -1;
    for (let i=0;i<arr.length;i++){
        if (arr[i][keyFieldName]==keyValue){
            index = i
            break;
        }
    }
	return index
}

export function arrGroup(arr: any,groupFieldName: string): any[]{
    const TempArr = [];
    for(let i=0;i<arr.length;i++){
        const _inx = getIndexFromArray(TempArr,groupFieldName,arr[i][groupFieldName]);
        if (_inx==-1) 
            TempArr.push({[groupFieldName]:arr[i][groupFieldName],children:[arr[i]]})
        else
            TempArr[_inx]['children'].push(arr[i])
    }
    return TempArr
}

export function arrGroupByFields(arr: any, groupFieldNames: string[]): any[]{
    const TempArr: any[] = [];
    for(let i=0;i<arr.length;i++){
        const groupValues = groupFieldNames.map(field => arr[i][field]);
        const groupKey = groupValues.join('|||');
        let _inx = -1;
        for(let j=0;j<TempArr.length;j++){
            const existingValues = groupFieldNames.map(field => TempArr[j][field]);
            if(existingValues.join('|||') === groupKey){
                _inx = j;
                break;
            }
        }
        if (_inx==-1) {
            const newGroup: any = {children:[arr[i]]};
            groupFieldNames.forEach(field => {
                newGroup[field] = arr[i][field];
            });
            TempArr.push(newGroup);
        } else {
            TempArr[_inx]['children'].push(arr[i]);
        }
    }
    return TempArr
}

/**
 * 是否含有中文
 * @param {String} str
 * @return {boolean}
 */
 export function IncludeChinese(str: string): boolean{ 
    if (/.*[\u4e00-\u9fa5]+.*$/.test(str)){
        return true ;
    } else {
        return false ;
    }
 }



//生成guid
export  function guid() {
	let d = new Date().getTime();
	const uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        const r = (d + Math.random()*16)%16 | 0;
        d = Math.floor(d/16);
        return (c=='x' ? r : (r&0x3|0x8)).toString(16);
	});
	return uuid;
}

/** 深度合并对象
 * 如果target(也就是FirstOBJ[key])存在，
 * 且是对象的话再去调用deepObjectMerge，
 * 否则就是FirstOBJ[key]里面没这个对象，需要与SecondOBJ[key]合并
 */
export function deepObjectMerge(FirstOBJ: any, SecondOBJ: any){ 
    for (const key in SecondOBJ) {
        FirstOBJ[key] = FirstOBJ[key] && FirstOBJ[key].toString() === "[object Object]" ?
            deepObjectMerge(FirstOBJ[key], SecondOBJ[key]) : FirstOBJ[key] = SecondOBJ[key];
    }
    return FirstOBJ;
}

export function getArrNotEqual(array1: any[],array2: any[]){
    const result= []  as any[];
    for(let i = 0; i < array2.length; i++){
        const obj = array2[i];
        const num = obj.Num;
        let isExist = false;
        for(let j = 0; j < array1.length; j++){
            const aj = array1[j];
            const n = aj.Num;
            if(n == num){
                isExist = true;
                break;
            }
        }
        if(!isExist){
            result.push(obj);
        }
    }
}
export function export2Excel(columns: any,list: any){
    const tHeader = [] as any
    const filterVal = [] as any
    columns.forEach((item: any) =>{
        if (item.title !== '#'){
            tHeader.push(item.title)
            filterVal.push(item.fieldName)
        }
    })
    const data = list.map((v: any)  => filterVal.map((j: any) => v[j.toLocaleLowerCase()]))
    ExportJsonToEexcel(tHeader, data, '数据列表');
}

export function addWaterMarker(str: string, parentNode: HTMLDivElement, font: string, textColor: string, rowLength: number, colLength: number) {// 水印文字，父元素，字体，文字颜色
    const can = document.createElement('canvas');
    parentNode.appendChild(can);
    can.width = parentNode.offsetWidth;
    can.height = parentNode.offsetHeight;
    can.style.display = 'none';
    const cans = can.getContext('2d');
    cans?.rotate(-10 * Math.PI / 180);
    cans!.font = font || "48px Microsoft JhengHei";
    cans!.fillStyle = textColor || "rgba(180, 180, 180, 0.3)";
    cans!.textAlign = 'left';
    cans!.textBaseline = 'middle';
    // 需要遍历添加文字
    cans?.fillText(str, 400, 200);
   /* for (let row = 0; row < can.height / rowLength; row++) {
      for (let col = 0; col < can.width / colLength; col++) {
        cans?.fillText(str, col * colLength, row * rowLength);
      }
    }*/
    // 在节点中添加内容
    parentNode.style.backgroundImage = "url(" + can.toDataURL("image/png") + ")";
  }

function getDPI() {
    const arrDPI =[];
    const tmpNode = document.createElement("DIV");
    tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
    document.body.appendChild(tmpNode);
    arrDPI[0] = (tmpNode.offsetWidth);
    arrDPI[1] = (tmpNode.offsetHeight);
    tmpNode.parentNode?.removeChild(tmpNode);
    return arrDPI;
}
//根据毫米算DPI
export function mm2px(mm: number) {
    const dpi = getDPI();
    console.log('dpi',dpi)
    const pixel = mm  * dpi[1] / 25.4; //只计算x轴的dPI
    return pixel
}
//根据毫米算DPI
export function px2mm(pixel: number) {
    const dpi = getDPI();
    const mm = pixel * 25.4 / dpi[1]; //只计算x轴的dPI
   return mm
}
/**
 * 前面加为0
 * @param {Object} data
 */
 function addDot(data: string){
	if (data.toString().indexOf(".")==0)
		return '0'+data
	else	
		return data
		
}
/*
去掉double类型小数点后面多余的0
参数：old 要处理的字符串或double
返回值：newStr 没有多余零的小数或字符串
例： cutZero(123.000) -> 123
cutZero(123.0001) -> 123.0001
cutZero(10203000.0101000) -> 10203000.0101
cutZero(10203000) -> 10203000 
*/
function cutZero(data: string){
	//拷贝一份 返回去掉零的新串
	let newstr=data;
	//判断是否有效数
	if(data.toString().indexOf(".")>-1){
		//循环变量 小数部分长度
		const leng = data.length-data.indexOf(".")-1
		//循环小数部分
		for(let i=leng;i>0;i--){
        //如果newstr末尾有0
            if(newstr.lastIndexOf("0")>-1 && parseInt(newstr.substr(newstr.length-1,1))==0){
                const k = newstr.lastIndexOf("0");
                //如果小数点后只有一个0 去掉小数点
                if(newstr.charAt(k-1)=="."){
                    return  newstr.substring(0,k-1);
                }else{
                //否则 去掉一个0
                    newstr=newstr.substring(0,k);
                }
            }else{
            //如果末尾没有0
                return newstr;
            }
        }
	}
	return data;
}
/**
 * 将小数位是0的项取整
 * @param {number|string} data
 */
export function clearDecimal(data: string|number,reverse?: boolean){
    if (!data) return '0'
	const temp1 = data.toString().split('/');
	if (temp1.length>1){
		const _d1 = cutZero(addDot(temp1[0]))
		const _d2 = cutZero(addDot(temp1[1]))
		return reverse?_d2+'/'+_d1:_d1+'/'+_d2;
	}
	return cutZero(parseFloat(addDot(data.toString())).toFixed(4).toString())
}
/**
 * 
 * @param 数字转人民币大写 
 * @returns 
 */
export function convertMoneyToChinese(Money: string) {
    const inputMoney = clearDecimal(Money);
    const flg = parseFloat(inputMoney)>=0?"":"负";
    const cnNums = ["零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"]; //汉字的数字
    const cnIntRadice =["", "拾", "佰", "仟"]; //基本单位
    const cnIntUnits =["", "万", "亿", "兆"]; //对应整数部分扩展单位
    const cnDecUnits = ["角", "分", "毫", "厘"]; //对应小数部分单位
    const cnInteger = "整"; //整数金额时后面跟的字符
    const cnIntLast = "元"; //整型完以后的单位
    const maxNum = 999999999999999.9999; //最大处理的数字
    let IntegerNum; //金额整数部分
    let DecimalNum; //金额小数部分
    let ChineseStr='' ; //输出的中文金额字符串
    let parts; //分离金额后用的数组，预定义
    if (inputMoney == "") {
      return "";
    }
    const money = Math.abs(parseFloat(inputMoney));
    if (money >= maxNum) {
      alert('超出最大处理数字');
      return "";
    }
    if (money == 0) {
      ChineseStr = cnNums[0] + cnIntLast + cnInteger;
      return ChineseStr;
    }
    const moneyStr = money.toString(); //转换为字符串
    if (moneyStr.indexOf(".") == -1) {
      IntegerNum = moneyStr;
      DecimalNum = '';
    } else {
      parts = moneyStr.split(".");
      IntegerNum = parts[0];
      DecimalNum = parts[1].substr(0, 4);
    }
    if (parseInt(IntegerNum, 10) > 0) { //获取整型部分转换
      let zeroCount = 0;
      const IntLen = IntegerNum.length;
      for (let i = 0; i < IntLen; i++) {
        const n = IntegerNum.substr(i, 1);
        const p = IntLen - i - 1;
        const q = p / 4;
        const m = p % 4;
        if (n == "0") {
          zeroCount++;
        } else {
          if (zeroCount > 0) {
            ChineseStr += cnNums[0];
          }
          zeroCount = 0; //归零
          ChineseStr += cnNums[parseInt(n)] + cnIntRadice[m];
        }
        if (m == 0 && zeroCount < 4) {
          ChineseStr += cnIntUnits[q];
        }
      }
      ChineseStr += cnIntLast;
      //整型部分处理完毕
    }
    if (DecimalNum != '') { //小数部分
        const decLen = DecimalNum.length;
      for (let i = 0; i < decLen; i++) {
        const n = DecimalNum.substr(i, 1);
        if (n != '0') {
          ChineseStr += cnNums[Number(n)] + cnDecUnits[i];
        }
      }
    }
    if (ChineseStr == '') {
      ChineseStr += cnNums[0] + cnIntLast + cnInteger;
    } else if (DecimalNum == '') {
      ChineseStr += cnInteger;
    }
    return flg + ChineseStr;
  
}

export function imageToBase64(url: string, callback?: Function) {
    fetch(url)
    .then(response => response.blob())
    .then(blob => {
      // 创建一个新的FileReader对象
      var reader = new FileReader();
       // 当FileReader加载完成时，调用回调函数并传入转换后的Base64字符串
      reader.onload = function(event) {
        callback&&callback(event.target?.result);
      };
      // 读取Blob对象并转换为Base64字符串
      reader.readAsDataURL(blob);
    })
    .catch(error => console.error('Error converting image to Base64:', error));
  }
/**
 * 
 * @param picUrl 图片地址
 * @param imgFieleNames 图片以;分隔文件名
 * @returns 返回第一张图的地址
 */
export function getfirstImg(picUrl: string,imgFieleNames: string,delaultImg: string){
	if (!imgFieleNames){
		return delaultImg
	}
	let imgList= imgFieleNames.split(';');
   // return require(delaultImg)
    if (imgList[0]){ 
        //console.log(imageToBase64(picUrl+imgList[0]))
        return picUrl+imgList[0]
    }
   
    return delaultImg
	//return imageToBase64(picUrl+imgList[0]||delaultImg)
}
//简单的防抖函数
export function myDebounce(fun: Function, delay: number) {
    let timer: any;
    return (...args: any)=> {
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(() => {
            fun(args);
        }, delay);
    }
}



/* 节流 */
export function myThrottle(fn: () => void, delay: number | undefined) {
    const isThtottle = ref(true)
    return () => {
        if (!isThtottle.value) return
        isThtottle.value = false
        setTimeout(() => {
            fn()
            isThtottle.value = true
        }, delay)
    }
}

/**
 * 将对象的key 改成 原key值 加列序号
 * @param {*} Obj 对像
 * @param {*} colunmIndex 列序号
 * @returns 
 */
export  function changeObjKey(Obj: Object,colunmIndex: number){
    const newObj = Object.keys(Obj).reduce((acc: Record<string, unknown>, key) => {
       // key === curKey?acc[newKey] = Obj[key]:acc[key] = Obj[key];
        acc[key+colunmIndex] = (Obj as Record<string, unknown>)[key]
        return acc;
    }, {});
    return newObj
}
/**
 * 将数据进行分栏
 * @param {*} datas 数据数组
 * @param {*} colunms 多少栏 
 * @returns 
 */
export function datasRowToColumns(datas: any,colunms: number,fField: string,changeKey: boolean = true){
var newArr = []
let tempObj = {}
let colunmIndex = 1
for (let i=0;i<datas.length;i++){
    if (fField){
        datas[i][fField] = i+1
    }
    let obj = changeKey? changeObjKey(datas[i],colunmIndex): datas[i]
   
    tempObj = Object.assign(tempObj,obj);
    colunmIndex++
    if (colunmIndex>colunms||i==datas.length-1){
        newArr.push(tempObj)
        tempObj = {}
        colunmIndex = 1
    } 
} 
return newArr
}
export function arrPaging(array: any, page_size: number, page_number: number) {
    // 计算分页开始的索引
    const start = (page_number - 1) * page_size;
    // 计算分页结束的索引
    const end = page_number * page_size;
    // 返回分页后的数组
    return array.slice(start, end);
}
/**
 * 构造打印数据
 * @param datas 源数据
 * @param printDomId 要打印的Dom ID
 * @param pagerHeight 打印纸张高度
 * @returns 分页后的数据
 */
export function buildPrintDatas(datas: any,printDomId: string,pagerHeight: number): []{
    const _Tab = document.getElementById(printDomId) as HTMLTableElement
    const _TabHeader        =   _Tab.querySelector('thead')
    const _TabTbody         =   _Tab.querySelector('tbody')
    const _TabFooter        =   _Tab.querySelector('tfoot')
    const rows              =   _Tab.rows;
    const fromIndex         =   _TabHeader?.querySelectorAll('tr').length||0;
    const footRows          =   _TabFooter?.querySelectorAll('tr').length||0;
    const _hearderHeight    =   (_TabHeader?.getBoundingClientRect().height||0).toFixed(2)
    const _footerHeight     =   (_TabFooter?.getBoundingClientRect().height||0).toFixed(2);
    const allowedHeight     =   (+mm2px(pagerHeight).toFixed(2)) -(+_hearderHeight)-(+_footerHeight) ;
   // console.log('纸张高度：',rows.length-footRows,mm2px(pagerHeight).toFixed(2),_hearderHeight,_footerHeight,allowedHeight)
    const _Arr              =   JSON.parse(JSON.stringify(datas))
    const PrintDatas        =   [] as any
    let _h = 0,_index = 0;
    for (let i=fromIndex;i<rows.length ;i++){
        //当前行+下一行>页高 ==>换页
        //console.log('行号',i,'行高', rows[i].getBoundingClientRect().height.toFixed(2),window.devicePixelRatio)
        _h = _h +parseFloat(rows[i].getBoundingClientRect().height.toFixed(2))
        _index ++
        if (i==rows.length - footRows-1 ||_h + rows[i+1].getBoundingClientRect().height>=allowedHeight) {
            PrintDatas.push(_Arr.splice(0,_index))
            console.log('第'+PrintDatas.length+'页','行:',_index,'行高：'+_h,'纸高:'+mm2px(pagerHeight).toFixed(2),'可用高度:'+allowedHeight,'页眉高度'+_hearderHeight,'页脚高度：'+_footerHeight,_TabHeader?.offsetHeight)
            _h = 0;
            _index = 0;
            if (_Arr.length == 0) break;
        }
        
    }
    return PrintDatas;
    
}

export function arraySwapRows(array: any, indexA: number, indexB: number) {
    // 检查索引是否有效并交换它们
    if (indexA !== indexB && indexA >= 0 && indexB >= 0 && indexA < array.length && indexB < array.length) {
        [array[indexA], array[indexB]] = [array[indexB], array[indexA]];
    }
    return array;
}

export function arrayInertRows(array: any, insertIndex: number, value: any) {
    array.splice(insertIndex,0,value)
    return array;
}

export default {
    diffAt:diffAt,
    diffTime:diffTime,
    diffDay:diffDay,
    checkDateTime:checkDateTime,
    toFixedFun:toFixedFun,
    numberFormat:numberFormat,
    dateFormat:dateFormat,
    getDate:getDate,
    getMonthFirst:getMonthFirst,
    getMonthLast:getMonthLast,
    getDatePart:getDatePart,
    sumArray:sumArray,
    getIndexFromArray: getIndexFromArray,
    getValueFromArray:getValueFromArray,
    IncludeChinese: IncludeChinese,
    isNumber: isNumber,
    isFloat: isFloat,
    deepObjectMerge:deepObjectMerge,
    guid:guid,
    export2Excel:export2Excel,
    addWaterMarker:addWaterMarker,
    mm2px:mm2px,
    px2mm:px2mm,
    formatZero:formatZero,
    arrGroup: arrGroup,
    arrGroupByFields: arrGroupByFields,
    clearDecimal: clearDecimal,
    convertMoneyToChinese:convertMoneyToChinese,
    myDebounce:myDebounce,
    getfirstImg:getfirstImg,
    changeObjKey: changeObjKey,
    datasRowToColumns: datasRowToColumns,
    arrPaging:arrPaging,
    buildPrintDatas: buildPrintDatas,
    arraySwapRows: arraySwapRows

}

