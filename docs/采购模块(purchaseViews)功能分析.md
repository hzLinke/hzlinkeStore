# 采购模块 (purchaseViews) 功能详细分析

## 目录结构总览

```
purchaseViews/
├── downOrderGroup/         # 供货商订货汇总
├── purchase/              # 采购收货管理
├── purchaseEntry/         # 采购入库管理
├── purchaseExChange/      # 采购换货管理
├── purchaseOrder/         # 采购订货管理
├── purchaseOrderGroup/    # 客户订货汇总
│   └── acceptWin/         # 接单确认子组件
├── purchaseReturn/        # 采购退货管理
├── shipper/               # 供货商管理
├── reports/               # 采购报表
│   ├── invoiceInReport/   # 进货报表
│   ├── purchaseCheck/     # 采购对账报表
│   ├── purchaseOrderReports/  # 采购订货报表
│   └── purchaseReports/   # 采购收货报表
├── PurchaseAction.ts      # 采购基础Action类
└── types.ts              # 类型定义
```

---

## 一、采购单据业务流程总图

```
┌─────────────────────────────────────────────────────────────────┐
│                        采购管理全流程                             │
└─────────────────────────────────────────────────────────────────┘

客户订货 (saleOrder)
        │
        ▼
┌───────────────────────┐
│  客户订货汇总          │
│ purchaseOrderGroup    │
│ (合并下单/单品下单)    │
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│  采购订货单            │
│ purchaseOrder (RD)    │
│ (转供货商)             │
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│  供货商订货汇总        │
│ downOrderGroup        │
│ (发布/取消订单)        │
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│  采购收货单            │
│ purchase (RK)         │
│ (审核/清空)            │
└───────────────────────┘
        │
        ▼
┌───────────────────────┐
│  采购入库单            │
│ purchaseEntry         │
│ (付款/入账)           │
└───────────────────────┘
        │
        ├─────────────────┐
        ▼                 ▼
┌───────────────┐ ┌───────────────┐
│  采购退货单    │ │  采购换货单    │
│ purchaseReturn│ │ purchaseExChange
│    (RT)       │ │    (CH)       │
└───────────────┘ └───────────────┘
```

---

## 二、基础资料

### 2.1 供货商管理 (shipper)

**路径**: `purchaseViews/shipper/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | 无 |
| billType | 无 |

#### 功能说明
- 管理供货商基本信息
- 维护供货商商品报价
- 支持报价复制、调入、清空

#### 核心字段

| 字段 | 类型 | 说明 |
|-----|------|-----|
| ShipperCode | string | 供货商编码 |
| ShipperName | string | 供货商名称 |
| ShortName | string | 简称 |
| Contact | string | 联系人 |
| Phone | string | 联系电话 |
| Address | string | 地址 |
| SettlementType | string | 结算方式 |
| StartMoney | decimal | 期初欠款 |
| Remark | string | 备注 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/shipper/shipperList/` |
| 明细 | `/masterApi/disApi/purchase/shipper/shipperDetail/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 新增 | 添加新供货商 |
| 修改 | 编辑供货商信息 |
| 删除 | 删除供货商 |
| 报价明细 | 进入报价管理页面 |
| 调入商品 | 从商品库导入商品 |
| 复制报价 | 从其他供货商复制报价 |

#### 业务流程
```
供货商列表 → 报价明细
    ↓
调入商品 / 复制报价
    ↓
录入/修改商品单价
    ↓
保存报价
```

---

## 三、采购单据管理

### 3.1 采购订货单 (purchaseOrder)

**路径**: `purchaseViews/purchaseOrder/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | RD |
| billType | 16 |

#### 功能说明
- 管理采购订货单
- 支持转供货商功能
- 支持查看商品去向明细
- 支持审核操作

#### 核心字段

| 字段 | 类型 | 说明 |
|-----|------|-----|
| BillCode | string | 单据编号 |
| BillDate | date | 单据日期 |
| ShipperCode | string | 供货商编码 |
| ShipperName | string | 供货商名称 |
| TotalMoney | decimal | 单据金额 |
| BillStatus | int | 单据状态 |
| MrUserCode | int | 审核人 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/purchaseOrder/BillList/` |
| 明细 | `/masterApi/disApi/purchase/purchaseOrder/BillDetail/` |

#### 明细字段
| 字段 | 说明 |
|-----|------|
| ProductCode | 商品编码 |
| ProductName | 商品名称 |
| Unit | 单位 |
| BillCount | 订货数量 |
| Price | 单价 |
| TotalMoney | 金额 |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 新增 | 创建采购订货单 |
| 修改 | 编辑订单 |
| 删除 | 删除订单 |
| 审核 | 审核单据 |
| 反签 | 取消审核 |
| 转供货商 | 将商品转到其他供货商 |
| 查看去向 | 查看商品去向明细 |
| 打印 | 打印单据 |

#### 业务流程
```
新增订货单 → 选择供货商 → 添加商品
    ↓
录入数量、单价 → 保存
    ↓
审核 → 生成待发货记录
    ↓
转供货商 / 查看去向
```

---

### 3.2 客户订货汇总 (purchaseOrderGroup)

**路径**: `purchaseViews/purchaseOrderGroup/`

#### 功能说明
- 汇总当日所有客户订货
- 按分类展示商品欠数
- 支持合并下单、单品下单、换货、取消等操作
- 智能分配供货商

#### 核心逻辑
```typescript
// 调用存储过程获取订货汇总
sp_build_PurchaseGroup({
    DeliveryAt: date,      // 送货日期
    CateCode: string,      // 分类编码
    PostCode: number       // 岗位编码
})
```

#### 数据源和API
| 类型 | API |
|-----|-----|
| 汇总数据 | `/masterApi/disApi/purchase/PurchaseOrderGroup/` |
| 打印 | `/masterApi/disApi/purchase/purchasePrint/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 刷新 | 刷新订货汇总 |
| 全选 | 选中所有商品 |
| 下单 | 单品下单到供货商 |
| 合并下单 | 将同类商品合并给同一供货商 |
| 换货 | 标记为换货商品 |
| 取消 | 取消订货 |
| 打印 | 打印订货单 |

#### 子组件 - acceptWin (接单确认)
```
弹窗内容：
┌─────────────────────────────────────┐
│ 接单确认                              │
├─────────────────────────────────────┤
│ 供货商: [下拉选择]                    │
│ 下单数量: [自动计算]                  │
│ 成交单价: [手动录入]                  │
│ 结算方式: [下拉选择]                  │
│                                     │
│ ☑ 免采（不生成采购单）                │
│                                     │
│        [取消]  [确认]                 │
└─────────────────────────────────────┘
```

#### 业务流程
```
选择送货日期 → 加载订货汇总
    ↓
按分类显示商品欠数
    ↓
选择商品 → 指定供货商
    ↓
点击「下单」或「合并下单」
    ↓
弹出接单确认窗口
    ↓
确认后生成采购订货单
```

---

### 3.3 供货商订货汇总 (downOrderGroup)

**路径**: `purchaseViews/downOrderGroup/`

#### 功能说明
- 按送货日期汇总客户订货商品
- 分配给供货商
- 支持订单发布与取消发布
- 支持供货商之间的商品转移

#### 核心逻辑
```typescript
// 获取供货商订货汇总
sp_build_DownGroup({
    DeliveryAt: date,      // 送货日期
    ShipperCode: string,    // 供货商编码
    CateCode: string        // 分类编码
})
```

#### 数据源和API
| 类型 | API |
|-----|-----|
| 汇总数据 | `/masterApi/disApi/purchase/downOrderGroup/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 发布订单 | 将订单发送给供货商 |
| 取消发布 | 取消已发布的订单 |
| 转供货商 | 将商品转到其他供货商 |
| 查看明细 | 双击查看商品明细 |

#### 业务流程
```
选择送货日期 → 加载汇总数据
    ↓
按供货商分组显示
    ↓
双击商品 → 查看明细 / 转供货商
    ↓
点击「发布订单」→ 发送订单给供货商
```

---

### 3.4 采购收货单 (purchase)

**路径**: `purchaseViews/purchase/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | RK |
| billType | - |

#### 功能说明
- 管理采购收货单（待收货状态：MrUserCode=0）
- 支持采购单的录入、修改、删除
- 支持付款、清空收货单等操作

#### 核心字段

| 字段 | 类型 | 说明 |
|-----|------|-----|
| BillCode | string | 单据编号 |
| BillDate | date | 单据日期 |
| ShipperCode | string | 供货商编码 |
| ShipperName | string | 供货商名称 |
| TotalMoney | decimal | 单据金额 |
| PayMoney | decimal | 已付金额 |
| MrUserCode | int | 收货人 |
| BillStatus | int | 单据状态 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/purchase/BillList/` |
| 明细 | `/masterApi/disApi/purchase/purchase/BillDetail/` |
| 打包明细 | `/masterApi/disApi/purchase/purchaseEntry/PackDetail/` |

#### 明细字段
| 字段 | 说明 |
|-----|------|
| ProductCode | 商品编码 |
| BarCode | 商品条码 |
| ProductName | 商品名称 |
| Unit | 单位 |
| BillCount | 订货数量 |
| InCount | 收货数量 |
| Price | 单价 |
| TotalMoney | 金额 |
| BatchNo | 批次号 |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 新增 | 创建收货单 |
| 修改 | 编辑收货单 |
| 删除 | 删除收货单 |
| 审核 | 审核单据 |
| 反签 | 取消审核 |
| 清空 | 清空收货单 |
| 付款 | 进行付款操作 |
| 打印 | 打印单据 |

#### 业务流程
```
列表显示 (MrUserCode=0 待收货)
    ↓
双击打开明细
    ↓
修改收货数量
    ↓
审核 → MrUserCode 赋值
    ↓
进入采购入库单
```

---

### 3.5 采购入库单 (purchaseEntry)

**路径**: `purchaseViews/purchaseEntry/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | RK |
| billType | - |

#### 功能说明
- 管理已收货的采购入库单（MrUserCode≠0）
- 支持查看打包明细
- 支持付款操作

#### 核心逻辑
```typescript
// 默认过滤条件
defaultConditions = {
    MrUserCode: '<>0'  // 已收货
}
```

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/purchaseEntry/BillList/` |
| 明细 | `/masterApi/disApi/purchase/purchaseEntry/BillDetail/` |
| 打包明细 | `/masterApi/disApi/purchase/purchaseEntry/PackDetail/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 查看明细 | 查看入库明细 |
| 展开打包明细 | 展开显示打包详情 |
| 入账 | 确认入库 |
| 付款 | 进行付款 |
| 打印 | 打印单据 |

#### 业务流程
```
采购收货单审核后
    ↓
进入采购入库单
    ↓
查看入库明细
    ↓
展开打包明细 → 查看包装详情
    ↓
入账确认 → 完成采购入库
```

---

### 3.6 采购退货单 (purchaseReturn)

**路径**: `purchaseViews/purchaseReturn/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | RT |
| billType | 1 |

#### 功能说明
- 管理采购退货单
- 支持退货商品录入
- 支持审核和付款

#### 核心字段
| 字段 | 类型 | 说明 |
|-----|------|-----|
| BillCode | string | 单据编号 |
| BillDate | date | 单据日期 |
| ShipperCode | string | 供货商编码 |
| ShipperName | string | 供货商名称 |
| TotalMoney | decimal | 退货金额 |

#### 业务规则
- 退货数量为**负数**
- 从库存中扣减退货数量
- 生成应付账款

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/purchaseReturn/BillList/` |
| 明细 | `/masterApi/disApi/purchase/purchaseReturn/BillDetail/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 新增 | 创建退货单 |
| 修改 | 编辑退货单 |
| 删除 | 删除退货单 |
| 审核 | 审核单据 |
| 付款 | 进行付款 |
| 打印 | 打印单据 |

#### 业务流程
```
新增退货单 → 选择供货商
    ↓
选择退货商品
    ↓
录入退货数量（负数）
    ↓
保存 → 审核
    ↓
付款 → 完成退货
```

---

### 3.7 采购换货单 (purchaseExChange)

**路径**: `purchaseViews/purchaseExChange/`

| 属性 | 说明 |
|-----|------|
| 单据前缀 | CH |
| billType | 2 |

#### 功能说明
- 管理采购换货单
- 支持换货商品的录入和审核
- 支持结算方式选择

#### 核心字段
| 字段 | 类型 | 说明 |
|-----|------|-----|
| BillCode | string | 单据编号 |
| BillDate | date | 单据日期 |
| ShipperCode | string | 供货商编码 |
| ShipperName | string | 供货商名称 |
| SettlementType | string | 结算方式 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 列表 | `/masterApi/disApi/purchase/purchaseExChange/BillList/` |
| 明细 | `/masterApi/disApi/purchase/purchaseExChange/BillDetail/` |

#### 明细字段
| 字段 | 说明 |
|-----|------|-----|
| ProductCode | 商品编码 |
| ProductName | 商品名称 |
| Unit | 单位 |
| BillCount | 换货数量 |
| AvailableQty | 可用量 |
| Price | 单价 |
| TotalMoney | 金额 |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 新增 | 创建换货单 |
| 修改 | 编辑换货单 |
| 删除 | 删除换货单 |
| 审核 | 审核单据 |
| 打印 | 打印单据 |

#### 业务流程
```
新增换货单 → 选择供货商
    ↓
选择换出商品 → 录入换出数量
    ↓
选择换入商品 → 录入换入数量
    ↓
保存 → 审核
    ↓
完成换货
```

---

## 四、采购报表模块

### 4.1 报表总览

| 报表名称 | 路径 | 说明 |
|---------|------|------|
| 进货报表 | invoiceInReport | 按供货商统计进货 |
| 采购对账报表 | purchaseCheck | 日期+供货商对账 |
| 采购订货报表 | purchaseOrderReports | 订货明细统计 |
| 采购收货报表 | purchaseReports | 收货明细统计 |

---

### 4.2 进货报表 (invoiceInReport)

**路径**: `purchaseViews/reports/invoiceInReport/`

#### 功能说明
- 按供货商统计进货情况
- 支持日期范围筛选
- 显示分类小计和总计

#### 筛选条件
| 字段 | 类型 | 说明 |
|-----|------|-----|
| StartDate | date | 开始日期 |
| EndDate | date | 结束日期 |
| ShipperCode | string | 供货商编码 |
| CateCode | string | 分类编码 |

#### 统计字段
| 字段 | 说明 |
|-----|------|
| ShipperName | 供货商名称 |
| CateName | 分类名称 |
| TotalQty | 总数量 |
| TotalMoney | 总金额 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 报表构建 | `/masterApi/disApi/Purchase/reports/InvoiceReport/` |
| 数据 | `/masterApi/disApi/sales/reports/InvoiceReport/` |

#### 操作功能
| 按钮 | 功能 |
|-----|------|
| 构建报表 | 生成统计数据 |
| 导出Excel | 导出数据到Excel |

---

### 4.3 采购对账报表 (purchaseCheck)

**路径**: `purchaseViews/reports/purchaseCheck/`

#### 功能说明
- 按日期和供货商统计采购对账
- 显示单据明细和金额
- 支持金额大写转换

#### 筛选条件
| 字段 | 类型 | 说明 |
|-----|------|-----|
| StartDate | date | 开始日期 |
| EndDate | date | 结束日期 |
| ShipperCode | string | 供货商编码 |

#### 报表结构
```
┌─────────────────────────────────────────┐
│ 供货商: XXX                              │
│ 对账日期: 2024-01-01 至 2024-01-31       │
├─────────────────────────────────────────┤
│ 单据号    日期      金额      大写金额     │
├─────────────────────────────────────────┤
│ RK001    01-05    1,000.00  壹仟元整    │
│ RK002    01-10    2,500.00  贰仟伍佰元整 │
├─────────────────────────────────────────┤
│ 合计:    3,500.00  叁仟伍佰元整          │
└─────────────────────────────────────────┘
```

#### 数据源和API
| 类型 | API |
|-----|-----|
| 报表 | `/masterApi/disApi/purchase/reports/purchaseCheck/` |

---

### 4.4 采购订货报表 (purchaseOrderReports)

**路径**: `purchaseViews/reports/purchaseOrderReports/`

#### 功能说明
- 统计采购订货明细
- 按单号、供货商、分类等筛选
- 显示数量和金额汇总

#### 筛选条件
| 字段 | 类型 | 说明 |
|-----|------|-----|
| StartDate | date | 开始日期 |
| EndDate | date | 结束日期 |
| ShipperCode | string | 供货商编码 |
| BillCode | string | 单据编号 |
| CateCode | string | 分类编码 |

#### 统计字段
| 字段 | 说明 |
|-----|------|
| BillCode | 单据编号 |
| ShipperName | 供货商 |
| ProductName | 商品名称 |
| BillCount | 订货数量 |
| Price | 单价 |
| TotalMoney | 金额 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 报表 | `/masterApi/disApi/purchase/reports/purchaseOrderReports/` |

---

### 4.5 采购收货报表 (purchaseReports)

**路径**: `purchaseViews/reports/purchaseReports/`

#### 功能说明
- 统计采购收货明细
- 支持多种筛选条件
- 显示结算金额和实际金额

#### 筛选条件
| 字段 | 类型 | 说明 |
|-----|------|-----|
| StartDate | date | 开始日期 |
| EndDate | date | 结束日期 |
| ShipperCode | string | 供货商编码 |
| ProductCode | string | 商品编码 |

#### 统计字段
| 字段 | 说明 |
|-----|------|
| BillCode | 单据编号 |
| ShipperName | 供货商 |
| ProductName | 商品名称 |
| InCount | 收货数量 |
| Price | 单价 |
| TotalMoney | 结算金额 |
| ActualMoney | 实际金额 |

#### 数据源和API
| 类型 | API |
|-----|-----|
| 报表 | `/masterApi/disApi/purchase/reports/purchaseReports/` |

---

## 五、公共组件和依赖

### 5.1 Action基类

| 类名 | 文件 | 说明 |
|-----|------|------|
| TPurchasesListGridAction | PurchaseAction.ts | 采购单列表Action |
| TPurchasesDetailGridAction | PurchaseAction.ts | 采购单明细Action |

### 5.2 公共组件

| 组件名称 | 路径 | 功能 |
|---------|------|------|
| WinPackDetail | components/WinPackDetail/ | 商品去向明细弹窗 |
| WinTransferShipper | components/WinTransferShipper/ | 转供货商弹窗 |
| WinProductSelect | components/WinProductSelect/ | 商品选择弹窗 |
| WinChangeProduct | - | 换货参数弹窗 |
| WinBatchInSelect | - | 批次成本匹配弹窗 |

### 5.3 公共数据

| 数据名称 | 说明 |
|---------|------|
| ShipperDatas | 供货商数据 |
| UserDatas | 用户数据 |
| CustomerDatas | 客户数据 |
| CateDatas | 分类数据 |
| SettlementTypeDatas | 结算方式数据 |
| ProductDatas | 商品数据 |

---

## 六、单据编号规则

| 单据类型 | 前缀 | billType |
|---------|------|----------|
| 采购订货单 | RD | 16 |
| 采购收货单 | RK | - |
| 采购入库单 | RK | - |
| 采购退货单 | RT | 1 |
| 采购换货单 | CH | 2 |

---

## 七、API接口汇总

| 模块 | 接口路径 |
|-----|---------|
| 供货商 | `/masterApi/disApi/purchase/shipper/` |
| 订货汇总 | `/masterApi/disApi/purchase/PurchaseOrderGroup/` |
| 订货单 | `/masterApi/disApi/purchase/purchaseOrder/` |
| 收货单 | `/masterApi/disApi/purchase/purchase/` |
| 入库单 | `/masterApi/disApi/purchase/purchaseEntry/` |
| 退货单 | `/masterApi/disApi/purchase/purchaseReturn/` |
| 换货单 | `/masterApi/disApi/purchase/purchaseExChange/` |
| 报表 | `/masterApi/disApi/purchase/reports/` |

---

*文档生成时间: 2026-05-17*
