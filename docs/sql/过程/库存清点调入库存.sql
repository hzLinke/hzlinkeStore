USE [LinkeDisV4]
GO

/****** Object:  StoredProcedure [dbo].[sp_Copy_Stock_FromCate]    Script Date: 2026-03-30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

-- exec sp_Copy_Stock_FromCate 'SC202311140001',101,''
ALTER PROCEDURE [dbo].[sp_Copy_Stock_FromCate] 
    @BillNumber VARCHAR(20),
    @AreaCode INT,
    @CateCodeList VARCHAR(MAX)
AS
/* 
***************************************************
    功能：调入现有库存(按分类调入)						
    参数：	
            @BillNumber    单号
            @AreaCode     仓库
            @CateCodeList 分类列表
    结果：
    作者：2019-03-24  张建明
**************************************************
*/
SET NOCOUNT ON

DECLARE @ChangeAt DATE,
        @OutMustDis BIT

SELECT @ChangeAt = changeAt 
FROM L_Bill_StockChange_Tab 
WHERE BillNumber = @BillNumber

SELECT @OutMustDis = OutMustDis 
FROM L_Sys_Parmars_Tab

IF @AreaCode = 0
BEGIN
    RAISERROR('请指定仓库，不能调入库存', 16, 1)
    RETURN 
END

IF (SELECT COUNT(BillNumber) FROM L_Bill_StockChanges_Tab WHERE billnumber = @BillNumber) > 0
BEGIN
    RAISERROR('当前单据已存在数据，不能调入库存', 16, 1)
    RETURN 
END

EXEC Sp_Build_StockEx @ChangeAt

INSERT INTO L_Bill_StockChanges_Tab (
    Idkey,
    StoreCode,
    AreaCode,
    ShipperCode,
    BillNumber,
    ProductCode,
    StockNum,
    num,
    BatchNumber,
    costprice,
    changeAt,
    at
)
SELECT @billNumber + '-' + dbo.SetNBit(RowId, '0', 4),
       1,
       CASE WHEN @AreaCode = 0 THEN AreaCode ELSE @AreaCode END AS AreaCode,
       0,
       @BillNumber,
       productCode,
       AllowedNum,
       0,
       @billNumber + '-' + dbo.SetNBit(RowId, '0', 4),
       avgPrice,
       @ChangeAt,
       GETDATE() 
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY ProductCode) AS RowId, *
    FROM V_Stock 
    WHERE AreaCode = @AreaCode 
      AND AllowedNum <> 0
) a

SET NOCOUNT OFF

GO



