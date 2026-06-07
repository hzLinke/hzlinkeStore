import { defineStore } from 'pinia';
import { ref } from 'vue';
import {CommondDatasParamType,TableRowDataType} from '@v4x/ui'
import { TWinForm } from '@/usehook/win'
/**
 * 应用全局状态管理
 */
export const useAppStore = defineStore('app', () => {
    // 在线用户列表
    const onLineUserList = ref([]);
    // 登录日志
    const loginLog = ref([]);
    // Socket 连接
    const socket = ref({} as any);
    // 是否扩展
    const isExtend = ref(false);
    // 通用数据
    const commonDatas = ref({} as CommondDatasParamType);
    // 帐套号
    const accountBookCode = <number>1;

    const loginDatas = {} as TableRowDataType;


    const winList = new Map<string, TWinForm>();
    const activeWin= ref<TWinForm|undefined>(undefined);

    /**
     * 更新通用数据
     * @param data - 要更新的数据
     */
    const updateCommonDatas = (data: CommondDatasParamType) => {
        commonDatas.value = Object.assign(commonDatas.value, data);
    };

    return {
        onLineUserList,
        loginLog,
        socket,
        isExtend,
        commonDatas,
        accountBookCode,
        winList,
        activeWin,
        loginDatas,
        updateCommonDatas
    };
});

export default useAppStore;
