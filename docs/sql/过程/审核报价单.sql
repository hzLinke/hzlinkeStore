USE [LinkeDisV4]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER Proc [dbo].[sp_Upd_QuotedPrice] 
    @billnumber VARCHAR(20),
    @UPDATEuserid INT,
    @UPDATEtype INT AS

/*
***************************************************
    功能：审核报价单						
    参数：	
            @billnumber:单号
            @UPDATEuserid :操作员
            @UPDATEtype :类型1，-1 
    结果：
        更新 客户报价
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON

DECLARE @CustomerCode BIGINT
DECLARE @startAt DATE
DECLARE @ENDAt DATE
DECLARE @UPDATESaleAllowedChangePrice BIT
DECLARE @Pcode INT
DECLARE @dr FLOAT
DECLARE @QuotedTemp TABLE (
    ProductCode VARCHAR(20),
    SaleType INT,
    SalePrice FLOAT
)

SELECT @CustomerCode = CustomerCode,
       @startAt = StartAt,
       @ENDAt = ENDAt 
FROM L_Bill_QuotedPrice_Tab 
WHERE BillNumber = @billnumber

SELECT @UPDATESaleAllowedChangePrice = ISNULL(UPDATESaleAllowedChangePrice, 0) 
FROM L_Sys_Parmars_Tab

SELECT @Pcode = ISNULL(Pcode, 0),
       @dr = ISNULL(Dr, 1) 
FROM L_Basic_Company_Tab 
WHERE IdCode = @CustomerCode

IF NOT EXISTS (
    SELECT 1 
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billnumber = @billnumber
) 
BEGIN
    RAISERROR('此单无数据,不能审核', 16, 1)
    RETURN 
END

IF @CustomerCode IS NULL OR @CustomerCode = 0 
BEGIN
    RAISERROR('请指定客户,不能审核', 16, 1)
    RETURN 
END

IF @UPDATEtype = 1
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE billnumber = @billnumber 
          AND ISNULL(examineUserCode, 0) > 0
    ) 
    BEGIN
        RAISERROR('此单已审核,不能审核', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber = @billnumber 
          AND ENDAt < CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR('结束日期不能小于当前日期', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber <> @billnumber 
          AND CustomerCode = @CustomerCode 
          AND ENDAt = @ENDAt
    )
    BEGIN
        RAISERROR('已存在相同结束日期的报价单', 16, 1)
        RETURN 
    END

    UPDATE L_Bill_QuotedPrice_Tab 
    SET examineUserCode = @UPDATEuserid,
        examineAt = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber

    UPDATE L_Bill_QuotedPrices_Tab 
    SET examineUserCode = @UPDATEuserid,
        At = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber

    UPDATE L_Basic_Company_Tab 
    SET startAt = @startAt,
        ENDAt = @ENDAt 
    WHERE IdCode = @CustomerCode

    DELETE L_Basic_Customer_Price_Tab 
    WHERE Pcode = @CustomerCode

    INSERT L_Basic_Customer_Price_Tab (
        IdKey,
        SerialNumber,
        CustomerProcudeCode,
        PCode,
        ProductCode,
        SaleType,
        AliasName,
        Price,
        defaultShipperCode,
		QualityGrade,
        note
    )
    SELECT IdKey,
           SerialNumber,
           CustomerProcudeCode,
           @CustomerCode,
           ProductCode,
           SaleType,
           AliasName,
           salePrice,
           defaultShipperCode,
		   QualityGrade,
           note 
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billNumber = @billnumber 
    ORDER BY SerialNumber

    INSERT @QuotedTemp (
        ProductCode,
        SaleType,
        SalePrice
    )
    SELECT ProductCode,
           SaleType,
           salePrice 
    FROM V_Bill_QuotedPrices_Tab 
    WHERE billnumber = @billnumber 
      AND salePrice <> 0

    IF @UPDATESaleAllowedChangePrice = 1
    BEGIN 
        IF @Pcode = 0 
        BEGIN
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab# a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_SaleOrders_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        END

        IF @Pcode > 0 
        BEGIN
            DECLARE @ChildCode BIGINT
            DECLARE @ChildDr FLOAT
            DECLARE _Cursor CURSOR FOR 
                SELECT IdCode,
                       Dr 
                FROM V_Basic_Customer_Tab 
                WHERE PCode = @Pcode
            OPEN _Cursor
            FETCH NEXT FROM _Cursor INTO @ChildCode, @ChildDr
            WHILE @@FETCH_STATUS = 0
            BEGIN
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_Sales_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
            
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_Sales_Tab# a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_SaleOrders_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt

                FETCH NEXT FROM _Cursor INTO @ChildCode, @ChildDr
            END
            CLOSE _Cursor
            DEALLOCATE _Cursor
        END
    END 
    ELSE 
    BEGIN
        IF @Pcode = 0
        BEGIN
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab# a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_SaleOrders_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        END

        IF @Pcode > 0
        BEGIN
            DECLARE @ChildCode2 BIGINT
            DECLARE @ChildDr2 FLOAT
            DECLARE _Cursor2 CURSOR FOR 
                SELECT IdCode,
                       Dr 
                FROM V_Basic_Customer_Tab 
                WHERE PCode = @Pcode
            OPEN _Cursor2
            FETCH NEXT FROM _Cursor2 INTO @ChildCode2, @ChildDr2
            WHILE @@FETCH_STATUS = 0
            BEGIN
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_Sales_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0
            
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_Sales_Tab# a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0
        
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_SaleOrders_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0

                FETCH NEXT FROM _Cursor2 INTO @ChildCode2, @ChildDr2
            END
            CLOSE _Cursor2
            DEALLOCATE _Cursor2
        END
    END
END

IF @UPDATEtype = -1
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE billnumber = @billnumber 
          AND ISNULL(examineUserCode, 0) > 0
    )
    BEGIN
        RAISERROR('此单未审核,不能反签', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber = @billnumber 
          AND ENDAt < CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR('过期的报价单不能反签', 16, 1)
        RETURN 
    END

    UPDATE L_Bill_QuotedPrice_Tab 
    SET examineUserCode = 0,
        examineAt = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber

    UPDATE L_Bill_QuotedPrices_Tab 
    SET examineUserCode = 0,
        At = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber

    DELETE L_Basic_Customer_Price_Tab 
    WHERE Pcode = @CustomerCode

    INSERT L_Basic_Customer_Price_Tab (
        IdKey,
        SerialNumber,
        CustomerProcudeCode,
        PCode,
        ProductCode,
        SaleType,
        AliasName,
        Price,
        defaultShipperCode,
		QualityGrade
    )
    SELECT IdKey,
           SerialNumber,
           CustomerProcudeCode,
           @CustomerCode,
           ProductCode,
           SaleType,
           AliasName,
           CurSalePrice,
           defaultShipperCode,
		   QualityGrade
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billNumber = @billnumber 
    ORDER BY SerialNumber
END

SET NOCOUNT OFF
GO
