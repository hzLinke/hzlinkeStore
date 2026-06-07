USE [LinkeDisV4]
GO

/****** Object:  Trigger [dbo].[Shipper_DisDetail_Update]    Script Date: 2026-04-08 19:33:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER [dbo].[Shipper_DisDetail_Update] 
ON [dbo].[L_Bill_PurchaseOrders_Tab#] 
FOR UPDATE
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE @BillNumber VARCHAR(20)
    DECLARE @PurchaseBillNumber VARCHAR(20)
    DECLARE @SaleOrderBillNumber VARCHAR(20)
    DECLARE @SaleBillNumber VARCHAR(20)
    DECLARE @SaleOrderIdKey VARCHAR(20)
    DECLARE @ThisIdKey VARCHAR(20)
    DECLARE @BatchNumber VARCHAR(50)
    DECLARE @ProductCode VARCHAR(20)
    DECLARE @QualityGrad INT
    DECLARE @SaleType INT
    DECLARE @DownWg FLOAT
    DECLARE @NumEx FLOAT
    DECLARE @Num FLOAT
    DECLARE @inPrice FLOAT
    DECLARE @AvgCostPrice FLOAT
    DECLARE @ThisNumEx FLOAT
    DECLARE @ThisNum FLOAT
    DECLARE @CurThisNumEx FLOAT
    DECLARE @CurThisNum FLOAT
    DECLARE @DiffNumEx FLOAT
    DECLARE @DiffNum FLOAT
    DECLARE @EditType VARCHAR(20)
    DECLARE @ShipperAddNumNotTransferStock BIT

    SELECT @ShipperAddNumNotTransferStock = ShipperAddNumNotTransferStock 
    FROM L_Sys_Parmars_Tab

    IF UPDATE(JumpUpdateTrigger) 
    BEGIN
        RETURN
    END

    IF (SELECT TOP 1 IsFromSplit FROM Inserted) = 1
    BEGIN
        RAISERROR('此商品为多采部分拆分得来，不能修改', 16, 1)
        RETURN 
    END

    IF UPDATE(NumEx) AND (SELECT TOP 1 Numex FROM inserted) < 0
    BEGIN
        RAISERROR('数量不能为负数', 16, 1)
        RETURN 
    END

    IF UPDATE(NumEx) OR UPDATE(CostPrice)
    BEGIN
        DECLARE _Cursor CURSOR FOR
            SELECT
                a.Idkey, 
                a.ProductCode,
                a.BillNumber,
                a.SaleOrderBillNumber,
                a.SaleOrderIdkey,
                a.SaleType,
                a.DownWg,
                a.num AS ThisNum,
                a.NumEx AS ThisNumEx,
                b.num AS CurThisNum,
                b.NumEx AS CurThisNumEx,
                a.editType,
                a.BatchNumber
            FROM Inserted a
            INNER JOIN Deleted b ON a.Idkey = b.Idkey

        OPEN _Cursor

        FETCH NEXT FROM _Cursor INTO 
            @ThisIdKey,
            @ProductCode,
            @BillNumber,
            @SaleOrderBillNumber,
            @SaleOrderIdKey,
            @SaleType,
            @DownWg,
            @ThisNum,
            @ThisNumEx,
            @CurThisNum,
            @CurThisNumEx,
            @EditType,
            @BatchNumber

        WHILE (@@FETCH_STATUS = 0)
        BEGIN
            SET @DiffNum = @ThisNum - @CurThisNum
            SET @DiffNumEx = @ThisNumEx - @CurThisNumEx

            SELECT @PurchaseBillNumber = PurchaseBillNumber 
            FROM L_Bill_PurchaseOrder_Tab 
            WHERE BillNumber = @BillNumber

            SELECT @SaleBillNumber = DeliveryBillNumber 
            FROM L_Bill_SaleOrder_Tab 
            WHERE BillNumber = @SaleOrderBillNumber

            IF @DiffNumEx > 0 AND @SaleType <> 2 
            BEGIN 
                IF @ShipperAddNumNotTransferStock = 0
                BEGIN
                    UPDATE L_Bill_PurchaseOrders_Tab# 
                    SET JumpUpdateTrigger = 1, 
                        num = num - @DiffNum, 
                        NumEx = NumEx - @DiffNumEx 
                    WHERE Idkey = @ThisIdKey

                    EXEC [Sp_TransferStock] @ThisIdKey, @BillNumber, @ProductCode, @SaleType, @DiffNum, @DiffNumEx, 1
                END 
                ELSE IF @EditType = 'shipper'
                BEGIN
                    UPDATE L_Bill_SaleOrders_Tab 
                    SET AcceptNum = AcceptNum + @DiffNum, 
                        AcceptNumEx = AcceptNumEx + @DiffNumEx 
                    WHERE Idkey = @SaleOrderIdKey 

                    UPDATE L_Bill_Sales_Tab 
                    SET numEx = @ThisNumEx 
                    WHERE OrderIdkey = @SaleOrderIdKey
                END
            END

            SELECT 
                @NumEx = SUM(NumEx),
                @Num = SUM(Num),
                @AvgCostPrice = SUM(NumEx * CostPrice) / SUM(NumEx)
            FROM L_Bill_PurchaseOrders_Tab# 
            WHERE BillNumber = @BillNumber 
                AND ProductCode = @ProductCode 
                AND SaleType = @SaleType 
                AND DownWg = @DownWg 
                AND BatchNumber = @BatchNumber

            UPDATE L_Bill_Purchases_Tab 
            SET numEx = @NumEx, 
                Num = @Num, 
                costprice = @AvgCostPrice
            WHERE BillNumber = @PurchaseBillNumber 
                AND ProductCode = @ProductCode 
                AND SaleType = @SaleType 
                AND DownWg = @DownWg 
                AND BatchNumber = @BatchNumber

            UPDATE L_Bill_PurchaseOrders_Tab 
            SET numEx = @NumEx, 
                Num = @Num, 
                costprice = @AvgCostPrice 
            WHERE BillNumber = @BillNumber 
                AND ProductCode = @ProductCode 
                AND SaleType = @SaleType 
                AND DownWg = @DownWg 
                AND BatchNumber = @BatchNumber

            IF @DiffNumEx < 0 
            BEGIN
                UPDATE L_Bill_SaleOrders_Tab 
                SET AcceptNum = AcceptNum - @CurThisNum + @ThisNum,
                    AcceptNumEx = AcceptNumEx - @CurThisNumEx + @ThisNumEx,
                    AcceptStatus = 0 
                WHERE Idkey = @SaleOrderIdKey AND AcceptNum > 0

                UPDATE L_Bill_SaleOrders_Tab 
                SET AcceptStatus = 1 
                WHERE Idkey = @SaleOrderIdKey AND OweNum <= 0

                UPDATE L_Bill_SaleOrders_Tab 
                SET numEx = num * CAST((@ThisNumEx / @ThisNum) AS DECIMAL(18, 6))
                WHERE Idkey = @SaleOrderIdKey AND SaleType = 2

                UPDATE L_Bill_Sales_Tab 
                SET numEx = num * CAST((@ThisNumEx / @ThisNum) AS DECIMAL(18, 6)) 
                WHERE OrderIdkey = @SaleOrderIdKey AND SaleType = 2

                IF @EditType = 'shipper' 
                BEGIN
                    UPDATE L_Bill_Sales_Tab 
                    SET numEx = num  
                    WHERE OrderIdkey = @SaleOrderIdKey AND SaleType <> 2
                END
            END

            FETCH NEXT FROM _Cursor INTO 
                @ThisIdKey,
                @ProductCode,
                @BillNumber,
                @SaleOrderBillNumber,
                @SaleOrderIdKey,
                @SaleType,
                @DownWg,
                @ThisNum,
                @ThisNumEx,
                @CurThisNum,
                @CurThisNumEx,
                @EditType,
                @BatchNumber
        END

        CLOSE _Cursor
        DEALLOCATE _Cursor
    END

    IF UPDATE(qualityGrade) 
    BEGIN
        DECLARE QualityGrad_Cursor CURSOR FOR
            SELECT
                a.Idkey, 
                a.ProductCode,
                a.BillNumber,
                a.SaleOrderBillNumber,
                a.SaleOrderIdkey,
                a.SaleType,
                a.qualityGrade,
                a.BatchNumber,
                a.num,
                a.NumEx,
                a.CostPrice
            FROM Inserted a
            INNER JOIN Deleted b ON a.Idkey = b.Idkey

        OPEN QualityGrad_Cursor

        FETCH NEXT FROM QualityGrad_Cursor INTO 
            @ThisIdKey,
            @ProductCode,
            @BillNumber,
            @SaleOrderBillNumber,
            @SaleOrderIdKey,
            @SaleType,
            @QualityGrad,
            @BatchNumber,
            @ThisNum,
            @ThisNumEx,
            @inPrice

        WHILE (@@FETCH_STATUS = 0)
        BEGIN
            EXEC sp_TransferQualityGrade
                @BillNumber,
                @SaleOrderBillNumber,
                @ProductCode,
                @ThisIdKey,
                @SaleOrderIdKey,
                @ThisNum,
                @ThisNumEx,
                @InPrice,
                1,
                @QualityGrad
    
            FETCH NEXT FROM QualityGrad_Cursor INTO 
                @ThisIdKey,
                @ProductCode,
                @BillNumber,
                @SaleOrderBillNumber,
                @SaleOrderIdKey,
                @SaleType,
                @QualityGrad,
                @BatchNumber,
                @ThisNum,
                @ThisNumEx,
                @inPrice
        END

        CLOSE QualityGrad_Cursor
        DEALLOCATE QualityGrad_Cursor
    END

    SET NOCOUNT OFF
END
GO
