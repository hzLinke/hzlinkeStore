
/****** Object:  View [dbo].[V_Stock]    Script Date: 2026-03-30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[V_Stock]
AS
WITH StockSummary AS (
    SELECT StoreCode, 
           AreaCode,
           ProductCode, 
           SUM(StockNum) AS Num,
           SUM(RuningNum) AS RuningNum,
           SUM(WaitIn) AS WaitInNum,
           SUM(WaitOut) AS WaitOutNum,
           MAX(costPrice) AS avgPrice,
           SUM(Money) AS SumMoney,
           CAST(SUM(StockNum) + SUM(WaitIn) - SUM(WaitOut) AS DECIMAL(18, 2)) AS AllowedNum
    FROM (
        SELECT StoreCode, AreaCode, ProductCode,BatchNumber, Num AS StockNum, 0 AS RuningNum, 0 AS WaitIn, 0 AS WaitOut, CostPrice, Money
        FROM V_Stock_tab
        UNION ALL
        SELECT StoreCode, AreaCode, ProductCode,BatchNumber, 0 AS StockNum, num AS RuningNum, 0 AS WaitIn, 0 AS WaitOut, 0 AS CostPrice, 0 AS Money
        FROM V_Stock_RunIng 
        UNION ALL
        SELECT StoreCode, AreaCode, ProductCode,BatchNumber, 0 AS StockNum, 0 AS RuningNum, num AS WaitIn, 0 AS WaitOut, 0 AS CostPrice, 0 AS Money
        FROM V_Stock_WaitIn 
        UNION ALL
        SELECT StoreCode, AreaCode, ProductCode,BatchNumber, 0 AS StockNum, 0 AS RuningNum, 0 AS WaitIn, num AS WaitOut, 0 AS CostPrice, 0 AS Money
        FROM V_Stock_WaitOut
    ) x
    GROUP BY StoreCode, AreaCode, ProductCode,BatchNumber
)
SELECT a.StoreCode, 
       a.AreaCode,
       a.ProductCode, 
       b.BarCode, 
       b.SelfCode, 
       b.PymCode, 
       b.Name,
       b.Spec,
       b.Pack,
       b.Unit, 
       b.Origin,
       b.Brand,  
       b.CateCode, 
       b.ShipperCode,
       b.LowerLimit,
       b.UpperLimit, 
       a.avgPrice,
       a.BatchNumber,
       a.Num, 
       a.RuningNum,
       a.WaitInNum, 
       a.WaitOutNum,
       a.AllowedNum,
       b.inPrice,
       a.AllowedNum * a.avgPrice AS SumMoney, 
       b.Note
FROM StockSummary a
INNER JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
WHERE a.Num <> 0 
   OR a.WaitInNum <> 0 
   OR a.WaitOutNum <> 0
   OR a.AllowedNum <> 0
GO


