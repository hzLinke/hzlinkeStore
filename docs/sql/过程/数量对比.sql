SELECT 
    a.Idkey,
    a.ProductCode,
    a.DownUnit,
    a.SaleType,
    a.num AS 主表数量,
    a.numEx AS 主表结算量,
    ISNULL(b.明细数量, 0) AS 明细数量,
    ISNULL(b.明细结算量, 0) AS 明细结算量,
    a.num - ISNULL(b.明细数量, 0) AS 数量差额,
    a.numEx - ISNULL(b.明细结算量, 0) AS 结算差额,
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
        ProductCode,
        SaleType,
        SUM(num) AS 明细数量,
        SUM(NumEx) AS 明细结算量
    FROM L_Bill_Sales_Tabs
    GROUP BY ProductCode, SaleType
) b ON a.ProductCode = b.ProductCode AND a.SaleType = b.SaleType
WHERE a.billnumber = @BillNumber
    AND (a.num <> ISNULL(b.明细数量, 0) OR a.numEx <> ISNULL(b.明细结算量, 0))
