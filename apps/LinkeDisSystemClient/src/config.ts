/**全局参数配置 */
import { defineComponent,toRaw,ref,reactive,getCurrentInstance,provide,inject} from 'vue'
let $http = ''
let $appid = ''
let $linkname = ''
let $picSrc='https://www.hzlinke.com.cn/linkeSystemApi/upImage/';
let $bookname = ''
let $ltdname = ''
let $ws = ''
let $endDat = 30;
if(import.meta.env.DEV){//开发环境
    $appid = '204609K3xDis'
    $bookname = '天司诚--正常帐套'
    $linkname = ''
    $http='http://127.0.0.1:3054/linkeSystemApi/V4';
    $ws = 'wss://www.test.com:9504?room=lk20000';
    $picSrc='http://127.0.0.1:3054/linkeSystemApi/upImage/';
} else {
    $appid = '204609K3xDis'
    $bookname = '天司诚--正常帐套'
    $linkname = ''
    $http='https://www.hzlinke.com.cn/linkeSystemApi/V4';
    $ws  = 'wss://www.hzlinke.com.cn:9504';
    $picSrc='https://www.hzlinke.com.cn/linkeSystemApi/upImage/';
} 
 
const $key = "0aa16ef73050c936242b6c567fc44c40"
export default {
    $http :$http,
    $appid: $appid,
    $linkname: $linkname,
    $ltdname: $ltdname,
    $picSrc: $picSrc,
    $bookname: $bookname,
    $key: $key,
    $ws:$ws,
    $endDat: $endDat
};