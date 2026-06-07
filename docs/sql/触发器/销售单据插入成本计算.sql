USE [LinkeDisV4]
GO

/****** Object:  Trigger [dbo].[Bill_Sales_Ins]    Script Date: 2026-04-08 11:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Bill_Sales_Ins] 
ON [dbo].[L_Bill_Sales_Tabs] 
FOR INSERT, UPDATE 
AS 
SET NOCOUNT ON

UPDATE a 
SET a.costprice = b.avgPrice, 
    a.ActualCostPrice = b.avgPrice 
FROM L_Bill_Sales_Tab a
INNER JOIN 
(
    SELECT 
        billNumber, 
        SaleIdkey, 
        SUM(NumEx * CostPrice) / SUM(NumEx) AS avgPrice 
    FROM L_Bill_Sales_Tabs 
    WHERE EXISTS (SELECT 1 FROM Inserted WHERE BillNumber = L_Bill_Sales_Tabs.BillNumber)
    GROUP BY BillNumber, SaleIdkey
) b ON a.billnumber = b.BillNumber AND a.Idkey = b.SaleIdkey

SET NOCOUNT OFF
GO
