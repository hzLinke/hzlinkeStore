USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[Sp_CalcCostPrice_FromPurchase]    Script Date: 2026-04-07 23:40:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Sp_CalcCostPrice_FromPurchase] 
    @BillNumber VARCHAR(20),
    @UpdateType INT
AS
/**
    采购收货，退货审核时以当天相同产品计算平均单价，并更新当天的销售单成本价
    @BillNumber VARCHAR(20) 采购入库单
**/
SET NOCOUNT ON

DECLARE @DeliveryAt SMALLDATETIME
DECLARE @PurchaseOrderBillNumber VARCHAR(20)

SELECT 
    @DeliveryAt = DeliveryAt,
    @PurchaseOrderBillNumber = OrderBillNumber 
FROM L_Bill_Purchase_Tab 
WHERE BillNumber = @BillNumber

IF @UpdateType = 1
BEGIN
    UPDATE a 
    SET a.JumpUpdateTrigger = 1,
        a.CostPrice = b.costprice 
    FROM L_Bill_PurchaseOrders_Tab# a,
        (
            SELECT BatchNumber, costprice 
            FROM L_Bill_Purchases_Tab 
            WHERE billnumber = @BillNumber
        ) b 
    WHERE a.BatchNumber = b.BatchNumber
END

DECLARE @PurchaseTemp TABLE 
(
    SaleOrderIdkey VARCHAR(100),
    ProductCode VARCHAR(20),
    num DECIMAL(18, 2),
    numex DECIMAL(18, 2),
    CostPrice DECIMAL(18, 8),
    BatchNumber VARCHAR(100)
)

INSERT INTO @PurchaseTemp 
(
    SaleOrderIdkey,
    ProductCode,
    num,
    numex,
    CostPrice,
    BatchNumber
)
SELECT 
    SaleOrderIdkey,
    ProductCode,
    num,
    numex,
    CostPrice,
    BatchNumber
FROM L_Bill_PurchaseOrders_Tab#
WHERE DeliveryAt = @DeliveryAt 
    AND BillNumber = @PurchaseOrderBillNumber

IF @UpdateType = -1 
BEGIN
    UPDATE a 
    SET a.BatchNumber = '' 
    FROM L_Bill_Sales_Tab a,
        @PurchaseTemp b 
    WHERE a.OrderIdKey = b.SaleOrderIdkey

    DELETE L_Bill_Sales_Tabs 
    WHERE SaleIdkey IN 
    (
        SELECT a.Idkey 
        FROM L_Bill_Sales_Tab a,
            @PurchaseTemp b 
        WHERE a.OrderIdKey = b.SaleOrderIdkey
    )

    RETURN
END

UPDATE a 
SET a.BatchNumber = b.BatchNumberList,
    a.costprice = b.CostPrice,
    a.ActualCostPrice = b.CostPrice 
FROM L_Bill_Sales_Tab a,
(
    SELECT 
        SaleOrderIdkey,
        SUM(CostPrice * NumEx) / SUM(NumEx) AS CostPrice,
        STUFF
        (
            (
                SELECT ',' + BatchNumber 
                FROM @PurchaseTemp t2 
                WHERE t2.SaleOrderIdkey = t1.SaleOrderIdkey 
                FOR XML PATH('')
            ), 1, 1, ''
        ) AS BatchNumberList
    FROM @PurchaseTemp t1
    GROUP BY SaleOrderIdkey
) b 
WHERE a.OrderIdKey = b.SaleOrderIdkey

INSERT INTO L_Bill_Sales_Tabs 
(
    StoreCode,
    AreaCode,
    DeliveryAt,
    SaleIdkey,
    BillNumber,
    ProductCode,
    SaleType,
    BatchNumber,
    num,
    numEx,
    DoubleNumExBase,
    PackBase,
    costprice
)
SELECT 
    a.StoreCode,
    a.AreaCode,
    a.DeliveryAt,
    a.Idkey,
    a.billnumber,
    a.ProductCode,
    a.SaleType,
    b.BatchNumber,
    b.num,
    b.NumEx,
    a.DoubleNumExBase,
    a.PackBase,
    b.CostPrice
FROM L_Bill_Sales_Tab a,
    @PurchaseTemp b 
WHERE a.OrderIdKey = b.SaleOrderIdkey

UPDATE a 
SET a.costprice = b.avgPrice,
    a.ActualCostPrice = b.avgPrice 
FROM L_Bill_Sales_Tab a,
(
    SELECT 
        billNumber,
        SaleIdkey,
        SUM(NumEx * CostPrice) / SUM(NumEx) AS avgPrice 
    FROM L_Bill_Sales_Tabs 
    WHERE billNumber = @billNumber
    GROUP BY BillNumber, SaleIdkey
) b 
WHERE a.billnumber = b.BillNumber 
    AND a.Idkey = b.SaleIdkey

UPDATE a 
SET a.AvgCostPrice = b.AvgCostPrice 
FROM L_Basic_Product_Tab a,
(
    SELECT 
        ProductCode,
        SUM(numex * CostPrice) / SUM(Numex) AS AvgCostPrice 
    FROM V_Bill_Purchases_Tab 
    WHERE DeliveryAt = @DeliveryAt 
    GROUP BY ProductCode
) b 
WHERE a.IdCode = b.ProductCode

SET NOCOUNT OFF
GO
