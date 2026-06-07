


// 使用 import.meta.glob 预加载所有视图组件
const viewModules = import.meta.glob(['../views/**/*.vue', '!**/common/**'])

// 获取组件的工厂函数
const getComponent = (path: string) => {
    // 处理空路径或双斜杠问题
    if (!path || path === '/') {
        console.warn(`Invalid path: ${path}`)
        return null
    }
    // 移除 path 开头和结尾的斜杠，避免拼接后产生双斜杠
    const cleanPath = path.replace(/^\//, '').replace(/\/$/, '')
    const fullPath = `../views/${cleanPath}/index.vue`
    const module = viewModules[fullPath]
    if (!module) {
        console.warn(`Component not found: ${fullPath}`)
        return null
    }
    return module
}

export function buildRouter(router: any, data: any) {
    console.log('Building router with data:', data)
    const basicPath = ['/basicViews', '/purchaseViews', '/saleViews', '/stockViews', '/financeViews', '/reportsViews', '/disViews', '/systemViews']

    data.forEach(function (items: any) {
        const _index = items.idcode - 1
        items.children.forEach(function (item: any) {
            if (item.children) {
                item.children.forEach((childrenItem: any) => {
                    if (childrenItem.viewpath && childrenItem.checked && childrenItem.showmodel != 1) {
                        const componentPath = basicPath[_index] + '/' + childrenItem.viewpath
                        const component = getComponent(componentPath)
                        if (component) {
                            const _childrenRoute = {
                                path: componentPath + '/index',
                                name: childrenItem.viewpath,
                                component: component,
                            }
                            router.addRoute('MainWin', _childrenRoute)
                        }
                    }
                })
            }
            if (item.viewpath && item.checked) {
                const componentPath = basicPath[_index] + '/' + item.viewpath
                const component = getComponent(componentPath)
                if (component) {
                    const route = {
                        path: componentPath + '/index',
                        name: item.viewpath,
                        component: component,
                    }
                    router.addRoute('MainWin', route)
                }
            }
        })
    })
}



