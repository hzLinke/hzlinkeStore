export interface TextScrollProps {
    /** 滚动文字内容 */
    text: string
    /** 滚动速度 (像素/秒) */
    speed?: number
    /** 滚动方向: left(向左) | right(向右) */
    direction?: 'left' | 'right'
    /** 是否循环滚动 */
    loop?: boolean
    /** 鼠标悬停是否暂停 */
    hoverPause?: boolean
    /** 容器宽度 */
    width?: number | string
    /** 字体大小 */
    fontSize?: number | string
    /** 文字颜色 */
    color?: string
    /** 背景色 */
    backgroundColor?: string
}
