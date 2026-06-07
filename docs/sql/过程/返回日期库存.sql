USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[Sp_GetDatStock]    Script Date: 2026-04-01 19:35:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[Sp_GetDatStock]
    @Dat SMALLDATETIME,
    @FilterEmptyBatch BIT = 0
AS
/***
    根据日期返回对应日期的库存
    最后一日汇总数 + 采购 - 销售 + 损溢 - 仓位调拨 + 拆零 - 领用
    @FilterEmptyBatch: 是否过滤批次为空的销售数据 1=过滤 0=不过滤
***/

SET NOCOUNT ON

DECLARE @EndGroupDat SMALLDATETIME

SELECT TOP 1 @EndGroupDat = CONVERT(VARCHAR(10), dat, 120)
FROM l_sys_GroupInf_Tab

SELECT StoreCode,
       AreaCode,
       ProductCode,
       BatchNumber,
       CAST(SUM(Num) AS DECIMAL(18, 2)) AS AllowedNum,
       SUM(Money) AS Money,
       CASE WHEN CAST(SUM(Num) AS DECIMAL(18, 2)) = 0
            THEN 0
            ELSE SUM(Money) / SUM(Num)
       END AS avgPrice
FROM (
    -- 最后一日汇总数
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, EndNum AS Num, EndMoney AS Money
    FROM L_Group_InOut_tab
    WHERE at = @EndGroupDat - 1

    UNION ALL

    -- 采购(包括冲红)
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, numEx AS Num, numEx * ActualCostPrice AS Money
    FROM V_Bill_Purchases_Tab
    WHERE DeliveryAt BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 销售
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber,
           (numEx - replaceNumEx) * -1 * DoubleNumExBase * PackBase AS Num,
           (numEx - replaceNumEx) * CostPrice * -1 AS Money
    FROM V_Bill_Sales_Tab
    WHERE DeliveryAt BETWEEN @EndGroupDat AND @Dat
        AND (@FilterEmptyBatch = 0 OR ISNULL(BatchNumber, '') <> '')

    UNION ALL

    -- 变更
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, ChangeNum AS Num, ChangeNum * CostPrice AS Money
    FROM L_Bill_StockChanges_Tabs
    WHERE changeAt BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 仓位调拨
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * (ExChangeType * -1) AS Num, num * (ExChangeType * -1) * CostPrice AS Money
    FROM L_Bill_AreaExChanges_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 拆零
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * Type AS Num, num * Type * CostPrice AS Money
    FROM L_Bill_StockSwaps_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 领用
    SELECT StoreCode, AreaCode, ProductCode, '' as BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockReceives_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 加工出
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockSplits_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 加工入
    SELECT StoreCode, AreaCode, ProductCode, BatchNumber, num AS Num, num * CostPrice AS Money
    FROM L_Bill_StockSplits_TabS
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0
) x
GROUP BY StoreCode, AreaCode, ProductCode, BatchNumber
