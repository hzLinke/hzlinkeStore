export interface TreeNode {
    id: string | number
    title: string
    icon?: string
    open?: boolean
    children?: TreeNode[]
    [key: string]: any
}

export interface TreeProps {
    data: TreeNode | TreeNode[]
}
