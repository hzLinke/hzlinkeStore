import type { App } from 'vue'
import autoFocus from './src/auto-focus'

const install = (app: App)=> {
    app.directive('focus',autoFocus)
}

export default{
    install:install
}