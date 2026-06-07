USE [LinkeDisV4]
GO

/****** Object:  View [dbo].[V_Stock_Tab]    Script Date: 2026-04-01 21:22:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[V_Stock_Tab] 
AS
/***
    计算得到库存表数量
    最后一日汇总数 + 采购 - 销售 + 损溢 - 仓位调拨 + 拆零 - 领用
***/
WITH BaseDate AS (
    SELECT TOP 1 CONVERT(VARCHAR(10), dat - 1, 120) AS At
    FROM l_sys_GroupInf_Tab
)
SELECT StoreCode, 
       AreaCode, 
       ProductCode,
       BatchNumber,
       CAST(SUM(Num) AS DECIMAL(18, 2)) AS Num,
       SUM(Money) AS Money,
       CASE WHEN CAST(SUM(Num) AS DECIMAL(18, 2)) = 0 
            THEN 0 
            ELSE SUM(Money) / SUM(Num) 
       END AS CostPrice  
FROM (
    -- 最后一日汇总数
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, EndNum AS Num, EndMoney AS Money
    FROM L_Group_InOut_tab
    WHERE at = (SELECT At FROM BaseDate)
    
    UNION ALL
    
    -- 采购(包括冲红)
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, numEx AS Num, numEx * CostPrice AS Money
    FROM V_Bill_Purchases_Tab
    WHERE DeliveryAt > (SELECT At FROM BaseDate)
      AND MrUserCode > 0
    
    UNION ALL
    
    -- 销售
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber,
           (numEx - replaceNumEx) * -1 * DoubleNumExBase * PackBase AS Num,
           (numEx - replaceNumEx) * CostPrice * -1 AS Money 
    FROM V_Bill_Sales_Tab
    WHERE DeliveryAt > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 变更
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, ChangeNum AS Num, ChangeNum * CostPrice AS Money
    FROM L_Bill_StockChanges_Tabs
    WHERE changeAt > (SELECT At FROM BaseDate)
    
    UNION ALL
    
    -- 仓位调拨
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * (ExChangeType * -1) AS Num, num * (ExChangeType * -1) * CostPrice AS Money
    FROM L_Bill_AreaExChanges_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 拆零
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * Type AS Num, num * Type * CostPrice AS Money
    FROM L_Bill_StockSwaps_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 领用
    SELECT StoreCode, AreaCode, ProductCode, '' as BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockReceives_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 加工出
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockSplits_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 加工入
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num AS Num, num * CostPrice AS Money
    FROM L_Bill_StockSplits_TabS
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
) x
GROUP BY StoreCode, AreaCode, ProductCode, BatchNumber




GO


