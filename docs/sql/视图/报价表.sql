/****** Object:  View [dbo].[V_Customer_Price_Tab]    Script Date: 2026-03-29 22:06:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[V_Customer_Price_Tab]
AS
SELECT 
    b.IdCode,
    b.BarCode,
    b.PymCode,
    b.SelfCode,
    a.aliasName AS Name,
    b.Spec,
    CASE WHEN c.DownUnitType = 1 AND a.SaleType = 0 THEN 4 ELSE a.SaleType END AS SaleType,
    CASE 
        WHEN a.SaleType = 3 THEN b.Punit 
        WHEN a.SaleType = 0 THEN c.DownUnit 
        ELSE b.Unit 
    END AS Unit,
    CASE 
        WHEN a.SaleType = 3 THEN b.inPrice * b.Pack 
        WHEN a.SaleType = 0 AND c.DownUnit = '公斤' THEN b.inPrice * 2 
        ELSE b.inPrice 
    END AS inPrice,
    b.CateCode,
    b.PicSrc,
    a.Note,
    a.Price,
    a.PCode,
    a.IdKey,
    a.MchCode,
    a.ProductCode,
    b.Pack,
    b.Brand,
    b.Origin,
    a.SerialNumber,
    a.CustomerProcudeCode,
    a.defaultShipperCode,
    a.QualityGrade,
    (SELECT SerialNum FROM L_Basic_Cate_Tab WHERE idcode = b.CateCode) AS cateSerialNum,
    (SELECT name FROM L_Basic_Cate_Tab WHERE idcode = b.CateCode) AS cateName
FROM (
    SELECT 
        a.IdKey,
        a.MchCode,
        a.PCode,
        a.ProductCode,
        a.SaleType,
        a.QualityGrade,
        a.aliasName,
        a.Price,
        a.SerialNumber,
        a.CustomerProcudeCode,
        a.defaultShipperCode,
        a.note
    FROM L_Basic_Customer_Price_Tab a
) AS a
LEFT JOIN (
    SELECT * 
    FROM L_Basic_Product_Tab 
    WHERE Status < 2
) AS b ON a.ProductCode = b.IdCode
LEFT JOIN V_Basic_Customer_Tab c ON a.PCode = c.IdCode
GO
