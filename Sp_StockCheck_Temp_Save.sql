USE [LinkeDisV4]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      System
-- Create date: 2026-05-22
-- Description: 保存库存盘点临时数据，存在则更新，不存在则插入
-- =============================================
CREATE PROCEDURE [dbo].[Sp_StockCheck_Temp_Save]
    @ProductCode VARCHAR(20) = NULL,
    @QualityGrade INT = NULL,
    @SaleType INT = NULL,
    @StockNum DECIMAL(18, 2) = NULL,
    @CheckNum DECIMAL(18, 2) = NULL,
    @UserCode INT = NULL,
    @CheckDate SMALLDATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ExistingIdKey VARCHAR(20)

    -- 根据 ProductCode, QualityGrade, SaleType 查询是否已存在
    SELECT @ExistingIdKey = IdKey 
    FROM [dbo].[L_StockCheck_Temp_Tab]
    WHERE ProductCode = @ProductCode 
      AND QualityGrade = @QualityGrade 
      AND SaleType = @SaleType
      AND CheckDate = @CheckDate

    IF @ExistingIdKey IS NOT NULL
    BEGIN
        -- 存在则更新
        UPDATE [dbo].[L_StockCheck_Temp_Tab]
        SET StockNum = @StockNum,
            CheckNum = @CheckNum,
            UserCode = @UserCode
        WHERE IdKey = @ExistingIdKey
    END
    ELSE
    BEGIN
        -- 不存在则插入，生成新的 IdKey
        SET @ExistingIdKey = @ProductCode + '_' + CAST(@QualityGrade AS VARCHAR(10)) + '_' + CAST(@SaleType AS VARCHAR(10)) + '_' + REPLACE(CONVERT(VARCHAR(10), @CheckDate, 120), '-', '')
        
        INSERT INTO [dbo].[L_StockCheck_Temp_Tab] (IdKey, ProductCode, QualityGrade, SaleType, StockNum, CheckNum, UserCode, CheckDate)
        VALUES (@ExistingIdKey, @ProductCode, @QualityGrade, @SaleType, @StockNum, @CheckNum, @UserCode, @CheckDate)
    END

    SET NOCOUNT OFF;
END
GO
