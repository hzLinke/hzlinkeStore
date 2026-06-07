USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[sp_Upd_StockChange]    Script Date: 2026-03-30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

-- exec sp_Upd_StockChange 'SC202302230001',10,1
ALTER PROCEDURE [dbo].[sp_Upd_StockChange] 
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT
AS
/* 
***************************************************
    功能：审核库存变单						
    参数：	
            @billnumber: 单号
            @updateuserid: 操作员
            @updatetype: 类型 1，-1 
    结果：
    更新库存
    作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON

DECLARE @StoreCode INT,
        @AreaCode INT,
        @ChangeAt DATE

SELECT @StoreCode = StoreCode,
       @AreaCode = AreaCode,
       @ChangeAt = changeAt 
FROM L_Bill_StockChange_Tab 
WHERE billNumber = @billNumber

IF dbo.is_Rhz(@ChangeAt) = 1
BEGIN
    RAISERROR('损溢日期已汇总，不能继续操作', 16, 1)
    RETURN 
END

EXEC Sp_CheckSumit '库存变更', @BillNumber, @updateType

IF @updatetype = 1
BEGIN
    EXEC Sp_CheckStock '库存变更', @BillNumber
    
    UPDATE L_Bill_StockChange_Tab 
    SET examineUserCode = @updateuserid,
        examineAt = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber
    
    UPDATE a
    SET a.storeCode = b.storeCode,
        a.BatchNumber = CONVERT(VARCHAR(10), GETDATE(), 112) + '-' + a.idkey 
    FROM L_Bill_StockChanges_Tab a
    INNER JOIN (
        SELECT billnumber, StoreCode 
        FROM L_Bill_StockChange_Tab 
        WHERE billnumber = @billnumber
    ) b ON a.billnumber = b.billnumber
    
    
    DELETE L_Bill_StockChanges_Tabs 
    WHERE BillNumber = @billnumber
    
    DECLARE @Idkey VARCHAR(100),
            @MchCode VARCHAR(50),
            @ShipperCode INT,
            @ProductCode VARCHAR(20),
            @ChangeNum DECIMAL(18, 2),
            @BatchNumber VARCHAR(100),
            @costprice DECIMAL(18, 8),
            @examineUserCode INT,
            @At DATETIME,
            @Note VARCHAR(50),
            @RemainingChangeNum DECIMAL(18, 2),
            @StockBatchNumber VARCHAR(100),
            @StockAllowedNum DECIMAL(18, 2),
            @StockAvgPrice DECIMAL(18, 8),
            @AllocatedNum DECIMAL(18, 2)
    
    DECLARE change_cursor CURSOR FOR
    SELECT Idkey, MchCode, StoreCode, AreaCode, ShipperCode, ProductCode, ChangeNum, BatchNumber, costprice, examineUserCode, At, Note
    FROM L_Bill_StockChanges_Tab
    WHERE billnumber = @billnumber
    
    OPEN change_cursor
    FETCH NEXT FROM change_cursor INTO @Idkey, @MchCode, @StoreCode, @AreaCode, @ShipperCode, @ProductCode, @ChangeNum, @BatchNumber, @costprice, @examineUserCode, @At, @Note
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RemainingChangeNum = @ChangeNum
        
        IF @ChangeNum > 0
        BEGIN
            INSERT INTO L_Bill_StockChanges_Tabs (
                Idkey,
                MchCode,
                StoreCode,
                AreaCode,
                ShipperCode,
                billnumber,
                ProductCode,
                ChangeNum,
                BatchNumber,
                costprice,
                examineUserCode,
                At,
                ChangeAt,
                Note
            )
            VALUES (
                @Idkey,
                @MchCode,
                @StoreCode,
                @AreaCode,
                @ShipperCode,
                @billnumber,
                @ProductCode,
                @ChangeNum,
                @BatchNumber,
                @costprice,
                @examineUserCode,
                @At,
                @ChangeAt,
                @Note
            )
        END
        ELSE
        BEGIN
            DECLARE stock_cursor CURSOR FOR
            SELECT BatchNumber, AllowedNum, avgPrice
            FROM V_Stock_Detail
            WHERE StoreCode = @StoreCode
              AND AreaCode = @AreaCode
              AND ProductCode = @ProductCode
              AND AllowedNum <> 0
            ORDER BY BatchNumber ASC
            
            OPEN stock_cursor
            FETCH NEXT FROM stock_cursor INTO @StockBatchNumber, @StockAllowedNum, @StockAvgPrice
            
            WHILE @@FETCH_STATUS = 0 AND @RemainingChangeNum <> 0
            BEGIN
                IF ABS(@RemainingChangeNum) >= @StockAllowedNum
                BEGIN
                    SET @AllocatedNum = @StockAllowedNum * SIGN(@RemainingChangeNum)
                END
                ELSE
                BEGIN
                    SET @AllocatedNum = @RemainingChangeNum
                END
                
                INSERT INTO L_Bill_StockChanges_Tabs (
                    Idkey,
                    MchCode,
                    StoreCode,
                    AreaCode,
                    ShipperCode,
                    billnumber,
                    ProductCode,
                    ChangeNum,
                    BatchNumber,
                    costprice,
                    examineUserCode,
                    At,
                    ChangeAt,
                    Note
                )
                VALUES (
                    @Idkey,
                    @MchCode,
                    @StoreCode,
                    @AreaCode,
                    @ShipperCode,
                    @billnumber,
                    @ProductCode,
                    @AllocatedNum,
                    @StockBatchNumber,
                    @StockAvgPrice,
                    @examineUserCode,
                    @At,
                    @ChangeAt,
                    @Note
                )
                
                SET @RemainingChangeNum = @RemainingChangeNum - @AllocatedNum
                
                FETCH NEXT FROM stock_cursor INTO @StockBatchNumber, @StockAllowedNum, @StockAvgPrice
            END
            
            CLOSE stock_cursor
            DEALLOCATE stock_cursor
        END
        
        FETCH NEXT FROM change_cursor INTO @Idkey, @MchCode, @StoreCode, @AreaCode, @ShipperCode, @ProductCode, @ChangeNum, @BatchNumber, @costprice, @examineUserCode, @At, @Note
    END
    
    CLOSE change_cursor
    DEALLOCATE change_cursor

    UPDATE L_Bill_StockChanges_Tab 
    SET examineUserCode = @updateuserid,
        At = GETDATE(),
        changeAt = @ChangeAt 
    WHERE billnumber = @billnumber
END

IF @updatetype = -1
BEGIN
    UPDATE L_Bill_StockChange_Tab 
    SET examineUserCode = 0,
        ExamineAt = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_StockChanges_Tab 
    SET examineUserCode = 0,
        At = GETDATE()
    WHERE billnumber = @billnumber
    
    DELETE L_Bill_StockChanges_Tabs 
    WHERE BillNumber = @billnumber
END

SET NOCOUNT OFF
GO
