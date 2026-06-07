USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase_Sub_Free]    Script Date: 2026-04-01 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Proc [dbo].[Sp_FreePurchase_Sub_Free]
    @SaleOrderIdkey varchar(100),
    @BillNumber varchar(100),--销售订单号
    @DeliveryAt date,
    @ProductCode VarChar(20),
    @DownUnit varchar(20),--下单单位
    @SaleType int,
    @DownWg float,
    @CustomerCode int,
    @FreeNum Float,
    @FreeNumEx Float,
    @Note VARCHAR(200) = ''--备注
as
Set NoCount On

DECLARE @StockTemp TABLE (
    StoreCode INT,
    AreaCode INT,
    ProductCode INT,
    BatchNumber VARCHAR(100),
    AllowedNum DECIMAL(18, 2),
    Money DECIMAL(18, 2),
    avgPrice DECIMAL(18, 8)
)

INSERT INTO @StockTemp (
    StoreCode,
    AreaCode,
    ProductCode,
    BatchNumber,
    AllowedNum,
    Money,
    avgPrice
)
EXEC Sp_GetDatStock @DeliveryAt, 1

DECLARE @MatchBatchNumber VARCHAR(100) = ''
DECLARE @MatchNum DECIMAL(18, 2) = 0
DECLARE @RemainingNum DECIMAL(18, 2)
DECLARE @MatchCostPrice DECIMAL(18, 8) = 0
DECLARE @CurrentBatch VARCHAR(100)
DECLARE @CurrentAllowedNum DECIMAL(18, 2)

SELECT @RemainingNum = ISNULL(@FreeNum, 0)

DECLARE batch_cursor CURSOR FOR
SELECT BatchNumber, AllowedNum, avgPrice
FROM @StockTemp
WHERE ProductCode = @ProductCode
    AND AreaCode = (SELECT AreaCode FROM L_Bill_SaleOrders_Tab WHERE Idkey = @SaleOrderIdkey)
    AND AllowedNum > 0
ORDER BY BatchNumber ASC

OPEN batch_cursor
FETCH NEXT FROM batch_cursor INTO @CurrentBatch, @CurrentAllowedNum, @MatchCostPrice

WHILE @@FETCH_STATUS = 0 AND @RemainingNum > 0
BEGIN
    SET @MatchBatchNumber = @CurrentBatch
    SET @MatchNum = CASE WHEN @CurrentAllowedNum >= @RemainingNum THEN @RemainingNum ELSE @CurrentAllowedNum END
    SET @RemainingNum = @RemainingNum - @MatchNum

    Insert Into L_Bill_PurchaseOrders_Tab#(
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
        BatchNumber,
        Note
    ) values (
        @SaleOrderIdkey ,
        'free',
        @DeliveryAt,
        @CustomerCode,
        @ProductCode,
        @DownUnit,
        @DownWg,
        @SaleType,
        @MatchNum,
        @MatchNum * Case When @SaleType = 3 Then @DownWg Else 1 End,
        @MatchCostPrice,
        @BillNumber,
        @SaleOrderIdkey,
        @MatchBatchNumber,
        @Note
    )

    FETCH NEXT FROM batch_cursor INTO @CurrentBatch, @CurrentAllowedNum, @MatchCostPrice
END

CLOSE batch_cursor
DEALLOCATE batch_cursor

update L_Bill_SaleOrders_Tab set
    FreeNum = FreeNum + @FreeNum,
    FreeNumEx = FreeNumEx + @FreeNumEx * Case When @SaleType = 3 Then @DownWg Else 1 End
where Idkey = @SaleOrderIdkey

update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where Idkey = @SaleOrderIdkey and OweNum <= 0

Set NoCount Off
GO
