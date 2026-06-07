/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase]    Script Date: 2026-03-29 20:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_Upd_Purchase]
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT,
    @updateShipper BIT
AS
/*
***************************************************
    功能：审核入帐单
    参数：
        @billnumber VARCHAR(20)  - 单号
        @updateuserid INT         - 操作员
        @updatetype INT           - 类型：1审核，-1反签
        @updateShipper BIT        - 是否更新报价单的默认供货商
    结果：更新库存
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @orderBillNumber VARCHAR(20)
DECLARE @mchCode VARCHAR(20)
DECLARE @ShipperCode INT
DECLARE @BillType INT
DECLARE @Type INT
DECLARE @UpdatePurchaseToDefaultShipper BIT
DECLARE @DeliveryAt DATE
DECLARE @CompanyCode BIGINT
DECLARE @AreaCode INT

-- 获取系统参数
SELECT @UpdatePurchaseToDefaultShipper = UpdatePurchaseToDefaultShipper
FROM L_Sys_Parmars_Tab

-- 获取采购订单信息
SELECT @orderBillNumber = OrderBillNumber,
       @mchCode = mchCode,
       @ShipperCode = ShipperCode,
       @Type = [Type],
       @BillType = billType,
       @DeliveryAt = DeliveryAt
FROM V_Bill_Purchase_Tab
WHERE BillNumber = @billnumber

-- 检查日期是否已汇总
IF dbo.is_Rhz(@DeliveryAt) = 1
BEGIN
    RAISERROR('操作日期已汇总，不能继续操作', 16, 1)
    RETURN
END

-- 审核流程
IF @updatetype = 1
BEGIN
    -- 检查是否已审核
    IF (SELECT ExamineUserCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) > 0
    BEGIN
        RAISERROR('此单已入帐审核，不能重复审核', 16, 1)
        RETURN
    END
    
    -- 检查是否有指定供货商
    IF (SELECT ShipperCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) = '0'
    BEGIN
        RAISERROR('此单无指定供货商，不能审核', 16, 1)
        RETURN
    END
    
    -- 检查是否有数据
    IF (SELECT COUNT(BillNumber) FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber) = 0
    BEGIN
        RAISERROR('此单无数据，不能审核', 16, 1)
        RETURN
    END
    
    -- 检查是否存在数量为0的商品
    IF (SELECT COUNT(BillNumber) FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber AND numex = 0) > 0
    BEGIN
        RAISERROR('此单存在数量为0的商品，不能审核', 16, 1)
        RETURN
    END
    
    -- 获取公司代码和区域代码
    SELECT @CompanyCode = ShipperCode,
           @AreaCode = AreaCode
    FROM V_Bill_Purchase_Tab
    WHERE BillNumber = @billnumber
    
    -- 更新采购入库单的供货商、门店、实际成本价、批次号
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.storeCode = b.storeCode,
        a.ActualCostPrice = CASE WHEN @BillType IN (0, 2) THEN a.CostPrice ELSE a.ActualCostPrice END,
        a.BatchNumber = CASE WHEN a.BatchNumber IS NULL THEN CONVERT(VARCHAR(10), GETDATE(), 112) + '-' + a.idkey ELSE a.BatchNumber END
    FROM L_Bill_Purchases_Tab a,
    (
        SELECT billnumber, ShipperCode, StoreCode
        FROM V_Bill_Purchase_Tab
        WHERE billnumber = @billnumber
    ) b
    WHERE a.billnumber = b.billnumber
    
    -- 更新采购入库单明细的供货商、门店、实际成本价、批次号
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.storeCode = b.storeCode,
        a.ActualCostPrice = CASE WHEN @BillType IN (0, 2) THEN a.CostPrice ELSE a.ActualCostPrice END,
        a.BatchNumber = CASE WHEN a.BatchNumber IS NULL THEN CONVERT(VARCHAR(10), GETDATE(), 112) + '-' + a.idkey ELSE a.BatchNumber END
    FROM L_Bill_Purchases_Tab# a,
    (
        SELECT billnumber, ShipperCode, StoreCode
        FROM V_Bill_Purchase_Tab
        WHERE billnumber = @billnumber
    ) b
    WHERE a.billnumber = b.billnumber
    
    -- 更新区域代码
    IF @AreaCode <> 0
    BEGIN
        UPDATE L_Bill_Purchases_Tab
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab#
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
    END
    ELSE
    BEGIN
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab a,
        (
            SELECT IdCode, AreaCode
            FROM L_Basic_Product_Tab
            WHERE IdCode IN (SELECT ProductCode FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber)
        ) b
        WHERE a.billnumber = @billnumber AND a.ProductCode = b.IdCode
        
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab# a,
        (
            SELECT IdCode, AreaCode
            FROM L_Basic_Product_Tab
            WHERE IdCode IN (SELECT ProductCode FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber)
        ) b
        WHERE a.billnumber = @billnumber AND a.ProductCode = b.IdCode
    END
    
    -- 更新审核信息
    UPDATE L_Bill_Purchase_Tab
    SET examineUserCode = @updateuserid,
        examineAt = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab
    SET examineUserCode = @updateuserid,
        ShipperCode = @CompanyCode,
        At = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab#
    SET examineUserCode = @updateuserid,
        ShipperCode = @CompanyCode,
        At = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    -- 更新订单的更新触发标志
    UPDATE a
    SET a.JumpUpdateTrigger = 1,
        a.costprice = b.costprice
    FROM L_Bill_PurchaseOrders_Tab# a,
    (
        SELECT OrderBillNumber, ProductCode, SaleType, DownWg, costprice, BatchNumber
        FROM V_Bill_Purchases_Tab
        WHERE billnumber = @billnumber AND shipperCode <> 1
    ) b
    WHERE a.billnumber = b.OrderBillNumber
      AND a.ProductCode = b.ProductCode
      AND a.saleType = b.saleType
      AND a.DownWg = b.DownWg
      AND a.BatchNumber = b.BatchNumber
    
    -- 更新报价单的默认供货商
    IF @UpdatePurchaseToDefaultShipper = 1 AND @updateShipper = 1
    BEGIN
        -- 更新客户报价单
        UPDATE a
        SET a.defaultShipperCode = b.ShipperCode
        FROM L_Basic_Customer_Price_Tab a,
        (
            SELECT *
            FROM V_Bill_Purchases_Tab
            WHERE billnumber = @billnumber AND shipperCode <> 1
        ) b
        WHERE a.ProductCode = b.ProductCode
        
        -- 更新商品报价单
        UPDATE a
        SET a.defaultShipperCode = b.ShipperCode
        FROM L_Bill_QuotedPrices_Tab a,
        (
            SELECT *
            FROM V_Bill_Purchases_Tab
            WHERE billnumber = @billnumber AND shipperCode <> 1
        ) b
        WHERE a.ProductCode = b.ProductCode
    END
    
    -- 只有采购收货单才更新商品资料价格
    IF @BillType IN (0, 2)
    BEGIN
        UPDATE a
        SET a.InPrice = b.CostPrice
        FROM L_Basic_Product_Tab a,
        (
            SELECT ProductCode, CostPrice
            FROM V_Bill_Purchases_Tab
            WHERE BillNumber = @BillNumber AND numEx > 0
        ) b
        WHERE a.Idcode = b.ProductCode AND b.CostPrice > 0
    END
END
ELSE
BEGIN
    -- 反签流程
    IF @updatetype = -1
    BEGIN
        -- 检查是否已审核
        IF (SELECT ExamineUserCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) = 0
        BEGIN
            RAISERROR('此单还末入帐审核，不能反签', 16, 1)
            RETURN
        END
        
        -- 检查是否已付款
        IF (SELECT AlreadyMoney FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) <> 0
        BEGIN
            RAISERROR('单据已存在付款，不能反签', 16, 1)
            RETURN
        END
        
        -- 反签审核信息
        UPDATE L_Bill_Purchase_Tab
        SET examineUserCode = 0,
            ExamineAt = GETDATE(),
            Status = 3
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab
        SET examineUserCode = 0,
            At = GETDATE(),
            Status = 3
        WHERE billnumber = @billnumber
        
        -- 更新对应订单为等收货状态
        UPDATE L_Bill_PurchaseOrder_Tab
        SET Status = 3
        WHERE BillNumber = @orderBillNumber
        
        UPDATE L_Bill_PurchaseOrders_Tab
        SET Status = 3
        WHERE BillNumber = @orderBillNumber
    END
END

-- 计算销售单的成本
EXEC Sp_CalcCostPrice_FromPurchase @billNumber

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO
