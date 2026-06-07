import type { App } from 'vue'

import { LkxGrid } from './LkxGrid'

import { LkxInput } from './LkxInput'
import { LkxToolsBar } from './LkxToolsBar'
import { LkxButton } from './LkxButton'
import { LkxPager } from './LkxPager'
import { LkxModal } from './LkxModal'
import { LkxIcons } from './LkxIcons'
import { LkxCol } from './LkxCol'
import { LkxRow } from './LkxRow'
import { Accordion } from './Accordion'
import { LkxEcharts } from './LkxEcharts'
import { LkxTabs } from './LinkeTabs'
import { LkxImageView } from './LkxImageView'
import { LkxTree } from './LkxTree'
import { LkxPopupMenu, popupMenu } from './LkxPopupMenu'
import { LkxMainMenu } from './mainMenu'
import { LkxInputIndicator } from './InputIndicator'
import { WinModal, ModalResultEnum } from './ModalWin'
import { LkxPrint } from './LkxPrint'
import { DropList } from './DropList'
import { DateTimeDropList } from './DateTimeDropList'
import { MessageBox, LoadingConstructor } from './MessageBox'
import { WinSearch } from './SearchWin'
import { InputBox } from './InputBox'
import { LkxUploadImgs } from './LkxUploadImgs'
import { LkxTextScroll } from './LkxTextScroll'

   

export {
    LkxGrid, LkxInput, LkxToolsBar, LkxButton, LkxPager,
    LkxModal, LkxIcons, LkxCol, LkxRow, Accordion, LkxEcharts, LkxTabs,
    LkxImageView, LkxTree, LkxPopupMenu,  LkxMainMenu,
    LkxInputIndicator, WinModal, ModalResultEnum, LkxPrint,
    DropList, DateTimeDropList, MessageBox, popupMenu, WinSearch, InputBox, LkxUploadImgs,
    LoadingConstructor, LkxTextScroll
}

export * from './types'
export * from './usehook'

export type { GridProps } from './LkxGrid'
export type { InputOptionsType } from './LkxInput'
export type { ToolsBarProps, ToolsBarItemType } from './LkxToolsBar'
export type { ButtonProps } from './LkxButton'
export type { PagerProps } from './LkxPager'
export type { ModalConfigProps } from './LkxModal'
export type { IconsProps } from './LkxIcons'
export type { ColProps, ResponsiveConfig } from './LkxCol'
export type { RowProps } from './LkxRow'
export type { AccordionDataType } from './Accordion'
export type { EchartsProps } from './LkxEcharts'
export type { TabsProps, TabItem } from './LinkeTabs'
export type { ImageViewProps } from './LkxImageView'
export type { TreeProps, TreeNode } from './LkxTree'
export type { PopupMenuProps, PopupMenuItem } from './LkxPopupMenu'
export type { MainMenuProps } from './mainMenu'
export type { InputIndicatorProps, InputIndicatorGridAction } from './InputIndicator'
export type { ModalResultValue, ModalOptions, ModalExposed } from './ModalWin'
export type { PrintProps } from './LkxPrint'
export type { DropListProps, DropListPosition } from './DropList'
export type { DateTimeDropListProps, DateTimeDropListPosition } from './DateTimeDropList'
export type { MessageOptions, ToastOptions, LoadingOptions, MessageBoxType } from './MessageBox'
export type { SearchBoxProps, SearchBoxFieldItem, SearchBoxConfigType } from './SearchWin'
export type { SearchBoxOptions } from './SearchWin/options'
export type { InputBoxOptions } from './InputBox'
export type { UploadImgsOptions, UploadImgsFileItem } from './LkxUploadImgs'
export type { TextScrollProps } from './LkxTextScroll'

const components = [
    { name: 'LkxGrid', component: LkxGrid },
    { name: 'LkxEcharts', component: LkxEcharts },
    { name: 'LkxMainMenu', component: LkxMainMenu },
    { name: 'LkxInputIndicator', component: LkxInputIndicator },
    { name: 'LkxInput', component: LkxInput },
    { name: 'LkxToolsBar', component: LkxToolsBar },
    { name: 'LkxButton', component: LkxButton },
    { name: 'LkxTabs', component: LkxTabs },
    { name: 'LkxImageView', component: LkxImageView },
    { name: 'LkxPager', component: LkxPager },
    { name: 'LkxModal', component: LkxModal },
    { name: 'LkxIcons', component: LkxIcons },
    { name: 'LkxCol', component: LkxCol },
    { name: 'LkxRow', component: LkxRow },
    { name: 'LkxTree', component: LkxTree },
    { name: 'LkxPopupMenu', component: LkxPopupMenu },
    { name: 'Accordion', component: Accordion },
    { name: 'LkxPrint', component: LkxPrint },
    { name: 'DropList', component: DropList },
    { name: 'DateTimeDropList', component: DateTimeDropList },
    { name: 'WinSearch', component: WinSearch },
    { name: 'LkxUploadImgs', component: LkxUploadImgs },
    { name: 'LkxTextScroll', component: LkxTextScroll },
]

const install = (app: App): void => {
    components.forEach(({ name, component }) => {
        app.component(name, component)
    })
}

export default {
    install,
}

declare module 'vue' {
    export interface GlobalComponents {
        LkxGrid: typeof LkxGrid
        LkxEcharts: typeof LkxEcharts
        LkxMainMenu: typeof LkxMainMenu
        LkxInputIndicator: typeof LkxInputIndicator
        LkxInput: typeof LkxInput
        LkxToolsBar: typeof LkxToolsBar
        LkxButton: typeof LkxButton
        LkxTabs: typeof LkxTabs
        LkxImageView: typeof LkxImageView
        LkxPager: typeof LkxPager
        LkxModal: typeof LkxModal
        LkxIcons: typeof LkxIcons
        LkxCol: typeof LkxCol
        LkxRow: typeof LkxRow
        LkxTree: typeof LkxTree
        LkxPopupMenu: typeof LkxPopupMenu
        Accordion: typeof Accordion
        LkxPrint: typeof LkxPrint
        DropList: typeof DropList
        DateTimeDropList: typeof DateTimeDropList
        WinSearch: typeof WinSearch
        LkxUploadImgs: typeof LkxUploadImgs
        LkxTextScroll: typeof LkxTextScroll
    }
}
