# 配送管理系统 V4x 前端功能完整分析文档

## 一、项目概览

### 1.1 模块总览

| 模块 | 目录 | 功能说明 |
|-----|------|---------|
| 基础资料 | basicViews/ | 商品、客户、用户等基础数据管理 |
| 销售管理 | saleViews/ | 销售订单、送货、退货等 |
| 采购管理 | purchaseViews/ | 采购订货、收货、入库等 |
| 库存管理 | stockViews/ | 库存查询、调拨、拆分等 |
| 财务管理 | financeViews/ | 应收应付账款管理 |
| 配送管理 | disViews/ | 配货操作、打印、报表 |
| 报表分析 | reportsViews/ | 销售、库存、进出库报表 |
| 系统设置 | systemViews/ | 系统参数、小程序配置 |

---

## 二、基础资料模块 (basicViews)

### 2.1 功能列表

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

---

## 三、销售模块 (saleViews)

### 3.1 功能列表

| 功能 | 路径 | 单据前缀 | 说明 |
|-----|------|---------|-----|
| 客户管理 | customer/ | - | 客户档案、报价时段 |
| 项目管理 | project/ | - | 项目信息 |
| 销售报价 | quotedPrice/ | BJ | 报价单、审核流程 |
| 销售单 | sale/ | XS | 送货单、审核打印 |
| 销售调整 | saleChange/ | - | 批量合并调整 |
| 销售结算 | saleEntry/ | - | 已审核单据入账 |
| 客户订单 | saleOrder/ | DD | 订货单管理 |
| 订单新增 | saleOrderAdd/ | - | 新增订货单 |
| 销售退货 | saleReturn/ | XT | 退货处理 |
| 单据拆分 | saleSplit/ | - | 送货单拆分 |
| 单据代打 | saleReplace/ | - | 单据打印替代 |
| 外账单据 | saleChange/ | - | 对外交换 |

### 3.2 核心功能详解

#### 3.2.1 客户管理 (customer)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/sales/customer/customerList/` |
| API-明细 | `/masterApi/disApi/sales/customer/customerDetail/` |

**核心字段**：
- idcode (客户编码)
- name (客户名称)
- settlementtype (结算方式)
- tel (联系电话)
- person (联系人)
- addr (地址)
- pcode (关联项目)
- startat/endat (报价时段)

**业务流程**：客户建档 → 维护信息 → 关联项目 → 设置报价时段

#### 3.2.2 销售单 (sale)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/sales/sale/BillList/` |
| API-明细 | `/masterApi/disApi/sales/sale/BillDetail/` |
| API-批次号 | `/masterApi/disApi/sales/sale/batchNumberFrom/` |

**核心字段**：
- billNumber (单号)
- customercode (客户)
- deliveryat (送货日期)
- salemoney (销售金额)
- costMoney (成本金额)
- profit (利润)
- examineusercode (审核人)

**业务流程**：创建销售单 → 选择客户商品 → 审核确认 → 入账处理 → 打印单据

#### 3.2.3 销售报价 (quotedPrice)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/sales/quotedPrice/BillList/` |
| API-明细 | `/masterApi/disApi/sales/quotedPrice/BillDetail/` |

**核心字段**：
- billNumber (单号)
- customercode (客户编码)
- pcode (项目)
- examineusercode (审核人)
- startat/endat (报价有效期)

---

## 四、库存模块 (stockViews)

### 4.1 功能列表

| 功能 | 路径 | 类型 | 说明 |
|-----|------|------|-----|
| 库存查询 | stocks/stock/ | 报表 | 实时库存统计 |
| 品质库 | stocks/qstock/ | 报表 | 待检商品 |
| 霉变库 | stocks/mstock/ | 报表 | 变质商品 |
| 库存历史 | stocks/stockHistory/ | 报表 | 期初/期末统计 |
| 采购入库 | stockReceive/ | 单据 | 入库单审核 |
| 库存损溢 | stockChange/ | 单据 | 盘盈盘亏调整 |
| 库存调拨 | stockSwap/ | 单据 | 同仓库调拨 |
| 商品拆分 | stockSplit/ | 单据 | 批次拆分 |
| 仓库调拨 | stockAreaSwap/ | 单据 | 跨仓库调拨 |

### 4.2 核心功能详解

#### 4.2.1 库存查询 (stock)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/stocks/stock/` |
| API-待入库 | `/masterApi/disApi/stocks/stockWaitIn/` |
| API-待出库 | `/masterApi/disApi/stocks/stockWaitOut/` |

**核心字段**：
- productcode (商品编码)
- Num (库存数量)
- RuningNum (运行数量)
- WaitInNum (待入库数量)
- WaitOutNum (待出库数量)
- AllowedNum (可用数量)
- SumMoney (总金额)

#### 4.2.2 库存损溢 (stockChange)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/stocks/stockChange/BillList/` |
| API-明细 | `/masterApi/disApi/stocks/stockChange/BillDetail/` |

**业务流程**：新增损溢单 → 选择日期 → 编辑明细 → 保存 → 审核 → 生效

---

## 五、财务模块 (financeViews)

### 5.1 功能列表

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 应付账款 | payable/ | 供应商应付款查询 |
| 应收账款 | receivable/ | 客户应收款查询 |
| 账户报表 | reports/AccountsReports/ | 账户统计 |
| 资金报表 | reports/moneyReports/ | 资金流水 |
| 付款报表 | reports/payReports/ | 付款明细 |
| 收款报表 | reports/recReports/ | 收款明细 |

### 5.2 核心功能详解

#### 5.2.1 应付账款 (payable)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/finance/Payable/Lists/` |
| API-明细 | `/masterApi/disApi/finance/Payable/DetailOnList/` |
| API-月汇总 | `/masterApi/disApi/finance/Payable/DetailOnMonth/` |
| API-采购明细 | `/masterApi/disApi/purchase/purchase/PackDetail/` |

**核心字段**：
- idcode (货商编码)
- shippername (货商名称)
- settlementtype (结算方式)
- accountday (账期)
- oweMoney (欠款金额)

#### 5.2.2 应收账款 (receivable)

| 属性 | 说明 |
|-----|------|
| API-列表 | `/masterApi/disApi/finance/receivable/Lists/` |
| API-明细 | `/masterApi/disApi/finance/receivable/DetailOnList/` |
| API-月汇总 | `/masterApi/disApi/finance/receivable/DetailOnMonth/` |

**核心字段**：
- idcode (客户编码)
- customername (客户名称)
- settlementtype (结算方式)
- accountday (账期)
- oweMoney (欠款金额)

---

## 六、配送模块 (disViews)

### 6.1 功能列表

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 配货操作 | disAction/ | 核心配货执行 |
| 配货打印 | disPrint/ | 多格式打印 |
| 配货报表 | disReport/ | 配货记录查询 |

### 6.2 核心功能详解

#### 6.2.1 配货操作 (disAction)

| 属性 | 说明 |
|-----|------|
| API | `/masterApi/disApi/dis/disDisTribution/` |

**核心功能**：
- 按客户/分类/货商三种视图配货
- 称重配货（支持电子秤串口）
- 一键配货
- 实时库存检查
- 配货完成标记
- 标签打印

**核心字段**：
- deliveryAt (送货日期)
- disType (配货类型: 0按客户/1按分类/2按货商)
- ProductCode (货号)
- num (应配数量)
- numex (欠数/实配)
- distributionstatus (配货状态)

**业务流程**：
```
选择送货日期 → 选择配货视图(客户/分类/货商)
    ↓
加载配货数据
    ↓
点击商品 → 称重/输入数量
    ↓
提交配货 → 打印标签
```

#### 6.2.2 配货打印 (disPrint)

| 属性 | 说明 |
|-----|------|
| API | `/masterApi/disApi/dis/disPrint/` |

**打印类型**：
| 类型值 | 说明 |
|-------|------|
| 0 | 按客户配货表 |
| 1 | 按分类配货表 |
| 2 | 按货商配货表 |
| 3 | 库存清点表 |
| 4 | 标签打印 |
| 5 | 司机取货单 |

---

## 七、报表模块 (reportsViews)

### 7.1 分析报表 (AnalysisReports)

| 报表 | 路径 | 说明 |
|-----|------|-----|
| ABC分类报表 | AbcReport/ | 商品ABC分类分析 |
| 出入库比率报表 | InOutRateReport/ | 采购/销售比例 |
| 月报表 | MonMReport/ | 月度趋势图表 |
| 销售趋势报表 | SaleTrendReport/ | 实时销售对比 |
| 未销售报表 | UnSaleReport/ | 滞销商品分析 |
| 周报表 | WeekReport/ | 四周对比分析 |
| 重量比率报表 | WtRateReport/ | 毛利分析 |
| 同比报表 | YonYReport/ | 同比趋势图表 |

#### 7.1.1 销售趋势报表 (SaleTrendReport)

| 属性 | 说明 |
|-----|------|
| API | `/masterApi/disApi/reports/AnalysisReports/SaleTrendReport/` |
| API-今日 | `/masterApi/disApi/reports/AnalysisReports/SaleTrendTodyReport/` |

**筛选条件**：startat (开始日期), endat (结束日期)

**统计字段**：salemoney (销售额), profit (毛利), billnumbernum (客单数)

#### 7.1.2 ABC分类报表 (AbcReport)

| 属性 | 说明 |
|-----|------|
| API | `/masterApi/disApi/reports/AnalysisReports/AbcReport/` |

**筛选条件**：startat, endat, catecode, productcode, barcode, name, spec

**统计字段**：ABCType, ProductCode, Num (销量), SaleMoney (销售额), ProFit (毛利)

### 7.2 进出库报表 (InoutReports)

| 报表 | 路径 | 说明 |
|-----|------|-----|
| 商品历史报表 | ProductHistory/ | 出入库流水 |
| 商品出入库报表 | ProductInOutReport/ | 完整进销存 |

#### 7.2.1 商品出入库报表 (ProductInOutReport)

| 属性 | 说明 |
|-----|------|
| API | `/masterApi/disApi/reports/InOutReports/ProductInOutReport/` |

**统计字段**：
| 阶段 | 数量 | 金额 |
|-----|------|------|
| 期初 | startNum | StartMoney |
| 采购 | purchaseNum | PurchaseMoney |
| 销售 | saleNum | SaleMoney |
| 拆零 | stockSwapNum | StockSwapMoney |
| 损溢 | stockChangeNum | StockChangeMoney |
| 领用 | stockReceiveNum | StockReceiveMoney |
| 退货差额 | diffNum | DiffMoney |
| 期末 | endNum | EndMoney |

### 7.3 销售报表 (saleReports)

| 报表 | 路径 | 说明 |
|-----|------|-----|
| 分类销售报表 | CateSaleReport/ | 按分类统计 |
| 客户销售报表 | CustomerSaleReport/ | 按客户统计 |
| 司机销售报表 | DriverSaleReport/ | 按司机统计 |
| 商品销售报表 | ProductSaleReport/ | 按商品统计 |
| 业务员销售报表 | SalesManSaleReport/ | 按业务员统计 |
| 销售汇总报表 | TotalSaleReport/ | 按日期汇总 |

---

## 八、系统设置模块 (systemViews)

### 8.1 功能列表

| 功能 | 路径 | 说明 |
|-----|------|-----|
| 系统参数 | sysParams/ | 业务规则配置 |
| 小程序配置 | WxSysParams/ | 微信小程序设置 |
| 数据分组 | dataGroup/ | 汇总计算 |
| 数据处理 | dataHandle/ | 数据清理初始化 |

### 8.2 核心功能详解

#### 8.2.1 系统参数 (sysParams)

| 属性 | 说明 |
|-----|------|
| API-获取 | `/masterApi/disApi/Sys/SysParams/getData/` |
| API-保存 | `/masterApi/disApi/Sys/SysParams/editData/` |

**配置项分类**：

| 分类 | 配置项 |
|-----|-------|
| 订单规则 | 下单时段、超时时间点 |
| 价格规则 | 成本/售价小数位、取最后销售价 |
| 库存规则 | 允许负库存、出库配货规则 |
| 打印规则 | 标签打印机、分栏配置 |
| 账套配置 | 主/子账套、账套间传送 |
| 分流规则 | 自动分流、多货商分流 |
| 配货规则 | 电子秤集成、配货后加单 |
| 入账规则 | 收货/销售自动入账 |

#### 8.2.2 小程序配置 (WxSysParams)

| 属性 | 说明 |
|-----|------|
| API-获取 | `/masterApi/disApi/Sys/WxSysParams/getData/` |
| API-保存 | `/masterApi/disApi/Sys/WxSysParams/editData/` |
| API-上传 | `/controller/commonApi/UploadImage/` |

**配置项**：
| 分类 | 配置项 |
|-----|-------|
| 基本信息 | 商家名称、电话、地址 |
| 图片资源 | Logo、客服二维码、轮播图、资质图片 |
| 支付配置 | APPID、APPSECRET、商户号、密钥、证书 |

#### 8.2.3 数据汇总 (dataGroup)

| 属性 | 说明 |
|-----|------|
| 操作 | Group_Copy, Group_InOut, Group_Sale, Group_Extend, Group_End |

**业务流程**：开始日期 → 结束日期 → 执行汇总 → 完成

#### 8.2.4 数据处理 (dataHandle) - 高危操作

| 操作 | 说明 |
|-----|------|
| DataDeleteGroup | 删除汇总数据 |
| DataEmpty | 开业清库 |
| DataInit | 初始化数据 |

**安全验证**：管理员密码 + 短信验证码

---

## 九、模块关联总图

```
┌─────────────────────────────────────────────────────────────────┐
│                         业务主流程                                │
└─────────────────────────────────────────────────────────────────┘

基础资料
    │
    ├── 商品管理 (product)
    ├── 客户管理 (customer)
    ├── 供货商管理 (shipper)
    └── 分类管理 (cate)

        ↓

采购管理                          销售管理
    ├── 订货汇总 ──────────────────→ 客户订货 (saleOrder)
    ├── 采购订货单 (purchaseOrder)    ↓
    ├── 收货汇总 ←─────────────────── 销售报价 (quotedPrice)
    ├── 采购收货 (purchase)          ↓
    └── 采购入库 (purchaseEntry)     销售单 (sale)
            │                        ↓
            │                   销售结算 (saleEntry)
            ↓                        ↓
库存管理                      应收/应付
    ├── 采购入库 (stockReceive)   receivable/payable
    ├── 库存调拨 (stockSwap)
    ├── 库存损溢 (stockChange)
    └── 库存拆分 (stockSplit)

        ↓

配送管理
    ├── 配货操作 (disAction) ← 核心业务
    ├── 配货打印 (disPrint)
    └── 配货报表 (disReport)

        ↓

报表分析
    ├── 销售报表 (saleReports)
    ├── 库存报表 (stockReports)
    └── 分析报表 (AnalysisReports)
```

---

## 十、单据编号规则

| 单据类型 | 前缀 | billType |
|---------|------|----------|
| 销售单 | XS | - |
| 销售报价 | BJ | - |
| 客户订单 | DD | - |
| 销售退货 | XT | - |
| 采购订货 | RD | 16 |
| 采购收货 | RK | - |
| 采购退货 | RT | 1 |
| 采购换货 | CH | 2 |
| 采购入库 | RK | - |

---

## 十一、API接口前缀汇总

| 模块 | 前缀 |
|-----|------|
| 销售 | `/masterApi/disApi/sales/` |
| 采购 | `/masterApi/disApi/purchase/` |
| 库存 | `/masterApi/disApi/stocks/` |
| 财务 | `/masterApi/disApi/finance/` |
| 配送 | `/masterApi/disApi/dis/` |
| 报表 | `/masterApi/disApi/reports/` |
| 系统 | `/masterApi/disApi/Sys/` |

---

*文档生成时间: 2026-05-17*
