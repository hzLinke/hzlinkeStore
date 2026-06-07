USE [LinkeDisV4]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [dbo].[Sp_QuotedPrice_Copy]
    @BillNumber VARCHAR(20),
    @CurCustomerCode BIGINT AS

/*
***************************************************
    功能：复制报价
    参数：
        @BillNumber: 单号
        @CurCustomerCode: 当前客户编码
**************************************************
*/

SET NOCOUNT ON

DECLARE @CustomerCode BIGINT
DECLARE @startAt DATE
DECLARE @endAt DATE
DECLARE @Pcode INT

SELECT @CustomerCode = CustomerCode,
       @startAt = StartAt,
       @endAt = EndAt 
FROM L_Bill_QuotedPrice_Tab 
WHERE BillNumber = @BillNumber

SELECT @Pcode = Pcode 
FROM L_Basic_Company_Tab 
WHERE IdCode = @CustomerCode

IF EXISTS (
    SELECT 1 
    FROM L_bill_QuotedPrice_Tab 
    WHERE BillNumber <> @BillNumber 
      AND CustomerCode = @CustomerCode 
      AND EndAt = @endAt
)
BEGIN
    RAISERROR('已存在相同结束日期的报价单，不能复制', 16, 1)
    RETURN 
END

IF EXISTS (
    SELECT 1 
    FROM L_bill_QuotedPrices_Tab 
    WHERE BillNumber = @BillNumber
)
BEGIN
    RAISERROR('已单已存在报价不能复制', 16, 1)
    RETURN 
END

INSERT INTO L_bill_QuotedPrices_Tab (
    IdKey,
    BillNumber,
    ProductCode,
    SaleType,
    aliasName,
    SerialNumber,
    CustomerProcudeCode,
    CurSalePrice,
    salePrice,
    At,
    defaultShipperCode,
	QualityGrade,
    TenSaleNum
)
SELECT @BillNumber + '-' + dbo.SetNBit(rowId, '0', 4),
       @BillNumber,
       ProductCode,
       SaleType,
       name,
       SerialNumber,
       CustomerProcudeCode,
       Price,
       Price,
       GETDATE(),
       defaultShipperCode,
	   QualityGrade,
       ISNULL(TenSaleNum, 0) 
FROM (
    SELECT a.ProductCode,
           a.SaleType,
           name,
           Price,
           SerialNumber,
           CustomerProcudeCode,
           RowId,
           defaultShipperCode,
		   QualityGrade,
           b.TenSaleNum 
    FROM (
        SELECT ProductCode,
               SaleType,
               name,
               Price,
               SerialNumber,
               CustomerProcudeCode,
               defaultShipperCode,
			   QualityGrade,
               ROW_NUMBER() OVER (ORDER BY SerialNumber) AS RowId 
        FROM V_Customer_Price_Tab 
        WHERE Pcode = @CurCustomerCode 
          AND CateCode IS NOT NULL
    ) a 
    LEFT JOIN (
        SELECT ProductCode,
               saleType,
               SUM(numex) AS TenSaleNum 
        FROM V_Bill_Sales_Tab  
        WHERE Pcode = @Pcode 
          AND DATEDIFF(DAY, DeliveryAt, GETDATE()) <= 30 
        GROUP BY ProductCode,
                 SaleType
    ) b ON a.ProductCode = b.ProductCode 
       AND a.SaleType = b.SaleType
) a

SET NOCOUNT OFF
GO
