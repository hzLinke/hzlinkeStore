USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[Sp_TransferStock]    Script Date: 2026-04-08 11:58:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Sp_TransferStock]
	@ThisIdKey VarChar(50),
	@BillNumber VarChar(20),
	@ProductCode VarChar(20),
	@SaleType int,
	@TransferNum Float,
	@TransferNumEx Float,
	@ToB bit
AS
/**
	采购下单单个商品转到备用存货
**/
BEGIN
	SET NOCOUNT ON

	DECLARE @CurNum Float
	DECLARE @CurNumEx Float
	DECLARE @DiffNum Float
	DECLARE @DiffNumEx Float
	DECLARE @SaleOrderBillNumber VarChar(50)
	DECLARE @SaleOrderIdKey VarChar(50)
	DECLARE @tempmaxIdkey int
	DECLARE @MaxIdkey VarChar(50)
	DECLARE @ThisStockIdKey Varchar(50)
	DECLARE @StockCount int
	DECLARE @BatchNumber VARCHAR(50)
	DECLARE @SaleBillNumber VARCHAR(20)

	SELECT 
		@SaleOrderBillNumber = SaleOrderBillNumber,
		@SaleOrderIdKey= SaleOrderIdKey, 
		@CurNum = Num,
		@CurNumEx = NumEx,
		@BatchNumber = BatchNumber
	FROM L_Bill_PurchaseOrders_Tab# 
	WHERE Idkey = @ThisIdKey

	--送货单号
	SELECT @SaleBillNumber = DeliveryBillNumber 
	FROM L_Bill_SaleOrder_Tab 
	WHERE BillNumber = @SaleOrderBillNumber

	SET @DiffNum = @CurNum - @TransferNum 
	SET @DiffNumEx = @CurNumEx - @TransferNumEx 

	IF @ToB = 0 AND (@TransferNum > @CurNum OR @TransferNumEx > @CurNumEx)
	BEGIN
		RAISERROR('转存数量不能大于原数量', 16, 1)
		RETURN 
	END;

	-- 禁用所有触发器
	ALTER TABLE [dbo].[l_bill_sales_tab] DISABLE TRIGGER ALL

	--①将剩余部分保留 更新JumpUpdateTrigger为跳出更新触发器
	IF @ToB =0 
	BEGIN
		UPDATE L_Bill_SaleOrders_Tab 
		SET AcceptNum = @DiffNum, 
			AcceptNumEx = @DiffNumEx, 
			AcceptStatus = 0 
		WHERE Idkey = @SaleOrderIdKey;

		UPDATE L_Bill_PurchaseOrders_Tab# 
		SET JumpUpdateTrigger = 1, 
			num = @DiffNum, 
			NumEx = @DiffNumEx 
		WHERE Idkey = @ThisIdKey
	END

	-----------------------------------------------------------------------------------------------

	--②转存部分
	SELECT @StockCount = COUNT(billnumber) 
	FROM L_Bill_PurchaseOrders_Tab# 
	WHERE BillNumber = @BillNumber 
		AND ProductCode = @ProductCode 
		AND SaleType = @SaleType 
		AND customerCode = 0 
		AND BatchNumber = @BatchNumber

	IF @StockCount = 0
	BEGIN
		SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE billnumber = @BillNumber

		SET @maxIdkey = @BillNumber + '-' + dbo.SetNBit(@tempmaxIdkey, '0', 4)

		INSERT INTO L_Bill_PurchaseOrders_Tab# 
		(
			Idkey, 
			BillNumber, 
			DeliveryAt, 
			SaleOrderBillNumber, 
			SaleOrderIdkey, 
			CustomerCode, 
			ProductCode,
			DownUnit, 
			DownWg, 
			SaleType, 
			num, 
			NumEx, 
			CostPrice,
			BatchNumber, 
			Note
		) 
		SELECT 
			@maxIdkey,
			@BillNumber,
			DeliveryAt,
			'' AS SaleOrderBillNumber,
			BatchNumber,
			'' AS SaleOrderIdkey,
			0 AS CustomerCode,
			ProductCode,
			DownUnit,
			DownWg,
			SaleType,
			@TransferNum,
			@TransferNumEx,
			CostPrice,
			'' AS Note  
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE Idkey = @ThisIdKey
	END 
	ELSE 
	BEGIN
		SELECT TOP 1 @ThisStockIdKey = IdKey 
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE BillNumber = @BillNumber 
			AND ProductCode = @ProductCode 
			AND SaleType = @SaleType 
			AND customerCode = 0

		UPDATE L_Bill_PurchaseOrders_Tab# 
		SET JumpUpdateTrigger = 1, 
			num = num + @TransferNum, 
			NumEx = NumEx + @TransferNumEx 
		WHERE Idkey = @ThisStockIdKey
	END;

	--EXEC EnabledTrigger 'L_Bill_PurchaseOrders_Tab#','Shipper_DisDetail_Update' --开启触发器

	IF @ToB = 0 
	BEGIN
		--③取消欠数部分
		EXEC [sp_CancelProduct] @SaleOrderBillNumber, @SaleOrderIdKey, @ProductCode, @TransferNum, @TransferNumEx

		--④删除接单量为0的行
		DELETE L_Bill_PurchaseOrders_Tab# 
		WHERE Num = 0 OR NumEx = 0

		--5修改已匹配的数据
		UPDATE l_bill_sales_tabs 
		SET num = num - @TransferNum, 
			numEx = numEx - @TransferNumEx 
		WHERE BillNumber = @SaleBillNumber 
			AND ProductCode = @ProductCode 
			AND BatchNumber = @BatchNumber
	END

	ALTER TABLE [dbo].[l_bill_sales_tab] ENABLE TRIGGER ALL

	SET NOCOUNT OFF
END;
GO
