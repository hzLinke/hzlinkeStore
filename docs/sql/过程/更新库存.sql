USE [LinkeDisV4]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStock]    Script Date: 2026-03-29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_UpdateStock]
    @UpdateType VARCHAR(20),
    @BillNumber VARCHAR(20),
    @UpdateAction INT
AS
/*
***************************************************
    功能：更新库存表
    参数：
        @UpdateType VARCHAR(20) - 更新类型：'Purchase' 采购入库，'Sale' 销售出库，'StockChange' 库存变更
        @BillNumber VARCHAR(20) - 单据号
        @UpdateAction INT        - 操作类型：1 审核（正向操作），-1 返审核（反向操作）
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 采购入库更新库存
IF @UpdateType = 'Purchase'
BEGIN
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        StoreCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        StoreCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_Purchases_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.StoreCode = b.StoreCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num + b.numEx * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            StoreCode,
            numEx,
            BatchNumber,
            costprice
        FROM L_Bill_Purchases_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.StoreCode = b.StoreCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE IF @UpdateType = 'Sale'
BEGIN
    -- 销售出库/退库更新库存
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        StoreCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        StoreCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_Sales_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.StoreCode = b.StoreCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num - b.numEx * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            StoreCode,
            numEx,
            BatchNumber,
            costprice
        FROM L_Bill_Sales_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.StoreCode = b.StoreCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE IF @UpdateType = 'StockChange'
BEGIN
    -- 库存变更单更新库存
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        StoreCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        StoreCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_StockChanges_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.StoreCode = b.StoreCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num + b.num * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            StoreCode,
            num,
            BatchNumber,
            costprice
        FROM L_Bill_StockChanges_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.StoreCode = b.StoreCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE
BEGIN
    -- 其他类型的库存更新（可根据需要扩展）
    RAISERROR('不支持的更新类型: %s', 16, 1, @UpdateType)
    RETURN
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO
