/****** Object:  StoredProcedure [dbo].[sp_PurchaseOrderToPurchase]    Script Date: 2026-03-29 20:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_PurchaseOrderToPurchase]
    @BillNumber VARCHAR(20),
    @UserCode INT
AS
/*
***************************************************
    功能：采购订单转至采购入库单
    参数：
        @BillNumber VARCHAR(20)  - 订单号
        @UserCode INT          - 操作员
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @tempBillNumber VARCHAR(20)
DECLARE @thisBillNumber VARCHAR(20)
DECLARE @ShipperCode BIGINT
DECLARE @mchCode VARCHAR(20)
DECLARE @DeliveryAt DATE
DECLARE @MakingUserCode INT
DECLARE @maxKey INT

-- 获取采购订单信息
SELECT @ShipperCode = ShipperCode,
       @MakingUserCode = MakingUserCode,
       @mchCode = mchCode,
       @DeliveryAt = DeliveryAt
FROM L_Bill_PurchaseOrder_Tab
WHERE BillNumber = @BillNumber

-- 生成入库单号
SELECT @tempBillNumber = ISNULL(MAX(CAST(SUBSTRING(billnumber, 11, 4) AS INT)), 0) + 1
FROM L_Bill_Purchase_Tab
WHERE CONVERT(CHAR(10), makingAt, 120) = CONVERT(CHAR(10), GETDATE(), 120)

SET @thisBillNumber = 'RK' + RIGHT(CONVERT(VARCHAR(20), GETDATE(), 112), 8) + dbo.SetNBit(@tempBillNumber, '0', 4)

-- 插入采购入库单主表
INSERT INTO L_Bill_Purchase_Tab
(
    BillNumber,
    mchCode,
    OrderBillNumber,
    ShipperCode,
    MakingUserCode,
    MakingAt,
    ExamineuserCode,
    ExamineAt,
    DeliveryAt,
    billType,
    Type,
    Status
)
VALUES
(
    @thisBillNumber,
    @mchCode,
    @BillNumber,
    @ShipperCode,
    @MakingUserCode,
    GETDATE(),
    0,
    GETDATE(),
    @DeliveryAt,
    0,
    1,
    0
)

-- 获取当前最大ID后四位
SELECT @maxKey = ISNULL(MAX(RIGHT(idkey, 4)), 0)
FROM L_Bill_Purchases_Tab
WHERE billnumber = @thisBillNumber

-- 插入采购入库单明细表
INSERT INTO L_Bill_Purchases_Tab
(
    IdKey,
    BillNumber,
    mchCode,
    AreaCode,
    ShipperCode,
    ProductCode,
    DownUnit,
    DownWg,
    SaleType,
    OrderNum,
    OpenNum,
    Num,
    NumEx,
    OpenCostPrice,
    CostPrice,
    salePrice,
    ExamineUserCode,
    At,
    DeliveryAt,
    BatchNumber,
    qualityGrade,
    Status
)
SELECT
    @thisBillNumber + '-' + dbo.SetNBit(CAST(@maxKey + ROW_NUMBER() OVER (ORDER BY IdKey) AS VARCHAR(10)), '0', 4),
    @thisBillNumber,
    @mchCode,
    areaCode,
    @ShipperCode,
    ProductCode,
    DownUnit,
    DownWg,
    SaleType,
    num AS OrderNum,
    NumEx,
    Num,
    NumEx,
    Costprice,
    Costprice,
    salePrice,
    0,
    GETDATE(),
    @DeliveryAt,
    BatchNumber,
    qualityGrade,
    0
FROM V_Bill_PurchaseOrders_Tab
WHERE Billnumber = @BillNumber

-- 更新销售订单中的采购入库单号
UPDATE L_Bill_PurchaseOrder_Tab
SET PurchaseBillNumber = @thisBillNumber
WHERE BillNumber = @BillNumber

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO
