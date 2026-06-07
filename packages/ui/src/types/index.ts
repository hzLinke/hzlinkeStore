/**
 * 表格数据结构
 */
export interface TablePropsType {
    columns: TableColumnsType[]
    datas: TableRowDataType[]
    methods: TableMethodsType
    events: TableEventsType
}

/**
 * 表格行数据结构
 */
export interface TableRowDataType {
    [propName: string]: any
}

/**
 * 指示器
 */
export interface IndicatorButtonsType {
    iconType: 'more' | 'add' | 'dec' | 'serarch'
    click?(data: object): void
}

export interface InputDropOptionsType {
    clickDrop?: boolean
    allowInput?: boolean
    allowFilter?: boolean
    allowException?: boolean
    resultFieldName?: string
    displayFieldName?: string
    displayFields?: string
    displayFieldWidths?: string
    dropListDatas?: TableRowDataType[]
    dropListDatasName?: string
    onFilter?(filterValue: string, dropListDatas?: TableRowDataType[]): TableRowDataType[]
}

/**
 * 列数据结构
 */
export interface TableColumnsType {
    align?: 'left' | 'center' | 'right'
    dataType?: string
    fieldKind?: string
    fieldName: string
    width?: number | string
    fontSize?: number| string
    inputType?: string
    dropListConfig?: InputDropOptionsType
    indicatorButtons?: IndicatorButtonsType[]
    indicatorButtonEventName?: string
    allowInputString?: boolean
    numberFlg?: string
    title: string
    visible?: boolean
    readonly?: boolean
    sort?: boolean
    sortStyle?: string
    fixed?: string
    format?: string
    zeroToNull?: boolean
    customFormater?: string | ((fieldValue: string | number, rowItem: TableRowDataType) => string | number)
    calculationer?: string
    excelFormula?: string
    defaultValue?: string
    hideDuplicates?: boolean
    footers?: {
        align?: 'left' | 'center' | 'right'
        value?: string
        valueType?: string
        format?: string
        calculationer?: string
    }
    tooltip?: string
}

/**
 * 表格方法数据结构
 */
export interface TableMethodsType {
    notAllowEdit?(rowItem: TableRowDataType): boolean
    notAllowDel?(rowItem: TableRowDataType): boolean
    customColor?(rowItem: TableRowDataType, cellItem: object): string
    customBgColor?(rowItem: TableRowDataType, cellItem: object): string
    [propName: string]: any
    rowCalculated?: {
        [propName: string]: {
            (Data: TableRowDataType): number
        }
    }
    sumCalculated?: {
        [propName: string]: {
            (Data: TableRowDataType[]): number
        }
    }
    customFormater?: {
        [propName: string]: {
            (data: string | number, rowItem: TableRowDataType): string
        }
    }
}

/**
 * 表格事件结构
 */
export interface TableEventsType {
    [propName: string]: any
    sort?(flg: string, fieldName: string, backCall: Function): void
    modalClose?(data: any, editCallBack?: any, inserCallBack?: any): void
    searchClose?(data: any): void
    changePage?(curPage: number, backCall: Function): void
    changePageSize?(pageSize: number, backCall: Function): void
    rowClick?(datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string): void
    rowDbClick?(datas: TableRowDataType[], rowdata: TableRowDataType, rowIndex: number, cellIndex: number, fieldName: string): void
    rowInsert?(): void
    rowEdit?(rowItem: any, rowIndex: number): void
    rowDelete?(rowIndex: number): void
    back?(): void
}

/**
 * 模式窗口
 */
export interface ModalConfigType {
    [propName: string]: any
    open?: boolean
    title?: string
    hideFooter?: boolean
    width?: string
    height?: string
    maskClosable?: boolean
    zIndex?: number
    handleClose?(data: object): void
}

/**
 * 增，改窗口结构
 */
export interface EditModalConfigParamType extends ModalConfigType {
    type: string
    rowData: TableRowDataType
    curRowData: TableRowDataType
    rowIndex: number
    items: {
        fieldName: string
        span: number
        config?: InputConfigType
        dropConfig?: InputDropConfigType
    }[][]
}

/**
 * 图片上传
 */
export interface UploadModalConfigParamType extends ModalConfigType {
    type: string
    rowIndex?: number
    limitCount?: number
    limitSize?: number
    imageStyle?: {
        width: string
        height: string
    }
}

export interface OperationsType {
    alopInsert: boolean
    alopDelete: boolean
    alopUpdate: boolean
    alopSubmit: boolean
    alopSearch: boolean
}

/**
 * 表格配置参数
 */
export interface TableConfigType {
    id?: string
    sep?: boolean
    sepWidth?: number | string
    expand?: boolean
    expandWidth?: number
    toolsbar?: boolean
    opt?: boolean
    optWidth?: number
    parger?: boolean
    gridFooter?: boolean
    notAllowEdit?: any[]
    notAllowDel?: any[]
    readOnly?: boolean
    enterJumpReadOnlyCol?: boolean
    endAutoAppend?: boolean
    allowedOperations?: OperationsType
    title?: string
    draggable?: boolean
    userName: string
}

/**分页配置参数 */
export interface PagerConfigType {
    whereStr?: string
    curPage: number
    pageSize: number
    total: number
}

/**
 * 表格状态结构
 */
export interface TalbeStatusType {
    headRowNumber: number
    activeColIndex: number
    expandRowIndex: number
    modeVaue: boolean
    mouseIsDown: boolean
    mouseIsDownOfBody: boolean
    startResize: boolean
    startSwap: boolean
    thisCellIndex: number
    fromCellIndex: number
    toCellIndex: number
    resizeStatusBoxLeft: number
    resizeStatusBoxTop: number
    curResizeStatusBoxLeft: number
}

interface PopupMenuItemType {
    code: string
    type?: string
    caption: string
    children: PopupMenuItemType[]
}

/**
 * 弹出菜单结构
 */
export interface PopupMenuDataType {
    pointXy: {
        left: number
        top: number
    }
    items: PopupMenuItemType[]
    cellIndex?: number
    closePopuMenu?: {
        (action?: any): any
    }
}

/**
 * 菜单结构
 */
export interface MenuDataType {
    open?: boolean
    level: number
    idcode: number
    title: string
    iconcls?: string
    path?: string
    name: string
    showModel: boolean
    children: MenuDataType[]
}

/**
 * 工具条参数
 */
export interface ToolsBarConfigType {
    handleClick?(data: any): void
    toolsBarItems: {
        title: string
        idCode: string
        index: number
        iconCls?: string
        dropDown?: boolean
    }[]
}

/**
 * 信息框MessageBox参数结构
 */
export interface MessageBoxConfigType {
    title: string
    content?: string
    messageType?: 'information' | 'error' | 'warning' | 'question'
    showCancel?: boolean
    showAbort?: boolean
    defaultButton?: 'mrOk' | 'mrCancel' | 'mrAbort'
    width?: string
    height?: string
    okText?: string
    abortText?: string
    cancelText?: string
    activeElement?: any
    closeModal?: {
        (action: MessageBoxReturnType): any
        value?: any
    }
    dataSet?: any[]
}

/**
 * 加载MessageBox参数结构
 */
export interface LoadingConfigType {
    moreText: string
    mask?: boolean
    csc?: string
}

/**
 * 轻提示MessageBox参数结构
 */
export interface ToastConfigType {
    content: string
    time?: number
    csc?: string
}

export enum MessageBoxReturnType {
    mrOk = 0,
    MrCancel = 1,
    MrClose = 2
}

export interface LkxMessageBoxType {
    information: { (options: MessageBoxConfigType): any }
    error: { (options: MessageBoxConfigType): any }
    warning: { (options: MessageBoxConfigType): any }
    question: { (options: MessageBoxConfigType): 'mrClose' | 'mrOk' | 'mrCancel' | 'mrAbort' }
    toast: { (options: ToastConfigType): void }
    loading: { (options: LoadingConfigType): void }
    closeLoading: { (): void }
}

interface disabledFunc {
    (): boolean
}

export interface InputButtonsConfigType {
    iconType: string
    onClick?: {
        (item: any): void
    }
}

export interface InputConfigType {
    fieldName?: string
    align?: string
    checkboxCaption?: string
    caption?: string
    captionWidth?: number
    captionAlign?: string
    placeholder?: string
    pattern?: string
    required?: boolean
    errmsg?: string
    disabled?: boolean | disabledFunc
    readonly?: boolean
    format?: string
    tag?: number
    border?: boolean
    buttons?: InputButtonsConfigType[]
    inputType?: 'text' | 'datetime' | 'number' | 'checkbox'| 'radio' | 'drop'|'mobilephone' | 'linkage'
    checkboxLable?: string
    radioList?: any[]
    onChange?(val: string | number): void
}

export interface InputDropConfigType {
    clickDrop?: boolean
    allowInput?: boolean
    allowFilter?: boolean
    allowException?: boolean
    indentation?: boolean
    dropListPosition: {
        top?: number
        left?: number
        width?: number
        height?: number
    }
    resultFieldName?: string
    displayFieldName?: string
    displayFields?: string
    displayFieldWidths?: string
    dropListDatas?: any[]
    dropListDatasName?: string
    onFilter?(filterValue: string,dropListDatas?: TableRowDataType[]): TableRowDataType[]
}

export interface PowerListType {
    allowedInsert: boolean
    allowedEdit: boolean
    allowedDelete: boolean
    allowedPrint: boolean
    allowedViewCostPrice: boolean
    allowedSubmit: boolean
    allowedUnSubmit: boolean
    allowedExport: boolean
    allowedSaveStyle: boolean
    allowedClearStyle: boolean
    allowedCancelCol: boolean
    allowedRecoveryCol: boolean
    allowedTableSet: boolean
}

/**
 * 数据获取参数
 */
export interface DataGetConfigType {
    mustCondition?: string
    defaultCondition?: string
    tableName?: string
    fieldName?: string
    fields?: string
    sortFields?: string
    condition?: string
    returnTotal?: boolean
    totalFieldSql?: string
    page?: number,
    curPage?: number,
    pageSize?: number
    extraData?: string,
    total?: number
}

/**
 * 返回数据类型
 */
export interface ResultDataType {
    errCode: number
    errMsg: string
    maxKeyValue?: string | number
    datas: TableRowDataType[]
    totalDatas: TableRowDataType
}

export interface DataSourceCreateParmarsType {
    ApiPath: string
    KeyFieldName: string
    NotAllowOperationList: string[]
    getParmars: DataGetConfigType
}

export interface SetFieldValueType {
    dropDatas?: any[]
    fieldName: string
    fieldValue: string | number
    editRowIndex: number
}

export interface DataSourceType {
    dataSet: TableRowDataType[]
    CurDataSet: TableRowDataType[]
    detailSet: TableRowDataType[]
    treeDatas: TableRowDataType[]
    extendDataSet: TableRowDataType[]
    totalData: TableRowDataType
    activeRowIndex: number
    dataSetRowCount: number
    selectLists: number[]
    status: string
    apiPath: string
    keyFieldName: string
    NotAllowOperationList: string[]
    getParams: DataGetConfigType
    PowerList: PowerListType
    thisRowData: TableRowDataType
    setActiveRowIndex(rowIndex: number, fnKey?: any): void
    datasetIsChange(): boolean
    rowAllowedDelete(rowItem: TableRowDataType, fieldName: string): boolean
    getFieldValueFormServer(params: DataGetConfigType): Promise<number>
    onSetFieldValue(data: SetFieldValueType, rowItem: TableRowDataType): Promise<boolean>
    open(PagerConfig: PagerConfigType, beforeOpen?: () => Promise<boolean>, afterOpen?: (dataSet: any[]) => void): Promise<boolean>
    openEx(PagerConfig: PagerConfigType): Promise<any>
    close(): void
    insert(beforeInsert?: () => Promise<boolean>, afterInsert?: (rowItem: TableRowDataType, rowIndex: number) => void): Promise<boolean>
    delete(beforeDelete?: (rowItem: TableRowDataType) => Promise<boolean>, afterDelete?: (rowItem: TableRowDataType) => void): Promise<boolean>
    update(updateFunction: (apiPath: string, tableName: string, keyFieldName: string, detailSet: any[]) => Promise<any>, beforeUpdate?: () => Promise<boolean>, afterUpdate?: (detailSet: any[]) => void): Promise<boolean>
    cancel(beforeCancel?: () => Promise<boolean>, afterCancel?: (dataSet: any[]) => void): Promise<boolean>
    emptyDetaiSet(): void
    changeFieldValue(fieldName: string, fieldVaue: string | number, activeRowIndex: number): void
    setFieldValue(fieldName: string, fieldVaue: string | number, rowIndex?: number): Promise<boolean>
    setFieldValuePlus(rowDatas: TableRowDataType, rowIndex?: number): Promise<boolean>
    getFieldValue(fieldName: string): string | number
}

export interface CommondDatasParamType {
    SysParamDatas: TableRowDataType[]
    AccountBookDatas: TableRowDataType[]
    PowerDatas: TableRowDataType[]
    PostDatas: TableRowDataType[]
    ProjectDatas: TableRowDataType[]
    CustomerDatas: TableRowDataType[]
    customerFromProjDatas: TableRowDataType[]
    ShipperDatas: TableRowDataType[]
    UserDatas: TableRowDataType[]
    CateDatas: TableRowDataType[]
    PCateDatas: TableRowDataType[]
    AllCateDatas: TableRowDataType[]
    AreaDatas: TableRowDataType[]
    SettlementTypeDatas: TableRowDataType[]
    PayTypeDatas: TableRowDataType[]
    AccountsDatas: TableRowDataType[]
    SubjectInDatas: TableRowDataType[]
    SubjectOutDatas: TableRowDataType[]
    LtdDatas: TableRowDataType[]
}
