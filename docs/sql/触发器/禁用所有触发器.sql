-- 1. 检查触发器状态（精确查询）
SELECT 
    name AS 触发器名,
    is_disabled AS 是否禁用
FROM sys.triggers
WHERE parent_id = OBJECT_ID('L_Bill_Inventory_Tab')

-- 2. 检查表上所有触发器（包括禁用的）
SELECT 
    OBJECT_NAME(object_id) AS 触发器名,
    is_disabled
FROM sys.objects
WHERE type = 'TR' 
    AND parent_object_id = OBJECT_ID('L_Bill_Inventory_Tab')

-- 3. 如果表上有触发器，尝试禁用
-- 先检查准确的名字
DECLARE @TriggerName NVARCHAR(128)
DECLARE @SQL NVARCHAR(MAX)

DECLARE trigger_cursor CURSOR FOR
SELECT name FROM sys.triggers WHERE parent_id = OBJECT_ID('L_Bill_Inventory_Tab')

OPEN trigger_cursor
FETCH NEXT FROM trigger_cursor INTO @TriggerName

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'DISABLE TRIGGER [' + @TriggerName + '] ON [dbo].[L_Bill_Inventory_Tab]'
    PRINT @SQL
    EXEC sp_executesql @SQL
    
    FETCH NEXT FROM trigger_cursor INTO @TriggerName
END

CLOSE trigger_cursor
DEALLOCATE trigger_cursor
