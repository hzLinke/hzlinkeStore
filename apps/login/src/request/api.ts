import {
    request,
    sendCheckCode,
    getPic,
    ResponseData
} from './request';

// 称重查询接口
const getScaleInfo = async(url: string, parmas: any): Promise<ResponseData | undefined> => {
    try {
        return await request({
            url: url + 'get',
            method: 'getScaleInfo',
            data: parmas
        });
    } catch (error: any) {
        console.log(error.message);
    }
};

// 查询参数
const getSearchParam = async(url: string): Promise<ResponseData | undefined> => {
    try {
        return await request({
            url: url + 'getSearchParam',
            method: 'post'
        });
    } catch (error: any) {
        console.log(error.message);
    }
};

// 列表查询接口
const getData = async(url: string, parmas: any): Promise<ResponseData> => {
    try {
        return await request({
            url: url + 'get',
            method: 'post',
            data: parmas
        });
    } catch (error: any) {
        console.log(error.message);
        throw error;
    }
};

const deleteData = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'delete',
        method: 'post',
        data: parmas
    });
};

const insertData = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'insert',
        method: 'post',
        data: parmas
    });
};

const editData = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'edit',
        method: 'post',
        data: parmas
    });
};

// 最大值接口
const getValue = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'getFieldValue',
        method: 'post',
        data: parmas
    });
};

// 最大值接口
const getMaxValue = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'getMaxFieldValue',
        method: 'post',
        data: parmas
    });
};

// 保存接口
const saveData = async(url: string, parmas: any): Promise<ResponseData> => {
    return await request({
        url: url + 'save',
        method: 'post',
        data: parmas
    });
};

// 通用接口
// notApi 为true时不使用控制器，直接用对应url,api参数无效
const comonRequest = async(url: string, api: string, parmas: any, notApi?: boolean): Promise<ResponseData> => {
    return await request({
        url: url + api,
        method: 'post',
        data: parmas,
        notApi: notApi
    });
};

/** 图片上传 */
interface UploadFileParams {
    files: File[];
    path: string;
    fileNames: string[];
}

const uploadFile = async(url: string, { files, path, fileNames }: UploadFileParams): Promise<ResponseData> => {
    const formData = new FormData(); // 创建form对象
    console.log(files,fileNames)
    for (let i = 0; i < files.length; i++) {
        formData.append(i.toString(), files[i]);
    }
    formData.append("path", path);
    formData.append("fileNames", JSON.stringify(fileNames));
    return await request({
        url: url,
        method: 'postformdata',
        data: formData
    });
};

const getPicx = (): void => {
    getPic();
};

// API 接口集合
const api = {
    getSearchParam: getSearchParam,
    getData: getData,
    getScaleInfo: getScaleInfo,
    getValue: getValue,
    deleteData: deleteData,
    insertData: insertData,
    uploadFile: uploadFile,
    editData: editData,
    saveData: saveData,
    comonRequest: comonRequest,
    sendCheckCode: sendCheckCode,
    getMaxValue: getMaxValue,
    getPic: getPicx
};

export default api;
