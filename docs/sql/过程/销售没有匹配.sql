USE [LinkeDisV4]
GO

ALTER PROC Sp_GetSaleBatchNotMatch
    @BillNumber VARCHAR(20) = ''
AS
/**销售没有匹配**/
SET NOCOUNT ON

SELECT 
    a.Idkey,
    a.ProductCode,
    a.DownUnit,
    a.SaleType,
    a.num - ISNULL(b.num, 0) AS num,
    a.numEx - a.replaceNumEx - ISNULL(b.numEx, 0) AS numEx,
    a.salePrice,
    a.BatchNumber,
    a.billnumber,
    a.DeliveryAt,
    c.Name,
    c.Spec
FROM L_Bill_Sales_Tab a
INNER JOIN L_Basic_Product_Tab c ON a.ProductCode = c.IdCode
LEFT JOIN ( 
    SELECT 
        billnumber,
        ProductCode, 
        SaleType, 
        SUM(num) AS num, 
        SUM(NumEx) AS numEx 
    FROM L_Bill_Sales_Tabs 
    WHERE billnumber = CASE WHEN @BillNumber = '' THEN billnumber ELSE @BillNumber END
    GROUP BY billnumber, ProductCode, SaleType 
) b ON a.ProductCode = b.ProductCode 
    AND a.SaleType = b.SaleType 
    AND a.billnumber = b.billnumber
WHERE a.billnumber = CASE WHEN @BillNumber = '' THEN a.billnumber ELSE @BillNumber END
    AND a.numEx - a.replaceNumEx <> ISNULL(b.numEx, 0)

SET NOCOUNT OFF
GO
