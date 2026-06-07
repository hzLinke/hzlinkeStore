# 配送分拣系统功能详细操作说明

> 本文档基于项目实际代码分析生成

---

## 项目结构

```
apps/web/src/views/
├── basicViews/              # 基础资料 (11个模块)
│   ├── action.ts           # TBasicAction 基类
│   ├── accounts/           # 账户管理
│   ├── area/               # 区域管理
│   ├── cate/               # 分类管理
│   ├── kProduct/           # K商品序号表
│   ├── ltd/                # 往来单位
│   ├── payType/            # 支付方式
│   ├── post/               # 岗位管理
│   ├── product/            # 商品档案（完整）
│   ├── settlementType/     # 结算方式
│   ├── subject/            # 科目管理
│   └── user/               # 用户管理
│
├── saleViews/              # 销售管理 (13个模块)
│   ├── SaleAction.ts      # TSalesListGridAction, TSalesDetailGridAction
│   ├── types.ts
│   ├── customer/          # 客户管理
│   ├── project/           # 项目管理
│   ├── quotedPrice/        # 报价单 (billType=302)
│   ├── reports/           # 销售报表
│   │   ├── invoiceReport/      # 发票报表
│   │   ├── saleCheck/         # 销售对账
│   │   ├── saleOrderReports/  # 订货报表
│   │   └── saleReports/       # 销售报表
│   ├── sale/              # 销售送货单 (billType=3)
│   ├── saleChange/        # 销售换货单 (billType=11)
│   ├── saleEntry/         # 销售入帐 (billType=13)
│   ├── saleOrder/         # 客户订货单 (billType=17)
│   ├── saleOrderAdd/      # 订货追加单
│   ├── saleReplace/       # 销售代打 (billType=14)
│   ├── saleReturn/        # 销售退货单 (billType=4)
│   └── saleSplit/         # 销售拆分单 (billType=12)
│
├── purchaseViews/          # 采购管理 (10个模块)
│   ├── PurchaseAction.ts  # TPurchasesListGridAction, TPurchasesDetailGridAction
│   ├── types.ts
│   ├── downOrderGroup/    # 供货商订货汇总
│   ├── purchase/          # 采购收货单 (billType=0)
│   ├── purchaseEntry/     # 采购入库单 (billType=1)
│   ├── purchaseExChange/  # 采购换货单 (billType=2)
│   ├── purchaseOrder/     # 采购订货单 (billType=16)
│   ├── purchaseOrderGroup/# 订货汇总
│   ├── purchaseReturn/     # 采购退货单 (billType=1)
│   ├── reports/           # 采购报表
│   │   ├── invoiceInReport/        # 进货报表
│   │   ├── purchaseCheck/         # 采购对账
│   │   ├── purchaseOrderReports/  # 采购订货报表
│   │   └── purchaseReports/       # 采购收货报表
│   └── shipper/          # 供货商管理
│
├── stockViews/             # 库存管理 (8+4个子模块)
│   ├── StockAction.ts     # TStockListGridAction, TStockDetailGridAction
│   ├── types.ts
│   ├── reports/           # 库存报表
│   │   ├── stockAreaSwapReport/  # 柜组调拨报表
│   │   ├── stockChangeReport/    # 库存变更报表
│   │   ├── stockReceiveReport/   # 商品领用报表
│   │   └── stockSwapReport/      # 分店调拨报表
│   ├── stockAreaSwap/     # 柜组调拨 (billType=7)
│   ├── stockChange/       # 库存变更 (billType=6)
│   ├── stockReceive/      # 商品领用 (billType=8)
│   ├── stocks/            # 库存查询（子模块）
│   │   ├── mstock/       # 月库存
│   │   ├── qstock/       # 季度库存
│   │   ├── stock/        # 库存查询
│   │   └── stockHistory/ # 历史库存
│   ├── stockSplit/       # 库存拆分 (billType=10)
│   └── stockSwap/        # 分店调拨 (billType=9)
│
├── financeViews/           # 财务管理 (4+4个子模块)
│   ├── FinanceAction.ts   # TFinanceListGridAction, TFinanceDetailGridAction, TFinanceDetailListGridAction
│   ├── types.ts
│   ├── payable/           # 应付账款
│   ├── receivable/        # 应收账款
│   └── reports/           # 财务报表
│       ├── AccountsReports/  # 账户报表
│       ├── moneyReports/     # 资金报表
│       ├── payReports/       # 付款报表
│       └── recReports/       # 收款报表
│
├── reportsViews/           # 报表分析 (4+16个子模块)
│   ├── reportsAction.ts   # TReportsAction
│   ├── AnalysisReports/   # 分析报表
│   │   ├── AbcReport/        # ABC分类报表
│   │   ├── InOutRateReport/  # 销进比报表
│   │   ├── MonMReport/      # 月均毛利报表
│   │   ├── SaleTrendReport/  # 销售趋势报表
│   │   ├── UnSaleReport/     # 四周滞销报表
│   │   ├── WeekReport/       # 四周销量报表
│   │   ├── WtRateReport/     # 周转率报表
│   │   └── YonYReport/       # 同比报表
│   ├── InoutReports/      # 出入库报表
│   │   ├── ProductHistory/       # 商品历史
│   │   └── ProductInOutReport/   # 商品出入库报表
│   └── saleReports/       # 销售报表
│       ├── CateSaleReport/      # 分类销售报表
│       ├── CustomerSaleReport/  # 客户销售报表
│       ├── DriverSaleReport/    # 司机销售报表
│       ├── ProductSaleReport/   # 商品销售报表
│       ├── SalesManSaleReport/  # 业务员销售报表
│       └── TotalSaleReport/     # 销售汇总报表
│
├── disViews/              # 配送管理 (3个模块)
│   ├── disAction/         # 配送业务
│   ├── disPrint/          # 打印管理
│   └── disReport/         # 配送报表
│
└── systemViews/            # 系统设置 (4个模块)
    ├── dataGroup/         # 汇总计算
    ├── dataHandle/        # 数据处理
    ├── sysParams/         # 系统参数
    └── WxSysParams/       # 微信参数
```

---

## 业务逻辑类说明

### basicAction.ts - TBasicAction
- 基础资料模块基类
- 继承自 TGridAction
- 支持 ESC 键关闭当前窗口

### SaleAction.ts
- `TSalesListGridAction`: 销售单据列表页
  - billType: 3=销售, 17=订货, 302=报价, 333=外销, 4=退货
  - 单据前缀: XS/XD/WS/XT/QP
- `TSalesDetailGridAction`: 销售单据明细页
  - 自动计算金额、重量、折扣
  - 商品选择支持报价校验

### PurchaseAction.ts
- `TPurchasesListGridAction`: 采购单据列表页
  - billType: 16=订货, 0=收货, 1=入库/退货, 2=换货
  - 单据前缀: RD/RK/RT/CH
- `TPurchasesDetailGridAction`: 采购单据明细页
  - 支持批次号自动生成
  - 开单量、框损计算

### StockAction.ts
- `TStockListGridAction`: 库存单据列表页
  - billType: 6=变更, 7=柜组调拨, 8=领用, 9=分店调拨, 10=拆零, 11=盘点, 12=拆分
  - 单据前缀: SC/AS/SR/SS/SB/Ck/SP
- `TStockDetailGridAction`: 库存单据明细页

### FinanceAction.ts
- `TFinanceListGridAction`: 应收/应付列表页
- `TFinanceDetailGridAction`: 应收/应付明细页
- `TFinanceDetailListGridAction`: 按单/月汇总明细

---

## 一、基础资料模块 (basicViews)

### 1.1 商品档案 (product)

**数据库表:** `L_Basic_Product`

**API路径:** `/masterApi/disApi/basic/product/`

**功能特点:**
- 完整的商品档案管理，支持左侧分类面板
- 支持商品拆零配置（明细表 `L_Basic_Product_Comb_Tab`）
- 品名/条码唯一性验证
- 子帐套限制（只能修改进价和售价）

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| idcode | 货号 | number | 商品编码(主键) |
| barcode | 条码 | text | 商品条码(唯一) |
| selfcode | 自编码 | text | 自定义编码 |
| name | 品名 | text | 商品名称(唯一) |
| AliasName | 别名 | text | 商品别名 |
| spec | 规格 | text | 规格型号 |
| pack | 装数 | number | 装数 |
| Weight | 净重 | number | 净重 |
| brand | 品牌 | text | 品牌 |
| origin | 产地 | text | 产地 |
| unit | 结算单位 | text | 结算单位(默认"斤") |
| punit | 下单单位 | text | 下单单位(默认"斤") |
| Downwgspec | 个重 | text | 单个重量(默认1) |
| domethod | 做法 | text | 做法 |
| saletype | 商品类型 | drop | 0-称重,1-按量,2-称重+按量,3-散+件 |
| catecode | 分类 | drop | 商品分类 |
| shipperCode | 供货商 | drop | 默认供货商 |
| areacode | 仓库 | drop | 默认仓库(默认101) |
| inprice | 进价 | number | 采购进价(0.000) |
| price1 | 售价1 | number | 销售价1(0.00) |
| price2 | 售价2 | number | 销售价2(0.00) |
| price3 | 售价3 | number | 销售价3(0.00) |
| price4 | 售价4 | number | 销售价4(0.00) |
| price5 | 售价5 | number | 销售价5(0.00) |
| LowerLimit | 下限 | number | 库存下限 |
| UpperLimit | 上限 | number | 库存上限 |
| status | 状态 | drop | 0-正常,1-只销,2-停销 |
| avgCostprice | 最后平均价 | number | 最后平均价(只读,0.000) |
| checknote | 验收标准 | text | 验收标准 |
| PicSrc | 图片 | text | 图片路径 |
| note | 备注 | text | 备注信息 |

**操作功能:**
- 新增（自动生成货号/条码/自编码，默认值设置）
- 删除（检查拆零配置，不允许删除有拆零配置的商品）
- 编辑（子帐套限制，只能修改进价和售价）
- 批量修改供货商（双击货号列）
- 图片上传（双击图片列）

**特殊功能:**
- 双击货号：打开商品拆零配置面板
- 双击图片：打开图片上传弹窗
- 支持按分类筛选（左侧分类面板）

---

### 1.2 K商品序号表 (kProduct)

**数据库表:** `L_Basic_K_Tab`

**API路径:** `/masterApi/disApi/basic/Kproduct/`

**功能特点:**
- K商品序号管理，结构简单
- 用于记录货号与序号的对应关系
- 主键为 SerialNumber（序号）

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| productcode | 货号 | number | 商品编码(可编辑) |
| barcode | 条码 | text | 商品条码(只读，自动填充) |
| name | 品名 | text | 商品名称(只读，自动填充) |
| spec | 规格 | text | 规格型号(只读，自动填充) |
| unit | 单位 | text | 计量单位(只读，自动填充) |
| SerialNumber | 序号 | number | 序号(主键) |

**操作功能:**
- 新增（自动生成序号）
- 删除
- 编辑

**特殊功能:**
- 输入货号后自动填充条码、品名、规格、单位信息
- 货号唯一性验证

---

### 1.3 用户管理 (user)

**API路径:** `/masterApi/disApi/basic/user/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| idcode | 编码 | number | 用户编码 |
| name | 姓名 | text | 用户姓名 |
| tel | 电话 | text | 联系电话 |
| post | 岗位 | drop | 岗位选择 |
| status | 状态 | drop | 0:在职, 1:离职 |
| LookSelfOrder | 只看本人 | drop | 0:否, 1:是 |
| wxcode | OpenCode | text | 微信OpenID |
| note | 备注 | text | 备注信息 |

**操作功能:**
- 新增（禁止删除/编辑编码0,1的系统用户）
- 删除
- 编辑

---

### 1.4 基础资料其他模块

| 模块 | API路径 | 主要字段 |
|------|---------|----------|
| 岗位管理 | /masterApi/disApi/basic/post/ | 编码、名称 |
| 分类管理 | /masterApi/disApi/basic/cate/ | 编码、名称、上级分类 |
| 区域管理 | /masterApi/disApi/basic/area/ | 编码、名称 |
| 结算方式 | /masterApi/disApi/basic/settlementType/ | 编码、名称 |
| 支付方式 | /masterApi/disApi/basic/payType/ | 编码、名称 |
| 科目管理 | /masterApi/disApi/basic/subject/ | 编码、名称、类型 |
| 往来单位 | /masterApi/disApi/basic/ltd/ | 编码、名称、类型 |
| 账户管理 | /masterApi/disApi/basic/accounts/ | 编码、名称、余额 |

---

## 二、销售管理模块 (saleViews)

### 2.1 客户订货单 (saleOrder)

**单据类型:** billType = 17

**API路径:**
- 列表: `/masterApi/disApi/sales/saleOrder/BillList/`
- 详情: `/masterApi/disApi/sales/saleOrder/BillDetail/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| billnumber | 单号 | text | 订货单号 |
| CustomerOrderId | 客户单号 | text | 客户自定义单号 |
| Pcode | 项目名称 | drop | 项目选择 |
| customercode | 客户 | drop | 客户选择 |
| SettlementType | 结算方式 | drop | 结算方式 |
| AccountDay | 帐期 | number | 账期天数 |
| SalesMan | 业务 | drop | 业务员 |
| DriverCode | 司机 | drop | 司机 |
| deliveryAt | 送货日 | datetime | 送货日期 |
| ExamineUserCode | 审核 | drop | 审核人 |
| MakingUserCode | 制单 | drop | 制单人 |
| MakingAt | 制单日 | datetime | 制单日期 |
| ExamineAt | 审核日 | datetime | 审核日期 |
| saleMoney | 订货金额 | number | 金额(0.00) |
| status | 状态 | drop | 0:未生效, 1:待送货, 2:完成 |
| note | 备注 | text | 备注信息 |

**明细表字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| productcode | 货号 | number | 商品货号 |
| barcode | 条码 | text | 商品条码 |
| name | 品名 | text | 商品名称 |
| spec | 规格 | text | 规格型号 |
| downwg | 换子 | number | 换算因子(0.00) |
| Weight | 净重 | number | 净重 |
| unit | 单位 | text | 计量单位 |
| QualityGrade | 质量 | drop | 0:标准, 1:次级, 2:高级 |
| stocknum | 可用量 | number | 可用库存(0.00) |
| num | 下单量 | number | 订购数量(0.00) |
| numex | 结算量 | number | 结算数量(0.00) |
| replaceNumEx | 代打数量 | number | 代打印数量(0.00) |
| dr | 折扣 | number | 折扣率(0.00%) |
| cursaleprice | 原价 | number | 原销售价(0.00) |
| baseprice | 单价 | number | 当前单价(0.00) |
| saleprice | 结算单价 | number | 结算单价(0.00) |
| money | 金额 | number | 行金额(0.00) |
| DisTotal | 应配量 | number | 应配数量(0.00) |
| note | 备注/做法 | text | 备注或做法 |

**工具栏按钮:**
- F8 复制菜普
- F9 撤销分流
- F10 智能匹配

**操作功能:**
- 新增
- 删除
- 编辑
- 审核
- 反审核
- 复制菜谱
- 智能匹配

---

### 2.2 销售送货单 (sale)

**单据类型:** billType = 3

**API路径:**
- 列表: `/masterApi/disApi/sales/sale/BillList/`
- 详情: `/masterApi/disApi/sales/sale/BillDetail/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| billnumber | 单号 | text | 送货单号 |
| orderbillnumber | 订单号 | text | 关联订货单号 |
| CustomerOrderId | 客户单号 | text | 客户自定义单号 |
| Pcode | 项目名称 | drop | 项目选择 |
| customercode | 客户 | drop | 客户选择 |
| SettlementType | 结算方式 | drop | 结算方式 |
| AccountDay | 帐期 | number | 账期天数 |
| SalesMan | 业务 | drop | 业务员 |
| DriverCode | 司机 | drop | 司机 |
| deliveryAt | 送货日 | datetime | 送货日期 |
| ExamineUserCode | 审核 | drop | 审核人 |
| MakingUserCode | 制单 | drop | 制单人 |
| MakingAt | 制单日 | datetime | 制单日期 |
| ExamineAt | 审核日 | datetime | 审核日期 |
| costMoney | 成本金额 | number | 成本(0.00) |
| saleMoney | 销售金额 | number | 金额(0.00) |
| profit | 毛利 | number | 毛利(0.00) |
| type | 类型 | drop | 0:后台, 1:自助, 2:拆单 |
| status | 状态 | drop | 0:待送货, 1:待收款, 2:完成 |
| note | 备注 | text | 备注信息 |

**明细表字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| productcode | 货号 | number | 商品货号 |
| barcode | 条码 | text | 商品条码 |
| name | 品名 | text | 商品名称 |
| spec | 规格 | text | 规格型号 |
| downwg | 换子 | number | 换算因子 |
| Weight | 净重 | number | 净重 |
| unit | 单位 | text | 计量单位 |
| QualityGrade | 质量 | drop | 0:标准, 1:次级, 2:高级 |
| stocknum | 可用量 | number | 可用库存 |
| num | 下单量 | number | 下单数量 |
| numex | 结算量 | number | 结算数量 |
| replaceNumEx | 代打数量 | number | 代打印数量 |
| distributionnum | 配货量 | number | 已配货数量 |
| costprice | 进价 | number | 采购单价 |
| dr | 折扣 | number | 折扣率 |
| cursaleprice | 原价 | number | 原销售价 |
| baseprice | 单价 | number | 销售单价 |
| saleprice | 结算单价 | number | 结算单价 |
| money | 金额 | number | 行金额 |
| TotalWeight | 重量 | number | 总重量 |
| DisTotal | 应配量 | number | 应配数量 |
| note | 备注 | text | 备注 |
| customerprocudecode | 客商编码 | text | 供应商商品编码 |
| customerOrderId | 客商单号 | text | 供应商单号 |
| catename | 分类 | text | 商品分类 |

**工具栏按钮:**
- F8 收款

**操作功能:**
- 新增
- 删除
- 编辑
- 审核
- 反审核
- 收款
- 修改送货日期（双击送货日单元格）

---

### 2.3 销售退货单 (saleReturn)

**单据类型:** billType = 4

**API路径:**
- 列表: `/masterApi/disApi/sales/saleReturn/BillList/`
- 详情: `/masterApi/disApi/sales/saleReturn/BillDetail/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| billnumber | 单号 | text | 退货单号 |
| accountBookCode | 账套 | drop | 账套选择 |
| orderbillnumber | 订单号 | text | 原订单号 |
| CustomerOrderId | 客户单号 | text | 客户单号 |
| Pcode | 项目名称 | drop | 项目选择 |
| customercode | 客户 | drop | 客户选择 |
| SettlementType | 结算方式 | drop | 结算方式 |
| AccountDay | 帐期 | number | 账期天数 |
| SalesMan | 业务 | drop | 业务员 |
| DriverCode | 司机 | drop | 司机 |
| deliveryAt | 送货日 | datetime | 送货日期 |
| ExamineUserCode | 审核 | drop | 审核人 |
| ExamineAt | 审核日 | datetime | 审核日期 |
| costMoney | 成本金额 | number | 成本金额 |
| saleMoney | 销售金额 | number | 退款金额 |
| profit | 毛利 | number | 毛利 |
| type | 类型 | drop | 0:后台, 1:自助, 2:拆单 |
| status | 状态 | drop | 0:待送货, 1:待收款, 2:完成 |
| note | 备注 | text | 备注信息 |

**明细表字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| productcode | 货号 | number | 商品货号 |
| barcode | 条码 | text | 商品条码 |
| name | 品名 | text | 商品名称 |
| spec | 规格 | text | 规格型号 |
| downwg | 个重 | number | 单个重量 |
| unit | 单位 | text | 计量单位 |
| num | 下单量 | number | 原下单数量 |
| numex | 结算量 | number | 退货数量(负数) |
| saleprice | 单价 | number | 销售单价 |
| money | 金额 | number | 退货金额 |
| note | 备注 | text | 备注 |

---

### 2.4 销售换货单 (saleChange)

**单据类型:** billType = 11

**API路径:** `/masterApi/disApi/sales/saleChange/`

**列表页字段:** 与销售退货单类似

---

### 2.5 销售拆分单 (saleSplit)

**单据类型:** billType = 12

**API路径:** `/masterApi/disApi/sales/saleSplit/`

---

### 2.6 销售入帐 (saleEntry)

**单据类型:** billType = 13

**API路径:** `/masterApi/disApi/sales/saleEntry/`

---

### 2.7 销售代打 (saleReplace)

**单据类型:** billType = 14

**API路径:** `/masterApi/disApi/sales/saleReplace/`

---

### 2.8 报价单 (quotedPrice)

**单据类型:** billType = 302

**API路径:** `/masterApi/disApi/sales/quotedPrice/`

---

### 2.9 项目管理 (project)

**API路径:** `/masterApi/disApi/sales/project/`

---

### 2.10 客户管理 (customer)

**API路径:** `/masterApi/disApi/sales/customer/`

---

### 2.11 销售报表 (reports)

| 模块 | API路径 |
|------|---------|
| 销售报表 | /masterApi/disApi/sales/reports/saleReports/ |
| 销售对账 | /masterApi/disApi/sales/reports/saleCheck/ |
| 订货报表 | /masterApi/disApi/sales/reports/saleOrderReports/ |
| 发票报表 | /masterApi/disApi/sales/reports/invoiceReport/ |

---

## 三、采购管理模块 (purchaseViews)

### 3.1 采购订货单 (purchaseOrder)

**单据类型:** billType = 16

**API路径:**
- 列表: `/masterApi/disApi/purchases/purchaseOrder/BillList/`
- 详情: `/masterApi/disApi/purchases/purchaseOrder/BillDetail/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| billnumber | 单号 | text | 订货单号 |
| shippercode | 货商 | drop | 供货商选择 |
| deliveryAt | 送货日 | datetime | 送货日期 |
| MakingUserCode | 采购员 | drop | 采购员 |
| ExamineUserCode | 审核 | drop | 审核人 |
| MakingAt | 制单日 | datetime | 制单日期 |
| ExamineAt | 审核日 | datetime | 审核日期 |
| costMoney | 订货金额 | number | 金额(0.00) |
| status | 状态 | drop | 0:未生效, 1:待接单, 2:待送货, 3:完成 |
| note | 备注 | text | 备注信息 |

**明细表字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| productcode | 货号 | number | 商品货号 |
| barcode | 条码 | text | 商品条码 |
| name | 品名 | text | 商品名称 |
| spec | 规格 | text | 规格型号 |
| downwg | 换子 | number | 换算因子(0.00) |
| unit | 单位 | text | 计量单位 |
| QualityGrade | 质量 | drop | 0:标准, 1:次级, 2:高级 |
| stocknum | 可用 | number | 可用库存(0.00) |
| num | 下单量 | number | 订购数量(0.00) |
| numex | 结算量 | number | 结算数量(0.00) |
| costprice | 单价 | number | 采购单价(0.0000) |
| money | 金额 | number | 行金额(0.00) |
| note | 备注 | text | 备注 |

**工具栏功能:**
- 双击货号: 转供应商
- 双击其他列: 查看商品去向明细

---

### 3.2 采购收货单 (purchase)

**单据类型:** billType = 0

**API路径:**
- 列表: `/masterApi/disApi/purchases/purchase/BillList/`
- 详情: `/masterApi/disApi/purchases/purchase/BillDetail/`

**列表页字段:** 与采购订货单类似

---

### 3.3 采购入库单 (purchaseEntry)

**单据类型:** billType = 1

**API路径:** `/masterApi/disApi/purchases/purchaseEntry/`

---

### 3.4 采购退货单 (purchaseReturn)

**单据类型:** billType = 1

**API路径:** `/masterApi/disApi/purchases/purchaseReturn/`

---

### 3.5 采购换货单 (purchaseExChange)

**单据类型:** billType = 2

**API路径:** `/masterApi/disApi/purchases/purchaseExChange/`

---

### 3.6 供货商管理 (shipper)

**API路径:** `/masterApi/disApi/purchases/shipper/`

**列表页字段:**
| 字段名 | 标题 | 类型 | 说明 |
|--------|------|------|------|
| idcode | 编码 | number | 供货商编码 |
| shortname | 简称 | text | 供货商简称 |
| name | 名称 | text | 供货商全称 |
| tel | 电话 | text | 联系电话 |
| person | 联系人 | text | 联系人 |
| addr | 地址 | text | 供货商地址 |
| settlementtype | 结算方式 | drop | 结算方式 |
| accountday | 账期 | number | 账期天数 |
| note | 备注 | text | 备注信息 |

---

### 3.7 订货汇总 (purchaseOrderGroup)

**API路径:** `/masterApi/disApi/purchases/purchaseOrderGroup/`

---

### 3.8 供货商订货汇总 (downOrderGroup)

**API路径:** `/masterApi/disApi/purchases/downOrderGroup/`

---

### 3.9 采购报表 (reports)

| 模块 | API路径 |
|------|---------|
| 采购收货报表 | /masterApi/disApi/purchases/reports/purchaseReports/ |
| 采购订货报表 | /masterApi/disApi/purchases/reports/purchaseOrderReports/ |
| 采购对账 | /masterApi/disApi/purchases/reports/purchaseCheck/ |
| 进货报表 | /masterApi/disApi/purchases/reports/invoiceInReport/ |

---

## 四、库存管理模块 (stockViews)

### 4.1 库存查询 (stocks/)

库存查询模块包含4个子模块：

| 子模块 | 功能说明 |
|--------|----------|
| stock/ | 库存查询 |
| mstock/ | 月库存 |
| qstock/ | 季度库存 |
| stockHistory/ | 历史库存 |

### 4.2 柜组调拨 (stockAreaSwap)

**单据类型:** billType = 7
**单据前缀:** AS

**功能说明:** 同一分店不同柜组之间的商品调拨

### 4.3 库存变更 (stockChange)

**单据类型:** billType = 6
**单据前缀:** SC

**功能说明:** 库存数量调整，包含盘盈盘亏处理

### 4.4 商品领用 (stockReceive)

**单据类型:** billType = 8
**单据前缀:** SR

**功能说明:** 员工领用商品出库

### 4.5 分店调拨 (stockSwap)

**单据类型:** billType = 9
**单据前缀:** SS

**功能说明:** 不同分店之间的商品调拨

### 4.6 库存拆分 (stockSplit)

**单据类型:** billType = 10
**单据前缀:** SB

**功能说明:** 商品拆零处理

### 4.7 库存报表 (reports/)

| 子模块 | 功能说明 |
|--------|----------|
| stockAreaSwapReport/ | 柜组调拨报表 |
| stockChangeReport/ | 库存变更报表 |
| stockReceiveReport/ | 商品领用报表 |
| stockSwapReport/ | 分店调拨报表 |

---

## 五、报表分析模块 (reportsViews)

### 5.1 分析报表 (AnalysisReports)

| 模块 | 功能说明 |
|------|----------|
| AbcReport/ | ABC分类报表 - 商品ABC分类统计 |
| InOutRateReport/ | 销进比报表 - 销售与采购比例分析 |
| MonMReport/ | 月均毛利报表 - 月度毛利趋势 |
| SaleTrendReport/ | 销售趋势报表 - 销售趋势分析 |
| UnSaleReport/ | 四周滞销报表 - 滞销商品统计 |
| WeekReport/ | 四周销量报表 - 近4周销量统计 |
| WtRateReport/ | 周转率报表 - 库存周转率 |
| YonYReport/ | 同比报表 - 年度同比分析 |

### 5.2 出入库报表 (InoutReports)

| 子模块 | 功能说明 |
|--------|----------|
| ProductHistory/ | 商品历史 |
| ProductInOutReport/ | 商品出入库报表 |

### 5.3 销售报表 (saleReports)

| 子模块 | 功能说明 |
|--------|----------|
| CateSaleReport/ | 分类销售报表 |
| CustomerSaleReport/ | 客户销售报表 |
| DriverSaleReport/ | 司机销售报表 |
| ProductSaleReport/ | 商品销售报表 |
| SalesManSaleReport/ | 业务员销售报表 |
| TotalSaleReport/ | 销售汇总报表 |

---

## 六、财务管理模块 (financeViews)

### 6.1 应收账款 (receivable)

**API路径:** `/masterApi/disApi/finance/receivable/`

**功能说明:** 管理客户应收账款，支持按单结算和按月汇总

### 6.2 应付账款 (payable)

**API路径:** `/masterApi/disApi/finance/payable/`

**功能说明:** 管理供货商应付账款，支持按单结算和按月汇总

### 6.3 财务报表 (reports/)

| 子模块 | 功能说明 |
|--------|----------|
| AccountsReports/ | 账户报表 |
| moneyReports/ | 资金报表 |
| payReports/ | 付款报表 |
| recReports/ | 收款报表 |

---

## 七、配送管理模块 (disViews)

### 7.1 模块说明

| 子模块 | 功能说明 |
|--------|----------|
| disAction/ | 配送业务逻辑 |
| disPrint/ | 打印管理 |
| disReport/ | 配送报表 |

---

## 八、系统设置模块 (systemViews)

### 8.1 系统参数 (sysParams)

**API路径:** `/masterApi/disApi/Sys/SysParams/`

**功能特点:** 系统核心参数配置，影响整个系统行为

**参数配置项:**

| 参数 | 说明 |
|------|------|
| exceedtimetoday | 超过此时间送货日期加1 |
| startordertime | 客户下单开始时段 |
| endordertime | 客户下单结束时段 |
| msgacceptwxcode | 订单信息接收人OpenCode |
| goeasyappkey | GoEasy推送APPKEY |
| grouptoexpandday | 扩展日（汇总日向前推X日） |
| inpricestyle | 成本格式（小数位） |
| outpricestyle | 售价格式（小数位） |
| pagerecord | 分页行数 |
| minretainday | 最小保留天数 |
| discardweight | 舍去重量 |
| purchasegridprintcol | 采购汇总打印栏数(2,3) |
| downgroupprintcolumns | 下单汇总打印栏数(1,2) |
| downgroupprintfontsize | 下单汇总打印字体 |
| disprintcolumns | 配货表打印栏数(1,2) |
| disprintfontsize | 配货表打印字体 |
| withinshippercode | 内部货商编码 |
| acceptusercode | 默认下单用户 |
| lableprintname | 标签机名称 |
| mainbookname | 主账套名称 |
| subbookname | 子账套名称 |

**复选框配置:**

| 参数 | 说明 |
|------|------|
| mainsendtosub | 账套间传送数据 |
| lastprice | 取最后销售单价 |
| purchasestoplustype | 采购收货祥细模式 |
| importstock | 导入可用量 |
| costpriceinpurchare | 成本计算以当日进货为准 |
| notavglose | 每日损耗不平摊 |
| allowedexceedstock | 允许负库存 |
| outmustdis | 出库要配货 |
| afterdisallowedaddproduct | 配货后允许加单 |
| disshowfrom | 配货表显示来源 |
| allowedoutordernum | 下单量可超订量 |
| shipperaddNumnottransferstock | 货商加量不转存 |
| enabledweighing | 启用电子称 |
| customerfromquotedprice | 取报价商品 |
| updatesaleallowedchangeprice | 报价时更新未审送货价格 |
| autoentry | 收货自动入帐 |
| saleautoentry | 销售自动入帐 |
| numiszeronotallowprint | 数量或单价为0不可打印 |
| updatesaleordertopurchaseorder | 自动分流 |
| enablemanyshipper | 启用多货商分流 |
| pushbackcheckstock | 回推清点存货 |
| groupbybigcate | 分类汇总输出以大类为准 |
| units | 智能匹配使用的单位 |

---

### 8.2 微信参数 (WxSysParams)

**API路径:** `/masterApi/disApi/Sys/WxSysParams/`

**功能特点:** 小程序和支付配置

**配置分组:**

| 分组 | 字段 | 说明 |
|------|------|------|
| 基本信息 | mchname | 公司名称 |
| | mchtel | 联系电话 |
| | mchaddr | 公司地址 |
| | noticetext | 公告 |
| 小程序配置 | appid | 小程序APPID |
| | appsecret | 小程序APPSECRET |
| 支付配置 | allowpay | 启用在线支付 |
| | pay_mchid | 商户号 |
| | pay_key | 支付密钥 |
| | pay_cert_path | 证书路径 |
| | pay_notify_url | 回调路径 |
| 图片上传 | logopic | 公司Logo(110*110) |
| | serviceqrsrc | 客服二维码 |
| | adpicurl | 轮播图(750*250,最多4张) |
| | certificatepic | 公司资质(最多20张) |

---

### 8.3 数据处理 (dataHandle)

**API路径:** `/masterApi/disApi/sys/DataHandle/`

**功能特点:** 危险操作，需要管理员密码验证+短信验证码

**操作功能:**

| 操作 | 说明 | 验证要求 |
|------|------|----------|
| 删除汇总 | 删除指定日期范围的汇总数据 | 管理员密码+短信验证码 |
| 开业清库 | 删除所有业务数据（基本资料除外） | 管理员密码+短信验证码+二次确认 |
| 初始化数据 | 删除所有业务数据（包括基本资料） | 管理员密码+短信验证码+二次确认 |

**安全机制:**
- 需要管理员密码（用户编码1的pwd字段，MD5加密）
- 需要短信验证码（发送到注册手机号）
- 危险操作需要二次确认

---

### 8.4 汇总计算 (dataGroup)

**功能特点:** 手动触发数据汇总计算

**弹窗形式操作:**
- 汇总日期范围选择
- 汇总计算执行

---

## 附录

### A. 单据类型对照表

| billType | 单据名称 |
|----------|----------|
| 0 | 采购收货单 |
| 1 | 采购入库单/退货单 |
| 2 | 采购换货单 |
| 3 | 销售送货单 |
| 4 | 销售退货单 |
| 6 | 库存变更单 |
| 7 | 柜组调拨单 |
| 8 | 商品领用单 |
| 9 | 分店调拨单 |
| 10 | 库存拆分单 |
| 11 | 销售换货单 |
| 12 | 销售拆分单 |
| 13 | 销售入库单 |
| 14 | 销售替代单 |
| 16 | 采购订货单 |
| 17 | 客户订货单 |
| 302 | 报价单 |
| 333 | 外销单 |

### B. 库存单据前缀对照表

| 前缀 | 单据名称 |
|------|----------|
| SC | 库存变更单 |
| AS | 柜组调拨单 |
| SR | 商品领用单 |
| SS | 分店调拨单 |
| SB | 库存拆分单 |
| Ck | 盘点单 |
| SP | 库存拆分单 |

### C. 状态值对照表

| 单据 | 状态值 | 含义 |
|------|--------|------|
| 订货单 | 0 | 未生效 |
| 订货单 | 1 | 待接单/待送货 |
| 订货单 | 2 | 完成 |
| 订货单 | 3 | 完成(采购) |
| 送货单 | 0 | 待送货 |
| 送货单 | 1 | 待收款 |
| 送货单 | 2 | 完成 |

### D. 质量等级

| 值 | 含义 |
|----|------|
| 0 | 标准 |
| 1 | 次级 |
| 2 | 高级 |

### E. 用户状态

| 值 | 含义 |
|----|------|
| 0 | 在职 |
| 1 | 离职 |

### F. 商品销售类型

| 值 | 含义 |
|----|------|
| 0 | 称重 |
| 1 | 按量 |
| 2 | 称重+按量 |
| 3 | 散+件 |

---

**文档版本:** V2.0
**生成日期:** 2026-05-17
**数据来源:** 项目实际代码全面扫描
