USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[Sp_Build_PurchaseGoup_List]    Script Date: 2026-04-01 22:00:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER Proc [dbo].[Sp_Build_PurchaseGoup_List]
    @DeliveryAt VARCHAR(10) = NULL,
    @ShowOweOnly BIT = 1
AS
SET NOCOUNT ON

DECLARE @ImportStock BIT
SELECT @ImportStock = ISNULL(importStock, 0) FROM L_Sys_Parmars_Tab

DECLARE @StockTemp TABLE (
	StoreCode INT, 
	AreaCode INT, 
	ProductCode INT,
	BatchNumber VARCHAR(100),
	AllowedNum DECIMAL(18, 2),
	Money DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)
            
INSERT INTO @StockTemp (
	StoreCode, 
	AreaCode, 
	ProductCode,
	BatchNumber,
	AllowedNum,
	Money,
	avgPrice
)
EXEC Sp_GetDatStock @DeliveryAt,1

;WITH OrderBase AS (
    SELECT
        AreaCode,
        ProductCode,
        DeliveryAt,
        SUM(Num - replaceNumEx) AS Num,
        SUM(NumEx - replaceNumEx) AS NumEx,
        SUM(OweNum) AS OweNum,
        SUM(FreeNum) AS FreeNum,
        SUM(AcceptNum) AS AcceptNum,
        SUM(OweNumEx) AS OweNumEx,
        SUM(FreeNumEx) AS FreeNumEx,
        SUM(AcceptNumEx) AS AcceptNumEx,
        SUM(replaceNumEx) AS replaceNumEx,
        MIN(AcceptStatus) AS AcceptStatus,
        saleType,
        MIN(SerialNumber) AS SerialNumber,
        MAX(DownWg) AS DownWg,
        MAX(DownUnit) AS DownUnit,
        MAX(BillType) AS BillType
    FROM (
        SELECT
            AreaCode,
            ProductCode,
            DownWG,
            SerialNumber,
            BillType,
            CASE WHEN saleType = 4 THEN 0 ELSE SaleType END AS SaleType,
            CASE WHEN SaleType = 4 THEN MinUnit ELSE DownUnit END AS DownUnit,
            Num * DoubleNumBase AS Num,
            NumEx * DoubleNumExBase AS NumEx,
            OweNum * DoubleNumBase AS OweNum,
            OweNumEx * DoubleNumExBase AS OweNumEx,
            FreeNum * DoubleNumBase AS FreeNum,
            FreeNumEx * DoubleNumExBase AS FreeNumEx,
            AcceptNumEx * DoubleNumExBase AS AcceptNumEx,
            AcceptNum * DoubleNumBase AS AcceptNum,
            replaceNumEx * DoubleNumExBase AS replaceNumEx,
            DeliveryAt,
            AcceptStatus
        FROM V_Bill_SaleOrders_Tab_K
        WHERE examineUserCode <> 0
            AND (@DeliveryAt IS NULL OR DeliveryAt = @DeliveryAt)
    ) AS x
    GROUP BY DeliveryAt, AreaCode, ProductCode, SaleType
),
FinalResult AS (
    SELECT
        b.IdCode,
        a.ProductCode,
        b.Name,
        b.Name + ISNULL(b.Spec, '') AS ng,
        b.BarCode,
        b.PicSrc,
        b.Unit,
        b.PUnit,
        b.CateCode,
        a.BillType,
        c.Name AS cateName,
        c.SerialNum,
        a.SerialNumber,
        b.spec,
        a.Num AS Num,
        a.NumEx AS NumEx,
        a.AcceptNum AS AcceptNum,
        a.AcceptNumEx AS AcceptNumEx,
        a.FreeNum AS FreeNum,
        a.FreeNumEx AS FreeNumEx,
        a.replaceNumEx AS replaceNumEx,
        a.OweNum AS OweNum,
        a.OweNumEx AS OweNumEx,
        a.AcceptStatus AS Status,
        ROUND(b.Price1, 2) AS price,
        b.inPrice AS costPrice,
        a.DeliveryAt,
        a.SaleType,
        a.DownWg,
        a.DownUnit,
        CASE
            WHEN @ImportStock = 0 THEN 0
            ELSE CAST(
                ISNULL((SELECT SUM(AllowedNum) FROM @StockTemp WHERE a.AreaCode = AreaCode AND a.ProductCode = ProductCode), 0)
                AS DECIMAL(18, 2))
        END AS TempStock
    FROM OrderBase AS a
    LEFT JOIN L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode
    LEFT JOIN L_Basic_Cate_Tab AS c ON b.CateCode = c.IdCode
    WHERE (@ShowOweOnly = 0 OR a.OweNum > 0)
)
SELECT
    *,
    [dbo].[xb_trim](CASE WHEN SaleType = 3 THEN TempStock / NULLIF(DownWg, 0) ELSE TempStock END) AS Stock
FROM FinalResult
ORDER BY SerialNum ASC, SerialNumber ASC

SET NOCOUNT OFF
GO
