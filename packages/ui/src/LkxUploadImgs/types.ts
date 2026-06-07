export interface UploadImgsFileItem {
  name: string
  url: string
  type?: string
  size?: number
}

export interface UploadImgsOptions {
  disabled?: boolean
  type?: number // 0 预览模式 1 列表模式 2 预览模式 + 上传按钮
  access?: string
  files?: UploadImgsFileItem[]
  imageList?: UploadImgsFileItem[] // files 的别名
  label?: string
  limit?: number // 限制上传的图片数， 0 为不限制
  limitCount?: number // 限制上传的图片数（limitCount 是 limit 的别名）
  limitSize?: number // 图片最大尺寸，超过将不添加并触发 oversize 事件（limitSize 是 maxSize 的别名）
  maxSize?: number // 图片最大尺寸，超过将不添加并触发 oversize 事件
  multiple?: boolean // 是否多选
  compress?: boolean // 是否开启压缩
  quality?: number // 默认压缩质量
  beforeRead?: (files: File[]) => boolean // 读取前钩子函数
  afterRead?: (files: any[], newFiles: File[]) => void // 读取后钩子函数
  beforeRemove?: (index: number, file: any) => Promise<boolean> // 移除前钩子函数
  onPicChange?: (files: any[]) => void // picChange 事件回调
  onPicDelete?: (index: number) => void // picDelete 事件回调
  imageStyle?: Record<string, string> // 图片样式
}
