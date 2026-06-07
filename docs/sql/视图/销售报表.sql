USE [LinkeDisV4]
GO

/****** Object:  View [dbo].[V_Reports_Sale]    Script Date: 2026-03-30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[V_Reports_Sale]
AS
/*销售报表*/
SELECT a.BillNumber,
       a.CurBillNumber,
       a.OrderBillNumber,
       a.MchCode,
       a.CustomerCode,
       a.pcode,
       a.SettlementType,
       a.AccountDay,
       a.StoreCode,
       b.AreaCode,
       a.SalesMan,
       a.DriverCode,
       a.DeliveryCode,
       a.status,
       a.note AS MainNote,
       b.At,
       a.DeliveryAt,
       a.examineUserCode,
       a.InvNumber,
       a.InvMoney,
       b.Idkey,
       b.productCode,
       c.BarCode,
       c.SelfCode,
       c.PymCode,
       c.CateCode,
       b.Name,
       c.AliasName,
       c.Name AS CurName,
       c.Spec,
       b.Unit AS Unit,
       c.Unit AS MinUnit,
       c.Origin,
       c.Brand,
       b.OrderNum,
       (b.numEx - b.replaceNumEx) * b.DoubleNumExBase * b.PackBase AS ExChangeNumEx,
       b.numEx - b.replaceNumEx AS NumEx,
       b.numEx AS SettlementNumEx,
       b.replaceNumEx,
       b.ActualCostPrice,
       b.costprice,
       ROUND(b.salePrice, 2) AS salePrice,
       b.DisTributionAt,
       b.DisTributionNum,
       b.DisTributionUserCode,
       (b.numEx - b.replaceNumEx) * b.ActualCostPrice AS ActualCostMoney,
       (b.numEx - b.replaceNumEx) * b.CostPrice AS CostMoney,
       ROUND((b.numEx - b.replaceNumEx) * ROUND(b.salePrice, 2), 2) AS SaleMoney,
       ROUND(b.numEx * ROUND(b.salePrice, 2), 2) AS SettlementMoney,
       (b.numEx - b.replaceNumEx) * (b.CostPrice - b.ActualCostPrice) AS KsMoney,
       b.replaceNumEx * b.salePrice AS ReplaceSaleMoney,
       b.Profit,
       CASE WHEN (b.numEx * b.salePrice) = 0 THEN -100 ELSE b.Profit / (b.numEx * b.salePrice) * 100 END AS ProfitRate,
       b.Note,
       b.LossNote,
       b.BatchNumber
FROM v_Bill_sale_Tab a
INNER JOIN v_Bill_sales_Tab b ON a.BillNumber = b.billnumber
INNER JOIN L_Basic_Product_Tab c ON b.ProductCode = c.IdCode
WHERE a.examineUserCode > 0
GO


