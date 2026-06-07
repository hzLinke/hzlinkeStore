<template>
     <Teleport to="body">
        <div id="loading" class="loader">
            <div v-if="mask" class="loader-mask"></div>
            <div class="loader-content">
                <div class="loadMore">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <div class="loadMoreText">{{moreText}}</div>
            </div>
        </div>
    </Teleport>
</template>

<script setup lang="ts">
import { type LoadingOptions }  from "../messageBox";
withDefaults(defineProps<LoadingOptions>(), {
    moreText: '',
    mask: true,
})
</script>

<style lang="scss" >
    .loader {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 90000000;
        font-size: 14px;
        &-mask {
            width: 100vw;
            height: 100vh;
            background-color: rgba($color: #000000, $alpha: 0.2);
        }
        &-content{
            position: absolute;
            background: #444444;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            top: 50%;
            left: 50%;
            z-index: 3300;
            transform: translate(-50%, -50%);
        }
    }
    
/*    -webkit- 和 -ms- 前缀用于那些不支持 animation 和 transform 属性的浏览器。*/
  /*  @-webkit-keyframes spin {
        0% { -webkit-transform: rotate(0deg); }
        100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }*/
    /*以上是旋转代码*/
    .loadMore{
        height: 40px;
        line-height: 40px;
        position:relative;
        text-align: center;
    }
	.loadMore span{
		width: 5px;
		height: 5px;
		margin: 0 1px;
		display: inline-block;
		vertical-align: middle;
		background: #9b59b6;
        -webkit-animation: loadMore 1.5s  infinite ease-in-out;
        animation: loadMore 1.5s  infinite ease-in-out;
	}
	.loadMoreText{
		font-size: 20px;
		text-align: center;
        padding: 0 5px;
        -webkit-animation: loadMoreText 1.5s 2s  infinite ease-in-out;
		animation: loadMoreText 1.5s 2s  infinite ease-in-out;
        color: white;
	}
	.loadMore span:nth-child(2){
		-webkit-animation-delay: .2s;
		animation-delay: .2s;  
	}
	.loadMore span:nth-child(3){
		-webkit-animation-delay: .4s;
		animation-delay: .4s;
	}
	.loadMore span:nth-child(4){
		-webkit-animation-delay: .6s;
		animation-delay: .6s;
	}
	.loadMore span:nth-child(5){
		-webkit-animation-delay: .8s;
		animation-delay: .8s;
	}
	@-webkit-keyframes loadMore {
		0% {height:5px;background:#9b59b6;}
		25% {height:30px;background:#3498db;}
		50% {height:5px;background:#9b59b6;}
		100% {height:5px;background:#9b59b6;}
	}
	@keyframes loadMore {
		0% {height:5px;background:#9b59b6;}
		25% {height:30px;background:#3498db;}
		50% {height:5px;background:#9b59b6;}
		100% {height:5px;background:#9b59b6;}
	}
	@-webkit-keyframes loadMoreText {
		0% {color:#000;}
		25% {color:#3498db;}
		50% {color:#9b59b6;}
		100% {color:#FFFFFF;}
	
	}
	@keyframes loadMoreText {
		0% {color:#000;}
		25% {color:#3498db;}
		50% {color:#9b59b6;}
		100% {color:#FFFFFF;}
	}
</style>