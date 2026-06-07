<template>
     <router-view></router-view>
</template>
<script setup lang="ts">
    import { useRouter, useRoute } from 'vue-router'
    import commonParam from '@/config'
    import { utf8ToBase64, base64ToUtf8 } from '@v4x/utils'
    import './assets/css/linkeSystemIcon.css'
    import './assets/css/buttonIcon/buttonIcon.css'

    import {useAppStore} from '@/stores'
    const appStore = useAppStore()

    const urlParams = new URLSearchParams(window.location.search)
    const queryParamsStr = urlParams.get('queryParams')
 
    const queryParams = queryParamsStr ? JSON.parse(base64ToUtf8(queryParamsStr)) : {}
    const QueryParams = {
        userCode:1,
        userName:'系统管理员',
        userPost:1,
        linkName:'Lk2020AE001-03',
        bookName:'测试帐套',
        ltdname:'惠州市天司成饮食服务有限公司',
        version:'All',
        appid:'91441303073532120H',
        picSrc:'',
        endDat:'2099-01-01',
        toUrl:'',
        loginUrl:'',

    }
    const encodeData = utf8ToBase64(JSON.stringify(QueryParams))
    console.log('加密数据:', encodeData)

    const decodeData = JSON.parse(base64ToUtf8(encodeData))
    console.log('解密数据:', decodeData) 
    if (queryParamsStr) {
        console.log(queryParams)
        appStore.loginDatas ={ idcode:queryParams.userCode || 1,name:queryParams.userName || '',post: queryParams.userPost || 1};
        commonParam.$useVersion = queryParams.version
        commonParam.$appid = queryParams.appid || ''
        appStore.accountBookCode = queryParams.accountBookCode || 1
        commonParam.$ltdname = queryParams.ltdname
        commonParam.$bookname = queryParams.bookName
        commonParam.$linkname = queryParams.linkName
        commonParam.$picSrc = queryParams.picSrc + commonParam.$linkname
        commonParam.$endDat = queryParams.endDat
        commonParam.$toUrl = queryParams.toUrl || ''
        commonParam.$loginUrl = queryParams.loginUrl || ''
    } else {
        const _loginDatas = JSON.parse(sessionStorage.getItem('loginDatas')||'');
        const _commonParam = JSON.parse(sessionStorage.getItem('commonParam')||'');
        appStore.loginDatas =_loginDatas
        appStore.accountBookCode = _commonParam.accountBookCode || 1
        commonParam.$useVersion = _commonParam.$useVersion
        commonParam.$appid = _commonParam.$appid
        commonParam.$ltdname = _commonParam.$ltdname
        commonParam.$bookname = _commonParam.$bookname
        commonParam.$linkname = _commonParam.$linkname
        commonParam.$picSrc = _commonParam.$picSrc
        commonParam.$endDat = _commonParam.$endDat
        commonParam.$toUrl = _commonParam.$toUrl
        commonParam.$loginUrl = _commonParam.$loginUrl
    }
   
    if (process.env.NODE_ENV === 'development') {
        commonParam.$http = 'http://127.0.0.1:3054/linkeSystemApi/V4/'
        commonParam.$picSrc = 'http://127.0.0.1:3054/linkeSystemApi/upImage/'
    } else {
        commonParam.$http = window.location.origin + '/linkeSystemApi/V4/'
        commonParam.$picSrc = window.location.origin + '/linkeSystemApi/upImage/'
    }

    const unload = (e: any) => {
        e = e || window.event
        if (e) {
            e.returnValue = '关闭提示'
        }
        return '关闭'
    }

    const stopF5Refresh = () => {
        const currentUrl = window.location.href
        document.oncontextmenu = function(e) {
            return false
        }
        window.onbeforeunload = (e) => {
            e.preventDefault()
            e.returnValue = ''
            return ''
        }
        
        window.addEventListener('popstate', () => {
            history.pushState(null, '', currentUrl)
        })
        
        history.pushState(null, '', currentUrl)
    }

    stopF5Refresh()
</script>
<style lang='scss'>
    html,body{
        margin: 0;
        padding: 0;
        font-family: Arial, "宋体";
        font-size: $font-size + 1;
    }
   
    /*表单里面元素就无法继承body的字体属性需要单独设置*/
    input, label, select, option, textarea, button, fieldset, legend { 
        font-family: Arial, "宋体";
        font-size:$font-size+1;
    }
    #app {
       
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    .updatePng{
        position: absolute;
        left: 10px;
        top : 10px;
        height: 100px;
        width: 130px;
        z-index: 10;
    }
    .payPng{
        position: absolute;
        left: 170px;
        top : 10px;
        height: 100px;
        width: 130px;
        z-index: 10;
    }

     /*// 设置滚动条的样式
        ::-webkit-scrollbar {
            width:12px;
            height: 12px;
            background-color: rgb(245, 245, 245);
        }
        // 滚动槽 
        ::-webkit-scrollbar-track {
            border-radius:80px;
        }
        // 滚动条滑块 
        ::-webkit-scrollbar-thumb {
            border-radius:10px;
            background:sandybrown;
        }
*/

</style>
