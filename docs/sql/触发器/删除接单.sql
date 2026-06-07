USE [LinkeDisV4]
GO

/****** Object:  Trigger [dbo].[Shipper_DisDetail_Delete]    Script Date: 2026-04-07 22:53:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[Shipper_DisDetail_Delete] 
ON [dbo].[L_Bill_PurchaseOrders_Tab#] 
FOR DELETE
AS 

SET NOCOUNT ON

DECLARE @IdKey VARCHAR(20)
DECLARE @DeliveryAt DATE
DECLARE @BillNumber VARCHAR(20)
DECLARE @PurchaseBillNumber VARCHAR(20)
DECLARE @SaleOrderBillNumber VARCHAR(20)
DECLARE @SaleBillNumber VARCHAR(20)
DECLARE @SaleOrderIdKey VARCHAR(20)
DECLARE @ProductCode VARCHAR(20)
DECLARE @SaleType INT
DECLARE @NumEx DECIMAL(18,4)
DECLARE @Num DECIMAL(18,4)
DECLARE @ThisNumEx DECIMAL(18,4)
DECLARE @ThisNum DECIMAL(18,4)
DECLARE @AvgCostPrice DECIMAL(18,6)
DECLARE @IsFromSplit BIT
DECLARE @IsFree BIT
DECLARE @BatchNumber VARCHAR(50)

SELECT TOP 1 
    @IdKey = Idkey,
    @DeliveryAt = DeliveryAt,
    @ProductCode = ProductCode,
    @BillNumber = BillNumber,
    @SaleOrderBillNumber = SaleOrderBillNumber,
    @SaleOrderIdKey = SaleOrderIdkey,
    @SaleType = SaleType,
    @ThisNum = ISNULL(num, 0),
    @ThisNumEx = ISNULL(NumEx, 0),
    @IsFromSplit = IsFromSplit,
    @IsFree = CASE WHEN billNumber = 'free' THEN 1 ELSE 0 END,
    @BatchNumber = BatchNumber
FROM 
    deleted

IF @IsFromSplit = 1
BEGIN
    IF EXISTS
    (
        SELECT 1 
        FROM L_Bill_PurchaseOrders_Tab# 
        WHERE DeliveryAt = @DeliveryAt 
            AND ProductCode = @ProductCode 
            AND SaleType = @SaleType 
            AND customerCode = 0
    )
    BEGIN
        UPDATE L_Bill_PurchaseOrders_Tab# 
        SET Num = Num + @ThisNum, 
            NumEx = NumEx + @ThisNumEx 
        WHERE DeliveryAt = @DeliveryAt 
            AND ProductCode = @ProductCode 
            AND SaleType = @SaleType 
            AND customerCode = 0
    END
    ELSE
    BEGIN
        INSERT INTO L_Bill_PurchaseOrders_Tab#
        (
            Idkey, 
            BillNumber, 
            DeliveryAt, 
            CustomerCode, 
            ProductCode, 
            DownUnit, 
            DownWg, 
            SaleType, 
            num, 
            NumEx, 
            CostPrice, 
            SaleOrderBillNumber, 
            SaleOrderIdkey, 
            Note, 
            IsFromSplit
        ) 
        SELECT 
            @Idkey, 
            BillNumber, 
            DeliveryAt, 
            0, 
            ProductCode, 
            DownUnit, 
            DownWg, 
            SaleType, 
            ISNULL(Num, 0), 
            ISNULL(NumEx, 0), 
            CostPrice, 
            '', 
            '', 
            Note, 
            0 
        FROM deleted 
        WHERE Idkey = @IdKey
    END
END

SELECT @PurchaseBillNumber = PurchaseBillNumber 
FROM L_Bill_PurchaseOrder_Tab 
WHERE BillNumber = @BillNumber

SELECT @SaleBillNumber = DeliveryBillNumber 
FROM L_Bill_SaleOrder_Tab 
WHERE BillNumber = @SaleOrderBillNumber

SELECT 
    @NumEx = ISNULL(Sum(NumEx), 0),
    @Num = ISNULL(Sum(Num), 0),
    @AvgCostPrice = CASE 
        WHEN SUM(NumEx) > 0 THEN ISNULL(Sum(NumEx * CostPrice) / Sum(NumEx), 0) 
        ELSE 0 
    END 
FROM L_Bill_PurchaseOrders_Tab# 
WHERE BillNumber = @BillNumber 
    AND ProductCode = @ProductCode 
    AND SaleType = @SaleType 
    AND BatchNumber = @BatchNumber

UPDATE L_Bill_Purchases_Tab 
SET 
    numEx = @NumEx, 
    Num = @Num, 
    costprice = @AvgCostPrice 
WHERE billnumber = @PurchaseBillNumber 
    AND ProductCode = @ProductCode 
    AND SaleType = @SaleType 
    AND BatchNumber = @BatchNumber

UPDATE L_Bill_PurchaseOrders_Tab 
SET 
    numEx = @NumEx, 
    Num = @Num, 
    costprice = @AvgCostPrice 
WHERE billnumber = @BillNumber 
    AND ProductCode = @ProductCode 
    AND SaleType = @SaleType 
    AND BatchNumber = @BatchNumber

DELETE L_Bill_PurchaseOrders_Tab 
WHERE billnumber = @BillNumber 
    AND ProductCode = @ProductCode 
    AND SaleType = @SaleType 
    AND num = 0 
    AND BatchNumber = @BatchNumber

DELETE L_Bill_Purchases_Tab 
WHERE billnumber = @PurchaseBillNumber 
    AND ProductCode = @ProductCode 
    AND SaleType = @SaleType 
    AND num = 0 
    AND BatchNumber = @BatchNumber

IF @IsFree = 1 
BEGIN
    UPDATE L_Bill_SaleOrders_Tab 
    SET 
        FreeNum = FreeNum - @ThisNum / CASE 
            WHEN SaleType = 4 THEN 2 
            ELSE 1 
        END,
        FreeNumEx = FreeNumEx - @ThisNumEx / CASE 
            WHEN @SaleType = 3 THEN DownWg 
            ELSE CASE 
                WHEN SaleType = 4 THEN 2 
                ELSE 1 
            END 
        END,
        AcceptStatus = 0 
    WHERE Idkey = @SaleOrderIdKey
END 
ELSE 
BEGIN
    UPDATE L_Bill_SaleOrders_Tab 
    SET 
        AcceptNum = AcceptNum - @ThisNum / CASE 
            WHEN SaleType = 4 THEN 2 
            ELSE 1 
        END,
        AcceptNumEx = AcceptNumEx - @ThisNumEx / CASE 
            WHEN @SaleType = 3 THEN DownWg 
            ELSE CASE 
                WHEN SaleType = 4 THEN 2 
                ELSE 1 
            END 
        END,
        AcceptStatus = 0 
    WHERE Idkey = @SaleOrderIdKey
END

SET NOCOUNT OFF
GO
