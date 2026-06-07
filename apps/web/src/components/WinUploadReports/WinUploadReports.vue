<template>
  <div class="form-container">
         <form class="form">
            <lkx-input class="payType-input" 
                :name="CataState.fieldName"
                :config="CataState.config"
                :dropConfig="CataState.dropConfig"
                v-model="CateCode"
            />
            <lkx-input class="Input-At-End"
                name="endat"
                :config="DeliveryAtState.config"
                v-model="DeliveryAt"
            />
        </form>
      <div class="win-body">
          <LkxUploadImgs 
              class="upload-image"
              :multiple="true"
              :compress="true"
              :before-read="beforeRead"
              :after-read="afterRead"
              :before-remove="beforeRemove"
              :maxSize="maxSize"
              :limit="limit"
              :type="type"
              @change="change"
              @preview="preview"
              @exceed="exceed"
              @oversize="oversize"
              :files="files"
          >
          </LkxUploadImgs>

          <div class="preview-bg" v-show="isPreview" z-index="99999999999999999" @click="closePreview">
              <div class="dialog" z-index="9999999999999999" @click="closePreview">
                  <img :src="previewIMG" class="preview-img">
              </div>
          </div>
      </div>
      <div class="win-action">
          <button class="modal-button" @click="handleCancel">取消</button>
          <button class="modal-button modal-button-primary" @click="handleConfirm">确定</button>
      </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, getCurrentInstance,reactive,watch } from "vue";
import {InputOptionsType, LkxUploadImgs} from '@v4x/ui'
import type { TableRowDataType, UploadImgsFileItem } from '@v4x/ui'
import {LkxInput}  from '@v4x/ui'  
import $Utils from '@v4x/utils/lkxUtil'
import commonParam from '@/config'
import { MessageBox,  ModalResultEnum } from '@v4x/ui'
import { modalActionConfirm, modalActionCancel } from '@v4x/utils'
import $api from '@/request/api';
import { UploadReportsOptions } from './types'

defineOptions({
    name: 'WinUploadReports'
})

const props = withDefaults(defineProps<UploadReportsOptions>(), {
    title: "",
    width: 800,
    height: 400,
    billNumber: '',
    productCode: '',
    productName: '',
    fileNames: '',
})

const DeliveryAt = ref($Utils.getDate());
const CateCode = ref(0);
// 配置状态
const CataState = reactive<InputOptionsType>({
    fieldName: 'catename',
    config: {
        caption: '一级分类：',
        captionWidth: 90,
        align: 'left',
        captionAlign: 'right',
        inputType: 'drop',
        onChange: (data: any) => {
            files.value = [];
        }
    },
    dropConfig: {
        allowInput: false,
        allowFilter: true,
        dropListPosition: {},
        resultFieldName: 'idcode',
        displayFieldName: 'name',
        displayFields: 'idcode|name',
        displayFieldWidths: '50|100',
        dropListDatas: props.listDatas,
        onFilter: (filterValue: string,dropListDatas:TableRowDataType[]) => {
            return dropListDatas.filter((item: any) => 
                item.name.toLowerCase().includes(filterValue.toLowerCase())
            );
        }
    } 
});

const DeliveryAtState = reactive<InputOptionsType>({
    config: {
        caption: '日期',
        captionWidth: 120,
        align: 'left',
        captionAlign: 'right',
        inputType: 'datetime',
        format: 'yyyy-MM-dd',
        onChange: (data: any) => {
            files.value = [];
        }
    }
});

const parentInstance = getCurrentInstance()?.parent

const fileNamesArr = [] as any;
const fieldNamesList = props.fileNames ? props.fileNames.split(';') : [];
for (let i = 0; i < fieldNamesList.length; i++) {
    fileNamesArr.push({
        name: fieldNamesList[i],
        url: `${commonParam.$picSrc}/product/${fieldNamesList[i]}`
    })
}
const files = ref(fileNamesArr);
const viewsFiles = ref([] as any[])
const maxSize = ref(1024 * 1024 * 2); // 2M
const previewIMG = ref('');
const limit = ref(10);
const isPreview = ref(false);
const type = ref(2) // 0 预览模式 1 列表模式 2 预览模式 + 上传按钮

const oversize = (file: any) => {
    MessageBox.warning({ title: '出错', content: '文件大小不能大于2M', showCancel: false })
};

const afterRead = async (file: any, newFiles: any) => {
    files.value.push(file[0] as any);
    const res = await uploadImage(newFiles);
    if (res) {
        updateCheckReports();
    }
};

const beforeRemove = async (index: number, file: any) => {
   const res = await deleteImage(file.name);
    if (res) {
        files.value.splice(index, 1);
        updateCheckReports();
    }
    
    return true;
};

const preview = (index: number, file: { url: string; }) => {
    previewIMG.value = file.url
    isPreview.value = true
};

const exceed = () => {
    alert(`只能上传${limit.value}张图片`)
};

const beforeRead = (files: string | any[]) => {
    for (let i = 0, len = files.length; i < len; i++) {
        const file = files[i]
        if (file.type != 'image/jpeg' && file.type != 'image/png') {
            alert('只能上传jpg和png格式的图片')
            return false
        }
    }

    return true
};

const closePreview = () => {
    isPreview.value = false
}
const change = (nfiles: UploadImgsFileItem[]) => {
    console.log('b', files.value)
}
const uploadImage = async (file: any) => {
    try {
        MessageBox.loading({ moreText: '正在上传...' });
        const uploadParam = {
            files: file,
            path: `${commonParam.$picSrc}${commonParam.$appid}/CheckReportsImage/${DeliveryAt.value}`,
            fileNames: Object.keys(file)
        };

        const res = await $api.uploadFile(
            commonParam.$http + 'controller/commonApi/UploadImage/index.php',
            uploadParam
        );

        if (res && res.errCode === 0) {
            return true
        } 
        new Error('上传图片失败:');
        
    } catch (error) {
        console.error('上传图片失败:', error);
        MessageBox.error({ title: '错误', content: '上传图片失败', showCancel: false });
        return false
    } finally {
        // 确保总是关闭加载提示
        setTimeout(() => MessageBox.closeAllLoading(), 100);
    }
};
const uploadImageFromViews = async (file_Url: string) => {
    MessageBox.loading({ moreText: '正在上传...' })
    const _Name = `${props.productCode}-${Date.now()}.jpg`;
    const uploadParam = {
        file_Url: file_Url,
        file_Path: `${commonParam.$picSrc}/product/`,
        file_Name: _Name
    }
    const res = await $api.comonRequest('/masterApi/disApi/basic/product/', 'downImageFile', uploadParam)
    files.value.push({ url: file_Url, name: _Name })
    setTimeout(() => {
        MessageBox.closeAllLoading()
    }, 500)
}
const deleteImage = async (fileName: string) => {
            try {
                MessageBox.loading({ moreText: '正在删除...' });
                const deleteParam = {
                    FileName: `${commonParam.$picSrc}${commonParam.$appid}/CheckReportsImage/${DeliveryAt.value}/${fileName}`,
                    path: `${commonParam.$picSrc}${commonParam.$appid}/CheckReportsImage/${DeliveryAt.value}`,
                };

                const res = await $api.comonRequest(
                    commonParam.$http + 'controller/commonApi/DeleteImage/index.php',
                    '',
                    deleteParam,
                    true
                );

                if (res && res.errCode === 0) {
                    return true
                }
                 new Error('删除图片失败');
            } catch (error) {
                console.error('删除图片失败:', error);
                MessageBox.error({ title: '错误', content: '删除图片失败', showCancel: false });
                return false
            } finally {
                // 确保总是关闭加载提示
                setTimeout(() => MessageBox.closeAllLoading(), 500);
            }
        };

const updateCheckReports = async () => {
    try {
        const fieldNames = files.value.map((file: { name: any; }) => file.name);
        const checkRepors = fieldNames.join(';');
        
        const submitRes = await $api.comonRequest(
            '/masterApi/disApi/sales/sale/BillDetail/',
            'updateBatchCheckReports',
            {
                PCateCode: CateCode.value,
                DeliveryAt: DeliveryAt.value,
                CheckedNameFiles: checkRepors,
            }
        );

        if (submitRes.errCode === 0) {}
        
        return submitRes;
    } catch (error) {
        console.error('更新检查报告失败:', error);
        MessageBox.error({ title: '错误', content: '更新检查报告失败', showCancel: false });
        throw error;
    }
};

const getCheckReports = async (deliveryAt: string) => {
    try {
        const res = await $api.comonRequest(
            '/masterApi/disApi/sales/sale/BillDetail/',
            'getCheckReports',
            {
                path: `${commonParam.$picSrc}${commonParam.$appid}/CheckReportsImage/${deliveryAt}`
            }
        );
            
        if (res && res.errCode === 0) {
            files.value = res.datas.map((item: any) => ({
                name: item.fileName,
                url: `${commonParam.$picSrc}${commonParam.$appid}/CheckReportsImage/${deliveryAt}/${item.fileName}`
            }));
        }
    } catch (error) {
        console.error('获取检查报告失败:', error);
        MessageBox.error({ title: '错误', content: '获取检查报告失败', showCancel: false });
    }
};

const handleConfirm = () => {
    modalActionConfirm(parentInstance, { action: ModalResultEnum.mrConfirm, data: files.value })
}
const handleCancel = () => {
    modalActionCancel(parentInstance, { action: ModalResultEnum.mrCancel, data: null })
}
const getImage = async () => {
    const res = await $api.comonRequest('/masterApi/disApi/basic/product/', 'getBaiDuImage', { name: props.productName })
    res.datas.forEach((item: any) => {
        const f = { url: item.url };
        viewsFiles.value.push(f);
    })
}


// 监听和生命周期
watch(DeliveryAt, () => {
    getCheckReports(DeliveryAt.value);
});

onMounted(() => {
    getCheckReports(DeliveryAt.value);
});

</script>
<style lang="scss" scoped>
.form-container {
    display: flex;
    flex-direction: column;
    height: 100%;
    .form {
    height: 30px;
    line-height: 30px;
    border-bottom: 1px solid #eee;
    
    .payType-input {
        padding-top: 3px;
        height: 24px;
        width: 360px;
    }
    
    .Input-At-End {
        padding-top: 3px;
        height: 24px;
        width: 260px;
    }
}
    .win-body {
        flex: 1;
        min-height: 0;
        display: flex;
        .upload-image {
            flex: 1;
            border-right: 1px solid #eee;
        }
        .preview-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            overflow: auto;
            z-index: 99999999999999999;
        }
        .dialog img {
            display: block;
            margin: auto;
            margin-top: 10vh;
        }
    }
    .win-action {
        height: 40px;
        flex-shrink: 0;
        padding: 5px 16px;
        border-top: 1px solid #e4e7ed;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
        .modal-button {
            line-height: 1em;
            font-size: 14px;
            padding: 8px 20px;
            border: 1px solid #dcdfe6;
            outline: none;
            display: inline-block;
            border-radius: 4px;
            cursor: pointer;
            background-color: #fff;
            transition: 0.1s;
            &:hover {
                color: #409eff;
                border-color: #c6e2ff;
                background-color: #ecf5ff;
            }
            & + & {
                margin-left: 10px;
            }
            &-primary {
                background-color: #2d8cf0;
                border-color: #2d8cf0;
                color: white;
                &:hover {
                    background: #66b1ff;
                    border-color: #66b1ff;
                    color: #fff;
                }
            }
        }
    }
}
</style>