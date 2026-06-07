/****** Object:  StoredProcedure [dbo].[sp_AcceptOrder]    Script Date: 2026-03-29 19:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_AcceptOrder]
    @mchCode VARCHAR(20),
    @ProductCode VARCHAR(20),
    @ShipperCode BIGINT,
    @num FLOAT,
    @numEx FLOAT,
    @Price FLOAT,
    @DeliveryAt DATE,
    @usercode INT,
    @OrderList VARCHAR(4000),
    @free INT
AS
/*
***************************************************
    功能：接单
    参数：
        @mchCode VARCHAR(20)      - 用户账号
        @ProductCode VARCHAR(20)   - 商品号
        @ShipperCode BIGINT      - 供货商
        @num FLOAT               - 数量
        @Price FLOAT             - 单价
        @DeliveryAt DATE          - 送货日
        @usercode INT            - 操作员
        @OrderList VARCHAR(4000)  - 订单列表以,分隔
        @free INT                - 0正常，1免采
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @tempBillNumber VARCHAR(20)
DECLARE @thisBillNumber VARCHAR(20)
DECLARE @tempmaxIdkey VARCHAR(100)
DECLARE @maxIdkey VARCHAR(100)
DECLARE @DoBillNumber VARCHAR(100)
DECLARE @DoIdkey VARCHAR(100)
DECLARE @DoOweNum FLOAT
DECLARE @DoOweNumEx FLOAT
DECLARE @DoProductCode VARCHAR(20)
DECLARE @doNum FLOAT
DECLARE @doNumEx FLOAT
DECLARE @DownUnit VARCHAR(20)
DECLARE @DownWg FLOAT
DECLARE @SaleType INT
DECLARE @DoCustomerCode INT
DECLARE @TotalNum FLOAT              -- 对应商品客户订单总数
DECLARE @OutNum FLOAT              -- 接单时超出数量
DECLARE @TotalNumEx FLOAT           -- 对应商品客户订单总数
DECLARE @OutNumEx FLOAT            -- 接单时超出数量
DECLARE @StockNum FLOAT            -- 可用库存
DECLARE @Note VARCHAR(50)           -- 备注
DECLARE @AllowedOutOrderNum BIT   -- 下单量是否可超订单量
DECLARE @AcceptUserCode INT
DECLARE @BatchNumber VARCHAR(50)      -- 采购批次
DECLARE @QualityGrade INT          -- 质量

-- 获取系统参数
SELECT @AllowedOutOrderNum = AllowedOutOrderNum, @AcceptUserCode = AcceptUserCode 
FROM L_Sys_Parmars_Tab

-- 自动接单时获取质量等级
IF @mchCode = 'AutoAccept'
BEGIN
    SELECT @QualityGrade = QualityGrade 
    FROM L_Bill_SaleOrders_Tab a 
    WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, ',') WHERE col = a.billnumber) 
    AND ProductCode = @ProductCode
    
    SET @BatchNumber = 'BT' + CONVERT(VARCHAR(10), GETDATE(), 112) + @ProductCode + CAST(@qualitygrade AS VARCHAR(5))
END
ELSE
BEGIN
    SET @BatchNumber = 'BT' + CONVERT(VARCHAR(10), GETDATE(), 112) + SUBSTRING(REPLACE(NEWID(), '-', ''), 1, 4)
END

-- 全部使用一个用户不分单
IF @AcceptUserCode > 0
    SET @usercode = @AcceptUserCode

-- 正常接单流程
IF @free = 0
BEGIN
    -- 取得订单总数
    SELECT @TotalNum = ISNULL(SUM(oweNum), 0), @TotalNumEx = ISNULL(SUM(OweNumEx), 0) 
    FROM V_Purchase_Group_Detail_Tab a 
    WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, ',') WHERE col = a.billnumber) 
    AND a.productCode = @ProductCode 
    AND a.DeliveryAt = @DeliveryAt
    
    -- 计算超出部分
    SET @OutNum = @Num - @TotalNum
    SET @OutNumEx = @NumEx - @TotalNumEx

    -- 检查是否超出下单量
    IF @AllowedOutOrderNum = 0 AND @OutNumEx > 0
    BEGIN
        RAISERROR('下单数量大于客户订货数量，请刷新数据再操作', 16, 1)
        RETURN
    END
    
    -- 判断数据是否被其他用户采购完
    IF @mchCode <> 'AutoAccept'
    BEGIN
        -- 自动分流时跳过，否则如果同一张单有相同商品时会触发
        IF (SELECT COUNT(*) FROM V_Purchase_Group_Detail_Tab a 
            WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, ',') WHERE col = a.billnumber) 
            AND ProductCode = @ProductCode) < 
            (SELECT COUNT(*) FROM dbo.f_splitSTR(@OrderList, ','))
        BEGIN
            RAISERROR('数据已被其它用户更新过，请刷新数据再操作', 16, 1)
            RETURN
        END
    END
    
    -- 生成采购单号
    SELECT @tempBillNumber = ISNULL(MAX(CAST(SUBSTRING(billnumber, 11, 4) AS INT)), 0) + 1 
    FROM L_Bill_PurchaseOrder_Tab 
    WHERE CONVERT(CHAR(10), makingAt, 120) = CONVERT(CHAR(10), GETDATE(), 120)
    
    SET @thisBillNumber = 'RD' + CONVERT(VARCHAR(20), GETDATE(), 112) + dbo.SetNBit(@tempBillNumber, '0', 4)
    
    -- 检查是否存在当前日期、当前操作员、且未审核的订单且单价不同
    IF (SELECT COUNT(*) FROM L_Bill_PurchaseOrder_Tab 
        WHERE ShipperCode = @ShipperCode 
        AND DeliveryAt = @DeliveryAt 
        AND MakingUserCode = @usercode 
        AND ExamineUserCode = 0) = 0
    BEGIN
        -- 不存在，插入新订单
        INSERT INTO L_Bill_PurchaseOrder_Tab 
        (
            BillNumber,
            mchCode,
            ShipperCode,
            MakingUserCode,
            MakiNgAt,
            ExamineuserCode,
            ExamineAt,
            DeliveryAt,
            BillType,
            Status
        ) 
        VALUES
        (
            @thisBillNumber,
            @mchCode,
            @ShipperCode,
            @UserCode,
            GETDATE(),
            0,
            GETDATE(),
            @DeliveryAt,
            16,
            0
        )
    END
    ELSE
    BEGIN
        -- 存在，使用现有订单号
        SELECT @thisBillNumber = BillNumber 
        FROM L_Bill_PurchaseOrder_Tab 
        WHERE ShipperCode = @ShipperCode 
        AND DeliveryAt = @DeliveryAt 
        AND MakingUserCode = @usercode 
        AND ExamineUserCode = 0
    END
    
    -- 声明游标处理销售订单
    DECLARE _Cursor CURSOR FOR
        SELECT BillNumber, Idkey, DownUnit, DownWg, SaleType, QualityGrade, StockNum, OweNum, OweNumEx, ProductCode, CustomerCode, Note
        FROM V_Purchase_Group_Detail_Tab a 
        WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, ',') WHERE col = a.billnumber) 
        AND a.productCode = @ProductCode 
        AND a.DeliveryAt = @DeliveryAt 
        AND OweNum > 0 
        ORDER BY a.owenum DESC
    
    OPEN _Cursor
    FETCH NEXT FROM _Cursor INTO @DoBillNumber, @DoIdkey, @DownUnit, @DownWg, @SaleType, @QualityGrade, @StockNum, @DoOweNum, @DoOweNumEx, @DoProductCode, @DoCustomerCode, @note
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- 判断接单数量是否足够
        IF @num >= @DoOweNum
        BEGIN
            SET @doNum = @DoOweNum
            SET @doNumEx = @DoOweNumEx
        END
        ELSE
        BEGIN
            SET @doNum = @num
            SET @doNumEx = @NumEx
        END
        
        -- 更新销售订单的接单数量
        UPDATE L_Bill_SaleOrders_Tab 
        SET AcceptNum = AcceptNum + @DoOweNum / DoubleNumBase,
            AcceptNumEx = AcceptNumEx + @DoOweNumEx / DoubleNumExBase 
        WHERE Idkey = @DoIdkey
        
        -- 将销售订单中的状态设成已接单状态
        UPDATE L_Bill_SaleOrders_Tab 
        SET Status = 1 
        WHERE Idkey = @DoIdkey 
        AND OweNum <= 0
        
        -- 生成采购订单明细ID
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab# 
        WHERE billnumber = @thisBillNumber
        
        SET @maxIdkey = @thisBillNumber + '-' + dbo.SetNBit(@tempmaxIdkey, '0', 4)
        
        -- 将客户明细存入采购订单明细中，用于供货商配货
        INSERT INTO L_Bill_PurchaseOrders_Tab# 
        (
            Idkey,
            BillNumber,
            DeliveryAt,
            mchCode,
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
            QualityGrade,
            Note
        ) 
        VALUES
        (
            @maxIdkey,
            @thisBillNumber,
            @DeliveryAt,
            @mchCode,
            @DoCustomerCode,
            @ProductCode,
            @DownUnit,
            @DownWg,
            @SaleType,
            @doNum,
            @doNumEx * CASE WHEN @SaleType = 3 THEN @DownWg ELSE 1 END,
            @Price,
            @DoBillNumber,
            @DoIdkey,
            @BatchNumber,
            @QualityGrade,
            @Note
        )
        
        -- 检查采购订单明细是否存在
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab 
        WHERE billnumber = @thisBillNumber
        
        SET @maxIdkey = @thisBillNumber + '-' + dbo.SetNBit(@tempmaxIdkey, '0', 4)
        
        IF (SELECT COUNT(billnumber) FROM L_Bill_PurchaseOrders_Tab 
            WHERE BillNumber = @thisBillNumber 
            AND ProductCode = @DoProductCode 
            AND SaleType = @SaleType 
            AND BatchNumber = @BatchNumber) = 0
        BEGIN
            -- 不存在，插入新明细
            INSERT INTO L_Bill_PurchaseOrders_Tab
            (
                IdKey,
                BillNumber,
                mchCode,
                ShipperCode,
                ProductCode,
                DownUnit,
                DownWg,
                SaleType,
                stockNum,
                Num,
                NumEx,
                CostPrice,
                salePrice,
                ExamineUserCode,
                At,
                DeliveryAt,
                BatchNumber,
                QualityGrade,
                Status
            ) 
            VALUES
            (
                @maxIdkey,
                @thisBillNumber,
                @mchCode,
                @ShipperCode,
                @ProductCode,
                @DownUnit,
                @DownWg,
                @SaleType,
                @StockNum,
                @doNum,
                @doNumEx * CASE WHEN @SaleType = 3 THEN @DownWg ELSE 1 END,
                @Price,
                0,
                0,
                GETDATE(),
                @DeliveryAt,
                @BatchNumber,
                @QualityGrade,
                0
            )
        END
        ELSE
        BEGIN
            -- 存在，更新数量和价格
            UPDATE a 
            SET a.num = b.Num, 
                a.numEx = b.NumEx, 
                a.costprice = b.AvePrice 
            FROM L_Bill_PurchaseOrders_Tab a,
            (
                SELECT BillNumber, ProductCode, SaleType, SUM(Num) AS Num, SUM(Numex) AS NumEx,
                    SUM(NumEx * CostPrice) / SUM(NumEx) AS AvePrice 
                FROM L_Bill_PurchaseOrders_Tab#
                WHERE BillNumber = @thisBillNumber 
                AND ProductCode = @ProductCode 
                AND BatchNumber = @BatchNumber
                GROUP BY BillNumber, ProductCode, SaleType
            ) b
            WHERE a.BillNumber = b.BillNumber 
            AND a.ProductCode = b.ProductCode 
            AND a.SaleType = b.SaleType 
            AND BatchNumber = @BatchNumber
        END
        
        -- 更新剩余数量
        SET @num = @num - @DoOweNum
        SET @numEx = @numEx - @DoOweNumEx
        
        -- 如果数量为0，退出循环
        IF @num <= 0
            BREAK
        
        FETCH NEXT FROM _Cursor INTO @DoBillNumber, @DoIdkey, @DownUnit, @DownWg, @SaleType, @QualityGrade, @StockNum, @DoOweNum, @DoOweNumEx, @DoProductCode, @DoCustomerCode, @note
    END
    
    CLOSE _Cursor
    DEALLOCATE _Cursor
    
    -- 处理超出订单总数
    IF @OutNum > 0
    BEGIN
        -- 更新采购订单明细
        UPDATE L_Bill_PurchaseOrders_Tab 
        SET num = num + @OutNum, 
            NumEx = NumEx + @OutNumEx 
        WHERE BillNumber = @thisBillNumber 
        AND ProductCode = @DoProductCode
        
        -- 生成新的采购订单明细ID
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab# 
        WHERE billnumber = @thisBillNumber
        
        -- 插入超出数量的明细
        INSERT INTO L_Bill_PurchaseOrders_Tab# 
        (
            Idkey,
            BillNumber,
            DeliveryAt,
            mchCode,
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
            BatchNumber
        ) 
        VALUES
        (
            @maxIdkey,
            @thisBillNumber,
            @DeliveryAt,
            @mchCode,
            0,
            @ProductCode,
            @DownUnit,
            @DownWg,
            @SaleType,
            @OutNum,
            @OutNumEx,
            @Price,
            '',
            '',
            @BatchNumber
        )
        
        -- 更新数量和价格
        UPDATE a 
        SET a.num = b.Num, 
            a.numEx = b.NumEx, 
            a.costprice = b.AvePrice 
        FROM L_Bill_PurchaseOrders_Tab a,
        (
            SELECT BillNumber, ProductCode, SaleType, SUM(Num) AS Num, SUM(Numex) AS NumEx,
                SUM(NumEx * CostPrice) / SUM(NumEx) AS AvePrice 
            FROM L_Bill_PurchaseOrders_Tab#
            WHERE BillNumber = @thisBillNumber 
            AND ProductCode = @ProductCode 
            GROUP BY BillNumber, ProductCode, SaleType
        ) b
        WHERE a.BillNumber = b.BillNumber 
        AND a.ProductCode = b.ProductCode 
        AND a.SaleType = b.SaleType
    END
END
ELSE
BEGIN
    -- 免采流程
    EXEC Sp_FreePurchase @ProductCode, @Num, @NumEx, @DeliveryAt, @OrderList
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
GO
