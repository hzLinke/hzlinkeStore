# 配送管理系统 V4x 前端项目分析文档

## 一、项目整体架构

### 1.1 技术栈
- **框架**: Vue 3 (Composition API + TypeScript)
- **路由**: Vue Router 4
- **状态管理**: Pinia
- **UI组件库**: @v4x/ui (自定义组件库)
- **HTTP客户端**: Axios
- **构建工具**: Vite
- **样式**: SCSS

### 1.2 项目目录结构

```
apps/web/src/
├── main.ts              # 应用入口
├── App.vue              # 根组件
├── config.ts            # 全局配置参数
├── router/
│   └── index.ts          # 路由配置
├── stores/
│   └── index.ts         # Pinia状态管理
├── usehook/             # 自定义Hooks
│   ├── buildRouter.ts   # 动态路由构建
│   ├── getNavItems.ts    # 获取导航菜单
│   ├── getCommonDatas.ts # 获取通用数据
│   ├── gridAction.ts     # 表格操作类
│   ├── dataSource.ts     # 数据源类
│   ├── userOpts.ts       # 用户操作封装
│   ├── dataAction.ts     # 数据操作工具
│   ├── win.ts           # 窗口表单类
│   ├── fireEvents.ts    # 事件触发
│   ├── getPendingWork.ts # 待办事项
│   └── getPostItems.ts  # 岗位权限
├── request/
│   ├── request.ts       # Axios封装
│   └── api.ts           # API接口集合
├── views/               # 视图组件
│   ├── MainWin.vue      # 主窗口
│   ├── Home.vue         # 首页
│   ├── login.vue        # 登录页
│   ├── basicViews/      # 基础资料模块
│   ├── saleViews/        # 销售模块
│   ├── purchaseViews/    # 采购模块
│   ├── stockViews/       # 库存模块
│   ├── financeViews/      # 财务模块
│   ├── reportsViews/      # 报表模块
│   ├── disViews/         # 配送模块
│   ├── systemViews/       # 系统设置模块
│   └── common/           # 公共组件
├── components/          # 弹窗组件库
│   ├── WinProductSelect/  # 商品选择
│   ├── WinBatchInSelect/  # 批次入库选择
│   ├── WinBatchOutSelect/ # 批次出库选择
│   ├── WinUploadProductImage/ # 商品图片上传
│   ├── WinChangePwd/      # 修改密码
│   ├── WinPrintStyleSet/   # 打印样式设置
│   └── ... (30+弹窗组件)
├── assets/              # 静态资源
├── directive/           # 自定义指令
├── plugins/             # 插件
├── utils/               # 工具函数
└── types/               # TypeScript类型定义
```

---

## 二、主要功能模块列表

### 2.1 模块总览

| 模块名称 | 目录路径 | 功能说明 |
|---------|---------|---------|
| **基础资料** | basicViews/ | 系统基础数据管理 |
| **销售管理** | saleViews/ | 销售订单、送货、报价等 |
| **采购管理** | purchaseViews/ | 采购订单、收货、入账等 |
| **库存管理** | stockViews/ | 库存查询、调拨、拆分等 |
| **财务管理** | financeViews/ | 应收应付、收付款等 |
| **配送管理** | disViews/ | 配货、打印、报表等 |
| **报表分析** | reportsViews/ | 数据分析、趋势报告等 |
| **系统设置** | systemViews/ | 系统参数、微信配置等 |

### 2.2 基础资料模块 (basicViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 账户管理 | accounts/ | 账户信息维护 |
| 区域管理 | area/ | 配送区域设置 |
| 分类管理 | cate/ | 商品分类管理 |
| 定位商品 | kProduct/ | 商品定位查询 |
| 公司管理 | ltd/ | 公司信息管理 |
| 支付方式 | payType/ | 支付方式配置 |
| 岗位管理 | post/ | 岗位权限设置 |
| 商品管理 | product/ | 商品档案管理 |
| 结算方式 | settlementType/ | 结算方式配置 |
| 科目管理 | subject/ | 财务科目管理 |
| 用户管理 | user/ | 用户账号管理 |

### 2.3 销售模块 (saleViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 客户送货单 | sale/ | 送货单列表 |
| 送货单录入 | saleEntry/ | 新增送货单 |
| 客户订单 | saleOrder/ | 销售订单管理 |
| 订单新增 | saleOrderAdd/ | 新增销售订单 |
| 对外单据 | saleChange/ | 外账单据管理 |
| 单据代打 | saleReplace/ | 单据打印替代 |
| 销售退货 | saleReturn/ | 退货处理 |
| 单据拆分 | saleSplit/ | 送货单拆分 |
| 报价管理 | quotedPrice/ | 商品报价 |
| 客户管理 | customer/ | 客户档案 |
| 项目管理 | project/ | 项目管理 |

### 2.4 采购模块 (purchaseViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 采购收货 | purchase/ | 收货处理 |
| 采购录入 | purchaseEntry/ | 采购单录入 |
| 采购订单 | purchaseOrder/ | 采购订单管理 |
| 采购汇总下单 | purchaseOrderGroup/ | 批量下单 |
| 下单汇总 | downOrderGroup/ | 汇总采购 |
| 采购退货 | purchaseReturn/ | 退货处理 |
| 采购交换 | purchaseExChange/ | 货品交换 |
| 货商管理 | shipper/ | 供应商档案 |
| 采购报表 | reports/ | 采购数据报表 |

### 2.5 库存模块 (stockViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 库存收货 | stockReceive/ | 采购入库 |
| 库存调整 | stockChange/ | 库存变动调整 |
| 商品加工拆分 | stockSplit/ | 加工拆分 |
| 库存调拨 | stockSwap/ | 库区间调拨 |
| 库区调拨 | stockAreaSwap/ | 按库区调拨 |
| 库存查询 | stocks/ | 多维度库存查询 |

### 2.6 财务模块 (financeViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 应付账款 | payable/ | 供应商付款 |
| 应收账款 | receivable/ | 客户收款 |
| 账户报表 | reports/AccountsReports/ | 账户统计 |
| 资金报表 | reports/moneyReports/ | 资金流水 |
| 付款报表 | reports/payReports/ | 付款明细 |
| 收款报表 | reports/recReports/ | 收款明细 |

### 2.7 配送模块 (disViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 配货操作 | disAction/ | **核心配货功能** |
| 配送打印 | disPrint/ | 标签单据打印 |
| 配送报表 | disReport/ | 配送统计报表 |

### 2.8 报表模块 (reportsViews)

#### 分析报表 (AnalysisReports)

| 功能 | 说明 |
|-----|------|
| SaleTrendReport | 销售走势分析 |
| InOutRateReport | 进出比率分析 |
| MonMReport | 月度报表 |
| WeekReport | 周报 |
| AbcReport | ABC商品分析 |
| UnSaleReport | 未销售商品报表 |
| WtRateReport | 损耗率报表 |
| YonYReport | 年同比报表 |

#### 销售报表 (saleReports)

| 功能 | 说明 |
|-----|------|
| CateSaleReport | 分类销售报表 |
| CustomerSaleReport | 客户销售报表 |
| DriverSaleReport | 司机销售报表 |
| ProductSaleReport | 商品销售报表 |
| SalesManSaleReport | 业务员销售报表 |
| TotalSaleReport | 销售汇总报表 |

#### 进出报表 (InoutReports)

| 功能 | 说明 |
|-----|------|
| ProductHistory | 商品流水账 |
| ProductInOutReport | 商品进出报表 |

### 2.9 系统设置 (systemViews)

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 系统参数 | sysParams/ | 系统配置 |
| 微信小程序 | WxSysParams/ | 小程序参数 |
| 数据分组 | dataGroup/ | 数据权限分组 |
| 数据处理 | dataHandle/ | 数据批量操作 |

---

## 三、路由结构说明

### 3.1 静态路由 (router/index.ts)

```
/                -> 重定向到 /mainWin
/mainWin         -> MainWin.vue (主窗口框架)
/home            -> Home.vue (首页)
/saleSplit       -> saleSplit/index.vue (单据拆分)
/saleReplace     -> saleReplace/index.vue (单据代打)
/kProduct        -> kProduct/index.vue (定位商品)
/saleChange      -> saleChange/index.vue (外帐单据)
/stockSplit      -> stockSplit/index.vue (商品加工拆分)
/wxSysParams     -> wxSysParams/index.vue (商城配置)
```

### 3.2 动态路由 (usehook/buildRouter.ts)

通过 `buildRouter()` 函数动态注册，基于用户权限：

| 模块 | 路由前缀 |
|-----|---------|
| 基础资料 | /basicViews/* |
| 采购管理 | /purchaseViews/* |
| 销售管理 | /saleViews/* |
| 库存管理 | /stockViews/* |
| 财务管理 | /financeViews/* |
| 报表分析 | /reportsViews/* |
| 配送管理 | /disViews/* |
| 系统设置 | /systemViews/* |

---

## 四、核心模块说明

### 4.1 状态管理 (stores/index.ts)

```typescript
useAppStore {
    onLineUserList    // 在线用户列表
    loginLog          // 登录日志
    socket            // WebSocket连接
    isExtend          // 是否扩展模式
    commonDatas       // 通用数据缓存
    accountBookCode   // 帐套编号
    loginDatas        // 登录用户信息
    winList           // 窗口列表Map
    activeWin         // 当前活动窗口
    updateCommonDatas // 更新通用数据方法
}
```

### 4.2 API请求模块 (request/)

#### request.ts - Axios封装
- **请求拦截**: 自动添加appid、linkname、userCode参数，MD5签名
- **响应拦截**: 自动生成guid、错误处理
- **方法**: get(), post(), postFormData(), request(), sendCheckCode()

#### api.ts - API接口集合
- getSearchParam - 查询参数
- getData - 列表查询
- deleteData - 删除数据
- insertData - 新增数据
- editData - 编辑数据
- saveData - 保存数据
- getValue - 获取字段值
- getMaxValue - 获取最大值
- uploadFile - 文件上传
- comonRequest - 通用请求
- getScaleInfo - 称重查询

### 4.3 核心Hooks (usehook/)

| 文件 | 功能说明 |
|-----|---------|
| buildRouter.ts | 动态构建路由，根据用户权限注册菜单对应的路由 |
| getNavItems.ts | 获取导航菜单数据，从权限表加载三级菜单 |
| getCommonDatas.ts | 获取通用数据：客户、商品、分类、货商等基础数据 |
| gridAction.ts | **TGridAction类** - 表格操作核心类，包含增删改查、审核、打印等 |
| dataSource.ts | **TDataSource类** - 数据源管理，处理数据加载、状态变更、提交 |
| win.ts | **TWinForm类** - 窗口表单基类，权限控制、打印样式切换 |
| userOpts.ts | 用户操作封装，数据增删改查、权限获取 |
| dataAction.ts | 数据操作工具，商品查询、数据存在性验证 |

### 4.4 核心类说明

#### TWinForm 类 (win.ts)

```typescript
class TWinForm {
    PowerList        // 权限列表
    ActiveGridAction // 当前活动的GridAction
    ActiveGridDom    // 当前活动的Grid DOM
    
    // 方法
    switchGrid()     // 切换主从表格
    closeWin()       // 关闭窗口
    getPrintStyle()  // 获取打印样式
    initPower()      // 初始化权限
    beforePrint()    // 打印前处理
}
```

#### TGridAction 类 (gridAction.ts)

```typescript
class TGridAction {
    dataSource       // 数据源
    Columns          // 表格列配置
    TableConfig      // 表格配置
    PagerConfig      // 分页配置
    PowerList        // 权限列表
    Events           // 事件处理
    Methods          // 方法
    
    // 核心方法
    open()           // 打开数据
    insert()         // 插入行
    update()         // 更新数据
    delete()         // 删除行
    cancel()         // 取消变更
    submit()         // 审核/反签
    checkSubmit()    // 检查审核权限
}
```

#### TDataSource 类 (dataSource.ts)

```typescript
class TDataSource {
    dataSet          // 当前数据集
    CurDataSet       // 过滤后的数据集
    detailSet        // 变更明细集
    totalData        // 合计数据
    activeRowIndex   // 当前行索引
    
    // 核心方法
    open()           // 加载数据
    insert()         // 插入
    delete()         // 删除
    update()         // 更新
    cancel()         // 取消
    setFieldValue()  // 设置字段值
    datasetIsChange() // 检查变更
}
```

---

## 五、组件结构说明

### 5.1 视图组件模式

大多数业务视图采用 **主从表** 结构：

```
LkxGrid (列表) <---> LkxGrid (明细) 
     |                    |
     v                    v
TListGridAction     TDetailGridAction
     |                    |
     v                    v
TDataSource         TDataSource
     |                    |
     v                    v
API请求             API请求
```

### 5.2 主窗口结构 (MainWin.vue)

```
┌─────────────────────────────────────────────────────┐
│ Header (顶部导航栏)                                  │
│  [Logo] [系统标题]           [小程序] [用户] [工具]  │
├─────────────────────────────────────────────────────┤
│ Menu (工具栏)                                       │
├────────────┬────────────────────────────────────────┤
│ Nav        │ WorkArea (工作区)                      │
│ (左侧菜单) │ ┌──────────────────────────────────┐   │
│            │ │ Tabs (标签页)                     │   │
│            │ ├──────────────────────────────────┤   │
│            │ │ router-view (动态内容)           │   │
│            │ │                                  │   │
│            │ │                                  │   │
│            │ └──────────────────────────────────┘   │
├────────────┴────────────────────────────────────────┤
│ Footer (底部状态栏)                                  │
│  帐套信息 | 服务到期提醒                            │
└─────────────────────────────────────────────────────┘
```

### 5.3 弹窗组件库 (components/)

| 组件名称 | 功能 |
|---------|------|
| WinProductSelect | 商品选择弹窗 |
| WinBatchInSelect | 批次入库选择 |
| WinBatchOutSelect | 批次出库选择 |
| WinRateProductSelect | 报价商品选择 |
| WinChangeProduct | 商品更换 |
| WinUploadProductImage | 商品图片上传 |
| WinUploadReports | 检测报告上传 |
| WinTransferShipper | 货商转移 |
| WinPackDetail | 包装详情 |
| WinOrderQrCode | 订单二维码 |
| WinShipperSet | 货商设置 |
| WinAddPriceRate | 加价率设置 |
| WinCateSelect | 分类选择 |
| WinImportWin | 导入窗口 |
| WinAccountsInit | 账户初始化 |
| WinAccountsMoneyChange | 账户资金变动 |
| WinAccountsMoneySwap | 账户资金调拨 |
| WinChangePwd | 修改密码 |
| WinCopyMenu | 复制菜单 |
| WinMateWin | 配对窗口 |
| WinMergeSelect | 合并选择 |
| WinDoMethod | 执行方法 |
| WinPrintStyleSet | 打印样式设置 |

---

## 六、配置文件说明 (config.ts)

```typescript
{
    $http:           // API地址
    $appid:          // 应用ID
    $linkname:       // 链接名称
    $ltdname:        // 公司名称
    $picSrc:         // 图片服务器地址
    $bookname:       // 帐套名称
    $key:            // 签名密钥
    $ws:             // WebSocket地址
    $endDat:         // 服务到期日期
    $version:        // 版本号
    $useVersion:     // 使用版本
    $loginUrl:       // 登录地址
    $toUrl:          // 跳转地址
    $accountBookCode: // 帐套编号
}
```

---

## 七、关键业务流程

### 7.1 登录流程

```
login.vue 
    ↓ 获取帐套信息
    ↓ 用户认证
    ↓ 写入sessionStorage
    ↓ 跳转到MainWin
    ↓ 加载导航菜单
    ↓ 构建动态路由
    ↓ 获取通用数据
    ↓ 渲染主界面
```

### 7.2 配货流程 (核心业务)

```
disAction/index.vue 
    ↓ 选择送货日期
    ↓ 加载配货数据
    ↓ 按客户/分类/货商分组显示
    ↓ 点击商品
    ↓ 获取库存来源
    ↓ 打开配货窗口
    ↓ 称重/输入数量
    ↓ 提交配货
    ↓ 打印标签
```

### 7.3 销售流程

```
sale/index.vue (列表)
    ↓ 选择送货单
    ↓ 查看明细
    ↓ 编辑明细数据
    ↓ 审核
    ↓ 生成应收款
```

---

## 八、数据库表结构关联

### 8.1 核心业务表

| 表名 | 说明 |
|-----|------|
| L_Nav_Func_header_tab | 导航菜单主表 |
| L_Nav_Func_Detail_tab | 导航菜单明细 |
| L_Nav_Func_Detail_children_Tab | 导航菜单子项 |
| L_Nav_Func_Power_tab | 功能权限表 |

### 8.2 业务数据表

| 模块 | 相关表 |
|-----|-------|
| 客户 | CustomerDatas |
| 商品 | ProductDatas, CateDatas |
| 供应商 | ShipperDatas |
| 销售 | SaleDatas, SaleEntryDatas |
| 采购 | PurchaseDatas, PurchaseEntryDatas |
| 库存 | StockDatas |
| 财务 | AccountsDatas, PayableDatas, ReceivableDatas |

---

## 九、总结

这是一个功能完善的**配送管理系统Web前端**，主要特点：

1. **模块化设计**: 清晰的功能模块划分，便于维护和扩展
2. **权限驱动**: 基于岗位权限的动态路由和功能控制
3. **数据分层**: TDataSource统一数据管理，TGridAction统一表格操作
4. **组件复用**: 30+弹窗组件封装，标准化交互体验
5. **业务完整**: 覆盖配送企业全业务流程（采购、销售、库存、财务、配货）

项目采用了Vue3+TypeScript的现代前端技术栈，通过Pinia状态管理和动态路由实现灵活的权限控制，是一套成熟的B/S架构业务系统。

---

*文档生成时间: 2026-05-17*
