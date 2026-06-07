USE [LinkeDisV4]
GO
/****** Object:  StoredProcedure [dbo].[sp_Calculate_Loss]    Script Date: 2026-04-01 20:07:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER Proc [dbo].[sp_Calculate_Loss]
    @DeliveryAt SMALLDATETIME ,
	@UpdateType Int
AS
/*
***************************************************
    功能：计算当日损耗
    参数：
        @DeliveryAt 送货日期
**************************************************
*/

SET NOCOUNT ON

DECLARE @LossMoney FLOAT
DECLARE @SaleNum FLOAT
DECLARE @SaleTotalNum FLOAT



DECLARE @ProductLoss TABLE (
    ProductCode INT,
	BatchNumber VARCHAR(50),
    LossMoney FLOAT
)

INSERT INTO @ProductLoss (
    ProductCode,
	BatchNumber,
    LossMoney
)
SELECT ProductCode,
		BatchNumber,
       SUM(ChangeNum * CostPrice) 
FROM L_Bill_StockChanges_Tabs 
WHERE ChangeAt = @DeliveryAt 
  AND ChangeNum <> 0
GROUP BY ProductCode,BatchNumber


UPDATE a 
SET a.LossMoney = a.LossMoney + b.Rate * b.LossMoney * @UpdateType , 
	a.ActualCostPrice = a.costprice + (a.LossMoney + b.Rate * b.LossMoney * @UpdateType ) *-1 / a.numEx 
FROM L_Bill_Sales_Tab a 
INNER JOIN (
    SELECT a.IdKey,
           a.BillNumber,
           a.ProductCode,
		   a.BatchNumber,
           a.NumEx,
           CONVERT(DECIMAL(18,2), a.NumEx * 1.0 / SUM(a.NumEx) OVER(PARTITION BY a.ProductCode,a.BatchNumber)) AS Rate,
           b.LossMoney 
    FROM V_Bill_Sales_Tab a 
    INNER JOIN @ProductLoss b ON a.ProductCode = b.ProductCode
    WHERE a.DeliveryAt = @DeliveryAt 
		AND a.BatchNumber = b.BatchNumber 
		AND a.LossAllocation = 1
) b ON a.IdKey = b.IdKey

SET NOCOUNT OFF
