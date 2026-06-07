USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[sp_build_DownGroup]    Script Date: 2026-04-08 00:16:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_build_DownGroup] 
    @DeliveryAt SMALLDATETIME,
    @ShipperCode INT,
    @CateCode INT
AS
SET NOCOUNT ON

;WITH CTE_STOCKFROM AS
(
    SELECT 
        IdKey, 
        BillNumber, 
        ProductCode, 
        CustomerCode, 
        CustomerSelfCode, 
        customerName, 
        ISNULL(ShipperCode, 0) AS ShipperCode, 
        SaleType, 
        CASE WHEN @CateCode < 10000 THEN Num ELSE NumEx END AS OrderNum, 
        QualityGrade, 
        DisAt, 
        Note, 
        CASE WHEN @CateCode < 10000 THEN DownUnit ELSE Unit END AS DownUnit, 
        DeliveryAt, 
        CateCode, 
        costPrice
    FROM V_Shipper_DisDetail_Tab 
    WHERE DeliveryAt = @DeliveryAt  
        AND (@ShipperCode = 0 OR ShipperCode = @ShipperCode)
        AND (@CateCode = 0 OR 
            CASE WHEN @CateCode < 10000 THEN CateCode / 100 ELSE CateCode END = @CateCode)
)
SELECT 
    a.ShipperCode,
    a.BillNumber AS BillNumberList,
    a.SaleType,
    a.costprice,
    0 AS TempStock,
    CASE WHEN a.ShipperCode = 0 THEN '备用存货' 
        ELSE (SELECT name FROM L_Basic_Company_Tab WHERE idcode = a.ShipperCode) 
    END AS ShipperName,
    (SELECT TOP 1 ExamineUserCode FROM L_Bill_PurchaseOrder_Tab WHERE BillNumber = a.BillNumber) AS ExamineUserCode,
    a.ProductCode,
    b.name + ISNULL(spec, '') AS Name,
    a.PackList,
    a.TotalNum 
FROM 
(
    SELECT 
        MIN(IdKey) AS IdKey,
        DeliveryAt,
        ShipperCode,
        ProductCode,
        SaleType,
        BillNumber,
        [dbo].[xb_trim](SUM(OrderNum)) + MIN(DownUnit) AS TotalNum,
        STUFF
        (
            (
                SELECT '；' + customerName + '[' + [dbo].[xb_trim](OrderNum) + DownUnit
                    + CASE WHEN ISNULL(Note, '') = '' THEN '' ELSE '(' + Note + ')' END
                    + CASE WHEN QualityGrade = 0 THEN '' ELSE '次' END + ']'
                FROM CTE_STOCKFROM 
                WHERE ShipperCode = x.ShipperCode AND ProductCode = x.ProductCode AND SaleType = x.SaleType  
                ORDER BY orderNum DESC FOR XML PATH('')
            ), 1, 1, ''
        ) AS PackList,
        MAX(costPrice) AS CostPrice
    FROM CTE_STOCKFROM x 
    GROUP BY DeliveryAt, BillNumber, ShipperCode, ProductCode, SaleType
) a, L_Basic_Product_Tab b 
WHERE a.ProductCode = b.Idcode 
ORDER BY a.ShipperCode, a.Idkey

SET NOCOUNT OFF
GO
