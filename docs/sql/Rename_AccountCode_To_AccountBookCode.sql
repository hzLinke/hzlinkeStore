USE [LinkDisV4]
GO

-- Rename column AccountCode to AccountBookCode in all tables
-- This script is case-insensitive (AccountCode matches AccountCode)

EXEC sp_rename '[dbo].[L_Basic_Accounts_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Area_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Cate_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Company_Area_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Company_Cate_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Company_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Customer_Price_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_K_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Post_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Product_Comb_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Product_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Project_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_SettlementType_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Shipper_Price_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Store_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_Subject_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_User_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Basic_UserManageCate_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_AreaExChange_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_AreaExChanges_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_AreaExChanges_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_PriceChange_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_PriceChanges_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Purchase_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Purchase_Tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_PurchaseOrder_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_PurchaseOrders_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Purchases_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Purchases_Tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Purchases_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_QuotedPrice_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sale_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sale_Tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sale_TabEx].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_SaleOrder_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_SaleOrders_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_Split_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_Tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_TabEx].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_Sales_view_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_SpecialOffer_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockChange_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockChanges_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockChanges_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockCheck_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockChecks_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockReceive_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockReceives_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockReceives_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSplit_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSplits_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSplits_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSwap_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSwaps_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StockSwaps_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StoreExChanges_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Bill_StoreExChanges_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_InOut_Area_tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_InOut_Cate_tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_InOut_Shipper_tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_InOut_tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_InOut_tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Area_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Cate_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Customer_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Customer_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Driver_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Driver_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_SalesMan_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_SalesMan_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_SalesPerson_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_SalesPerson_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Shipper_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Shipper_Tabs].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Store_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Tab#].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Group_Sale_Total_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Stock_Tab].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[L_Stock_Tab_Bak].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[Reports_ProductUnsalable].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[Reports_Stock].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[Reports_StockEx].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

EXEC sp_rename '[dbo].[Reports_StoreSale].[AccountCode]', 'AccountBookCode', 'COLUMN';
GO

