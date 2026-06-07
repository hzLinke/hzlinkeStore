import md5 from 'js-md5';
import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig } from 'axios';
// eslint-disable-next-line @typescript-eslint/ban-ts-comment
// @ts-ignore
import QS from 'qs';
import commonParam from '@/config';
import {MessageBox} from '@v4x/ui'
import {useAppStore} from '@/stores'

// 导出类型定义供外部使用
export interface RequestConfig extends InternalAxiosRequestConfig {
    processData?: boolean;
    notApi?: boolean;
}

export interface Params {
    appid: string;
    linkname?: string;
    [key: string]: any;
}

export interface SignParams {
    params: Params;
    sign: string;
}

export interface ResponseData<T = any> {
    errCode?: number;
    errMsg?: string;
    datas?: T | T[];
    [key: string]: any;
}

export interface MessageParam {
    title: string;
    content: string;
    showCancel?: boolean;
    [key: string]: any;
}

// 生成guid
const guid = function(): string {
    let d = new Date().getTime();
    const uuid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        const r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c == 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
    return uuid;
};

// 自动切换环境
axios.defaults.baseURL = commonParam.$http + 'api.php/';
// 设置超时时间
axios.defaults.timeout = 600000; // 10分钟

// 请求拦截(请求发出前处理请求)
axios.interceptors.request.use((config: RequestConfig) => {
    // 在发送请求之前如果为post序列化请求参数
    if (config.processData == false) { // 上传图片时用
        config.data = config.data || {};
        config.data.appid = commonParam.$appid;
    } else {
        if (config.method === 'post') {
            // 增加appid参数与签名
            const _d = Object.assign({}, config.data, { 
                appid: commonParam.$appid, 
                linkname: commonParam.$linkname ,
                userCode: useAppStore().loginDatas.idcode
            });
            const params: SignParams = {
                params: _d,
                sign: md5(commonParam.$key +
                    JSON.stringify(_d,
                        function replacer(_key: string, value: any): any { // 数字与boolean加双引号
                            if (typeof value == 'number' || typeof value == 'boolean') {
                                return value.toString();
                            }
                            return value;
                        }
                    )
                )
            };
            config.data = QS.stringify(params);
        }
    }
    return config;
});

// 响应拦截器（处理响应数据）
axios.interceptors.response.use((res: AxiosResponse<ResponseData>) => {
    // 对响应数据做判断，与后台协议统一接口返回格式
    if (res.data.errCode != 0) { // 这个判断可根据实际情况修改
        return res;
    }
    // 每行增加guid唯一编码
    if (res.data.datas) {
        if (typeof res.data.datas == 'object' && Array.isArray(res.data.datas)) {
            res.data.datas.forEach((item: any) => {
                item['guid'] = guid();
            });
        }
    }
    return res;
});

// 封装get方法
function get(url: string, params?: AxiosRequestConfig): Promise<ResponseData> {
    return new Promise((resolve, reject) => {
        axios.get(url, params).then(res => {
            resolve(res.data);
        }).catch(err => {
            reject(err.data);
        });
    });
}

// 封装post方法
async function post(url: string, params?: any): Promise<ResponseData> {
    const res: AxiosResponse<ResponseData> = await axios.post(url, params);
    if (res.data.errCode == undefined || res.data.errCode != 0) {
        throw new Error(res.data.errMsg || JSON.stringify(res.data));
    } else {
        return res.data;
    }
}

/** post表单数据，用于上传文件 */
export const postFormData = async(url: string, formData: FormData): Promise<ResponseData> => {
    const res: AxiosResponse<ResponseData> = await axios({
        url: url,
        method: 'post',
        data: formData,
        headers: {
            'Content-Type': 'multipart/form-data'
        },
        processData: false, // 告诉axios不要去处理发送的数据(重要参数)
    } as RequestConfig);
    if (res.data.errCode == undefined) {
        throw new Error(JSON.stringify(res.data));
    } else {
        return res.data;
    }
};

// 对外接口
/**
 * notApi 为true时不使用控制器，直接用对应url
 * @param method - 请求方法
 * @param url - 请求地址
 * @param data - 请求数据
 * @param notApi - 是否不使用控制器
 * @returns 返回响应数据
 */
export async function request({
    method,
    url,
    data,
    notApi
}: {
    method: string;
    url: string;
    data?: any;
    notApi?: boolean;
}): Promise<ResponseData> {
    axios.defaults.baseURL = notApi ? commonParam.$http : commonParam.$http + 'api.php/';
    try {
        if (method == 'get') {
            return await get(url, data);
        } else if (method == 'post') {
            return await post(url, data);
        } else if (method == 'postformdata') {
            return await postFormData(url, data);
        } else if (method == 'getScaleInfo') {
            axios.defaults.baseURL = 'http://127.0.0.1:9999';
            return await post(url, data);
        } else {
            return { errCode: 40001, errMsg: "不支持的请求方法" };
        }
    } catch (error: any) {
        let errMsg = error.message || '';
        if (method != 'getScaleInfo') {
            const StrIndex = errMsg.indexOf('[SQL Server]');
            if (StrIndex > -1) {
                errMsg = errMsg.substr(StrIndex + 12, 4000);
            }
            MessageBox.error({
                title: '出错',
                content: errMsg,
                showCancel: false
            } as MessageParam);
        }

        return { errCode: 40001, errMsg: "出错" + errMsg };
    }
}

/**
 * 验证码发送
 * @param url - 请求地址
 * @param params - 参数 {type, tel} 类型，电话号码（前面加+86)
 * @returns 是否发送成功
 */
export async function sendCheckCode(url: string, params: { tel: string; version: string }): Promise<boolean> {
    const _tel = params.tel;
    const res: AxiosResponse<any> = await axios.post(url, params);
    if (res.data.SendStatusSet[0].Code == 'Ok') {
        MessageBox.information({
            title: '提示',
            content: `验证码已发送至${_tel.substring(0, 6)}****${_tel.substring(10)}请查收`,
            showCancel: false
        } as MessageParam);
        return true;
    } else {
        MessageBox.error({
            title: '验证码发送失败',
            content: res.data.SendStatusSet[0].Message,
            showCancel: false
        } as MessageParam);
        return false;
    }
}

export function getPic(): void {
    const axiosInstance: AxiosInstance = require('axios');

    // 图片搜索API的URL
    const imageSearchApi = 'https://image.baidu.com/search/acjson';

    // 构建请求参数
    const params = {
        q: 'searchKeyword', // 替换为你想搜索的图片关键字
        pn: 0, // 分页参数，第一页设置为0
        rn: 30, // 每页返回的图片数量
        // 其他可选参数...
    };

    // 发送GET请求
    axiosInstance.get(imageSearchApi, { params })
        .then((response: AxiosResponse<any>) => {
            // 打印返回的图片数据
            console.log(response.data.data);

            // 解析返回的数据以获取图片链接
            const imageUrls = response.data.data.map((image: any) => image.thumbURL);
            console.log(imageUrls);

            // 下面可以添加代码以保存图片等操作
        })
        .catch((error: any) => {
            console.error('Error fetching images:', error);
        });
}

// Vue 插件安装
export default {
    install(app: any) {
        app.config.globalProperties.$axios = axios;
        app.config.globalProperties.$request = request;
    }
}
