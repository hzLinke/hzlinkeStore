USE [LinkeDisV4]
GO

/****** Object:  Trigger [dbo].[Inventory_Deduct]    Script Date: 2026-04-08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Inventory_Deduct] 
ON [dbo].[L_Bill_Inventory_Tab]
FOR UPDATE
AS
SET NOCOUNT ON

IF UPDATE(Num)
BEGIN
    DECLARE @ProductCode VARCHAR(20)
    DECLARE @DeductNum DECIMAL(18, 4)
    DECLARE @BatchNum DECIMAL(18, 4)
    DECLARE @BatchNumber VARCHAR(50)

    SELECT @ProductCode = i.ProductCode, @DeductNum = ISNULL(d.Num, 0) - ISNULL(i.Num, 0)
    FROM Inserted i
    INNER JOIN Deleted d ON i.ProductCode = d.ProductCode
    WHERE d.Num > i.Num

    WHILE @DeductNum > 0
    BEGIN
        SELECT TOP(1) @BatchNumber = BatchNumber, @BatchNum = Num
        FROM L_Bill_InventoryDetail_Tab
        WHERE ProductCode = @ProductCode AND Num > 0
        ORDER BY BatchNumber

        IF @BatchNumber IS NULL
            BREAK

        IF @BatchNum >= @DeductNum
        BEGIN
            UPDATE L_Bill_InventoryDetail_Tab 
            SET Num = Num - @DeductNum
            WHERE ProductCode = @ProductCode AND BatchNumber = @BatchNumber

            SET @DeductNum = 0
        END
        ELSE
        BEGIN
            UPDATE L_Bill_InventoryDetail_Tab 
            SET Num = 0
            WHERE ProductCode = @ProductCode AND BatchNumber = @BatchNumber

            SET @DeductNum = @DeductNum - @BatchNum
        END
    END

    DELETE FROM L_Bill_InventoryDetail_Tab 
    WHERE ProductCode = @ProductCode AND Num <= 0
END

SET NOCOUNT OFF
GO
