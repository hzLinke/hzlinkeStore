import { ref, onMounted, onUnmounted, Ref } from 'vue'
/* 用于判断用户是否点击了元素外部*/
const userClickOutside = (elementRef: Ref<null | HTMLElement>,inputType: string) => {
    const isClickOutside = ref(false)
   
    const handler = (e: MouseEvent) => {
        if (!elementRef.value) return false
        if (inputType!='null'){
            if (elementRef.value&&['linkage','datetime','drop'].indexOf(inputType)!=-1) {
                const dropEl = document.querySelector('.dropList')//下拉的列表元素
                //检验一个元素是不是另一个元素的后代
                isClickOutside.value = !elementRef.value.contains(e.target as HTMLElement)&&
                                    !(dropEl&&dropEl.contains(e.target as HTMLElement)); 
            }
        } else {
            isClickOutside.value = !elementRef.value.contains(e.target as HTMLElement); 
        }
        
    }
    onMounted(() => {
        document.addEventListener('mousedown', handler)
    })
    onUnmounted(() => {
        document.removeEventListener('mousedown', handler)
    })
   
    return isClickOutside;
}

export default userClickOutside