USE [LinkeDisV4]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_PurchaseOrder]    Script Date: 2026-04-17 15:56:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[sp_Upd_PurchaseOrder] 
	@billnumber VARCHAR(20),
	@deliveryat DATETIME,
	@updateuserid INT,
	@updatetype INT
AS
/* ****************************************************/
/* *********复核线下采购订单						 ************/
/* ******** 参数：@billnumber :单号            ***********/
/* ********       @updateuserid :工号             **********/
/* ********       @updatetype    :复核类型（1,-1) **********/
/* ********  2019-02-05  张建明             **********/  
/*   审核后不影响其它数据*/
/* ********  优化：2026-04-17 适配SQL2008R2 ********/
/****************************************************/
SET NOCOUNT ON

IF @updatetype = 1 
BEGIN
	DECLARE @ExamineUserCode INT
	DECLARE @ShipperCode VARCHAR(20)
	DECLARE @WithInShipperCode VARCHAR(20)
	DECLARE @MainSendToSub BIT
	DECLARE @OrderCount INT
	DECLARE @ZeroCount INT
	
	SELECT 
		@ExamineUserCode = ExamineUserCode,
		@ShipperCode = ShipperCode 
	FROM L_Bill_PurchaseOrder_Tab 
	WHERE billnumber = @billnumber
	
	IF @ExamineUserCode > 0 
	BEGIN
		RAISERROR (N'此单已审核,不能重复审核', 16, 1)
		RETURN 
	END
	
	IF @ShipperCode = '0' 
		OR @ShipperCode IS NULL
	BEGIN
		RAISERROR (N'此单无指定客户，不能审核', 16, 1)
		RETURN 
	END
	
	SELECT 
		@OrderCount = COUNT(BillNumber),
		@ZeroCount = SUM(
			CASE 
				WHEN num = 0 THEN 1 
				ELSE 0 
			END
		) 
	FROM L_Bill_PurchaseOrders_Tab 
	WHERE billnumber = @billnumber
	
	IF @OrderCount = 0 
	BEGIN
		RAISERROR (N'此单无数据,不能审核', 16, 1)
		RETURN 
	END
	
	IF @ZeroCount > 0 
	BEGIN
		RAISERROR (N'此单存在数量为0的商品,不能审核', 16, 1)
		RETURN 
	END
	
	SELECT 
		@WithInShipperCode = WithInShipperCode,
		@MainSendToSub = MainSendToSub 
	FROM L_Sys_Parmars_Tab

	UPDATE a
	SET a.AreaCode = b.AreaCode
	FROM L_Bill_PurchaseOrders_Tab a
	INNER JOIN (
		SELECT 
			IdCode,
			AreaCode 
		FROM L_Basic_Product_Tab 
		WHERE IdCode IN (
			SELECT ProductCode 
			FROM L_Bill_PurchaseOrders_Tab 
			WHERE billnumber = @billnumber
		)
	) b ON a.ProductCode = b.IdCode
	WHERE a.billnumber = @billnumber

	UPDATE L_Bill_PurchaseOrder_Tab 
	SET examineUserCode = @updateuserid,
		examineAt = GETDATE(),
		deliveryat = @deliveryat,
		Status = 1 
	WHERE billnumber = @billnumber
	
	UPDATE L_Bill_PurchaseOrders_Tab 
	SET examineUserCode = @updateuserid,
		ShipperCode = @ShipperCode,
		At = GETDATE(),
		deliveryat = @deliveryat 
	WHERE billnumber = @billnumber

	IF @WithInShipperCode <> @ShipperCode
	BEGIN 
		EXEC sp_PurchaseOrderToPurchase 
			@billnumber,
			@updateuserid
	END 
	ELSE 
	BEGIN
		EXEC sp_PurchaseOrderToPurchase 
			@billnumber,
			@updateuserid
		EXEC sp_PurchaseToSaleOrder 
			@billnumber,
			@updateuserid
	END
END
ELSE
BEGIN
	DECLARE @PurchaseBillNumber VARCHAR(20)
	DECLARE @PurchaseExamineUserCode INT
	
	SELECT 
		@PurchaseBillNumber = PurchaseBillNumber,
		@ExamineUserCode = ExamineUserCode 
	FROM L_Bill_PurchaseOrder_Tab 
	WHERE BillNumber = @billnumber 
	
	IF @ExamineUserCode = 0 
		OR @ExamineUserCode IS NULL
	BEGIN
		RAISERROR (N'此单还未审核，不能反签', 16, 1)
		RETURN 
	END
	
	IF @PurchaseBillNumber IS NOT NULL
	BEGIN
		SELECT @PurchaseExamineUserCode = ExamineUserCode 
		FROM L_Bill_Purchase_Tab 
		WHERE billnumber = @PurchaseBillNumber
		
		IF @PurchaseExamineUserCode > 0 
		BEGIN
			RAISERROR (N'对应的采购收货单已审核，不能反签', 16, 1)
			RETURN 
		END
	END
	
	DELETE FROM L_Bill_Purchases_Tab 
	WHERE BillNumber = @PurchaseBillNumber
	
	DELETE FROM L_Bill_Purchase_Tab 
	WHERE BillNumber = @PurchaseBillNumber
	
	UPDATE L_Bill_PurchaseOrder_Tab 
	SET examineUserCode = 0,
		ExamineAt = GETDATE(),
		Status = 0 
	WHERE billnumber = @billnumber
	
	UPDATE L_Bill_PurchaseOrders_Tab 
	SET examineUserCode = 0,
		At = GETDATE() 
	WHERE billnumber = @billnumber
END

SET NOCOUNT OFF
