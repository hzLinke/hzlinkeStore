GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Mr]    Script Date: 2026-03-29 20:22:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_Upd_Purchase_Mr]
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT,
    @updateShipper BIT
AS
/*
***************************************************
    功能：采购单收货（注意不可以用组合货号）
    参数：
        @billnumber VARCHAR(20)  - 单号
        @updateuserid INT         - 操作员
        @updatetype INT           - 类型：1收货，-1反签
        @updateShipper BIT        - 是否更新报价单的默认供货商
    结果：更新库存
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @orderBillNumber VARCHAR(20)
DECLARE @ShipperCode INT
DECLARE @AreaCode INT
DECLARE @Type INT
DECLARE @DeliveryAt DATE
DECLARE @settlementAt DATETIME

-- 获取采购订单信息
SELECT @orderBillNumber = OrderBillNumber,
       @ShipperCode = ShipperCode,
       @AreaCode = AreaCode,
       @Type = [Type],
       @DeliveryAt = DeliveryAt
FROM V_Bill_Purchase_Tab
WHERE BillNumber = @billnumber

-- 检查日期是否已汇总
IF dbo.is_Rhz(@DeliveryAt) = 1
BEGIN
    RAISERROR('操作日期已汇总，不能继续操作', 16, 1)
    RETURN
END

-- 收货流程
IF @updatetype = 1
BEGIN
    -- 检查汇总和库存
    EXEC Sp_CheckSumit '收货', @BillNumber, @updatetype
    EXEC Sp_CheckStock '收货', @BillNumber
    
    -- 更新采购入库单的供货商、门店、实际成本价
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.storeCode = b.storeCode,
        a.ActualCostPrice = a.CostPrice
    FROM L_Bill_Purchases_Tab a,
         L_Bill_Purchase_Tab b
    WHERE b.billnumber = @billNumber
      AND a.billnumber = b.billnumber
    
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.storeCode = b.storeCode,
        a.ActualCostPrice = a.CostPrice
    FROM L_Bill_Purchases_Tab# a,
         L_Bill_Purchase_Tab# b
    WHERE b.billnumber = @billNumber
      AND a.billnumber = b.billnumber
    
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
             L_Basic_Product_Tab b
        WHERE a.billnumber = @billnumber
          AND a.ProductCode = b.IdCode
        
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab# a,
             L_Basic_Product_Tab b
        WHERE a.billnumber = @billnumber
          AND a.ProductCode = b.IdCode
    END
    
    -- 计算报帐时间
    IF DATEPART(HOUR, GETDATE()) > 12
    BEGIN
        SET @settlementAt = DATEADD(DAY, 1, GETDATE())
    END
    ELSE
    BEGIN
        SET @settlementAt = GETDATE()
    END
    
    -- 更新收货信息
    UPDATE L_Bill_Purchase_Tab
    SET mrUserCode = @updateuserid,
        mrAt = GETDATE(),
        settlementAt = @settlementAt,
        Status = 3
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab
    SET mrUserCode = @updateuserid,
        ShipperCode = @ShipperCode,
        mrAt = GETDATE(),
        DeliveryAt = @DeliveryAt,
        settlementAt = @settlementAt,
        Status = 3
    WHERE billnumber = @billnumber
    
    -- 更新对应订单为完成状态
    UPDATE L_Bill_PurchaseOrder_Tab
    SET Status = 3,
        PurchaseBillNumber = @billnumber
    WHERE BillNumber = @orderBillNumber
    
    UPDATE L_Bill_PurchaseOrders_Tab
    SET Status = 3
    WHERE BillNumber = @orderBillNumber
    
    -- 如果设置自动入帐，则运行入帐逻辑
    IF (SELECT AutoEntry FROM L_Sys_Parmars_Tab) = 1
    BEGIN
        EXEC sp_Upd_Purchase @billnumber, @updateuserid, @updatetype, @updateShipper
    END
END
ELSE
BEGIN
    -- 反签流程
    IF @updatetype = -1
    BEGIN
        -- 检查是否已收货
        IF (SELECT mrUserCode FROM L_Bill_Purchase_Tab WHERE billnumber = @billnumber) = 0
        BEGIN
            RAISERROR('此单还末收货，不能反签', 16, 1)
            RETURN
        END
        
        -- 如果设置自动入帐，则先反签入帐单
        IF (SELECT AutoEntry FROM L_Sys_Parmars_Tab) = 1
           AND (SELECT COUNT(*) FROM L_Bill_Purchase_Tab WHERE BillNumber = @billnumber AND ExamineUserCode <> 0) > 0
        BEGIN
            EXEC sp_Upd_Purchase @billnumber, @updateuserid, @updatetype, @updateShipper
        END
        
        -- 检查汇总
        EXEC Sp_CheckSumit '收货', @BillNumber, @updatetype
        
        -- 反签收货信息
        UPDATE L_Bill_Purchase_Tab
        SET mrUserCode = 0,
            ExamineAt = GETDATE(),
            Status = 2
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab
        SET mrUserCode = 0,
            At = GETDATE(),
            Status = 2
        WHERE billnumber = @billnumber
        
        -- 更新对应订单为等收货状态
        UPDATE L_Bill_PurchaseOrder_Tab
        SET Status = 2
        WHERE BillNumber = @orderBillNumber
        
        UPDATE L_Bill_PurchaseOrders_Tab
        SET Status = 2
        WHERE BillNumber = @orderBillNumber
    END
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO
