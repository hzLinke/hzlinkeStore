-- 检查表上所有触发器的状态
SELECT 
    t.name AS 触发器名称,
    t.is_disabled AS 是否禁用,
    CASE WHEN t.is_disabled = 0 THEN '启用' ELSE '禁用' END AS 状态
FROM sys.triggers t
WHERE parent_id = OBJECT_ID('L_Bill_Inventory_Tab')

-- 检查触发器详细信息
EXEC sp_helptrigger 'L_Bill_Inventory_Tab'
