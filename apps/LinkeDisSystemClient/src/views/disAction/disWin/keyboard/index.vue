<template>
    <div class="keyboard-body" >
        <div class="input-value">{{inputValue}}</div>
        <div>
            <table border="1" cellpadding="0" cellspacing="0"  @click="handleClick">
        <tbody>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td >←</td>
            </tr>
            <tr>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td >X</td>
            </tr>
            <tr>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td rowspan="2">取消</td>
            </tr>
            <tr>
                <td colspan="2" >0</td>
                <td>.</td>
            </tr>
            <tr>
                <td colspan="4" >确定</td>
            </tr>
        </tbody>
    </table>
        </div>
    
    </div>
    
</template>
<script setup lang="ts">
import { ref } from "vue";

defineOptions({
    name: "KeyBoard"
})

const emit = defineEmits<{
    KeyBoardInput: [value: string]
    KeyBoardClose: [action: string]
}>()

const inputValue = ref('')

const handleClick = (e: MouseEvent) => {
    const _v = (e.target as HTMLTableCellElement).innerText
    switch (_v) {
        case '←':
            inputValue.value = inputValue.value.substring(0, inputValue.value.length - 1)
            emit('KeyBoardInput', inputValue.value)
            break
        case 'X':
            inputValue.value = ''
            emit('KeyBoardInput', inputValue.value)
            break
        case '取消':
            emit('KeyBoardClose', 'Cancel')
            break
        case '确定':
            emit('KeyBoardClose', 'Confirm')
            break
        default:
            inputValue.value = inputValue.value + _v
            emit('KeyBoardInput', inputValue.value)
            break
    }
}
</script>
<style lang="scss" scoped>
    .keyboard-body {
        display: flex;
        flex-direction: column;
        .input-value{
            height: 40px;
            text-align: right;
            font-size: 40px;
            border: 1px solid black;
        }
        table{
            width: 100%;
            table-layout: fixed;
            border-collapse:collapse; 
            tr{
                height: 50px;
            }
            td{
                text-align: center;
                font-size: 40px;
                cursor: pointer;
               
            }
            td:hover{
                background: blue;
                color: white;
            }
            td:active{
                background: blueviolet;
                color: white;
            }
        }
        
    }
</style>