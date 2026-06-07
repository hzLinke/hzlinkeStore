<template>
    <div id="container"></div>
</template>

<script  lang = 'ts'>
import { defineComponent,onMounted} from 'vue'
import { useRouter} from "vue-router";
import G6 from '@antv/g6';
import pageAction from '../../pageAction'
// @ts-ignore
import { data } from './data'
/*工作流程*/
export default defineComponent({
  name: 'WorkProcess',
  setup(){
    const router = useRouter()
    onMounted(()=>{
      const graph = new G6.Graph({
        container: 'container',
        width:730,
        height: 700,
      // fitView: true,
      // fitViewPadding: 100,
        modes: {
          default: ['drag-canvas']//, 'zoom-canvas', 'click-select'
        },
        // 节点类型及样式
        defaultNode: {
          type: 'rect',
          size: [150, 50],
          style: {
            fill: '#DEE9FF',
            stroke: '#5B8FF9',
            cursor: "pointer",
            radius: 10
          },
        },
        // 连线类型及样式
        defaultEdge: {
          type: 'polyline',
          style: {
            offset: 25,
            endArrow: true,
            lineWidth: 1,
            stroke: '#333'
          },

        }
      });
      graph.on('node:click',(ev)=>{
        pageAction.toPage(router,(ev.item as any)._cfg.model.parmar)
      })
      graph.data(data);
      graph.render();
    })
  }
});
</script>

<style lang="scss" >
#container {
  width: 100%;
  height: 100%;
 // border: 1px saddlebrown solid;
}
</style>
