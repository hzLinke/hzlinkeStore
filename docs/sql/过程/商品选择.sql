USE [LinkeDisV4]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductInfEx]    Script Date: 2026-04-08 03:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- exec Sp_GetProductInfEx '10001','',90004,1,0,0,0,'2024-05-05'
ALTER PROCEDURE [dbo].[Sp_GetProductInfEx]
    @inputText VARCHAR(100),
    @mchCode VARCHAR(20),
    @customerCode VARCHAR(50),
    @StoreCode INT,
    @AreaCode INT,
    @BillType INT,
    @IsS4 BIT,
    @Date SMALLDATETIME = '2024-05-01'
AS
/*
***************************************************
    功能：商品选择（PC端）
    参数：
        @inputText VARCHAR(100)  - 输入
        @mchCode VARCHAR(20)     - 用户账号
        @customerCode VARCHAR(50)- 客户
        @StoreCode INT           - 分店
        @AreaCode INT            - 柜组
        @BillType INT            - 单类，用以控制品态返回
        @IsS4 BIT                - 返回四周销
        @Date SMALLDATETIME      - 日期，用于返回对应日期的库存
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @Pcode BIGINT
DECLARE @importStock BIT
DECLARE @DownUnitType INT
DECLARE @priceLevel INT
DECLARE @qualityGrade INT
DECLARE @realCustomerCode VARCHAR(50)
DECLARE @needStock BIT

-- 获取导入可用量参数
SELECT @importStock = importStock
FROM L_Sys_Parmars_Tab

-- 获取计价单位与项目编码,质量级别
SELECT @DownUnitType = DownUnitType,
       @Pcode = Pcode,
       @qualityGrade = qualityGrade
FROM L_Basic_Company_Tab
WHERE IdCode = @customerCode

-- 处理报价单情况
IF @BillType = 302
BEGIN
    SET @realCustomerCode = '0'
END
ELSE IF @Pcode > 0
BEGIN
    -- 如果项目编码不为0，将取价客户设成本项目第一个客户
    SELECT TOP 1 @realCustomerCode = CAST(IdCode AS VARCHAR(50))
    FROM V_Basic_Customer_Tab
    WHERE PCode = @Pcode
    ORDER BY IdCode
END
ELSE
BEGIN
    SET @realCustomerCode = @customerCode
END

-- 判断是否需要库存
IF @BillType = 6 OR @BillType = 7 OR @BillType = 8 OR @BillType = 10 OR @importStock = 1
BEGIN
    SET @needStock = 1
    EXEC Sp_Build_Stock @Date
END
ELSE
BEGIN
    SET @needStock = 0
END

-- 获取客户价格级别
SELECT @priceLevel = priceLevel
FROM L_Basic_Company_Tab
WHERE IdCode = @realCustomerCode

-- 主查询
SELECT 
    b.IdCode,
    b.selfCode,
    b.PymCode,
    b.BarCode,
    c.CustomerProcudeCode,
    b.name AS BasicName,
    CASE WHEN c.ProductAliasName IS NULL THEN b.name ELSE c.ProductAliasName END AS name,
    CASE WHEN ISNULL(b.AliasName, '') = '' THEN b.name ELSE b.name + '/' + b.AliasName END AS AliasNameList,
    b.spec,
    b.weight,
    b.Pack,
    CASE WHEN b.SaleType = 2 AND @DownUnitType = 1 THEN '公斤' ELSE b.Unit END AS Unit,
    b.Punit,
    CASE WHEN b.SaleType = 0 AND @DownUnitType = 1 THEN '公斤' ELSE b.DownUnit END AS DownUnit,
    b.DownWgSpec,
    b.doMethod,
    b.ShipperCode,
    b.AreaCode,
    b.CateCode,
    (SELECT Name FROM l_Basic_Cate_Tab WHERE IdCode = b.CateCode) AS CateName,
    CASE WHEN b.SaleType = 0 AND @BillType <> 302 AND @DownUnitType = 1 THEN 4 ELSE b.SaleType END AS SaleType,
    b.inPrice * CASE WHEN (b.SaleType = 0 OR b.SaleType = 2) AND @DownUnitType = 1 THEN 2 ELSE 1 END AS inPrice,
    CASE 
        WHEN @needStock = 1 AND EXISTS(SELECT 1 FROM V_Stock_Get WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode) 
            THEN (SELECT CostPrice FROM V_Stock_Get WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode)
        ELSE CASE WHEN b.AvgCostPrice = 0 THEN b.inPrice ELSE b.AvgCostPrice END * CASE WHEN (b.SaleType = 0 OR b.SaleType = 2) AND @DownUnitType = 1 THEN 2 ELSE 1 END 
    END AS CostPrice,
	dbo.xb_trim(
        CASE WHEN c.ProductCode IS NULL 
            THEN b.Price1 * CASE WHEN (b.SaleType = 0 OR b.SaleType = 2) AND @DownUnitType = 1 THEN 2 ELSE 1 END 
            ELSE c.Price 
        END
    ) AS SalePrice,
    CASE WHEN c.ProductCode IS NULL THEN b.Note ELSE c.Note END AS Note,
    CASE WHEN c.ProductCode IS NULL THEN b.ShipperCode ELSE CASE WHEN c.defaultShipperCode < 2 THEN b.ShipperCode ELSE c.defaultShipperCode END END AS defaultShipperCode,
    CASE WHEN c.ProductCode IS NULL THEN 0 ELSE 1 END AS IsQuotedPrice,
    CASE WHEN c.ProductCode IS NULL THEN @qualityGrade ELSE ISNULL(c.qualityGrade, @qualityGrade) END AS qualityGrade,
    CASE WHEN @needStock = 1 THEN
        CASE WHEN @AreaCode = 0 THEN
            (SELECT CAST(ISNULL(SUM(AllowedNum), 0) AS DECIMAL(18, 2)) FROM V_Stock WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode)
        ELSE
            (SELECT CAST(ISNULL(SUM(AllowedNum), 0) AS DECIMAL(18, 2)) FROM V_Stock WHERE ProductCode = b.IdCode AND (AreaCode = @AreaCode OR @AreaCode = 0))
        END
    ELSE 0 END AS Stock,
    CASE WHEN @needStock = 1 THEN
        CASE WHEN @AreaCode = 0 THEN
            ISNULL((SELECT EndNum FROM Reports_Stock WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode), 0)
        ELSE
            ISNULL((SELECT EndNum FROM Reports_Stock WHERE ProductCode = b.IdCode AND AreaCode = @AreaCode), 0)
        END
    ELSE 0 END AS ToDayStock	
FROM V_SELECTProduct b
LEFT JOIN (
    SELECT 
        ProductCode,
        CustomerProcudeCode,
        AliasName,
        price,
        defaultShipperCode,
        SaleType,
        Note,
        AliasName AS ProductAliasName,
        qualityGrade
    FROM L_Basic_Customer_Price_Tab
    WHERE PCode = @realCustomerCode
) c ON b.IdCode = c.ProductCode 
    AND CASE WHEN b.SaleType = 2 THEN 0 ELSE b.SaleType END = c.SaleType
WHERE 
    -- 基础状态过滤
    b.status < 2
    -- 输入条件过滤
    AND (
        -- 数字输入：精确匹配IdCode
        (dbo.isChinese(@inputText) = 0 AND dbo.isEnglish(@inputText) = 0 AND b.IdCode = @inputText)
        OR
        -- 文本输入：模糊匹配Name或AliasName
        (dbo.isChinese(@inputText) = 1 OR dbo.isEnglish(@inputText) = 1) 
        AND (b.Name LIKE '%' + @inputText + '%' OR b.AliasName LIKE '%' + @inputText + '%')
    )
    -- 单据类型过滤
    AND (
        -- 需要过滤SaleType<2的单据类型
        (@BillType IN (6, 7, 8, 10, 22, 21) AND b.SaleType < 2)
        OR
        -- 不需要过滤SaleType的单据类型
        (@BillType NOT IN (6, 7, 8, 10, 22, 21))
        OR
        -- 单据类型6或7：移除状态限制
        (@BillType IN (6, 7))
    )
ORDER BY 
    CASE WHEN c.ProductCode IS NULL THEN 0 ELSE 1 END DESC,
    CAST(b.IdCode AS BIGINT)

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
