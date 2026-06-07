USE [LinkeDisV4]
GO
/****** Object:  View [dbo].[V_WxPower]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_WxPower]'))
DROP VIEW [dbo].[V_WxPower]
GO
/****** Object:  View [dbo].[V_Wx_Templated_Num_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Templated_Num_Tab]'))
DROP VIEW [dbo].[V_Wx_Templated_Num_Tab]
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Tab]'))
DROP VIEW [dbo].[V_Wx_Bill_Purchase_Tab]
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Return_Tab]'))
DROP VIEW [dbo].[V_Wx_Bill_Purchase_Return_Tab]
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Entry_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Entry_Tab]'))
DROP VIEW [dbo].[V_Wx_Bill_Purchase_Entry_Tab]
GO
/****** Object:  View [dbo].[V_StockCheck_Temp_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_StockCheck_Temp_Tab]'))
DROP VIEW [dbo].[V_StockCheck_Temp_Tab]
GO
/****** Object:  View [dbo].[V_Stock_RunIng]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_RunIng]'))
DROP VIEW [dbo].[V_Stock_RunIng]
GO
/****** Object:  View [dbo].[V_Shop_User_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shop_User_Tab]'))
DROP VIEW [dbo].[V_Shop_User_Tab]
GO
/****** Object:  View [dbo].[V_Shipper_Price_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_Price_Tab]'))
DROP VIEW [dbo].[V_Shipper_Price_Tab]
GO
/****** Object:  View [dbo].[V_Shipper_AcceptList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_AcceptList_Tab]'))
DROP VIEW [dbo].[V_Shipper_AcceptList_Tab]
GO
/****** Object:  View [dbo].[V_SelectProduct]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_SelectProduct]'))
DROP VIEW [dbo].[V_SelectProduct]
GO
/****** Object:  View [dbo].[V_SaleBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_SaleBatchNotMatch]'))
DROP VIEW [dbo].[V_SaleBatchNotMatch]
GO
/****** Object:  View [dbo].[V_Reports_SaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleOrder]'))
DROP VIEW [dbo].[V_Reports_SaleOrder]
GO
/****** Object:  View [dbo].[V_Reports_SaleEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleEx]'))
DROP VIEW [dbo].[V_Reports_SaleEx]
GO
/****** Object:  View [dbo].[V_Reports_ResPay]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_ResPay]'))
DROP VIEW [dbo].[V_Reports_ResPay]
GO
/****** Object:  View [dbo].[V_Reports_Rec]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Rec]'))
DROP VIEW [dbo].[V_Reports_Rec]
GO
/****** Object:  View [dbo].[V_Reports_PurchaseOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_PurchaseOrder]'))
DROP VIEW [dbo].[V_Reports_PurchaseOrder]
GO
/****** Object:  View [dbo].[V_Reports_Pay]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Pay]'))
DROP VIEW [dbo].[V_Reports_Pay]
GO
/****** Object:  View [dbo].[V_Reports_Dis]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Dis]'))
DROP VIEW [dbo].[V_Reports_Dis]
GO
/****** Object:  View [dbo].[V_Reports_AcceptAndDis]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_AcceptAndDis]'))
DROP VIEW [dbo].[V_Reports_AcceptAndDis]
GO
/****** Object:  View [dbo].[V_Report_StoreExChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StoreExChange]'))
DROP VIEW [dbo].[V_Report_StoreExChange]
GO
/****** Object:  View [dbo].[V_Report_StockSwap]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockSwap]'))
DROP VIEW [dbo].[V_Report_StockSwap]
GO
/****** Object:  View [dbo].[V_Report_StockReceive]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockReceive]'))
DROP VIEW [dbo].[V_Report_StockReceive]
GO
/****** Object:  View [dbo].[V_Report_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockCheck]'))
DROP VIEW [dbo].[V_Report_StockCheck]
GO
/****** Object:  View [dbo].[V_Report_StockChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockChange]'))
DROP VIEW [dbo].[V_Report_StockChange]
GO
/****** Object:  View [dbo].[V_Report_PayGroup_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayGroup_Tab]'))
DROP VIEW [dbo].[V_Report_PayGroup_Tab]
GO
/****** Object:  View [dbo].[V_Report_AreaExChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_AreaExChange]'))
DROP VIEW [dbo].[V_Report_AreaExChange]
GO
/****** Object:  View [dbo].[V_PurchaeBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_PurchaeBatchNotMatch]'))
DROP VIEW [dbo].[V_PurchaeBatchNotMatch]
GO
/****** Object:  View [dbo].[V_Product_Comb_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Product_Comb_Tab]'))
DROP VIEW [dbo].[V_Product_Comb_Tab]
GO
/****** Object:  View [dbo].[V_Prodcut]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Prodcut]'))
DROP VIEW [dbo].[V_Prodcut]
GO
/****** Object:  View [dbo].[V_Offer]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Offer]'))
DROP VIEW [dbo].[V_Offer]
GO
/****** Object:  View [dbo].[V_NotOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_NotOrder]'))
DROP VIEW [dbo].[V_NotOrder]
GO
/****** Object:  View [dbo].[V_Login_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Login_Tab]'))
DROP VIEW [dbo].[V_Login_Tab]
GO
/****** Object:  View [dbo].[V_GroupMaxAt]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GroupMaxAt]'))
DROP VIEW [dbo].[V_GroupMaxAt]
GO
/****** Object:  View [dbo].[V_Group_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Group_Sale_Tab]'))
DROP VIEW [dbo].[V_Group_Sale_Tab]
GO
/****** Object:  View [dbo].[V_Group_Sale_Customer_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Group_Sale_Customer_Tabs]'))
DROP VIEW [dbo].[V_Group_Sale_Customer_Tabs]
GO
/****** Object:  View [dbo].[V_Customer_Study_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Study_Tab]'))
DROP VIEW [dbo].[V_Customer_Study_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StoreExChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StoreExChanges_Tab]'))
DROP VIEW [dbo].[V_Bill_StoreExChanges_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StoreExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StoreExChange_Tab]'))
DROP VIEW [dbo].[V_Bill_StoreExChange_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockSwaps_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSwaps_Tab]'))
DROP VIEW [dbo].[V_Bill_StockSwaps_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockSwap_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSwap_Tab]'))
DROP VIEW [dbo].[V_Bill_StockSwap_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockSplits_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplits_Tabs]'))
DROP VIEW [dbo].[V_Bill_StockSplits_Tabs]
GO
/****** Object:  View [dbo].[V_Bill_StockSplits_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplits_Tab]'))
DROP VIEW [dbo].[V_Bill_StockSplits_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockSplit_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplit_Tab]'))
DROP VIEW [dbo].[V_Bill_StockSplit_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockReceives_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockReceives_Tab]'))
DROP VIEW [dbo].[V_Bill_StockReceives_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockReceive_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockReceive_Tab]'))
DROP VIEW [dbo].[V_Bill_StockReceive_Tab]
GO
/****** Object:  View [dbo].[V_Bill_StockChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockChange_Tab]'))
DROP VIEW [dbo].[V_Bill_StockChange_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Sales_view_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_view_Tab]'))
DROP VIEW [dbo].[V_Bill_Sales_view_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tab_FromNoTUpdate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tab_FromNoTUpdate]'))
DROP VIEW [dbo].[V_Bill_Sales_Tab_FromNoTUpdate]
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Add_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Add_Tab]'))
DROP VIEW [dbo].[V_Bill_SaleOrders_Add_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Sale_TabEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_TabEx]'))
DROP VIEW [dbo].[V_Bill_Sale_TabEx]
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Return_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchase_Return_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Purchase_ExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_ExChange_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchase_ExChange_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Entry_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Entry_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchase_Entry_Tab]
GO
/****** Object:  View [dbo].[V_Bill_PriceChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PriceChanges_Tab]'))
DROP VIEW [dbo].[V_Bill_PriceChanges_Tab]
GO
/****** Object:  View [dbo].[V_Bill_PriceChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PriceChange_Tab]'))
DROP VIEW [dbo].[V_Bill_PriceChange_Tab]
GO
/****** Object:  View [dbo].[V_Bill_AreaExChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_AreaExChanges_Tab]'))
DROP VIEW [dbo].[V_Bill_AreaExChanges_Tab]
GO
/****** Object:  View [dbo].[V_Bill_AreaExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_AreaExChange_Tab]'))
DROP VIEW [dbo].[V_Bill_AreaExChange_Tab]
GO
/****** Object:  View [dbo].[V_Basic_User_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_User_Tab]'))
DROP VIEW [dbo].[V_Basic_User_Tab]
GO
/****** Object:  View [dbo].[V_Basic_Shipper_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Shipper_Tab]'))
DROP VIEW [dbo].[V_Basic_Shipper_Tab]
GO
/****** Object:  View [dbo].[V_Basic_Product_Comb_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Product_Comb_Tab]'))
DROP VIEW [dbo].[V_Basic_Product_Comb_Tab]
GO
/****** Object:  View [dbo].[V_Basic_CustomerAndStore_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_CustomerAndStore_Tab]'))
DROP VIEW [dbo].[V_Basic_CustomerAndStore_Tab]
GO
/****** Object:  View [dbo].[V_Basic_Company_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Company_Tab]'))
DROP VIEW [dbo].[V_Basic_Company_Tab]
GO
/****** Object:  View [dbo].[V_Basic_Company_Area_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Company_Area_Tab]'))
DROP VIEW [dbo].[V_Basic_Company_Area_Tab]
GO
/****** Object:  View [dbo].[V_Basic_Cate_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Cate_Tab]'))
DROP VIEW [dbo].[V_Basic_Cate_Tab]
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Tab_K]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Tab_K]'))
DROP VIEW [dbo].[V_Bill_SaleOrders_Tab_K]
GO
/****** Object:  View [dbo].[v_Bill_SaleOrder_K]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Bill_SaleOrder_K]'))
DROP VIEW [dbo].[v_Bill_SaleOrder_K]
GO
/****** Object:  View [dbo].[V_Basic_K_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_K_Tab]'))
DROP VIEW [dbo].[V_Basic_K_Tab]
GO
/****** Object:  View [dbo].[V_Reports_SaleList]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleList]'))
DROP VIEW [dbo].[V_Reports_SaleList]
GO
/****** Object:  View [dbo].[V_Reports_Sale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Sale]'))
DROP VIEW [dbo].[V_Reports_Sale]
GO
/****** Object:  View [dbo].[V_Reports_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Purchase]'))
DROP VIEW [dbo].[V_Reports_Purchase]
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchase_Tab]
GO
/****** Object:  View [dbo].[V_Customer_Price_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Price_Tab]'))
DROP VIEW [dbo].[V_Customer_Price_Tab]
GO
/****** Object:  View [dbo].[V_Stock_Detail]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Detail]'))
DROP VIEW [dbo].[V_Stock_Detail]
GO
/****** Object:  View [dbo].[V_Bill_Distribution_DetialEx_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_DetialEx_Tab]'))
DROP VIEW [dbo].[V_Bill_Distribution_DetialEx_Tab]
GO
/****** Object:  View [dbo].[V_Bill_QuotedPrices_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_QuotedPrices_Tab]'))
DROP VIEW [dbo].[V_Bill_QuotedPrices_Tab]
GO
/****** Object:  View [dbo].[V_Bill_QuotedPrice_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_QuotedPrice_Tab]'))
DROP VIEW [dbo].[V_Bill_QuotedPrice_Tab]
GO
/****** Object:  View [dbo].[V_BatchNumberPurchase_To]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_BatchNumberPurchase_To]'))
DROP VIEW [dbo].[V_BatchNumberPurchase_To]
GO
/****** Object:  View [dbo].[V_BatchNumberSale_From]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_BatchNumberSale_From]'))
DROP VIEW [dbo].[V_BatchNumberSale_From]
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tabs]'))
DROP VIEW [dbo].[V_Bill_Sales_Tabs]
GO
/****** Object:  View [dbo].[V_Bill_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_Tab]'))
DROP VIEW [dbo].[V_Bill_Sale_Tab]
GO
/****** Object:  View [dbo].[V_Stock_m]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_m]'))
DROP VIEW [dbo].[V_Stock_m]
GO
/****** Object:  View [dbo].[V_Stock_Q]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Q]'))
DROP VIEW [dbo].[V_Stock_Q]
GO
/****** Object:  View [dbo].[V_Bill_Sales_Split_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Split_Tab]'))
DROP VIEW [dbo].[V_Bill_Sales_Split_Tab]
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Group_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Group_Tab]'))
DROP VIEW [dbo].[V_Bill_SaleOrders_Group_Tab]
GO
/****** Object:  View [dbo].[V_Purchase_Group_List_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_List_Tab]'))
DROP VIEW [dbo].[V_Purchase_Group_List_Tab]
GO
/****** Object:  View [dbo].[V_Report_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Purchase_Tab]'))
DROP VIEW [dbo].[V_Report_Purchase_Tab]
GO
/****** Object:  View [dbo].[V_Report_PurchaseOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PurchaseOrder_Tab]'))
DROP VIEW [dbo].[V_Report_PurchaseOrder_Tab]
GO
/****** Object:  View [dbo].[V_Shipper_AcceptList_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_AcceptList_Tabs]'))
DROP VIEW [dbo].[V_Shipper_AcceptList_Tabs]
GO
/****** Object:  View [dbo].[V_CalcCostPrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_CalcCostPrice]'))
DROP VIEW [dbo].[V_CalcCostPrice]
GO
/****** Object:  View [dbo].[V_Bill_StockChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockChanges_Tab]'))
DROP VIEW [dbo].[V_Bill_StockChanges_Tab]
GO
/****** Object:  View [dbo].[V_Report_RecList_Month_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecList_Month_Tab]'))
DROP VIEW [dbo].[V_Report_RecList_Month_Tab]
GO
/****** Object:  View [dbo].[V_Report_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Sale_Tab]'))
DROP VIEW [dbo].[V_Report_Sale_Tab]
GO
/****** Object:  View [dbo].[V_Report_SaleOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_SaleOrder_Tab]'))
DROP VIEW [dbo].[V_Report_SaleOrder_Tab]
GO
/****** Object:  View [dbo].[V_Report_RecList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecList_Tab]'))
DROP VIEW [dbo].[V_Report_RecList_Tab]
GO
/****** Object:  View [dbo].[V_Report_RecGroup_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecGroup_Tab]'))
DROP VIEW [dbo].[V_Report_RecGroup_Tab]
GO
/****** Object:  View [dbo].[V_Report_PayList_Month_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayList_Month_Tab]'))
DROP VIEW [dbo].[V_Report_PayList_Month_Tab]
GO
/****** Object:  View [dbo].[V_Report_PayList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayList_Tab]'))
DROP VIEW [dbo].[V_Report_PayList_Tab]
GO
/****** Object:  View [dbo].[V_Wx_Bill_Sale_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Sale_Return_Tab]'))
DROP VIEW [dbo].[V_Wx_Bill_Sale_Return_Tab]
GO
/****** Object:  View [dbo].[V_Wx_Bill_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Sale_Tab]'))
DROP VIEW [dbo].[V_Wx_Bill_Sale_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Group_Tab_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Group_Tab_FromShipper]'))
DROP VIEW [dbo].[V_Bill_Distribution_Group_Tab_FromShipper]
GO
/****** Object:  View [dbo].[V_StockFrom]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_StockFrom]'))
DROP VIEW [dbo].[V_StockFrom]
GO
/****** Object:  View [dbo].[V_Bill_PurchaseOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PurchaseOrder_Tab]'))
DROP VIEW [dbo].[V_Bill_PurchaseOrder_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Sale_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_Return_Tab]'))
DROP VIEW [dbo].[V_Bill_Sale_Return_Tab]
GO
/****** Object:  View [dbo].[V_Bill_SaleOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrder_Tab]'))
DROP VIEW [dbo].[V_Bill_SaleOrder_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Detial_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Detial_Tab]'))
DROP VIEW [dbo].[V_Bill_Distribution_Detial_Tab]
GO
/****** Object:  View [dbo].[V_Bill_PurchaseOrders_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PurchaseOrders_Tab]'))
DROP VIEW [dbo].[V_Bill_PurchaseOrders_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Purchases_Detail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchases_Detail_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchases_Detail_Tab]
GO
/****** Object:  View [dbo].[V_Purchase_Group_Detail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_Detail_Tab]'))
DROP VIEW [dbo].[V_Purchase_Group_Detail_Tab]
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Tab]'))
DROP VIEW [dbo].[V_Bill_SaleOrders_Tab]
GO
/****** Object:  View [dbo].[V_Stock_Get]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Get]'))
DROP VIEW [dbo].[V_Stock_Get]
GO
/****** Object:  View [dbo].[V_Purchase_Group_DetailEx_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_DetailEx_Tab]'))
DROP VIEW [dbo].[V_Purchase_Group_DetailEx_Tab]
GO
/****** Object:  View [dbo].[V_Report_Stock_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Stock_Tab]'))
DROP VIEW [dbo].[V_Report_Stock_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Group_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Group_Tab]'))
DROP VIEW [dbo].[V_Bill_Distribution_Group_Tab]
GO
/****** Object:  View [dbo].[V_Stock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock]'))
DROP VIEW [dbo].[V_Stock]
GO
/****** Object:  View [dbo].[V_Stock_WaitOuts]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitOuts]'))
DROP VIEW [dbo].[V_Stock_WaitOuts]
GO
/****** Object:  View [dbo].[V_Stock_WaitIn]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitIn]'))
DROP VIEW [dbo].[V_Stock_WaitIn]
GO
/****** Object:  View [dbo].[V_Stock_WaitOut]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitOut]'))
DROP VIEW [dbo].[V_Stock_WaitOut]
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tab]'))
DROP VIEW [dbo].[V_Bill_Sales_Tab]
GO
/****** Object:  View [dbo].[V_Stock_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Tab]'))
DROP VIEW [dbo].[V_Stock_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Purchases_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchases_Tab]'))
DROP VIEW [dbo].[V_Bill_Purchases_Tab]
GO
/****** Object:  View [dbo].[V_Shipper_DisDetail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_DisDetail_Tab]'))
DROP VIEW [dbo].[V_Shipper_DisDetail_Tab]
GO
/****** Object:  View [dbo].[V_Prodcut_From_Favorite]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Prodcut_From_Favorite]'))
DROP VIEW [dbo].[V_Prodcut_From_Favorite]
GO
/****** Object:  View [dbo].[V_Customer_Favorite_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Favorite_Tab]'))
DROP VIEW [dbo].[V_Customer_Favorite_Tab]
GO
/****** Object:  View [dbo].[V_Bill_Sales_TabEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_TabEx]'))
DROP VIEW [dbo].[V_Bill_Sales_TabEx]
GO
/****** Object:  View [dbo].[V_Basic_Customer_Tab]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Customer_Tab]'))
DROP VIEW [dbo].[V_Basic_Customer_Tab]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SP_UpdateStock]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePower]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_UpdatePower]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_UpdatePower]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockSwap]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockSwap]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_StockSwap]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockSplit]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockSplit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_StockSplit]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockReceive]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockReceive]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_StockReceive]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockChange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_StockChange]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleSplit]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleSplit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_SaleSplit]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleOrder_Add]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleOrder_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_SaleOrder_Add]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_SaleOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleCheckReports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleCheckReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_SaleCheckReports]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleBatchCheckReports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleBatchCheckReports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_SaleBatchCheckReports]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale_Return]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale_Return]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Sale_Return]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale_Entry]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale_Entry]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Sale_Entry]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Sale]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_QuotedPrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_QuotedPrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_QuotedPrice]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_PurchaseOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_PurchaseOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_PurchaseOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Return]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Return]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Purchase_Return]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Pc(作废)]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Pc(作废)]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Purchase_Pc(作废)]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Mr]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Mr]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Purchase_Mr]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_ExChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_ExChange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Purchase_ExChange]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_Purchase]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_PriceChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_PriceChange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_PriceChange]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_DisTribution]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_DisTribution]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_DisTribution]
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_AreaExChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_AreaExChange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Upd_AreaExChange]
GO
/****** Object:  StoredProcedure [dbo].[Sp_TransferStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_TransferStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_TransferStock]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_single]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_single]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferShipper_single]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_QualityGrade]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_QualityGrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferShipper_QualityGrade]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_Ex]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_Ex]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferShipper_Ex]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferShipper]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferQualityGrade]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferQualityGrade]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferQualityGrade]
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferPCate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferPCate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TransferPCate]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Transfer_Free]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Transfer_Free]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Transfer_Free]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Transfer_Cancel]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Transfer_Cancel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Transfer_Cancel]
GO
/****** Object:  StoredProcedure [dbo].[sp_ToSotckCheck]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ToSotckCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ToSotckCheck]
GO
/****** Object:  StoredProcedure [dbo].[sp_ToSale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ToSale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ToSale]
GO
/****** Object:  StoredProcedure [dbo].[sp_To_Favorite]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_To_Favorite]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_To_Favorite]
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectChange]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SubjectChange]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SubjectChange]
GO
/****** Object:  StoredProcedure [dbo].[sp_Subject_Ins_Rec]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Subject_Ins_Rec]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Subject_Ins_Rec]
GO
/****** Object:  StoredProcedure [dbo].[sp_Subject_Ins_Pay]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Subject_Ins_Pay]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Subject_Ins_Pay]
GO
/****** Object:  StoredProcedure [dbo].[Sp_StockSplits_Copy]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_StockSplits_Copy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_StockSplits_Copy]
GO
/****** Object:  StoredProcedure [dbo].[Sp_StockSplit_Copy]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_StockSplit_Copy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_StockSplit_Copy]
GO
/****** Object:  StoredProcedure [dbo].[Sp_SplitSale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SplitSale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_SplitSale]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ShipperAcceptOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_ShipperAcceptOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_ShipperAcceptOrder]
GO
/****** Object:  StoredProcedure [dbo].[Sp_SendOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SendOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_SendOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderUnToSale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderUnToSale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaleOrderUnToSale]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToSale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToSale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaleOrderToSale]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToPurchasOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToPurchasOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaleOrderToPurchasOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToPurchaseTemp]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToPurchaseTemp]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaleOrderToPurchaseTemp]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderAddToSaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderAddToSaleOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_SaleOrderAddToSaleOrder]
GO
/****** Object:  StoredProcedure [dbo].[Sp_SaleOrder_Temp_Clear]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SaleOrder_Temp_Clear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_SaleOrder_Temp_Clear]
GO
/****** Object:  StoredProcedure [dbo].[sp_Rec_Pc]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rec_Pc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Rec_Pc]
GO
/****** Object:  StoredProcedure [dbo].[sp_Rec]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rec]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Rec]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Merge]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Merge]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Merge]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Load_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Load_Shipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Load_Shipper]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Load]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Load]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Load]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Import]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Import]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Import]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_GetNotExists]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_GetNotExists]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_GetNotExists]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Copy_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Copy_Shipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Copy_Shipper]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Copy]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Copy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Copy]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Clear_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Clear_Shipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Clear_Shipper]
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Clear]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Clear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_QuotedPrice_Clear]
GO
/****** Object:  StoredProcedure [dbo].[Sp_PushBackCheckStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_PushBackCheckStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_PushBackCheckStock]
GO
/****** Object:  StoredProcedure [dbo].[Sp_PushBack_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_PushBack_StockCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_PushBack_StockCheck]
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseToSaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseToSaleOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PurchaseToSaleOrder]
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseOrderToPurchase_repeat]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseOrderToPurchase_repeat]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PurchaseOrderToPurchase_repeat]
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseOrderToPurchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseOrderToPurchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PurchaseOrderToPurchase]
GO
/****** Object:  StoredProcedure [dbo].[sp_Pay_Pc]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Pay_Pc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Pay_Pc]
GO
/****** Object:  StoredProcedure [dbo].[sp_Pay]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Pay]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Pay]
GO
/****** Object:  StoredProcedure [dbo].[Sp_OrderToQuotePrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_OrderToQuotePrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_OrderToQuotePrice]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Load]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Load]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Offer_Load]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Copy]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Copy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Offer_Copy]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Clear]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Clear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Offer_Clear]
GO
/****** Object:  StoredProcedure [dbo].[Sp_LoadCustomerPrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_LoadCustomerPrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_LoadCustomerPrice]
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertQuotePrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_InsertQuotePrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_InsertQuotePrice]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ImportData_Update]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_ImportData_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_ImportData_Update]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_Sale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_Sale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Group_Sale]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_InOut_Copy]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_InOut_Copy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Group_InOut_Copy]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_InOut]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_InOut]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Group_InOut]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_Extend]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_Extend]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Group_Extend]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_End]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_End]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Group_End]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSaleBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetSaleBatchNotMatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetSaleBatchNotMatch]
GO
/****** Object:  StoredProcedure [dbo].[sp_getRate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getRate]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPurchaeBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPurchaeBatchNotMatch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetPurchaeBatchNotMatch]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductInfEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProductInfEx]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetProductInfEx]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductInf]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProductInf]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetProductInf]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProduct(作废)]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProduct(作废)]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetProduct(作废)]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPriceLogs]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPriceLogs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetPriceLogs]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPageList]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPageList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetPageList]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetFoodMenu]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetFoodMenu]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetFoodMenu]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetDatStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetDatStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_GetDatStock]
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_list]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_list]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Get_list]
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase_Sub_Split]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase_Sub_Split]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_FreePurchase_Sub_Split]
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase_Sub_Free]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase_Sub_Free]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_FreePurchase_Sub_Free]
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_FreePurchase]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseOrderDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseOrderDetailNum]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseOrderDetailNum]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNumEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNumEx]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseNumEx]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNum_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNum_FromShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseNum_FromShipper]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNum]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNum]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseNum]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseEntryDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseEntryDetailNum]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseEntryDetailNum]
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseDetailNum]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_EditPurchaseDetailNum]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Edit_Express]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Edit_Express]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Edit_Express]
GO
/****** Object:  StoredProcedure [dbo].[sp_Deposit]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Deposit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Deposit]
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_Init]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_Init]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Data_Init]
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_empty]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_empty]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Data_empty]
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_DelGroup]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_DelGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Data_DelGroup]
GO
/****** Object:  StoredProcedure [dbo].[sp_customUpdateProductSalePrice]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_customUpdateProductSalePrice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_customUpdateProductSalePrice]
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_Stock_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_Stock_FromCate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Copy_Stock_FromCate]
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_Stock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_Stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Copy_Stock]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Copy_SaleBill_ToEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Copy_SaleBill_ToEx]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Copy_SaleBill_ToEx]
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu_ToW]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu_ToW]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Copy_FoodMenu_ToW]
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu_Add]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu_Add]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Copy_FoodMenu_Add]
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Copy_FoodMenu]
GO
/****** Object:  StoredProcedure [dbo].[sp_Clear_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Clear_Purchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Clear_Purchase]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckSumit]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CheckSumit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_CheckSumit]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CheckStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_CheckStock]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProductNumber]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProductNumber]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ChangeProductNumber]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProduct_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProduct_FromShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ChangeProduct_FromShipper]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProduct]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ChangeProduct]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChanageSaleDeliveryAt]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChanageSaleDeliveryAt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_ChanageSaleDeliveryAt]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CateSwapRows]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CateSwapRows]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_CateSwapRows]
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelProduct]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CancelProduct]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CancelProduct]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CancelAutoAccept]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CancelAutoAccept]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_CancelAutoAccept]
GO
/****** Object:  StoredProcedure [dbo].[Sp_calcuPack]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_calcuPack]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_calcuPack]
GO
/****** Object:  StoredProcedure [dbo].[sp_Calculate_Loss]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Calculate_Loss]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Calculate_Loss]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalcSalePirce]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CalcSalePirce]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CalcSalePirce]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalcInPirce]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CalcInPirce]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_CalcInPirce]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CalcCostPrice_FromPurchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CalcCostPrice_FromPurchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_CalcCostPrice_FromPurchase]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_StockEx]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_StockEx]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Build_StockEx]
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_StockCheck]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Build_StockCheck]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_Stock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_Stock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Build_Stock]
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_Receivables]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_Receivables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Build_Receivables]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_PurchaseGoup_List]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_PurchaseGoup_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Build_PurchaseGoup_List]
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_PayMent]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_PayMent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Build_PayMent]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_Offer]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_Offer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Build_Offer]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DownGroup]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DownGroup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DownGroup]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_LabelPrint]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_LabelPrint]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisData_LabelPrint]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisData_FromShipper]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromCustomer]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromCustomer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisData_FromCustomer]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromCate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisData_FromCate]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_CheckStock]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_CheckStock]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisData_CheckStock]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisAction_FromShipper]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromCustomer]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromCustomer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisAction_FromCustomer]
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromCate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_build_DisAction_FromCate]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sales_Customer_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sales_Customer_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sales_Customer_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Total_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Total_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Total_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Store_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Store_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Store_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Invoice_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Invoice_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Invoice_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Customer_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Customer_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Customer_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Cate_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Cate_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Cate_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Area_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Area_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Sale_Area_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Purchase_Invoice_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Purchase_Invoice_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Purchase_Invoice_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Product_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Product_InOut_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Product_InOut_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_History_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_History_InOut_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_History_InOut_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Cate_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Cate_InOut_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Cate_InOut_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Area_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Area_InOut_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Area_InOut_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_YonY_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_YonY_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Analysis_YonY_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Analysis_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_MonM_Reports]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_MonM_Reports]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Buid_Analysis_MonM_Reports]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_SingleMerge]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_SingleMerge]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Bill_SingleMerge]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_SingleDelete]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_SingleDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Bill_SingleDelete]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchMerge]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchMerge]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Bill_BatchMerge]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchDelete]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Bill_BatchDelete]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchClear]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchClear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_Bill_BatchClear]
GO
/****** Object:  StoredProcedure [dbo].[sp_batchSetPriceRate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_batchSetPriceRate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_batchSetPriceRate]
GO
/****** Object:  StoredProcedure [dbo].[Sp_BatchNumberMatch_Sale]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_BatchNumberMatch_Sale]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_BatchNumberMatch_Sale]
GO
/****** Object:  StoredProcedure [dbo].[Sp_BatchNumberMatch_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_BatchNumberMatch_Purchase]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Sp_BatchNumberMatch_Purchase]
GO
/****** Object:  StoredProcedure [dbo].[sp_batchChangeShipper]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_batchChangeShipper]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_batchChangeShipper]
GO
/****** Object:  StoredProcedure [dbo].[sp_Auto_Study]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Auto_Study]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_Auto_Study]
GO
/****** Object:  StoredProcedure [dbo].[sp_AIMateToBill]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AIMateToBill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AIMateToBill]
GO
/****** Object:  StoredProcedure [dbo].[sp_AiMate_Bak]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AiMate_Bak]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AiMate_Bak]
GO
/****** Object:  StoredProcedure [dbo].[sp_AiMate]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AiMate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AiMate]
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptOrder_bak]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AcceptOrder_bak]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AcceptOrder_bak]
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptOrder]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AcceptOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_AcceptOrder]
GO
/****** Object:  StoredProcedure [dbo].[init_Data]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[init_Data]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[init_Data]
GO
/****** Object:  StoredProcedure [dbo].[Hr_Sp_parseJSON]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hr_Sp_parseJSON]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Hr_Sp_parseJSON]
GO
/****** Object:  StoredProcedure [dbo].[EnabledTrigger]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnabledTrigger]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[EnabledTrigger]
GO
/****** Object:  StoredProcedure [dbo].[DisableTrigger]    Script Date: 2026-04-16 17:22:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisableTrigger]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DisableTrigger]
GO
/****** Object:  StoredProcedure [dbo].[DisableTrigger]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DisableTrigger]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[DisableTrigger]

@tableName NVARCHAR(255),

@triggerName NVARCHAR(255)

AS BEGIN
set nocount on
--关闭触发器

EXECUTE (''DISABLE TRIGGER '' + @triggerName + '' ON '' + @tableName)
set nocount off

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[EnabledTrigger]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnabledTrigger]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[EnabledTrigger]

@tableName NVARCHAR(255),

@triggerName NVARCHAR(255)

AS BEGIN
set nocount on
--打开触发器


EXECUTE (''ENABLE TRIGGER '' + @triggerName + '' ON '' + @tableName)
set nocount off

END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Hr_Sp_parseJSON]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Hr_Sp_parseJSON]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Hr_Sp_parseJSON] 
	@Json varchar(max),
	@CommandSql varchar(max) output
as
set NoCount on
	SET @Json	=	REPLACE(@Json,''['','''')
	SET @Json	=	REPLACE(@Json,'']'','''')
	SET @Json	=	REPLACE(@Json,''},'',''}‖'')
	declare @i int
	DECLARE @thisJson varchar(Max)
	DECLARE @temp VARCHAR(Max)
	DECLARE @objName VARCHAR(Max)
	DECLARE @objValue VARCHAR(MAX)
	DECLARE @fieldSql VARCHAR(MAX)
	set @i=1
	set @CommandSql = ''''
	declare __Cursor cursor for select col from  f_splitSTR(@Json,''‖'')
	open __Cursor
	fetch next from __Cursor into @thisJson
	While (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		SET @fieldSql=''select ''
		SET @thisJson=REPLACE(@thisJson,''{'','''')
		SET @thisJson=REPLACE(@thisJson,''}'','','')
		WHILE LEN(@thisJson)>0
		BEGIN
			SET @temp=SUBSTRING(@thisJson,0,CHARINDEX('','',@thisJson,0))
			SET @thisJson=RIGHT(@thisJson,LEN(@thisJson)-LEN(@temp)-1)
			SET @objName =left(@temp,CHARINDEX('':'',@temp,0)-1)
			SET @objValue =right(@temp,len(@temp)-CHARINDEX('':'',@temp,0))
			IF left(@objValue,1)<>''"'' set @objValue = ''"''+@objValue+''"'' -- 如果数据转成字符
			SET @fieldSql=@fieldSql+REPLACE(@objValue,''"'','''''''')+'' as ''+REPLACE(@objName,''"'','''')+'',''
		END
		SET @fieldSql=LEFT(@fieldSql,LEN(@fieldSql)-1)

		if @CommandSql = '''' 
		begin
			SET @CommandSql =  @fieldSql
		end else begin
			SET @CommandSql = @CommandSql +'' union all ''+ @fieldSql
		end;
		--set @i= @i+1
		--print @i
	/*------------------------------*/
	fetch next from __Cursor into @thisJson
	end --销售游标循环结束
	close   __Cursor  --关闭销售游标   
	deallocate   __Cursor--删除销售游标  
set Nocount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[init_Data]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[init_Data]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[init_Data] as

delete L_Bill_PurchaseOrder_Tab
delete L_Bill_SaleOrder_Tab
delete l_bill_purchase_tab
delete L_bill_Sale_tab
delete L_Stock_Tab

delete L_Bill_AreaExChange_Tab
delete L_Bill_PriceChange_Tab
delete L_Bill_StockChange_Tab
delete L_Bill_StockReceive_Tab
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AcceptOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_AcceptOrder]
    @mchCode VARCHAR(20),
    @ProductCode VARCHAR(20),
    @ShipperCode BIGINT,
    @AcceptNum FLOAT,
    @AcceptNumEx FLOAT,
    @Price FLOAT,
    @DeliveryAt DATE,
    @usercode INT,
    @OrderList VARCHAR(4000),
    @free INT
AS
/*
***************************************************
    功能：接单
    参数：
        @mchCode VARCHAR(20)      - 用户账号
        @ProductCode VARCHAR(20)   - 商品号
        @ShipperCode BIGINT      - 供货商
        @num FLOAT               - 数量
        @Price FLOAT             - 单价
        @DeliveryAt DATE          - 送货日
        @usercode INT            - 操作员
        @OrderList VARCHAR(4000)  - 订单列表以,分隔
        @free INT                - 0正常，1免采
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @tempBillNumber VARCHAR(20)
DECLARE @thisBillNumber VARCHAR(20)
DECLARE @tempmaxIdkey VARCHAR(100)
DECLARE @maxIdkey VARCHAR(100)
DECLARE @DoBillNumber VARCHAR(100)
DECLARE @DoIdkey VARCHAR(100)
DECLARE @DoOweNum FLOAT
DECLARE @DoOweNumEx FLOAT
DECLARE @DoProductCode VARCHAR(20)
DECLARE @doNum FLOAT
DECLARE @doNumEx FLOAT
DECLARE @DownUnit VARCHAR(20)
DECLARE @DownWg FLOAT
DECLARE @SaleType INT
DECLARE @DoCustomerCode INT
DECLARE @TotalNum FLOAT              -- 对应商品客户订单总数
DECLARE @OutNum FLOAT              -- 接单时超出数量
DECLARE @TotalNumEx FLOAT           -- 对应商品客户订单总数
DECLARE @OutNumEx FLOAT            -- 接单时超出数量
DECLARE @StockNum FLOAT            -- 可用库存
DECLARE @Note VARCHAR(50)           -- 备注
DECLARE @AllowedOutOrderNum BIT   -- 下单量是否可超订单量
DECLARE @AcceptUserCode INT
DECLARE @BatchNumber VARCHAR(50)      -- 采购批次
DECLARE @QualityGrade INT          -- 质量

-- 获取系统参数
SELECT @AllowedOutOrderNum = AllowedOutOrderNum, @AcceptUserCode = AcceptUserCode 
FROM L_Sys_Parmars_Tab

-- 自动接单时获取质量等级
IF @mchCode = ''AutoAccept''
BEGIN
    SELECT @QualityGrade = QualityGrade 
    FROM L_Bill_SaleOrders_Tab a 
    WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, '','') WHERE col = a.billnumber) 
    AND ProductCode = @ProductCode
    
    SET @BatchNumber = ''BT'' + CONVERT(VARCHAR(8), GETDATE(), 112) + REPLACE(CONVERT(VARCHAR(12), GETDATE(), 114), '':'', '''')+''-''+CAST(@ShipperCode AS VARCHAR(10)) +''-''+ @ProductCode +''-''+ CAST(@qualitygrade AS VARCHAR(5))
END
ELSE
BEGIN
    SET @BatchNumber = ''BT'' + CONVERT(VARCHAR(8), GETDATE(), 112) + REPLACE(CONVERT(VARCHAR(12), GETDATE(), 114), '':'', '''') + SUBSTRING(REPLACE(NEWID(), ''-'', ''''), 1, 4)
END

-- 全部使用一个用户不分单
IF @AcceptUserCode > 0
    SET @usercode = @AcceptUserCode

-- 正常接单流程
IF @free = 0
BEGIN
    -- 取得订单总数
    SELECT @TotalNum = ISNULL(SUM(oweNum), 0), @TotalNumEx = ISNULL(SUM(OweNumEx), 0) 
    FROM V_Purchase_Group_Detail_Tab a 
    WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, '','') WHERE col = a.billnumber) 
    AND a.productCode = @ProductCode 
    AND a.DeliveryAt = @DeliveryAt
    
    -- 计算超出部分
    SET @OutNum = @AcceptNum - @TotalNum
    SET @OutNumEx = @AcceptNumEx - @TotalNumEx

    -- 检查是否超出下单量
    IF @AllowedOutOrderNum = 0 AND @OutNumEx > 0
    BEGIN
        RAISERROR(''下单数量大于客户订货数量，请刷新数据再操作'', 16, 1)
        RETURN
    END
    
    -- 判断数据是否被其他用户采购完
    IF @mchCode <> ''AutoAccept''
    BEGIN
        -- 自动分流时跳过，否则如果同一张单有相同商品时会触发
        IF (SELECT COUNT(*) FROM V_Purchase_Group_Detail_Tab a 
            WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, '','') WHERE col = a.billnumber) 
            AND ProductCode = @ProductCode) < 
            (SELECT COUNT(*) FROM dbo.f_splitSTR(@OrderList, '',''))
        BEGIN
            RAISERROR(''数据已被其它用户更新过，请刷新数据再操作'', 16, 1)
            RETURN
        END
    END
    
    -- 生成采购单号
    SELECT @tempBillNumber = ISNULL(MAX(CAST(SUBSTRING(billnumber, 11, 4) AS INT)), 0) + 1 
    FROM L_Bill_PurchaseOrder_Tab 
    WHERE CONVERT(CHAR(10), makingAt, 120) = CONVERT(CHAR(10), GETDATE(), 120)
    
    SET @thisBillNumber = ''RD'' + CONVERT(VARCHAR(20), GETDATE(), 112) + dbo.SetNBit(@tempBillNumber, ''0'', 4)
    
    -- 检查是否存在当前日期、当前操作员、且未审核的订单且单价不同
    IF (SELECT COUNT(*) FROM L_Bill_PurchaseOrder_Tab 
        WHERE ShipperCode = @ShipperCode 
        AND DeliveryAt = @DeliveryAt 
        AND MakingUserCode = @usercode 
        AND ExamineUserCode = 0) = 0
    BEGIN
        -- 不存在，插入新订单
        INSERT INTO L_Bill_PurchaseOrder_Tab 
        (
            BillNumber,
            mchCode,
            ShipperCode,
            MakingUserCode,
            MakiNgAt,
            ExamineuserCode,
            ExamineAt,
            DeliveryAt,
            BillType,
            Status
        ) 
        VALUES
        (
            @thisBillNumber,
            @mchCode,
            @ShipperCode,
            @UserCode,
            GETDATE(),
            0,
            GETDATE(),
            @DeliveryAt,
            16,
            0
        )
    END
    ELSE
    BEGIN
        -- 存在，使用现有订单号
        SELECT @thisBillNumber = BillNumber 
        FROM L_Bill_PurchaseOrder_Tab 
        WHERE ShipperCode = @ShipperCode 
			AND DeliveryAt = @DeliveryAt 
			AND MakingUserCode = @usercode 
			AND ExamineUserCode = 0
    END
    
    -- 声明游标处理销售订单
    DECLARE _Cursor CURSOR FOR
        SELECT BillNumber, Idkey, DownUnit, DownWg, SaleType, QualityGrade, StockNum, OweNum, OweNumEx, ProductCode, CustomerCode, Note
        FROM V_Purchase_Group_Detail_Tab a 
        WHERE EXISTS (SELECT 1 FROM dbo.f_splitSTR(@OrderList, '','') WHERE col = a.billnumber) 
			AND a.productCode = @ProductCode 
			AND a.DeliveryAt = @DeliveryAt 
			AND OweNum > 0 
        ORDER BY a.owenum DESC
    
    OPEN _Cursor
    FETCH NEXT FROM _Cursor INTO @DoBillNumber, @DoIdkey, @DownUnit, @DownWg, @SaleType, @QualityGrade, @StockNum, @DoOweNum, @DoOweNumEx, @DoProductCode, @DoCustomerCode, @note
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- 判断接单数量是否足够
        IF @AcceptNum >= @DoOweNum
        BEGIN
            SET @doNum = @DoOweNum
            SET @doNumEx = @DoOweNumEx
        END
        ELSE
        BEGIN
            SET @doNum = @AcceptNum
            SET @doNumEx = @AcceptNumEx
        END
        
        -- 更新销售订单的接单数量
        UPDATE L_Bill_SaleOrders_Tab 
        SET AcceptNum = AcceptNum + @doNum / DoubleNumBase,
            AcceptNumEx = AcceptNumEx + @doNumEx / DoubleNumExBase,
			Status = 1
        WHERE Idkey = @DoIdkey

		INSERT INTO L_Bill_Sales_Tabs 
(
    AccountBookCode,
    AreaCode,
    DeliveryAt,
    SaleIdkey,
    BillNumber,
    ProductCode,
    SaleType,
    BatchNumber,
    num,
    numEx,
    DoubleNumExBase,
    PackBase,
    costprice
)
SELECT 
    a.AccountBookCode,
    a.AreaCode,
    a.DeliveryAt,
    a.Idkey,
    a.billnumber,
    a.ProductCode,
    a.SaleType,
    @BatchNumber,
    @doNum / DoubleNumBase as num,
    @doNumEx / DoubleNumExBase as NumEx,
    a.DoubleNumExBase,
    a.PackBase,
	@Price
FROM L_Bill_Sales_Tab a
WHERE a.OrderIdKey = @DoIdkey
        
        -- 将销售订单中的状态设成已接单状态
        UPDATE L_Bill_SaleOrders_Tab 
        SET AcceptStatus = 1 
        WHERE Idkey = @DoIdkey 
        AND OweNum <= 0

        -- 生成采购订单明细ID
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab# 
        WHERE billnumber = @thisBillNumber
        
        SET @maxIdkey = @thisBillNumber + ''-'' + dbo.SetNBit(@tempmaxIdkey, ''0'', 4)
        
        -- 将客户明细存入采购订单明细中，用于供货商配货
        INSERT INTO L_Bill_PurchaseOrders_Tab# 
        (
            Idkey,
            BillNumber,
            DeliveryAt,
            mchCode,
            CustomerCode,
            ProductCode,
            DownUnit,
            DownWg,
            SaleType,
            num,
            NumEx,
            CostPrice,
            SaleOrderBillNumber,
            SaleOrderIdkey,
            BatchNumber,
            QualityGrade,
			ShipperCode,
            Note
        ) 
        VALUES
        (
            @maxIdkey,
            @thisBillNumber,
            @DeliveryAt,
            @mchCode,
            @DoCustomerCode,
            @ProductCode,
            @DownUnit,
            @DownWg,
            @SaleType,
            @doNum,
            @doNumEx * CASE WHEN @SaleType = 3 THEN @DownWg ELSE 1 END,
            @Price,
            @DoBillNumber,
            @DoIdkey,
            @BatchNumber,
            @QualityGrade,
			@ShipperCode,
            @Note
        )
       
        -- 检查采购订单明细是否存在
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab 
        WHERE billnumber = @thisBillNumber
        
        SET @maxIdkey = @thisBillNumber + ''-'' + dbo.SetNBit(@tempmaxIdkey, ''0'', 4)
        
        IF (SELECT COUNT(billnumber) FROM L_Bill_PurchaseOrders_Tab 
            WHERE BillNumber = @thisBillNumber 
            AND ProductCode = @DoProductCode 
            AND SaleType = @SaleType 
            AND BatchNumber = @BatchNumber) = 0
        BEGIN
            -- 不存在，插入新明细
            INSERT INTO L_Bill_PurchaseOrders_Tab
            (
                IdKey,
                BillNumber,
                mchCode,
                ShipperCode,
                ProductCode,
                DownUnit,
                DownWg,
                SaleType,
                stockNum,
                Num,
                NumEx,
                CostPrice,
                salePrice,
                ExamineUserCode,
                At,
                DeliveryAt,
                BatchNumber,
                QualityGrade,
                Status
            ) 
            VALUES
            (
                @maxIdkey,
                @thisBillNumber,
                @mchCode,
                @ShipperCode,
                @ProductCode,
                @DownUnit,
                @DownWg,
                @SaleType,
                @StockNum,
                @doNum,
                @doNumEx * CASE WHEN @SaleType = 3 THEN @DownWg ELSE 1 END,
                @Price,
                0,
                0,
                GETDATE(),
                @DeliveryAt,
                @BatchNumber,
                @QualityGrade,
                0
            )
        END
        ELSE
        BEGIN
            -- 存在，更新数量和价格
            UPDATE a 
            SET a.num = b.Num, 
                a.numEx = b.NumEx, 
                a.costprice = b.AvePrice 
            FROM L_Bill_PurchaseOrders_Tab a,
            (
                SELECT BillNumber, ProductCode, SaleType, SUM(Num) AS Num, SUM(Numex) AS NumEx,
                    SUM(NumEx * CostPrice) / SUM(NumEx) AS AvePrice 
                FROM L_Bill_PurchaseOrders_Tab#
                WHERE BillNumber = @thisBillNumber 
                AND ProductCode = @ProductCode 
                AND BatchNumber = @BatchNumber
                GROUP BY BillNumber, ProductCode, SaleType
            ) b
            WHERE a.BillNumber = b.BillNumber 
            AND a.ProductCode = b.ProductCode 
            AND a.SaleType = b.SaleType 
            AND BatchNumber = @BatchNumber
        END
        
        -- 更新剩余数量
        SET @AcceptNum = @AcceptNum - @DoOweNum
        SET @AcceptNumEx = @AcceptNumEx - @DoOweNumEx
        
        -- 如果数量为0，退出循环
        IF @AcceptNum <= 0
            BREAK
        
        FETCH NEXT FROM _Cursor INTO @DoBillNumber, @DoIdkey, @DownUnit, @DownWg, @SaleType, @QualityGrade, @StockNum, @DoOweNum, @DoOweNumEx, @DoProductCode, @DoCustomerCode, @note
    END
    
    CLOSE _Cursor
    DEALLOCATE _Cursor
    
    -- 处理超出订单总数
    IF @OutNum > 0
    BEGIN
        -- 更新采购订单明细
        UPDATE L_Bill_PurchaseOrders_Tab 
        SET num = num + @OutNum, 
            NumEx = NumEx + @OutNumEx 
        WHERE BillNumber = @thisBillNumber 
			AND ProductCode = @DoProductCode 
			AND BatchNumber = @BatchNumber
        
        -- 生成新的采购订单明细ID
        SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
        FROM L_Bill_PurchaseOrders_Tab# 
        WHERE billnumber = @thisBillNumber
        SET @maxIdkey = @thisBillNumber + ''-'' + dbo.SetNBit(@tempmaxIdkey, ''0'', 4)
        -- 插入超出数量的明细
        INSERT INTO L_Bill_PurchaseOrders_Tab# 
        (
            Idkey,
            BillNumber,
            DeliveryAt,
            mchCode,
            CustomerCode,
            ProductCode,
            DownUnit,
            DownWg,
            SaleType,
            num,
            NumEx,
            CostPrice,
            SaleOrderBillNumber,
            SaleOrderIdkey,
            BatchNumber,
			ShipperCode
        ) 
        VALUES
        (
            @maxIdkey,
            @thisBillNumber,
            @DeliveryAt,
            @mchCode,
            0,
            @ProductCode,
            @DownUnit,
            @DownWg,
            @SaleType,
            @OutNum,
            @OutNumEx,
            @Price,
            '''',
            '''',
            @BatchNumber,
			@ShipperCode
        )
        

        -- 更新数量和价格
      /*  UPDATE a 
        SET a.num = b.Num, 
            a.numEx = b.NumEx, 
            a.costprice = b.AvePrice 
        FROM L_Bill_PurchaseOrders_Tab a,
        (
            SELECT BillNumber, ProductCode, SaleType, SUM(Num) AS Num, SUM(Numex) AS NumEx,
                SUM(NumEx * CostPrice) / SUM(NumEx) AS AvePrice 
            FROM L_Bill_PurchaseOrders_Tab#
            WHERE BillNumber = @thisBillNumber 
            AND ProductCode = @ProductCode 
            GROUP BY BillNumber, ProductCode, SaleType
        ) b
        WHERE a.BillNumber = b.BillNumber 
        AND a.ProductCode = b.ProductCode 
        AND a.SaleType = b.SaleType*/
    END
END
ELSE
BEGIN
    -- 免采流程
    EXEC Sp_FreePurchase @ProductCode, @AcceptNum, @AcceptNumEx, @DeliveryAt, @OrderList
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AcceptOrder_bak]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AcceptOrder_bak]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[sp_AcceptOrder_bak] 
	@mchCode varchar(20),
	@ProductCode varchar(20),
	@ShipperCode Bigint,
	@num float,
	@numEx Float,
	@Price float,
	@DeliveryAt date,
	@usercode int,
	@OrderList Varchar(4000),
	@free int
as 
/* 
***************************************************
	功能：接单						
	参数：	@mchCode varchar(20),用户账号
			@ProductCode varchar(20),商品号
			@ShipperCode Bigint,供货商
			@num float,数量
			@Price float,单价
			@DeliveryAt date 送货日
			@usercode int操作员,
			@OrderList Varchar(4000) 订单列表以,分隔
			@free int 0正常，1 免采
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/

set nocount on
SET ANSI_WARNINGS OFF --关闭警告: 聚合或其它 SET 操作消除了空值
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@tempmaxIdkey varchar(100),
			@maxIdkey varchar(100),
			@DoBillNumber varchar(100),
			@DoIdkey varchar(100),
			@DoOweNum Float,
			@DoOweNumEx Float,
			@DoProductCode varchar(20),
			@doNum float,
			@doNumEx float,
			@DownUnit varchar(20),
			@DownWg float,
			@SaleType int,
			@DoCustomerCode int,
			@TotalNum Float,--对应商品客户订单总数
			@OutNum Float, --
			@TotalNumEx Float,--对应商品客户订单总数
			@OutNumEx Float, --接单时超出数量
			@StockNum Float,--可用库存
			@Note varchar(50), --备注
			@AllowedOutOrderNum bit, --下单量是否可超订单量
			@AcceptUserCode int,
			@BatchNumber VarChar(50), --采购批次
			@QualityGrade Int --质量

	select @AllowedOutOrderNum = AllowedOutOrderNum, @AcceptUserCode = AcceptUserCode from L_Sys_Parmars_Tab
	IF @mchCode = ''AutoAccept''
	BEGIN
		SELECT @QualityGrade = QualityGrade FROM L_Bill_SaleOrders_Tab a WHERE EXISTS (Select 1 from dbo.f_splitSTR(@OrderList,'','') where col=a.billnumber) and ProductCode=@ProductCode
		SET @BatchNumber =''BT'' + CONVERT(VARCHAR(10), GETDATE(), 112) + @ProductCode+Cast(@qualitygrade as varchar(5))
	END ELSE BEGIN
		SET @BatchNumber =''BT'' + CONVERT(VARCHAR(10), GETDATE(), 112) + SUBSTRING(REPLACE(NEWID(), ''-'', ''''), 1, 4)
	END
	--全部使用一个用户不分单
	IF @AcceptUserCode > 0
		set @usercode = @AcceptUserCode	
	if @free =0  --代表要将采购单发送到供货商 1代表有库存不用采购
	begin
		--取得订单总数
		select  @TotalNum = IsNull(SUM(oweNum),0),@TotalNumEx=Isnull(SUM(OweNumEx),0) from V_Purchase_Group_Detail_Tab a 
				where EXISTS (Select 1 from dbo.f_splitSTR(@OrderList,'','') where col=a.billnumber) and a.productCode = @ProductCode and a.DeliveryAt=@DeliveryAt
		--超出部分
		set @OutNum = @Num - @TotalNum	
		set @OutNumEx = @NumEx - @TotalNumEx

		If @AllowedOutOrderNum = 0 and @OutNumEx>0
		BEGIN
			Raiserror( ''下单数量大于客户订货数量，请刷新数据再操作'',16,1)
			return 
		end;
		/**判断数据是否被采购完**/
		IF @mchCode <> ''AutoAccept''
		BEGIN --自动分流时跳过 不然如果同一张单有相同商品时会触发
			If (select count(*)	from V_Purchase_Group_Detail_Tab a where EXISTS (Select 1 from dbo.f_splitSTR(@OrderList,'','') where col=a.billnumber) and ProductCode=@ProductCode)<>
				(Select count(*) from dbo.f_splitSTR(@OrderList,'',''))
			BEGIN
				Raiserror( ''数据已被其它用户更新过，请刷新数据再操作'',16,1)
				return 
			end;
		END
		select @tempBillNumber = isnull(max(cast(SUBSTRING(billnumber,11,4) as int)),0)+1from L_Bill_PurchaseOrder_Tab where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
		
		set @thisBillNumber = ''RD''+convert(varchar(20),getdate(),112)+dbo.SetNBit(@tempBillNumber,''0'',4)
		if (Select COUNT(*) from L_Bill_PurchaseOrder_Tab where ShipperCode = @ShipperCode and 	DeliveryAt=@DeliveryAt and MakingUserCode=@usercode and ExamineUserCode=0)=0
		begin --不存在当前日期 当前操作员，且未审的订单 且单价不同
			Insert Into L_Bill_PurchaseOrder_Tab 
			(
				BillNumber,
				mchCode,
				ShipperCode,
				MakingUserCode,
				MakiNgAt,
				ExamineuserCode,
				ExamineAt,
				DeliveryAt,
				BillType,
				Status
			) values
			(
				@thisBillNumber,
				@mchCode,
				@ShipperCode,
				@UserCode,
				GETDATE(),
				0,
				GETDATE(),
				@DeliveryAt,
				16,0
			)
		end else 
		begin
			Select @thisBillNumber = BillNumber from L_Bill_PurchaseOrder_Tab where ShipperCode = @ShipperCode and DeliveryAt=@DeliveryAt and MakingUserCode=@usercode and  ExamineUserCode=0
		end

		declare _Cursor cursor for 
			select BillNumber,Idkey,DownUnit,DownWg,SaleType,QualityGrade,StockNum,OweNum,OweNumEx,ProductCode,CustomerCode,Note
				from V_Purchase_Group_Detail_Tab a where EXISTS (Select 1 from dbo.f_splitSTR(@OrderList,'','') where col=a.billnumber) and a.productCode = @ProductCode and a.DeliveryAt=@DeliveryAt and OweNum>0 
			order by a.owenum desc

		open _Cursor
		fetch next from _Cursor into @DoBillNumber,@DoIdkey,@DownUnit,@DownWg,@SaleType,@QualityGrade,@StockNum, @DoOweNum,@DoOweNumEx,@DoProductCode,@DoCustomerCode,@note
		While (@@Fetch_status=0)--游标循环开始
		Begin
		/*------------------------------*/
			if @num >= @DoOweNum
			begin
				set @doNum=@DoOweNum
				set @doNumEx = @DoOweNumEx
				update L_Bill_SaleOrders_Tab 
					set AcceptNum = AcceptNum+@DoOweNum / DoubleNumBase,
					AcceptNumEx = AcceptNumEx+@DoOweNumEx / DoubleNumExBase 
				where Idkey = @DoIdkey
			end else
			begin
				set @doNum=@num
				set @doNumEx = @NumEx
				update L_Bill_SaleOrders_Tab 
					set AcceptNum = AcceptNum+@num / DoubleNumBase,
					AcceptNumEx = AcceptNumEx+@NumEx / DoubleNumExBase
				where Idkey = @DoIdkey
			end
			 --将销售订单中的状态设成已接单状态
			update L_Bill_SaleOrders_Tab set Status = 1	where Idkey = @DoIdkey
			--将销售订单中的状态设成已接单状态
			update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where Idkey = @DoIdkey and OweNum<=0
			
			select @tempmaxIdkey= isnull(max(RIGHT(Idkey,4)),0)+1 from L_Bill_PurchaseOrders_Tab# where billnumber=@thisBillNumber
			
			set @maxIdkey = @thisBillNumber+''-''+dbo.SetNBit(@tempmaxIdkey,''0'',4)
			--将客户明细存入采购订单明细中，用于供货商配货
			Insert Into L_Bill_PurchaseOrders_Tab# 
				(
					Idkey,
					BillNumber,
					DeliveryAt,
					mchCode,
					CustomerCode,
					ProductCode,
					DownUnit,
					DownWg,
					SaleType,
					num,
					NumEx,
					CostPrice,
					SaleOrderBillNumber,
					SaleOrderIdkey,
					BatchNumber,
					QualityGrade,
					Note
				) values (
					@maxIdkey,
					@thisBillNumber,
					@DeliveryAt,
					@mchCode,
					@DoCustomerCode,
					@ProductCode,
					@DownUnit,
					@DownWg,
					@SaleType,
					@doNum,
					@doNumEx*Case When @SaleType=3 Then @DownWg Else 1 End,
					--Case When @SaleType=3 Then @doNumEx*@DownWg Else @doNumEx End,
					@Price,
					@DoBillNumber,
					@DoIdkey,
					@BatchNumber,
					@QualityGrade,
					@Note
				)


			select @tempmaxIdkey= isnull(max(RIGHT(Idkey,4)),0)+1 from L_Bill_PurchaseOrders_Tab where billnumber=@thisBillNumber
			set @maxIdkey = @thisBillNumber+''-''+dbo.SetNBit(@tempmaxIdkey,''0'',4)
			if (select COUNT(billnumber) from L_Bill_PurchaseOrders_Tab where BillNumber=@thisBillNumber and ProductCode=@DoProductCode and SaleType=@SaleType and BatchNumber=@BatchNumber)=0
			begin --不存在
				Insert Into L_Bill_PurchaseOrders_Tab
				(
					IdKey,
					BillNumber,
					mchCode,
					ShipperCode,
					ProductCode,
					DownUnit,
					DownWg,
					SaleType,
					stockNum,
					Num,
					NumEx,
					CostPrice,
					salePrice,
					ExamineUserCode,
					At,
					DeliveryAt,
					BatchNumber,
					QualityGrade,
					Status
				) values (
					@maxIdkey,
					@thisBillNumber,
					@mchCode,
					@ShipperCode,
					@ProductCode,
					@DownUnit,
					@DownWg,
					@SaleType,
					@StockNum,
					@doNum,
					@doNumEx * Case When @SaleType=3 Then @DownWg Else 1 End,
					@Price,0,0,
					GETDATE(),
					@DeliveryAt,
					@BatchNumber,
					@QualityGrade,
					0
				)
			end else --存在 
			begin
				update a set a.num = b.Num,a.numEx = b.NumEx,a.costprice = b.AvePrice From L_Bill_PurchaseOrders_Tab a,(
					select BillNumber,ProductCode,SaleType,Sum(Num) as Num,Sum(Numex) as NumEx,
						sum(NumEx*CostPrice)/Sum(NumEx) as AvePrice from L_Bill_PurchaseOrders_Tab#
						where BillNumber = @thisBillNumber and ProductCode = @ProductCode and BatchNumber = @BatchNumber
						Group by BillNumber,ProductCode,SaleType
					) b
				Where a.BillNumber = b.BillNumber and a.ProductCode = b.ProductCode and a.SaleType = b.SaleType  and BatchNumber = @BatchNumber

			end
			
			
			set @num = @num - @DoOweNum
			set @numEx = @numEx - @DoOweNumEx
			
			if @num <=0
				break
		/*------------------------------*/
		fetch next from _Cursor into @DoBillNumber,@DoIdkey,@DownUnit,@DownWg,@SaleType,@QualityGrade,@StockNum,@DoOweNum,@DoOweNumEx,@DoProductCode,@DoCustomerCode,@Note
		end --销售游标循环结束
		close   _Cursor  --关闭销售游标   
		deallocate   _Cursor--删除销售游标  
		
		--存在超出订单总数
		if @OutNum >0 
		begin
			--update L_Bill_PurchaseOrders_Tab set num=num+@OutNum,NumEx=NumEx+@OutNumEx where BillNumber=@thisBillNumber and ProductCode=@DoProductCode
			select @tempmaxIdkey= isnull(max(RIGHT(Idkey,4)),0)+1 from L_Bill_PurchaseOrders_Tab# where billnumber=@thisBillNumber
			--select @tempmaxIdkey= isnull(max(SUBSTRING(IdKey,LEN(billnumber)+1,4)),0)+1 from L_Bill_PurchaseOrders_Tab# where billnumber=@thisBillNumber
			set @maxIdkey = @thisBillNumber+''-''+dbo.SetNBit(@tempmaxIdkey,''0'',4)
			Insert Into L_Bill_PurchaseOrders_Tab# 
			(
				Idkey,
				BillNumber,
				DeliveryAt,
				mchCode,
				CustomerCode,
				ProductCode,
				DownUnit,
				DownWg,
				SaleType,
				num,
				NumEx,
				CostPrice,
				SaleOrderBillNumber,
				SaleOrderIdkey,
				BatchNumber
			) values (
				@maxIdkey,
				@thisBillNumber,
				@DeliveryAt,
				@mchCode,
				0,
				@ProductCode,
				@DownUnit,
				@DownWg,
				@SaleType,
				@OutNum,
				@OutNumEx,
				@Price,
				'''',
				'''',
				@BatchNumber
			)
			update a set a.num = b.Num,a.numEx = b.NumEx,a.costprice = b.AvePrice From L_Bill_PurchaseOrders_Tab a,(
					select BillNumber,ProductCode,SaleType,Sum(Num) as Num,Sum(Numex) as NumEx,sum(NumEx*CostPrice)/Sum(NumEx) as AvePrice from L_Bill_PurchaseOrders_Tab#
						where BillNumber = @thisBillNumber and ProductCode = @ProductCode 
						Group by BillNumber,ProductCode,SaleType
					) b
				Where a.BillNumber = b.BillNumber and a.ProductCode = b.ProductCode and a.SaleType = b.SaleType
		end;
		
	end	
	if @free =1 --免采
	begin
		 Exec Sp_FreePurchase @ProductCode ,@Num,@NumEx,@DeliveryAt,@OrderList
		
	end
	
set nocount off
SET ANSI_WARNINGS ON


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AiMate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AiMate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[sp_AiMate] 
	@CustomerCode Int,
	@InputJson VARCHAR(MAX),
	@UserCode INT
AS
/**
	智能识别
	@CustomerCode 客户
	@InputJson VARCHAR(MAX),要识别的JSON格式数据
	@UserCode FLOAT  操作人
*/
SET NOCOUNT ON
	DECLARE @Json varchar(max),@CommandSql varchar(max),@DownUnitType Int,	@Pcode Int
	--SELECT @Json =''[{"序号":1,"品名":"瘦肉丝","单位":"斤"},{"序号":2,"品名":"豆苗","单位":"斤"},{"序号":3,"品名":"牛肉","单位":"斤"}]''
	EXEC Hr_Sp_parseJSON @InputJson,@CommandSql output

	DECLARE @InputTable Table(
		Seq  [Int] NOT NULL,
		Name [varchar](100) NULL,
		Num	 [Float] Null,
		DownUnit [varchar](20)  NULL,
		Note [varchar](100) NULL
	)
	DECLARE @TempTable Table(
		Seq  [Int] NOT NULL,
		userCode Int,
		InputName [varchar](50),
		Unit [varchar](20),
		ProductCode [varchar](20),
		Num	 [Float] Null,
		SaleType [Int],
		Note [varchar](100) NULL,
		isMate [Bit]
	)
	SET @CommandSql = ''SELECT * into ##TempImportData  FROM ( ''+ @CommandSql +'') a''
	EXEC (@CommandSql)
	INSERT INTO @InputTable SELECT Seq,Name,Num,Unit,Note FROM ##TempImportData
	drop table ##TempImportData

	--得到计价单位与项目编码
	SELECT @DownUnitType = DownUnitType,@Pcode=Pcode FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode
	
	IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END     

	DELETE L_AiMate_Tab WHERE UserCode = @UserCode


	--1 匹配学习表
INSERT INTO @TempTable (Seq,UserCode,InputName,Unit,ProductCode,Num,SaleType,Note,isMate)
SELECT b.Seq,@UserCode,b.Name AS InputName,b.DownUnit,a.sysCode,b.Num,a.saleType,b.Note,1 from V_Customer_Study_Tab a,@InputTable b Where a.customerCode = @CustomerCode AND a.InputName =b.Name and a.DownUnit = b.DownUnit
DELETE @InputTable Where Seq IN (SELECT Seq FROM @TempTable)

--1 匹配报价表
INSERT INTO @TempTable (Seq,UserCode,InputName,Unit,ProductCode,Num,SaleType,Note,isMate)
SELECT b.Seq,@UserCode,b.Name AS InputName,b.DownUnit,a.ProductCode,b.Num,a.saleType,b.Note,1 from V_Customer_Price_Tab a,@InputTable b Where a.PCode = @CustomerCode AND a.Name =b.Name and a.Unit = b.DownUnit
DELETE @InputTable Where Seq IN (SELECT Seq FROM @TempTable)

--1 匹配资料表
INSERT INTO @TempTable (Seq,UserCode,InputName,Unit,ProductCode,Num,SaleType,Note,isMate)
SELECT b.Seq,@UserCode,b.Name AS InputName,b.DownUnit,a.idCode,b.Num,a.saleType,b.Note,1 from V_SelectProduct a,@InputTable b Where a.Status<2 AND a.Name =b.Name and a.Unit = b.DownUnit
DELETE @InputTable Where Seq IN (SELECT Seq FROM @TempTable)


	INSERT INTO L_AIMate_Tab (Seq,UserCode,InputName,ProductCode,Name,Spec,Unit,Num,salePrice, Note,SaleType,IsMate)
	SELECT Seq,UserCode,InputName,ProductCode,Y.Name,Y.Spec,DownUnit,Num,salePrice,X.Note,X.SaleType,isMate FROM (
		SELECT Seq,@UserCode as UserCode,Name as InputName,DownUnit,'''' as ProductCode,Num,0 as SaleType,note,0 as isMate,0 as salePrice FROM  @InputTable
		UNION ALL
		SELECT a.*,CASE WHEN b.ProductCode IS NULL THEN 0 ELSE b.Price END SalePrice from @TempTable a LEFT JOIN (SELECT * FROM V_Customer_Price_Tab WHERE PCode = @CustomerCode) B ON a.ProductCode = b.ProductCode AND a.SaleType = b.SaleType
	) X LEFT JOIN L_Basic_Product_Tab Y ON X.ProductCode = Y.IdCode
	
SET NOCOUNT OFF


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AiMate_Bak]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AiMate_Bak]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROC [dbo].[sp_AiMate_Bak] 
	@CustomerCode Int,
	@InputJson VARCHAR(MAX),
	@UserCode INT
AS
/**
	智能识别
	@CustomerCode 客户
	@InputJson VARCHAR(MAX),要识别的JSON格式数据
	@UserCode FLOAT  操作人
*/
SET NOCOUNT ON
	DECLARE @Json varchar(max),@CommandSql varchar(max),@DownUnitType Int,	@Pcode Int
	--SELECT @Json =''[{"序号":1,"品名":"瘦肉丝","单位":"斤"},{"序号":2,"品名":"豆苗","单位":"斤"},{"序号":3,"品名":"牛肉","单位":"斤"}]''
	EXEC Hr_Sp_parseJSON @InputJson,@CommandSql output

	DECLARE @InputTable Table(
		Seq  [Int] NOT NULL,
		Name [varchar](100) NULL,
		Num	 [Float] Null,
		DownUnit [varchar](20)  NULL,
		Note [varchar](100) NULL
	)
	SET @CommandSql = ''SELECT * into ##TempImportData  FROM ( ''+ @CommandSql +'') a''
	EXEC (@CommandSql)
	INSERT INTO @InputTable SELECT Seq,Name,Num,Unit,Note FROM ##TempImportData
	drop table ##TempImportData

	--得到计价单位与项目编码
	SELECT @DownUnitType = DownUnitType,@Pcode=Pcode FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode
	
	IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END     

	DELETE L_AiMate_Tab WHERE UserCode = @UserCode

	INSERT INTO L_AIMate_Tab (Seq,UserCode,InputName,ProductCode,Name,Spec,Unit,Num,salePrice, Note,SaleType,IsMate)
	SElECT x.Seq,@UserCode, x.InputName, '''' as idCode,'''' as Name,'''' as Spec,x.DownUnit,x.Num,CAST(0 as float),Note,0,0 as IsMate FROM (
		SELECT a.name as InputName,CASE WHEN b.sysName IS Null THEN a.Name ELSE b.sysName End Name,a.DownUnit,a.Note,a.Num,a.Seq from @inputTable a 
		LEFT JOIN (SELECT * FROM L_Customer_Study_Tab WHERE customerCode = @CustomerCode) b On a.Name = b.inputName
	) X 
	WHERE NOT EXISTS (SELECT 1 FROM V_SELECTProduct WHERE Name = x.name and DownUnit = x.DownUnit)

	Union ALL
	SElECT b.Seq,@UserCode, b.InputName,a.idCode, a.Name,a.spec,a.DownUnit,b.Num,a.SalePrice, b.Note,a.SaleType,1 IsMate FROM 
	(SELECT IdCode ,
				name as BasicName,
				CASE WHEN ProductAliasName IS NULL THEN
					Name
				ELSE ProductAliasName end name,
				Case WHEN ISNull(AliasName,'''')='''' Then
					name 
				else 
					name+''/''+AliasName 
				end AliasNameList,
				Isnull(spec,'''') as Spec,
				Pack,
				CASE WHEN SaleType = 2 and @DownUnitType=1 THEN ''公斤'' ELSE Unit END AS  Unit,
				Punit,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN ''公斤'' ELSE DownUnit END AS DownUnit,
				DownWgSpec,
				doMethod,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
				dbo.xb_trim(SalePrice) as SalePrice,
				Note,
				defaultShipperCode,
				IsQuotedPrice
			FROM (
				SELECT IdCode,
					selfCode,
					PymCode,
					BarCode,
					name,
					b.AliasName,
					spec,
					Pack,
					Unit,
					DownUnit,
					DownWgSpec,
					doMethod,
					Punit,
					b.SaleType,
					ShipperCode,
					AreaCode,
					inPrice,
					AvgCostPrice,
					CASE WHEN c.ProductCode Is Null THEN b.Price1* CASE WHEN (b.SaleType = 0 Or b.SaleType = 2) and @DownUnitType=1 THEN 2 ELSE 1 END ELSE c.Price END as SalePrice,
					CASE WHEN c.ProductCode Is Null THEN Null ELSE c.AliasName END as ProductAliasName,
					CASE WHEN c.ProductCode Is Null THEN b.ShipperCode ELSE CASE WHEN c.defaultShipperCode<2 THEN b.ShipperCode ELSE c.defaultShipperCode END END as defaultShipperCode,
					CASE WHEN c.ProductCode Is Null THEN b.Note ELSE c.Note END as Note,
					CASE WHEN c.ProductCode Is Null THEN 0 ELSE 1 END IsQuotedPrice
				FROM (SELECT * from V_SELECTProduct WHERE status<2) b LEFT JOIN 
				(SELECT ProductCode,AliasName,price,defaultShipperCode,SaleType,Note FROM L_Basic_Customer_Price_Tab WHERE PCode = @CustomerCode) c
				ON b.idCode = c.ProductCode AND CASE WHEN b.SaleType = 2 THEN 0 ELSE b.SaleType END = c.SaleType		
			) T) a, 
	(
	SELECT a.name as InputName, CASE WHEN b.sysName IS Null THEN a.Name ELSE b.sysName End Name,a.DownUnit,a.Note,a.Num,a.Seq from @inputTable a 
		LEFT JOIN (SELECT * FROM L_Customer_Study_Tab WHERE customerCode = @CustomerCode) b On a.Name = b.inputName
	) b WHERE a.Name = b.Name AND a.DownUnit = b.DownUnit

SET NOCOUNT OFF


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AIMateToBill]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AIMateToBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--     EXEC [sp_AIMateToBill] ''toSaleOrder'', ''XD202411040001'',1

CREATE proc [dbo].[sp_AIMateToBill] 
	@Type varchar(20),
	@BillNumber VarChar(20),
	@UserCode Int
AS 
/* 
***************************************************
	功能：智能匹配转单						
	参数：	
			@Type        类型  toSaleOrder|toSaleOrderAdd|toSale
			@BillNumber :订单号 
			@UserCode :操作员
	结果：
		
	作者：2024-11-05  张建明
**************************************************
*/
set nocount on
	declare 
		@CustomerCode int,
		@DeliveryAt SmallDateTime,
		@DownUnitType Int,
		@DisType int,--配送方式
		@Note varchar(50),--备注
		@Money Float, --金额
		@importStock bit,
		@Pcode Int,
		@dr Float
		set @Money = 0

	declare @maxKey int --当前最多Ikey的后四位值
	SELECT @CustomerCode = CustomerCode,@DeliveryAt=DeliveryAt  FROM L_Bill_SaleOrder_Tab WHERE BillNumber = @BillNumber
	SELECT @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_SaleOrders_Tab where billnumber = @BillNumber
    --导入可用量
	SELECT @importStock = importStock FROM L_Sys_Parmars_Tab
	--得到计价单位与项目编码
	SELECT @DownUnitType = DownUnitType,@Pcode=Pcode,@dr=Dr FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode
	
	
	IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END         
	Insert Into L_Bill_SaleOrders_Tab
	(
		IdKey,
		BillNumber,
		AreaCode,
		CustomerCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		downUnitType,
		pack,
		Num,
		NumEx,
		replaceNumEx,
		CostPrice,
		cursaleprice,
		basePrice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		defaultShipperCode,
		Status,
		Note
	) 
	Select 
		@BillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		@BillNumber,
		areaCode,
		@CustomerCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		downUnitType,
		pack,
		Num,
		NumEx,
		replaceNumEx,
		Costprice,
		curSalePrice,
		salePrice as basePrice,
		salePrice * @dr as salePrice,
		
		0,getdate(),
		@DeliveryAt,
		defaultShipperCode,
		0, 
		Note
	from (
		select 
			ROW_NUMBER() OVER(Order by Seq) AS RowId,
			AreaCode,
			ProductCode,
			num,
			Num AS NumEx,
			0 AS replaceNumEx,
			Costprice,
			SalePrice AS  curSalePrice,
			SalePrice AS salePrice,
			SaleType,
			@DownUnitType AS downUnitType,
			DownUnit,
			CASE WHEN SaleType =2 or SaleType = 3 THEN DownWgSpec ELSE 1 END DownWg,
			pack,
			defaultShipperCode,
			Note
		From (
			SELECT IdCode As ProductCode,
				name as BasicName,
				CASE WHEN ProductAliasName IS NULL THEN
					Name
				ELSE ProductAliasName end name,
				Case WHEN ISNull(AliasName,'''')='''' Then
					name 
				else 
					name+''/''+AliasName 
				end AliasNameList,
				Isnull(spec,'''') as Spec,
				Pack,
				CASE WHEN SaleType = 2 and @DownUnitType=1 THEN ''公斤'' ELSE Unit END AS  Unit,
				Punit,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN ''公斤'' ELSE DownUnit END AS DownUnit,
				DownWgSpec,
				doMethod,
				AreaCode,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
				inPrice * CASE WHEN (SaleType = 0 Or SaleType = 2) and 1=1 THEN 2 ELSE 1 END AS inPrice,
				CASE WHEN AvgCostPrice = 0 THEN inPrice ELSE AvgCostPrice END * CASE WHEN (SaleType = 0 Or SaleType = 2) and 1=1 THEN 2 ELSE 1 END as CostPrice,
				dbo.xb_trim(SalePrice) as SalePrice,
				Note,
				defaultShipperCode,
				IsQuotedPrice,
				Seq,
					Num,
				case When 0=0 then
					(SELECT Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num FROM V_Stock_Get WHERE T.idcode=ProductCode and AreaCode=T.areaCode) 
				else 
					(SELECT Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num FROM V_Stock_Get WHERE T.idcode=ProductCode	and (AreaCode=0 or 0=0))
				end Stock,
				case When 0=0 then
					IsNull((SELECT EndNum FROM  Reports_Stock WHERE  T.idcode=ProductCode and AreaCode=T.areaCode),0)
					else 
					IsNull((SELECT EndNum FROM  Reports_Stock WHERE   ProductCode = T.idcode and AreaCode=0),0)
				end ToDayStock
			
			FROM (
			SELECT IdCode,
					selfCode,
					PymCode,
					BarCode,
					name,
					b.AliasName,
					spec,
					Pack,
					Unit,
					DownUnit,
					DownWgSpec,
					doMethod,
					Punit,
					b.SaleType,
					ShipperCode,
					AreaCode,
					inPrice,
					AvgCostPrice,
					CASE WHEN c.ProductCode Is Null THEN b.Price1* CASE WHEN (b.SaleType = 0 Or b.SaleType = 2) and @DownUnitType=1 THEN 2 ELSE 1 END ELSE c.Price END as SalePrice,
					CASE WHEN c.ProductCode Is Null THEN Null ELSE c.AliasName END as ProductAliasName,
					CASE WHEN c.ProductCode Is Null THEN b.ShipperCode ELSE CASE WHEN c.defaultShipperCode<2 THEN b.ShipperCode ELSE c.defaultShipperCode END END as defaultShipperCode,
					CASE WHEN c.ProductCode Is Null THEN b.Note ELSE c.Note END as Note,
					CASE WHEN c.ProductCode Is Null THEN 0 ELSE 1 END IsQuotedPrice,
					Seq,
					Num
				
				FROM (SELECT R.*,V.Seq,V.Num FROM V_SelectProduct R,L_AiMate_Tab V  WHERE R.status<2 AND V.UserCode = @UserCode AND R.idCode = V.ProductCode AND r.SaleType = v.SaleType and V.IsMate = 1) b LEFT JOIN 
				(SELECT ProductCode,AliasName,price,defaultShipperCode,SaleType,Note FROM L_Basic_Customer_Price_Tab WHERE PCode = @CustomerCode) c
				ON b.idCode = c.ProductCode AND CASE WHEN b.SaleType = 2 THEN 0 ELSE b.SaleType END = c.SaleType		
			) T
		) x
	) a 
set nocount off



--select * from L_AiMate_Tab

-- SELECT R.*,V.Num FROM V_SelectProduct R,L_AiMate_Tab V  WHERE R.status<2 AND V.UserCode = 1 AND R.idCode = V.ProductCode AND r.SaleType = v.SaleType and V.IsMate = 1' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Auto_Study]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Auto_Study]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Auto_Study]
	@customerCode Int,
	@inputName Varchar(50),
	@sysName VarChar(50),
	@sysCode VarChar(20),
	@saleType Int
AS
/**
 自动学习
	@customerCode Int,  客户编码
	@inputName Varchar(50),客户商品叫法
	@sysName VarChar(50),系统中对应品名
	@sysCode VarChar(20)系统中对应货号
	@saleType Int 商品类型
**/

 IF (SELECT Count(IdKey) FROM L_Customer_study_Tab WHERE customerCode = @customerCode AND inputName = @inputName And sysName = @sysName and sysCode = @sysCode and saleType=@saleType) =0
 BEGIN
	INSERT INTO L_Customer_study_Tab (customerCode,inputName,sysName,sysCode,saleType) VALUES (@customerCode,@inputName,@sysName,@sysCode,@saleType)
 END ELSE BEGIN
	UPDATE L_Customer_study_Tab SET sysCode = @sysCode ,saleType=@saleType,sysName=@sysName WHERE customerCode=@customerCode and inputName=@inputName
 END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_batchChangeShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_batchChangeShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_batchChangeShipper] 
	@BillNumber varchar(20),--报价单号
	@CustomerCode bigint,--客户编码
	@CateCode int,--分类编码
	@ShipperCode bigInt --货商编码
as
/**
	批量更改默认供货商
	@CustomerCode bigint,--客户编码
	@CateCode int,--分类编码
	@ShipperCode bigInt --货商编码
**/
set Nocount on
	/*Update L_Basic_Customer_Price_Tab set defaultShipperCode = @ShipperCode 
		where PCode = @CustomerCode and
			ProductCode in (Select IdCode From L_Basic_Product_Tab where CateCode = @CateCode)
	*/
	Update L_Bill_QuotedPrices_Tab set defaultShipperCode = @ShipperCode
		Where billnumber = @BillNumber and
			ProductCode in (Select IdCode From L_Basic_Product_Tab where CateCode = @CateCode)


set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_BatchNumberMatch_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_BatchNumberMatch_Purchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROC [dbo].[Sp_BatchNumberMatch_Purchase]
	@DeliveryAt SMALLDATETIME,
	@SaleIdkey VARCHAR(20),
	@ProductCode VARCHAR(20),
	@MatchBatchNumber VARCHAR(50),
	@MatchNum FLOAT,
	@MatchCostPrice FLOAT
AS
/**
	采购单批次匹配
**/
SET NOCOUNT ON

INSERT INTO L_Bill_Sales_Tabs (AccountBookCode,AreaCode,SaleIdkey,DeliveryAt,BillNumber,ProductCode,BatchNumber,SaleType,num,numEx,
	DoubleNumExBase,PackBase,costprice) 
	SELECT AccountBookCode,AreaCode,@SaleIdkey,@DeliveryAt,billnumber,@ProductCode,@MatchBatchNumber,SaleType,
		@MatchNum,
        @MatchNum * Case When SaleType = 3 Then DownWg Else 1 End,
		DoubleNumExBase,
		PackBase,
        @MatchCostPrice
	FROM L_Bill_Sales_Tab WHERE Idkey = @SaleIdkey

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_BatchNumberMatch_Sale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_BatchNumberMatch_Sale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_BatchNumberMatch_Sale]
	@DeliveryAt SMALLDATETIME,
	@SaleIdkey VARCHAR(20),
	@ProductCode VARCHAR(20),
	@MatchBatchNumber VARCHAR(50),
	@MatchNum FLOAT,
	@MatchCostPrice FLOAT
AS
/**
	销售单批次匹配
**/
SET NOCOUNT ON

INSERT INTO L_Bill_Sales_Tabs (AccountBookCode,AreaCode,SaleIdkey,DeliveryAt,BillNumber,ProductCode,BatchNumber,SaleType,num,numEx,
	DoubleNumExBase,PackBase,costprice) 
	SELECT AccountBookCode,AreaCode,@SaleIdkey,@DeliveryAt,billnumber,@ProductCode,@MatchBatchNumber,SaleType,
		@MatchNum,
        @MatchNum * Case When SaleType = 3 Then DownWg Else 1 End,
		DoubleNumExBase,
		PackBase,
        @MatchCostPrice
	FROM L_Bill_Sales_Tab WHERE Idkey = @SaleIdkey

SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_batchSetPriceRate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_batchSetPriceRate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_batchSetPriceRate] 
	@BillNumber varchar(20),--报价单号
	@CustomerCode bigint,--客户编码
	@CateCode int,--分类编码
	@PirceRate Float --加价率
as
/**
	批量更改默认供货商
	@CustomerCode bigint,--客户编码
	@CateCode int,--分类编码
	@PirceRate Float --加价率
**/
set Nocount on
	/*Update a set a.price = round(b.inPrice * (1+@PirceRate/100),1) from L_Basic_Customer_Price_Tab a, (Select IdCode,inPrice From L_Basic_Product_Tab where CateCode = @CateCode) b
		where PCode = @CustomerCode and a.ProductCode=b.IdCode
	*/
	Update a set a.salePrice = round(b.inPrice * (@PirceRate/100.0),1) from L_Bill_QuotedPrices_Tab a, (Select IdCode,inPrice From L_Basic_Product_Tab where CateCode = @CateCode) b
		where billnumber = @BillNumber and a.ProductCode=b.IdCode
	

set NoCount Off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchClear]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchClear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create proc [dbo].[Sp_Bill_BatchClear] 
	@CustomerCode INT,
	@StartAt SmallDateTime,
	@EndAt SmallDateTime
AS
/*清空对应时段外帐数据
		@CustomerCode INT,
		@StartAt SmallDateTime,
		@EndAt SmallDateTime
*/
SET NOCOUNT ON
	IF @CustomerCode = 0
	BEGIN
		RAISERROR(''请指定源客户'',16,1)
		RETURN
	END 
	
	DELETE L_Bill_Sales_TabEx WHERE billnumber IN (SELECT BillNumber FROM L_Bill_Sale_TabEx WHERE CustomerCode = @CustomerCode AND DeliveryAt BETWEEN @StartAt AND @EndAt)
	DELETE L_Bill_Sale_TabEx WHERE CustomerCode = @CustomerCode AND DeliveryAt BETWEEN @StartAt AND @EndAt
	
SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchDelete]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create proc [dbo].[Sp_Bill_BatchDelete] 
	@CustomerCode INT,
	@StartAt SmallDateTime,
	@EndAt SmallDateTime,
	@ProductCode VarChar(20)
AS
/*批量删除时段对应商品
	@CustomerCode INT,
	@StartAt SmallDateTime,
	@EndAt SmallDateTime，
	@ProductCode VarChar(20)
*/
SET NOCOUNT ON
	IF @CustomerCode = 0
	BEGIN
		RAISERROR(''请指定源客户'',16,1)
		RETURN
	END 
	
	DELETE L_Bill_Sales_TabEx WHERE CustomerCode = @CustomerCode AND DeliveryAt BETWEEN @StartAt AND @EndAt AND ProductCode = @ProductCode
	
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_BatchMerge]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_BatchMerge]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_Bill_BatchMerge] 
	@CurCustomerCode INT,
    @TargetCustomerCode INT,
	@StartAt SmallDateTime,
	@EndAt SmallDateTime
AS
/*批量合并
	@CurCustomerCode INT,
	@TargetCustomerCode INT,
	@StartAt SmallDateTime,
	@EndAt SmallDateTime
*/
SET NOCOUNT ON
	IF @CurCustomerCode = 0
	BEGIN
		RAISERROR(''请指定源客户'',16,1)
		RETURN
	END 
	IF @TargetCustomerCode = 0
	BEGIN
		RAISERROR(''请指定目标客户'',16,1)
		RETURN
	END 
	IF @CurCustomerCode = @TargetCustomerCode
	BEGIN
		RAISERROR(''源客户与目标客户不能相同'',16,1)
		RETURN
	END 

	DECLARE @BillNumber VARCHAR(20)
	DECLARE _Cursor CURSOR FOR SELECT BillNumber FROM L_Bill_Sale_TabEx WHERE CustomerCode = @CurCustomerCode AND DeliveryAt BETWEEN @StartAt AND @EndAt
	OPEN _Cursor
	FETCH NEXT FROM  _Cursor INTO @BillNumber
	WHILE (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		EXEC [Sp_Bill_SingleMerge] @CurCustomerCode ,@TargetCustomerCode ,@BillNumber	
	/*------------------------------*/
	FETCH NEXT FROM _Cursor INTO @BillNumber
	END --销售游标循环结束
	CLOSE   _Cursor  --关闭销售游标   
	DEALLOCATE   _Cursor--删除销售游标  

	
SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_SingleDelete]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_SingleDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_Bill_SingleDelete] 
	@IdKey VarChar(50)
AS
/*单个删除商品
	@IdKey VarChar(50))
*/
SET NOCOUNT ON
	
	DELETE L_Bill_Sales_TabEx WHERE Idkey = @IdKey
	
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bill_SingleMerge]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Bill_SingleMerge]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Bill_SingleMerge] 
	@CurCustomerCode INT,
    @TargetCustomerCode INT,
	@BillNumer VARCHAR(20)
AS
/*单行合并
	@CurCustomerCode INT,
	@TargetCustomerCode INT,
	@BillNumer VARCHAR(20)
*/
SET NOCOUNT ON

	IF @CurCustomerCode = 0
	BEGIN
		RAISERROR(''请指定源客户'',16,1)
		RETURN
	END 
	IF @TargetCustomerCode = 0
	BEGIN
		RAISERROR(''请指定目标客户'',16,1)
		RETURN
	END 
	IF @CurCustomerCode = @TargetCustomerCode
	BEGIN
		RAISERROR(''源客户与目标客户不能相同'',16,1)
		RETURN
	END 
	IF @BillNumer = ''''
	BEGIN
		RAISERROR(''请指定原单号'',16,1)
		RETURN
	END 
    DECLARE @DeliveryAt SmallDateTime,@TargetBillNumber VarChar(20)
	SELECT @DeliveryAt = DeliveryAt FROM L_Bill_Sale_TabEx WHERE BillNumber = @BillNumer
	SELECT Top 1 @TargetBillNumber = BillNumber FROM L_Bill_Sale_TabEx WHERE DeliveryAt = @DeliveryAt AND CustomerCode = @TargetCustomerCode
	/**目标日期不存在单号,将源单号客户改成目标**/
	IF ISNULL(@TargetBillNumber,'''') = ''''
	BEGIN
		UPDATE L_Bill_Sale_TabEx SET CustomerCode = @TargetCustomerCode WHERE BillNumber = @BillNumer
		UPDATE L_Bill_Sales_TabEx SET CustomerCode = @TargetCustomerCode WHERE BillNumber = @BillNumer
		RETURN
	END 
	/**目标日期存在单号,将源单号客户改成目标,单号改成目标**/
	UPDATE L_Bill_Sales_TabEx SET CustomerCode = @TargetCustomerCode,BillNumber = @TargetBillNumber,DetailNote=''从''+@BillNumer+''合并'' WHERE BillNumber = @BillNumer
	DELETE L_Bill_Sales_TabEx WHERE billnumber = @BillNumer
	DELETE L_Bill_Sale_TabEx WHERE billnumber = @BillNumer
	
SET NOCOUNT OFF




/****** Object:  StoredProcedure [dbo].[Sp_Bill_SingleMerge]    Script Date: 2024-08-14 17:41:40 ******/
SET ANSI_NULLS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_MonM_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_MonM_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec [Sp_Buid_Analysis_MonM_Reports] ''2020-02-01'',''2020-03-01'',''1,2,3'',''Product_MOnM'',''month'',''productCode=10001'',0

--select * from Reports_ProductRate

CREATE proc [dbo].[Sp_Buid_Analysis_MonM_Reports] 
/*计算环比报表*/
	@StartAt varchar(12),
	@EndAt varchar(12),
	@AccountBookCode varchar(300),
	@Type	varchar(80),
	@YOnYType	varchar(10),
	@condition varchar(1000),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	declare @szCommand nvarchar(4000),
			@AtText varchar(100),
			@GroupText varchar(100)
	if @YOnYType = ''day''
	begin
		Set @AtText = ''substring(Convert(Char(10),At,120),6,5) as At''
		Set @GroupText = ''substring(Convert(Char(10),At,120),6,5)''
	end;
	if @YOnYType = ''month''
	begin
		set @AtText = ''substring(Convert(Char(10),At,120),6,2) as At''
		set @GroupText = ''substring(Convert(Char(10),At,120),6,2)''
	end;
	if @YOnYType = ''year''
	begin
		set @AtText = ''substring(Convert(Char(10),At,120),1,4) as At''
		set @GroupText = ''substring(Convert(Char(10),At,120),1,4)''
	end;
	
	if @condition<>'''' 
		set @condition = '' and ''+@condition	
	set @AccountBookCode = ''''''''+@AccountBookCode+''''''''
	set @StartAt = ''''''''+@StartAt+''''''''	
	set @EndAt = ''''''''+@EndAt+''''''''	

	if @Type =  ''Product_MOnM''-- 环比
	begin
		set @szCommand = ''
		if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[Reports_ProductMonMRate]'''') and OBJECTPROPERTY(id, N''''IsUserTable'''') = 1)
			drop table [dbo].Reports_ProductMonMRate
		select *,
			(select SUM(Num) from V_Group_Sale_Tab x where DATEDIFF(@@Part,AT,a.Atex)=1) as ANum,
			(select SUM(SaleMoney) from V_Group_Sale_Tab where DATEDIFF(@@Part,AT,a.Atex)=1) as ASaleMoney,
			(select SUM(profit) from V_Group_Sale_Tab where DATEDIFF(@@Part,AT,a.Atex)=1) as Aprofit
			into Reports_ProductMonMRate
		From (
				select 	@@AtText,
						MIN(At) as Atex,
						SUM(Num) as BNum,
						SUM(SaleMoney) as BsaleMoney,
						sum(profit) as BProfit
				from V_Group_Sale_Tab a 
				where At between @@StartAt and @@EndAt and
					CHARINDEX('''',''''+CAST(AccountBookCode AS VARCHAR(10))+'''','''', '''',''''+@@AccountBookCode+'''','''')>0 @@condition 
				group by @@GroupText 
			) a''
	
		
		set @szCommand = replace(@szCommand,''@@AtText'',@AtText)
		set @szCommand = replace(@szCommand,''@@GroupText'',@GroupText)
		set @szCommand = replace(@szCommand,''@@Part'',@YOnYType)
		set @szCommand = replace(@szCommand,''@@AccountBookCode'',@AccountBookCode)
		set @szCommand = replace(@szCommand,''@@StartAt'',@StartAt)
		set @szCommand = replace(@szCommand,''@@EndAt'',@EndAt)
		set @szCommand = replace(@szCommand,''@@condition'',@condition)
		set @szCommand = replace(@szCommand,''#26'',''%'')

		--print @szCommand
		--Update l_sqlText_Tab set sqlText = @szCommand
	
		Exec sp_executesql  @szCommand 
	end;
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec Sp_Buid_Analysis_Reports ''2020-03-01'',''2020-03-01'',''1'',''Sale_Trend'',0

--select * from Reports_ProductWeek

CREATE proc [dbo].[Sp_Buid_Analysis_Reports] 
/*计算分析报表*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@Type	varchar(80),
	@IsExtend Int as
set nocount on
	if @Type = ''Sale_Trend'' --销售走势
	begin  
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_SaleTrend]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
		drop table [dbo].Reports_SaleTrend
		
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_SaleTrend_ToDay]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
		drop table [dbo].Reports_SaleTrend_ToDay
		
		/*select 
			At,
			SUM(SaleMoney) as SaleMoney,
			SUM(Profit) as Profit
		into Reports_SaleTrend
		from L_Group_Sale_Total_Tab 
		where At between @StartAt and @EndAt and
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
		group by at*/
		SELECT At ,
			SUM(SaleMoney) AS SaleMoney,
			SUM(Profit) AS Profit,
			SUm(BillNumberNum) AS BillNumberNum,
			Sum(PurchASeMoney) AS PurchASeMoney
		INTO Reports_SaleTrend_ToDay 
		FROM (
			SELECT 
					DeliveryAt AS At,
					SUM(SaleMoney) AS SaleMoney,
					SUM(Profit) AS Profit,
					0 AS BillNumberNum,
					0 AS PurchASeMoney
				FROM V_bill_Sale_Tab  
				WHERE DeliveryAt between CONVERT(Char(10),GETDATE()-1,120) and CONVERT(Char(10),GETDATE(),120)
				GROUP BY DeliveryAt
			UNION ALL
			SELECT 
					DeliveryAt AS At,
					0 AS SaleMoney,
					0 AS Profit,
					Count(*) AS BillNumberNum,
					0 AS PurchASeMoney
				FROM V_bill_Sale_Tab  
				WHERE DeliveryAt between CONVERT(Char(10),GETDATE()-1,120) and CONVERT(Char(10),GETDATE(),120)
				GROUP BY DeliveryAt
			UNION ALL
			SELECT 
					DeliveryAt AS At,
					0 AS SaleMoney,
					0 AS Profit,
					0 AS BillNumberNum,
					SUM(costMoney) AS PurchASeMoney
			
				FROM V_Bill_Purchase_Tab  
				WHERE DeliveryAt between CONVERT(Char(10),GETDATE()-1,120) and CONVERT(Char(10),GETDATE(),120) AND ExamineUserCode<>0
				GROUP BY DeliveryAt

		) x GROUP BY At

		SELECT At ,
			SUM(SaleMoney) AS SaleMoney,
			SUM(Profit) AS Profit,
			SUm(BillNumberNum) AS BillNumberNum,
			Sum(PurchASeMoney) AS PurchASeMoney
		INTO Reports_SaleTrend 
		FROM (
			SELECT 
					DeliveryAt AS At,
					SUM(SaleMoney) AS SaleMoney,
					SUM(Profit) AS Profit,
					0 AS BillNumberNum,
					0 AS PurchASeMoney
				FROM V_bill_Sale_Tab  
				WHERE DeliveryAt between @StartAt and @EndAt
				GROUP BY DeliveryAt
			UNION ALL
			SELECT 
					DeliveryAt AS At,
					0 AS SaleMoney,
					0 AS Profit,
					Count(*) AS BillNumberNum,
					0 AS PurchASeMoney
				FROM V_bill_Sale_Tab  
				WHERE DeliveryAt between @StartAt and @EndAt
				GROUP BY DeliveryAt,BillNumber
			UNION ALL
			SELECT 
					DeliveryAt AS At,
					0 AS SaleMoney,
					0 AS Profit,
					0 AS BillNumberNum,
					SUM(costMoney) AS PurchASeMoney
			
				FROM V_Bill_Purchase_Tab  
				WHERE DeliveryAt between @StartAt and @EndAt AND ExamineUserCode<>0
				GROUP BY DeliveryAt

		) x GROUP BY At
	end;
	
	if @Type = ''Product_WtRate'' --周传率
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductWtRate]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].[Reports_ProductWtRate]
		Select a.*,
			Case when StockMoney=0 then 0 else a.SaleMoney/30/StockMoney*100 end as WtRate, --周传率真
			Case when StockMoney=0 then 0 else Cast(1/(a.SaleMoney/30/StockMoney) as [decimal](18, 4)) end as WtDay,--周传天数
			Case when StockMoney=0 then 0 else (a.SaleMoney/30/StockMoney)*ProfitRate end as CroRate,--交叉比率
			b.BarCode,
			b.Name,
			b.Spec,
			b.Unit,
			b.Origin,
			b.Brand,
			b.CateCode 
		into Reports_ProductWtRate from 
		(
			Select a.*,b.StockMoney from 
				(
					select 
						ProductCode,
						sum(Num) as Num,
						sum(CostMoney) as CostMoney,
						sum(SaleMoney) as SaleMoney,
						sum(Profit) as Profit,
						Case when sum(SaleMoney)=0 then 0 else Sum(Profit)/sum(SaleMoney)*100 end as ProfitRate 
					from l_Group_Sale_Tab 
					where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 group by ProductCode
				) a left join 
				(
					Select a.ProductCode,a.Num*b.price1 as StockMoney from 
						(
							Select ProductCode,sum(Num) as Num from L_Stock_Tab group by ProductCode
						) a,L_Basic_Product_Tab b 
					where a.ProductCode=b.IdCode
				) b on a.ProductCode=b.ProductCode
		) a,L_Basic_Product_Tab b 
		where a.ProductCode=b.idCode
	end;
	
	if @Type = ''Product_Week'' --四周销
	begin
		if DateDiff(d,@StartAt,@EndAt)>30
		begin
			Raiserror( ''日期跨度不能超过1个月'',16,1)
			return 
		end;
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductWeek]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductWeek
			
		select At,
			ProductCode,
			Num
			InTo WeekTemp 
		from L_Group_Sale_Tab 
		where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0
			
			
		declare @s1 DateTime,@s2 DateTime,@s3 DateTime,@s4 DateTime
		set @s4=cast(@EndAt as DateTime)-7
		set @s3=cast(@EndAt as DateTime)-14
		set @s2=cast(@EndAt as DateTime)-21
		set @s1=cast(@EndAt as DateTime)-28
		
		Select a.*,
			a.week4+a.week3+a.week2+a.week1 as sumNum,
			(a.week4+a.week3+a.week2+a.week1)/28  as avgNum,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Origin,
			b.Brand,
			b.CateCode into Reports_ProductWeek
		from (
			select d0.ProductCode,
				(select isnull(sum(Num),0) as Num from WeekTemp where at> @s4 and ProductCode=d0.ProductCode) as week4,
				(Select isnull(sum(Num),0) as Num from WeekTemp where at> @s3 and at<=@s4 and ProductCode=d0.ProductCode) as week3,
				(Select isnull(sum(Num),0) as Num from WeekTemp where at> @s2 and at<=@s3 and ProductCode=d0.ProductCode) as week2,
				(Select isnull(sum(Num),0) as Num from WeekTemp where at> @s1 and at<=@s2 and ProductCode=d0.ProductCode) as week1 
			from 
				(
					select ProductCode,
						ISNULL(sum(Num),0) as Num 
					from WeekTemp Group by ProductCode
				 ) d0
			) a,L_Basic_Product_Tab b 
		where a.ProductCode=b.idCode
		  
		drop table [dbo].WeekTemp
	end;
	if @Type = ''Product_InOutRate'' --进销比率
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductInOutRate]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductInOutRate
			
		Select a.*,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode into Reports_ProductInOutRate 
		from (
			select ProductCode,
				sum(isnull(PurchaseNum,0)) as PurchaseNum,
				sum(isnull(SaleNum,0)) as SaleNum,
				case when sum(isnull(SaleNum,0))=0 then -1 else sum(isnull(PurchaseNum,0))/sum(isnull(SaleNum,0)) end as Rate 
			from L_Group_Inout_Tab 
			where at between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0
			group by ProductCode
		) a,L_Basic_Product_Tab b 
		where a.ProductCode=b.idCode 
	end;
	
	if @Type = ''Product_ABCSale'' --销额ABC
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductABC]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductABC
			
		Select a.*,
			a.SaleMoney/(Select sum(SaleMoney) from l_Group_Sale_Tab where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as Rate into AbcTemp 
		from (
				Select top 50000 ProductCode,
					sum(Num) as Num,
					sum(Profit) as Profit,
					sum(SaleMoney) as SaleMoney 
				from l_Group_Sale_Tab 
				where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
				group by ProductCode 
				order by SaleMoney desc 
		) a
		
		select a.ProductCode,
			a.ABCType,
			a.SaleMoney,
			a.Num,
			a.Profit,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode into Reports_ProductABC 
			from (
				Select *, 
					case When (select sum(Rate) from AbcTemp as d2 where d2.Rate>=d0.Rate)<=80 then ''A'' else 
					case When (select sum(Rate) from AbcTemp as d3 where d3.Rate>=d0.Rate) between 80 and 95 then ''B'' else ''C'' end  
					end as ABCType 
				from AbcTemp as D0 
			) a,L_Basic_Product_Tab b
			where a.ProductCode=b.IdCode
		drop table AbcTEmp
	end;
	if @Type = ''Product_ABCNum'' --销量ABC
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductABC]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductABC
			
		Select a.*,
			a.Num/(Select sum(Num) from l_Group_Sale_Tab where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as Rate into AbcTemp 
		from (
				Select top 50000 ProductCode,
					sum(Num) as Num,
					sum(Profit) as Profit,
					sum(SaleMoney) as SaleMoney 
				from l_Group_Sale_Tab 
				where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
				group by ProductCode 
				order by SaleMoney desc 
		) a
		
		select a.ProductCode,
			a.ABCType,
			a.SaleMoney,
			a.Num,
			a.Profit,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode into Reports_ProductABC 
			from (
				Select *, 
					case When (select sum(Rate) from AbcTemp as d2 where d2.Rate>=d0.Rate)<=80 then ''A'' else 
					case When (select sum(Rate) from AbcTemp as d3 where d3.Rate>=d0.Rate) between 80 and 95 then ''B'' else ''C'' end  
					end as ABCType 
				from AbcTemp as D0 
			) a,L_Basic_Product_Tab b
			where a.ProductCode=b.IdCode
		drop table AbcTEmp
	end;
	if @Type = ''Product_ABCSale'' --销额ABC
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductABC]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductABC
			
		Select a.*,
			a.SaleMoney/(Select sum(SaleMoney) from l_Group_Sale_Tab where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as Rate into AbcTemp 
		from (
				Select top 50000 ProductCode,
					sum(Num) as Num,
					sum(Profit) as Profit,
					sum(SaleMoney) as SaleMoney 
				from l_Group_Sale_Tab 
				where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
				group by ProductCode 
				order by SaleMoney desc 
		) a
		
		select a.ProductCode,
			a.ABCType,
			a.SaleMoney,
			a.Num,
			a.Profit,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode into Reports_ProductABC 
			from (
				Select *, 
					case When (select sum(Rate) from AbcTemp as d2 where d2.Rate>=d0.Rate)<=80 then ''A'' else 
					case When (select sum(Rate) from AbcTemp as d3 where d3.Rate>=d0.Rate) between 80 and 95 then ''B'' else ''C'' end  
					end as ABCType 
				from AbcTemp as D0 
			) a,L_Basic_Product_Tab b
			where a.ProductCode=b.IdCode
		drop table AbcTEmp
	end;
	if @Type = ''Product_ABCProfit'' --毛利ABC
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductABC]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductABC
			
		Select a.*,
			a.Profit/(Select sum(Profit) from l_Group_Sale_Tab where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as Rate into AbcTemp 
		from (
				Select top 50000 ProductCode,
					sum(Num) as Num,
					sum(Profit) as Profit,
					sum(SaleMoney) as SaleMoney 
				from l_Group_Sale_Tab 
				where At between @StartAt and @EndAt and CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
				group by ProductCode 
				order by SaleMoney desc 
		) a
		
		select a.ProductCode,
			a.ABCType,
			a.SaleMoney,
			a.Num,
			a.Profit,
			b.BarCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode into Reports_ProductABC 
			from (
				Select *, 
					case When (select sum(Rate) from AbcTemp as d2 where d2.Rate>=d0.Rate)<=80 then ''A'' else 
					case When (select sum(Rate) from AbcTemp as d3 where d3.Rate>=d0.Rate) between 80 and 95 then ''B'' else ''C'' end  
					end as ABCType 
				from AbcTemp as D0 
			) a,L_Basic_Product_Tab b
			where a.ProductCode=b.IdCode
		drop table AbcTEmp
	end;
	if @Type =  ''Product_Unsalable''-- 滞销
	begin
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductUnsalable]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductUnsalable
			
		select * into Reports_ProductUnsalable
		from L_Report_Stock_Tab  
		where CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 and 
			Num<>0 and Isnull(lastOutNum,0)=0 and DATEDIFF(dd,lastInAt,Getdate())>CAST(@StartAt as int)
	end;
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Analysis_YonY_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Analysis_YonY_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec [Sp_Buid_Analysis_YonY_Reports] ''2020-02-01'',''2020-03-01'',''1,2,3'',''Product_YOnY'',''month'',''productCode=10001'',0

--select * from Reports_ProductRate

CREATE proc [dbo].[Sp_Buid_Analysis_YonY_Reports] 
/*计算环比同比报表*/
	@StartAt varchar(12),
	@EndAt varchar(12),
	@AccountBookCode varchar(300),
	@Type	varchar(80),
	@YOnYType	varchar(10),
	@condition varchar(1000),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	declare @szCommand nvarchar(4000),
			@AtText varchar(100),
			@GroupText varchar(100)
	if @YOnYType = ''day''
	begin
		Set @AtText = ''substring(Convert(Char(10),At,120),6,5) as At''
		Set @GroupText = ''substring(Convert(Char(10),At,120),6,5)''
	end;
	if @YOnYType = ''month''
	begin
		set @AtText = ''substring(Convert(Char(10),At,120),6,2) as At''
		set @GroupText = ''substring(Convert(Char(10),At,120),6,2)''
	end;
	if @YOnYType = ''year''
	begin
		set @AtText = ''substring(Convert(Char(10),At,120),1,4) as At''
		set @GroupText = ''substring(Convert(Char(10),At,120),1,4)''
	end;
	
	if @condition<>'''' 
		set @condition = '' and ''+@condition	
	set @AccountBookCode = ''''''''+@AccountBookCode+''''''''
	set @StartAt = ''''''''+@StartAt+''''''''	
	set @EndAt = ''''''''+@EndAt+''''''''	
			
	if @Type =  ''Product_YOnY''-- 同比
	begin
		set @szCommand = ''
		if exists (select * from dbo.sysobjects where id = object_id(N''''[dbo].[Reports_ProductYonYRate]'''') and OBJECTPROPERTY(id, N''''IsUserTable'''') = 1)
			drop table [dbo].Reports_ProductYonYRate
			
		select case when a.At is null then b.at else a.at end at,
			a.ANum,
			a.AsaleMoney,
			a.AProfit,
			b.BNum,
			b.BSaleMoney,
			b.BProfit into Reports_ProductYonYRate
		from 
			(
				select @@AtText,
					SUM(Num) as ANum,
					SUM(SaleMoney) as AsaleMoney,
					sum(profit) as AProfit 
				from V_Group_Sale_Tab  
				where At between DATEADD(YEAR,-1,@@StartAt) and DATEADD(YEAR,-1,@@EndAt) and
					CHARINDEX('''',''''+CAST(AccountBookCode AS VARCHAR(10))+'''','''', '''',''''+@@AccountBookCode+'''','''')>0 @@condition group by @@GroupText
			) a right join 
			(
				select @@AtText,
					SUM(Num) as BNum,
					SUM(SaleMoney) as BsaleMoney,
					sum(profit) as BProfit  
				from V_Group_Sale_Tab  
				where At between @@StartAt and @@EndAt and 
					CHARINDEX('''',''''+CAST(AccountBookCode AS VARCHAR(10))+'''','''', '''',''''+@@AccountBookCode+'''','''')>0 @@condition group by @@GroupText
			) b
			on a.at=b.at''
		set @szCommand = replace(@szCommand,''@@AtText'',@AtText)
		set @szCommand = replace(@szCommand,''@@GroupText'',@GroupText)
		set @szCommand = replace(@szCommand,''@@AccountBookCode'',@AccountBookCode)
		set @szCommand = replace(@szCommand,''@@StartAt'',@StartAt)
		set @szCommand = replace(@szCommand,''@@EndAt'',@EndAt)
		set @szCommand = replace(@szCommand,''@@condition'',@condition)
		set @szCommand = replace(@szCommand,''#26'',''%'')

		--print @szCommand
		--Update l_sqlText_Tab set sqlText = @szCommand
	
		Exec sp_executesql  @szCommand 
	end;
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Area_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Area_InOut_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Buid_Area_InOut_Reports] 
/*计算柜组进销存*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 

		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_AreaJxc]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_AreaJxc
			
		Select a.*	
		into Reports_AreaJxc from 
		(
			select a.*,isNull(b.StartNum,0) as StartNum,isnull(b.StartMoney,0) as StartMoney from 
				(select isNull(a.endNum,0) as Endnum,isnull(a.EndMoney,0) as EndMoney,b.* from 
					(
						select 
							AreaCode,
							sum(endNum) as endNum,
							sum(EndMoney) as EndMoney 
						from L_Group_InOut_Area_Tab
						where at=@EndAt and AccountBookCode=@AccountBookCode group by AreaCode
					) a 
				 full join 
				(
					select AreaCode,
						SUM([PurchaseNum])				as [PurchaseNum],		--采购
						SUM([PurchaseMoney])			as [PurchaseMoney],
						SUM([SaleNum])					as [SaleNum],			--销售
						SUM([SaleMoney])				as [SaleMoney],
						SUM([StockSwapNum])				as [StockSwapNum],	--拆零
						SUM([StockSwapMoney])			as [StockSwapMoney],
						SUM([AreaExChangeNum])			as [AreaExChangeNum],	--柜组调拨
						SUM([AreaExChangeMoney])		as [AreaExChangeMoney],
						SUM([StockChangeNum])			as [StockChangeNum],	--库存变更
						SUM([StockChangeMoney])			as [StockChangeMoney],
						SUM([StockCheckNum])			as [StockCheckNum],		--盘点
						SUM([StockCheckMoney])			as [StockCheckMoney],
						SUM([StockReceiveNum])			as [StockReceiveNum],	--领用
						SUM([StockReceiveMoney])		as [StockReceiveMoney],
						SUM([PriceChangeNum])			as [PriceChangeNum],	--调价
						SUM([PriceChangeMoney])			as [PriceChangeMoney],
						SUM([DiffNum])					as [DiffNum],
						SUM([DiffMoney])				as [DiffMoney]				--退货差
					from L_Group_InOut_Area_Tab
					where at between @StartAt and @EndAt and AccountBookCode=@AccountBookCode group by AreaCode
				) b 
			on a.AreaCode=b.AreaCode
		) a 
		full join 
		(
			select 
				AreaCode,
				sum(StartNum) as StartNum,
				sum(StartMoney) as StartMoney 
			from L_Group_InOut_Area_Tab
			where at=@StartAt and AccountBookCode=@AccountBookCode group by AreaCode
		) b
		on a.AreaCode=b.AreaCode 
	) a 
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Cate_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Cate_InOut_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Buid_Cate_InOut_Reports] 
/*计算分类进销存*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_CateJxc]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_CateJxc
			
		Select a.*	
		into Reports_CateJxc from 
		(
			select a.*,isNull(b.StartNum,0) as StartNum,isnull(b.StartMoney,0) as StartMoney from 
				(select isNull(a.endNum,0) as Endnum,isnull(a.EndMoney,0) as EndMoney,b.* from 
					(
						select 
							CateCode,
							sum(endNum) as endNum,
							sum(EndMoney) as EndMoney 
						from L_Group_InOut_Cate_Tab
						where at=@EndAt and AccountBookCode=@AccountBookCode group by CateCode
					) a 
				 full join 
				(
					select CateCode,
						SUM([PurchaseNum])				as [PurchaseNum],		--采购
						SUM([PurchaseMoney])			as [PurchaseMoney],
						SUM([SaleNum])					as [SaleNum],			--销售
						SUM([SaleMoney])				as [SaleMoney],
						SUM([StockSwapNum])				as [StockSwapNum],	--拆零
						SUM([StockSwapMoney])			as [StockSwapMoney],
						SUM([AreaExChangeNum])			as [AreaExChangeNum],	--柜组调拨
						SUM([AreaExChangeMoney])		as [AreaExChangeMoney],
						SUM([StockChangeNum])			as [StockChangeNum],	--库存变更
						SUM([StockChangeMoney])			as [StockChangeMoney],
						SUM([StockCheckNum])			as [StockCheckNum],		--盘点
						SUM([StockCheckMoney])			as [StockCheckMoney],
						SUM([StockReceiveNum])			as [StockReceiveNum],	--领用
						SUM([StockReceiveMoney])		as [StockReceiveMoney],
						SUM([PriceChangeNum])			as [PriceChangeNum],	--调价
						SUM([PriceChangeMoney])			as [PriceChangeMoney],
						SUM([DiffNum])					as [DiffNum],
						SUM([DiffMoney])				as [DiffMoney]				--退货差
					from L_Group_InOut_Cate_Tab
					where at between @StartAt and @EndAt and AccountBookCode=@AccountBookCode group by CateCode
				) b 
			on a.CateCode=b.CateCode
		) a 
		full join 
		(
			select 
				CateCode,
				sum(StartNum) as StartNum,
				sum(StartMoney) as StartMoney 
			from L_Group_InOut_Cate_Tab
			where at=@StartAt and AccountBookCode=@AccountBookCode group by CateCode
		) b
		on a.CateCode=b.CateCode 
	) a 
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_History_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_History_InOut_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--   exec Sp_Buid_History_InOut_Reports ''2023-11-01'',''2023-11-20'',1，101,12624,0
CREATE proc [dbo].[Sp_Buid_History_InOut_Reports] 
/*计算单品历史*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@AreaCode varchar(300),
	@ProductCode varchar(20),
	@IsExtend Int as
set nocount on
SET ANSI_WARNINGS OFF --关闭警告: 聚合或其它 SET 操作消除了空值
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	declare @MaxAt Smalldatetime,@DiffNum int
	select @MaxAt = Convert(Varchar(10),Max(dat),120) from l_sys_GroupInf_Tab
	IF @MaxAt <= @StartAt Set @StartAt = @MaxAt -1
	IF @AreaCode = 0 Select @AreaCode = AreaCode From L_Basic_Product_Tab where IdCode = @ProductCode

		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_HistoryJxc]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_HistoryJxc

		select At,
			SUM(StartNum)					as StartNum,		
			SUM(StartMoney)					as StartMoney,
			SUM([PurchaseNum])				as [PurchaseNum],		--采购
			SUM([PurchaseMoney])			as [PurchaseMoney],
			SUM([SaleNum])					as [SaleNum],			--销售
			SUM([SaleMoney])				as [SaleMoney],
			SUM([StockSwapNum])				as [StockSwapNum],	-- 拆零
			SUM([StockSwapMoney])			as [StockSwapMoney],
			SUM([AreaExChangeNum])			as [AreaExChangeNum],	--柜组调拨
			SUM([AreaExChangeMoney])		as [AreaExChangeMoney],
			SUM([StockChangeNum])			as [StockChangeNum],	--库存变更
			SUM([StockChangeMoney])			as [StockChangeMoney],
			SUM([StockCheckNum])			as [StockCheckNum],		--盘点
			SUM([StockCheckMoney])			as [StockCheckMoney],
			SUM([StockReceiveNum])			as [StockReceiveNum],	--领用
			SUM([StockReceiveMoney])		as [StockReceiveMoney],
			SUM([PriceChangeNum])			as [PriceChangeNum],	--调价
			SUM([PriceChangeMoney])			as [PriceChangeMoney],
			SUM([DiffNum])					as [DiffNum],
			SUM([DiffMoney])				as [DiffMoney],				--退货差
			SUM(EndNum)						as EndNum,		
			SUM(EndMoney)					as EndMoney
		into Reports_HistoryJxc	from L_Group_InOut_Tab
		where at between @StartAt and @EndAt and AccountBookCode=@AccountBookCode and AreaCode = @AreaCode and ProductCode=@ProductCode group by At
		

		declare @TempTab Table (At Smalldatetime,
			StartNum decimal(18, 8),StartMoney  decimal(18, 8),
			PurchaseNum  decimal(18, 8),PurchaseMoney decimal(18, 8),
			SaleNum decimal(18, 8),SaleMoney decimal(18, 8),
			StockSwapNum decimal(18, 8),StockSwapMoney decimal(18, 8),
			AreaExChangeNum decimal(18, 8),AreaExChangeMoney decimal(18, 8),
			StockChangeNum decimal(18, 8),StockChangeMoney decimal(18, 8),
			StockCheckNum decimal(18, 8),StockCheckMoney decimal(18, 8),
			StockReceiveNum decimal(18, 8),StockReceiveMoney decimal(18, 8),
			PriceChangeNum decimal(18, 8),PriceChangeMoney decimal(18, 8),
			DiffNum decimal(18, 8),DiffMoney decimal(18, 8),
			EndNum as [StartNum]+[PurchaseNum]-[SaleNum]+[StockSwapNum]-[areaExChangeNum]+[StockChangeNum]+[StockCheckNum]-[StockReceiveNum],
			EndMoney as [StartMoney]+[PurchaseMoney]-[SaleMoney]+[StockSwapMoney]-[AreaExChangeMoney]+[StockChangeMoney]+[StockCheckMoney]-[StockReceiveMoney]-[diffMoney]-[priceChangeMoney]
		)

		set @DiffNum = DATEDIFF(day,@MaxAt,GetDate())+1
		While @diffNum >0
		Begin
			delete @TempTab
			Insert into @TempTab (At,StartNum,StartMoney,PurchaseNum,PurchaseMoney,SaleNum,SaleMoney,StockSwapNum,StockSwapMoney,
				AreaExChangeNum,AreaExChangeMoney,StockChangeNum,StockChangeMoney,StockCheckNum,StockCheckMoney,StockReceiveNum,StockReceiveMoney,
				PriceChangeNum,PriceChangeMoney,DiffNum,DiffMoney)
			select @MaxAt,Sum(StartNum),Sum(StartMoney),Sum(PurchaseNum),Sum(PurchaseMoney),Sum(SaleNum),Sum(SaleMoney),
				Sum(StockSwapNum),Sum(StockSwapMoney),
				Sum(AreaExChangeNum),Sum(AreaExChangeMoney),Sum(StockChangeNum),Sum(StockChangeMoney),
				Sum(StockCheckNum),Sum(StockCheckMoney),Sum(StockReceiveNum),Sum(StockReceiveMoney),
				Sum(PriceChangeNum),Sum(PriceChangeMoney),Sum(DiffNum),Sum(DiffMoney) from (
					--汇总
					Select @MaxAt as at,@ProductCode as ProductCode,EndNum as StartNum,case when EndNum =0 then 0 else  EndMoney end StartMoney,0 as PurchaseNum,0 as PurchaseMoney,0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from Reports_HistoryJxc  where At = @MaxAt-1
					Union All --采购
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,Sum(NumEx) as PurchaseNum,Sum(NumEx*ActualCostPrice) as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from V_Bill_Purchases_Tab  
					where DeliveryAt = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode
					Union All  -- 销售
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						Sum((NumEx-replaceNumEx)*DoubleNumExBase*PackBase) as SaleNum,
						Sum((NumEx-replaceNumEx)*DoubleNumExBase*PackBase*
						(ActualCostPrice/DoubleNumExBase/PackBase)) as SaleMoney,
						0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from V_Bill_Sales_Tab  
					where DeliveryAt = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode
					Union All --清点
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,Sum(ChangeNum) as StockChangeNum,Sum(ChangeNum*costprice) as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from L_Bill_StockChanges_Tab 
					where changeAt = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
					Union All --领用
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						Sum(num) as StockReceiveNum,Sum(Num*costprice) as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from L_Bill_StockReceives_Tab 
					where Convert(VarChar(10),at,120) = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
					Union All --拆零
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,Sum(Num*type) as StockSwapNum,Sum(Num*type*costprice) as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from L_Bill_StockSwaps_Tabs  
					where Convert(VarChar(10),at,120) = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
					Union All --加工
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,Sum(Num*type) as StockSwapNum,Sum(Num*type*costprice) as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from (
							SELECT AccountBookCode,AreaCode,ProductCode,num,changeAt,-1 as Type,costprice FROM L_Bill_StockSplits_Tab
								WHERE Convert(VarChar(10),changeAt,120) = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
							UNION ALL
							SELECT AccountBookCode,AreaCode,ProductCode,num,changeAt,1 as Type,costprice FROM L_Bill_StockSplits_TabS
								WHERE Convert(VarChar(10),changeAt,120) = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
						) x 
					
					Union All --调拨
					Select @MaxAt as at,@ProductCode as ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						Sum(Num*ExChangeType) as AreaExChangeNum,Sum(Num*ExChangeType*CostPrice) as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,0 as StockCheckNum,0 as StockCheckMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney,
						0 as PriceChangeNum,0 as PriceChangeMoney,0 as DiffNum,0 as DiffMoney from L_Bill_AreaExChanges_Tabs  
					where Convert(VarChar(10),at,120) = @MaxAt and AreaCode = @AreaCode and ProductCode=@ProductCode and examineUserCode>0
			) x Group by ProductCode

			--select * from @tempTab 
			Insert into Reports_HistoryJxc select * from @tempTab
			Set @MaxAt = @MaxAt + 1
			Set @DiffNum = @DiffNum -1
		end;
		
set nocount off
SET ANSI_WARNINGS On --关闭警告: 聚合或其它 SET 操作消除了空值


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Product_InOut_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Product_InOut_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Buid_Product_InOut_Reports] 
/*计算商品进销存*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@AreaCode Int = 0,
	@IsExtend Int
	
as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
		if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductJxc]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
			drop table [dbo].Reports_ProductJxc
			
		Select a.*,
			b.barCode,
			b.selfCode,
			b.name,
			b.Spec,
			b.Unit,
			b.Brand,
			b.Origin,
			b.CateCode	
		into Reports_ProductJxc from 
		(
			select a.*,isNull(b.StartNum,0) as StartNum,isnull(b.StartMoney,0) as StartMoney from 
				(select isNull(a.endNum,0) as Endnum,isnull(a.EndMoney,0) as EndMoney,b.* from 
					(
						select 
							ProductCode,
							sum(endNum) as endNum,
							sum(EndMoney) as EndMoney 
						from L_Group_InOut_Tab
						where at=@EndAt and AccountBookCode=@AccountBookCode and (AreaCode =	@AreaCode or @AreaCode=0) group by productCode
					) a 
				 full join 
				(
					select [productCode],
						SUM([PurchaseNum])				as [PurchaseNum],		--采购
						SUM([PurchaseMoney])			as [PurchaseMoney],
						SUM([SaleNum])					as [SaleNum],			--销售
						SUM([SaleMoney])				as [SaleMoney],
						SUM([StockSwapNum])				as [StockSwapNum],	--拆零
						SUM([StockSwapMoney])			as [StockSwapMoney],
						SUM([AreaExChangeNum])			as [AreaExChangeNum],	--柜组调拨
						SUM([AreaExChangeMoney])		as [AreaExChangeMoney],
						SUM([StockChangeNum])			as [StockChangeNum],	--库存变更
						SUM([StockChangeMoney])			as [StockChangeMoney],
						SUM([StockCheckNum])			as [StockCheckNum],		--盘点
						SUM([StockCheckMoney])			as [StockCheckMoney],
						SUM([StockReceiveNum])			as [StockReceiveNum],	--领用
						SUM([StockReceiveMoney])		as [StockReceiveMoney],
						SUM([PriceChangeNum])			as [PriceChangeNum],	--调价
						SUM([PriceChangeMoney])			as [PriceChangeMoney],
						SUM([DiffNum])					as [DiffNum],
						SUM([DiffMoney])				as [DiffMoney]				--退货差
					from L_Group_InOut_Tab
					where at between @StartAt and @EndAt and AccountBookCode=@AccountBookCode and (AreaCode =	@AreaCode or @AreaCode=0)  group by productCode
				) b 
			on a.productCode=b.productCode
		) a 
		full join 
		(
			select 
				ProductCode,
				sum(StartNum) as StartNum,
				sum(StartMoney) as StartMoney 
			from L_Group_InOut_Tab
			where at=@StartAt and AccountBookCode=@AccountBookCode and (AreaCode =	@AreaCode or @AreaCode=0) group by productCode
		) b
		on a.productCode=b.productCode 
	) a left join 
		L_Basic_Product_Tab b 
		on a.productCode=b.IdCode order by ProductCode
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Purchase_Invoice_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Purchase_Invoice_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE proc [dbo].[Sp_Buid_Purchase_Invoice_Reports] 
/*采购开票数据*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@ShipperCode bigint,
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	DECLARE @GroupByBigCate Int
	SELECT @GroupByBigCate = GroupByBigCate FROM l_sys_Parmars_Tab
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_Invoice]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_Invoice
	select a.*,a.CostMoney/NumEx as costPrice,b.Name,b.Spec,b.Unit, b.CateCode,
		CASE WHEN @GroupByBigCate=0 THEN
				(select Name from L_Basic_Cate_Tab where idcode = b.CateCode) 
			ELSE 
				(select Name from L_Basic_Cate_Tab where idcode = b.CateCode/100) 
			END cateName 
		into Reports_Invoice from
	(select ProductCode,sum(numEx) as Numex,sum(NumEx*costprice) as CostMoney 
		from L_Bill_Purchases_Tab where DeliveryAt between  @StartAt and @EndAt and ShipperCode = @ShipperCode and examineUserCode>0 group by ProductCode) a,
	L_Basic_Product_Tab b where Numex<>0 and a.ProductCode = b.IdCode
	
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Area_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Area_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec Sp_Buid_Sale_Reports ''2020-03-01'',''2020-03-01'',''1,2,3'',0,0

--select * from Reports_ProductSale

CREATE proc [dbo].[Sp_Buid_Sale_Area_Reports] 
/*计算柜组销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_AreaSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_AreaSale
	
	select 
		AreaCode,
		sum(Num) as Num,
		SUM(CostMoney) as CostMoney,
		SUM(SaleMoney) as SaleMoney,
		SUM(SaleMoney)/(Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as SalePer, 
		SUM(Profit) as Profit,
		SUM(Profit)/SUM((SaleMoney))*100 as ProfitRate,
		SUM(Profit)/(Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as ProfitPer
	into Reports_AreaSale
	from L_Group_Sale_Area_Tab 
	where At between @StartAt and @EndAt and
		CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
	group by AreaCode
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Cate_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Cate_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec Sp_Buid_Sale_Reports ''2020-03-01'',''2020-03-01'',''1,2,3'',0,0

--select * from Reports_ProductSale

CREATE proc [dbo].[Sp_Buid_Sale_Cate_Reports] 
/*计算分类销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_CateSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_CateSale
	
	select 
		CateCode,
		sum(Num) as Num,
		SUM(CostMoney) as CostMoney,
		SUM(SaleMoney) as SaleMoney,
		SUM(SaleMoney)/(Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as SalePer, 
		SUM(Profit) as Profit,
		SUM(Profit)/SUM((SaleMoney))*100 as ProfitRate,
		SUM(Profit)/(Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as ProfitPer
	into Reports_CateSale
	from (select a.*,b.CateCode from (select * from L_Group_Sale_Tab where At between @StartAt and @EndAt and
		CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)  a Left Join L_Basic_Product_Tab b on a.ProductCode = b.IdCode) x
	
	group by CateCode
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Customer_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Customer_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec Sp_Buid_Sale_Reports ''2020-03-01'',''2020-03-01'',''1,2,3'',0,0

--select * from Reports_ProductSale

CREATE proc [dbo].[Sp_Buid_Sale_Customer_Reports] 
/*计算客户销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_CustomerSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_CustomerSale
	
	select 
		customerCode,
		sum(Num) as Num,
		SUM(CostMoney) as CostMoney,
		SUM(SaleMoney) as SaleMoney,
		SUM(SaleMoney)/(Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as SalePer, 
		SUM(Profit) as Profit,
		CASE WHEN SUM(SaleMoney)=0 THEN -100 ELSE SUM(Profit)/SUM((SaleMoney))*100 END ProfitRate,
		SUM(Profit)/(Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as ProfitPer
	into Reports_CustomerSale
	from L_Group_Sale_Customer_Tab 
	where At between @StartAt and @EndAt and
		CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
	group by customerCode
	
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Invoice_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Invoice_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_Buid_Sale_Invoice_Reports] 
/*销售开票数据*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@CustomerCode bigint,
	@OrderNote varChar(50),
	@IsExtend Int --是否用于外帐
 as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_Invoice]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_Invoice
	IF @IsExtend = 0
	BEGIn
		IF @OrderNote = ''''
		BEGIN
			select a.*,a.saleMoney/NumEx as salePrice,b.Name,b.Spec,b.Unit, b.CateCode,
				(select name from L_Basic_Cate_Tab  where IdCode = b.CateCode) as CateName 
				into Reports_Invoice from
			(select ProductCode,sum(SettlementNumEx) as Numex,SUM(SettlementMoney) as SaleMoney 
				from V_Reports_Sale where DeliveryAt between  @StartAt and @EndAt and CustomerCode = @CustomerCode and examineUserCode>0 group by ProductCode) a,
			L_Basic_Product_Tab b where a.Numex<>0 and a.ProductCode = b.IdCode
		END ELSE BEGIN
			select a.*,a.saleMoney/NumEx as salePrice,b.Name,b.Spec,b.Unit, b.CateCode,
				(select name from L_Basic_Cate_Tab  where IdCode = b.CateCode) as CateName 
				into Reports_Invoice from
			(select ProductCode,sum(SettlementNumEx) as Numex,sum(SettlementMoney) as SaleMoney 
				from V_Reports_Sale where DeliveryAt between  @StartAt and @EndAt and CustomerCode = @CustomerCode and 
				examineUserCode>0 AND MainNote = @OrderNote group by ProductCode) a,
			L_Basic_Product_Tab b where a.Numex<>0 and a.ProductCode = b.IdCode
		END
	END

	IF @IsExtend = 1
	BEGIn
		select a.*,a.saleMoney/NumEx as salePrice,b.Name,b.Spec,b.Unit, b.CateCode,
			(select name from L_Basic_Cate_Tab  where IdCode = b.CateCode) as CateName 
			into Reports_Invoice from
		(select ProductCode,sum(numEx) as Numex,sum(NumEx*salePrice) as SaleMoney 
			from L_Bill_sales_TabEx where DeliveryAt between  @StartAt and @EndAt and CustomerCode = @CustomerCode group by ProductCode) a,
		L_Basic_Product_Tab b where a.Numex<>0 and a.ProductCode = b.IdCode
	END
	
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Buid_Sale_Reports] 
/*计算商品销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@AreaCode Int,
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_ProductSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_ProductSale

	select a.*,
		b.BarCode,
		b.SelfCode,
		b.Name,
		b.Spec,
		b.Unit,
		b.Origin,
		b.Brand,
		b.CateCode 
	into Reports_ProductSale from 
        (
			select [Type],
				ProductCode,
				sum(Num) as Num,
				SUM(CostMoney) as CostMoney,
				SUM(SaleMoney) as SaleMoney,
				SUM(SaleMoney)/nullif((Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
					(AreaCode =	@AreaCode or @AreaCode=0) and
					CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0),0)*100 as SalePer, 
				SUM(Profit) as Profit,
				SUM(Profit)/nullif(SUM(SaleMoney),0)*100 as ProfitRate,
				SUM(Profit)/nullif((Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
					(AreaCode =	@AreaCode or @AreaCode=0) and
					CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0),0)*100 as ProfitPer
			from L_Group_Sale_Tab 
			where At between @StartAt and @EndAt and 
				(AreaCode =	@AreaCode or @AreaCode=0) and
				CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
			group by AreaCode,ProductCode,[Type]
		) a left join L_Basic_Product_Tab b on a.ProductCode=b.IdCode 
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Store_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Store_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec Sp_Buid_Sale_Reports ''2020-03-01'',''2020-03-01'',''1,2,3'',0,0

--select * from Reports_ProductSale

CREATE proc [dbo].[Sp_Buid_Sale_Store_Reports] 
/*计算分店销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_StoreSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_StoreSale
	
	select 
		AccountBookCode,
		sum(Num) as Num,
		SUM(CostMoney) as CostMoney,
		SUM(SaleMoney) as SaleMoney,
		SUM(SaleMoney)/(Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as SalePer, 
		SUM(Profit) as Profit,
		SUM(Profit)/SUM((SaleMoney))*100 as ProfitRate,
		SUM(Profit)/(Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as ProfitPer
	into Reports_StoreSale
	from L_Group_Sale_Store_Tab 
	where At between @StartAt and @EndAt and
		CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
	group by AccountBookCode
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sale_Total_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sale_Total_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec [Sp_Buid_Sale_Total_Reports] ''2021-02-01'',''2021-02-18'',''1,2,3'',0

--select * from Reports_TaotlSale

CREATE proc [dbo].[Sp_Buid_Sale_Total_Reports] 
/*计算总表销售*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_TotalSale]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_TotalSale
	
	select 
		At,
		sum(Num) as Num,
		SUM(CostMoney) as CostMoney,
		SUM(SaleMoney) as SaleMoney,
		SUM(SaleMoney)/(Select SUM(saleMoney) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as SalePer, 
		SUM(Profit) as Profit,
		Case when max(SaleMoney)<>0 then SUM(Profit)/SUM((SaleMoney))*100 else 0 end ProfitRate,
		SUM(Profit)/(Select SUM(Profit) from L_Group_Sale_Tab where At between @StartAt and @EndAt and 
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0)*100 as ProfitPer
		into Reports_TotalSale
	from L_Group_Sale_Total_Tab 
	where At between @StartAt and @EndAt and 
		CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
	group by at
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Buid_Sales_Customer_Reports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Buid_Sales_Customer_Reports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--exec Sp_Buid_Sales_Customer_Reports ''2024-05-01'',''2024-05-31'',''1'',90002,0

--select * from Reports_CustomerSales

CREATE proc [dbo].[Sp_Buid_Sales_Customer_Reports] 
/*计算客户销售明细*/
	@StartAt varchar(10),
	@EndAt varchar(10),
	@AccountBookCode varchar(300),
	@CustomerCode varchar(300),
	@IsExtend Int as
set nocount on
	if DATEDIFF(MONTH,@EndAt,@StartAt)<-6
	begin
		Raiserror(''日期跨度不能超过6个月'',16,1)
		return
	end; 
	if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_CustomerSales]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_CustomerSales
	
	SELECT a.*,b.Name,b.BarCode,b.SelfCode,b.Spec,b.Unit,b.CateCode INTO Reports_CustomerSales FROM (
		SELECT 
			ProductCode,
			SUM(Num) as Num,
			SUM(CostMoney) as CostMoney,
			SUM(SaleMoney) as SaleMoney,
			SUM(Profit) as Profit,
			CASE WHEN SUM(SaleMoney)=0 THEN -100 ELSE SUM(Profit)/SUM((SaleMoney))*100 END ProfitRate
		FROM L_Group_Sale_Customer_Tabs 
		WHERE CustomerCode = @CustomerCode AND At between @StartAt and @EndAt and
			CHARINDEX('',''+CAST(AccountBookCode AS VARCHAR(10))+'','', '',''+@AccountBookCode+'','')>0 
		GROUP BY ProductCode
	) a Left Join L_Basic_Product_Tab b On a.ProductCode = b.IdCode
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromCate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec [sp_build_DisAction_FromCate] ''2024-04-10'',''''

CREATE Proc [dbo].[sp_build_DisAction_FromCate] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
set nocount on
--waitfor delay ''00:00:55''
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''
declare @CTE_SALES_TODAY Table(
	[BillNumber] [varchar](20) NOT NULL,
	[DeliveryAt] [date] Not Null,
	[OrderIdkey] [varchar](50),
	[productCode] [varchar](20) NOT NULL,
	[DownUnit] [varchar](20) NOT NULL,
	[Unit] [varchar](20) NOT NULL,
	[saleType] [Int],
	[CustomerCode] [Int] NOT NULL,
	[customerShortName] [varchar](100),
	[OrderNum] [float] NOT NULL,
	[num] [float] NOT NULL,
	[numEx] [float] NOT NULL,
	[replaceNumEx] [float] NOT NULL,
	[DisTributionNum] [float] NOT NULL,
	[DisTributionStatus] [float] NOT NULL,
	[Note] [varchar](100)
)


Insert into @CTE_SALES_TODAY (BillNumber,DeliveryAt,OrderIdkey,productCode,DownUnit,Unit,saleType,
		CustomerCode,CustomerShortName,OrderNum,Num,NumEx,replaceNumEx,DisTributionNum,DisTributionStatus,note)
select Top 5000000	BillNumber,DeliveryAt,OrderIdkey,a.productCode,a.DownUnit,a.Unit,a.saleType,
		a.CustomerCode,
		(select ShortName from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerShortName,
		a.OrderNum,a.Num,a.NumEx,a.replaceNumEx,ISNULL(a.DisTributionNum,0),DisTributionStatus,a.note
		 from V_Bill_Sales_Tab_FromNotUpdate a 
		 where a.DeliveryAt = @@DeliveryAt and RealityNumEx<>0
		order by numEx desc

select a.productCode,a.DisTributionStatus,b.Name,ISNULL(b.Spec,'''''''') as Spec,
		b.CateCode,
		(select name from L_Basic_Cate_Tab where b.CateCode = idCode) as CateName,
		a.saleType,a.DownUnit,a.Unit,b.PicSrc,
		[dbo].[xb_trim](a.OrderNum) as OrderNum,
		ROUND(a.OweNumEx,2) as OweNumEx,ROUND(a.OweNumEx,2) as NumEx,	
		ROUND(a.oweNum,2) as Num,
		[dbo].[xb_trim](a.OweNumEx)+a.DownUnit as DisNumEx,
		DisTributionNum From
		(
			select productCode,saleType,Min(DownUnit) as DownUnit,Min(Unit) as Unit,Sum(DisTributionNum) as DisTributionNum,
				sum(OrderNum)-sum(replaceNumEx) as OrderNum,
				sum(num) as oweNum,
				sum(numEx)-sum(replaceNumEx)-Sum(DisTributionNum) as OweNumEx,
				min(DisTributionStatus) as DisTributionStatus from @CTE_SALES_TODAY group by ProductCode,saleType
		) a,
		L_Basic_Product_Tab b 
		where a.productCode = b.IdCode and @@condition  order by DisTributionStatus,cateCode
''
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 
set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromCustomer]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- exec [sp_build_DisAction_FromCustomer] ''2024-04-17'',''''

CREATE Proc [dbo].[sp_build_DisAction_FromCustomer] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
/**
	生成客户配货表(使用表变量)
		@DeliveryAt smalldatetime,送货日
		@CustomerCode int,		客户编码
		@LineName varchar(100)  送货路线
**/
set NoCount On
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''

select billNumber,Deliveryat,Idkey,OrderIdkey,ProductCode,SaleType,CustomerCode,CustomerShortName,Name,DownUnit,unit,Spec,cateCode,PicSrc,LineName,DisTributionStatus,OrderNum,DisTributionNum,Num,NumEx,OweNumEx,salePrice,DisNumEx,Note from (
			select a.billNumber, a.productCode,a.saleType,
			a.CustomerCode,
			b.ShortName as CustomerShortName,
			isNull(b.LineName,'''''''') as LineName,
			a.Name,
			a.DownUnit,
			a.unit,
			IsNull(a.Spec,'''''''') as Spec,
			a.num,
			a.PicSrc,
			a.DisTributionStatus,
			[dbo].[xb_trim](a.OrderNum-a.replaceNumEx) as OrderNum,
			ISNULL(a.DisTributionNum,0) as DisTributionNum,
			[dbo].[xb_trim](a.NumEx-a.replaceNumEx) as NumEx,
			[dbo].[xb_trim](a.NumEx-a.replaceNumEx-ISNULL(a.DisTributionNum,0)) as OweNumEx,
			[dbo].[xb_trim](a.NumEx-a.replaceNumEx-ISNULL(a.DisTributionNum,0))+a.Unit+Case when isNull(a.note,'''''''')='''''''' then '''''''' else ''''【''''+a.note+''''】'''' end as DisNumEx,
			a.salePrice,
			a.cateCode,
			a.note,a.DeliveryAt,a.IdKey,OrderIdkey
			 from V_Bill_Sales_Tab_FromNotUpdate a ,L_Basic_Company_Tab b 
			 where a.DeliveryAt = @@DeliveryAt and a.RealityNumEx<>0  and a.CustomerCode = b.idCode
		 ) x where @@condition order by DisTributionStatus,cateCode


''
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 

set NoCount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisAction_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisAction_FromShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

--exec sp_build_DisAction_FromShipper ''2024-04-24'',''productName=''''abcd''''''

CREATE Proc [dbo].[sp_build_DisAction_FromShipper] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
set nocount on
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''

select  x.ShipperCode,ProductCode,x.saleType,ShipperName,b.Name, ISNull(spec,'''''''') as Spec,x.DownUnit,x.Unit,
	b.picSrc,OrderNum,Num,NumEx,dbo.xb_trim(NumEx)+x.DownUnit as DisNumEx,dbo.xb_trim(OweNumEx) oweNumEx,DisTributionNum,DisTributionStatus
from (
	select Min(IdKey) as IdKey,ShipperCode,ProductCode,saleType,ShipperName,Min(DownUnit) as DownUnit,Min(Unit) as Unit,
		sum(numEx) as OrderNum,
		sum(Num) as Num,
		sum(NumEx) as NumEx,
		Sum(DisTributionNum) as DisTributionNum,
		sum(numEx)-Sum(DisTributionNum) as OweNumEx,
		min(DisTributionStatus) as DisTributionStatus
	
	from  V_StockFrom a
		 where a.DeliveryAt = @@DeliveryAt and  CustomerCode>0 and @@condition group by ProductCode,saleType,ShipperCode,ShipperName
) x,L_Basic_Product_Tab b where x.ProductCode = b.IdCode order by DisTributionStatus,shippercode,idkey
''
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_CheckStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_CheckStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec sp_build_DisData_CheckStock ''2023-12-02'',''areaCode in (101)''

CREATE Proc [dbo].[sp_build_DisData_CheckStock] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
set nocount on
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''

Exec Sp_Build_StockEx @@DeliveryAt
Select ProductCode,CateCode,Name,Spec,Unit,[dbo].[xb_trim](EndNum)+unit as StockNum from Reports_StockEx where EndNum<>0 and @@condition
''
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromCate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec sp_build_DisData_FromCate ''2024-05-31'',''''

CREATE Proc [dbo].[sp_build_DisData_FromCate] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
set nocount on
--waitfor delay ''00:00:55''
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''
declare @FromTable Table(
	[productCode] [varchar](20) NOT NULL,
	customerShortName varchar(50),
	saleType int,
	cateCode int,
	[Name] [varchar](100),
	ng varchar(100),
	[Spec] [varchar](100),
	DownUnit varchar(20),
	[Unit] [varchar](20),
	[num] [float] NOT NULL,
	[numEx] [float] NOT NULL,
	RealityNumEx Float not null,
	[Note] [varchar](100)
)
insert into @FromTable
select productCode,customerShortName,SaleType,cateCode,name,ng,Spec,DownUnit,Unit,num,NumEx,RealityNumEx,Note from V_Bill_Sales_Tab_FromNotUpdate where DeliveryAt = @@DeliveryAt and RealityNumEx<>0

select *, dbo.xb_trim(TempTotalNum)+DownUnit as TotalNum From (
select RePlACE(REPLACE((select  
	case When 
		SaleType = 2 
	Then customerShortName +''''：''''+ dbo.xb_trim(Num) +DownUnit
	Else customerShortName  +''''：''''+  dbo.xb_trim(RealityNumEx) + DownUnit
	End+CASE WHEN isNull(Note,'''''''')='''''''' THEN '''''''' ELSE ''''【''''+Note+''''】'''' END as f
   from @FromTable where  ProductCode = x.ProductCode and SaleType = x.SaleType Order By RealityNumEx DESC
   for xml path),''''<row><f>'''',''''''''),''''</f></row>'''',''''；'''') as FromList,
   Catecode,
   Min(DownUnit) as DownUnit,
   Case when SaleType = 2 then Min(name)+''''【按斤结算】'''' else Min(ng) end  as name,
  Sum(Case when SaleType = 2 Then Num Else RealityNumEx End) as TempTotalNum
from  @FromTable x 
where  @@condition group by Catecode,ProductCode,SaleType
) y  Order by CateCode asc,TempTotalNum Desc''

set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 

set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromCustomer]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec sp_build_DisData_FromCustomer ''2024-09-17'',''''

CREATE Proc [dbo].[sp_build_DisData_FromCustomer] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
/**
	生成客户配货表(使用表变量)
		@DeliveryAt smalldatetime,送货日
		@CustomerCode int,		客户编码
		@LineName varchar(100)  送货路线
**/
set NoCount On
declare @szCommand nvarchar(max),@FromCommand nvarchar(800),@DisShowFrom bit
SELECT @DisShowFrom = DisShowFrom From l_Sys_Parmars_Tab
if @ConditionValue='''' set @ConditionValue = ''1=1''
IF @DisShowFrom = 1
	SET @FromCommand = ''
		REPlACE(REPLACE((select  
		CASE When 
			SaleType = 2 
		THEN ShipperName +''''：''''+ dbo.xb_trim(Num) +DownUnit
		Else ShipperName  +''''：''''+  dbo.xb_trim(NumEx) + DownUnit
		End as f
	   FROM V_StockFrom where  DeliveryAt = @@DeliveryAt and ProductCode = x.ProductCode and saleOrderIdKey = x.OrderIdKey
	   FOR XML PATH),''''<row><f>'''',''''''''),''''</f></row>'''',''''；'''') as FromList
	''
ELSE
	SET @FromCommand = '''''''''' as FromList''

set @szCommand = ''
select @@FromCommand,
   CustomerCode,
   productCode,
   ng as name, 
   [dbo].[xb_trim](RealityNumEx)+DownUnit as PrintNumEx,
   Case when SaleType = 2 then dbo.xb_trim(Num)+DownUnit+''''【按斤结算】'''' else dbo.xb_trim(RealityNumEx)+DownUnit +CASE WHEN isNull(Note,'''''''')='''''''' THEN '''''''' ELSE ''''【''''+Note+''''】'''' END END  as NumEx
from V_Bill_Sales_Tab_FromNotUpdate x
where DeliveryAt = @@DeliveryAt and RealityNumEx<>0 and @@condition
order by LineName asc,CateSerialNum asc,numEx desc''
set @szCommand = replace(@szCommand,''@@FromCommand'',@FromCommand)
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

print @szCommand
exec sp_executesql  @szCommand 

set NoCount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_FromShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec sp_build_DisData_FromShipper ''2024-04-30'',''''

CREATE Proc [dbo].[sp_build_DisData_FromShipper] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
set nocount on
declare @szCommand nvarchar(max);
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand = ''
declare @StockFromTable Table(
	[IdKey] [varchar](50),
	[productCode] [varchar](20) NOT NULL,
	[ShipperCode] [Int] NOT NULL,
	[customerShortName] [varchar](50),
	[saleType] [int],
	[SaleOrderIdkey] [varchar](20),
	[Name] [varchar](100),
	[Spec] [varchar](100),
	[Ng] [varchar](100),
	[DownUnit] [varchar](20),
	[Unit] [varchar](20),
	[num] [float] NOT NULL,
	[numEx] [float] NOT NULL,
	[Note] [varchar](100)
)
insert into @StockFromTable
select Idkey,productCode,ShipperCode,customerShortName,
	CASE WHEN SaleType = 4 THEN 0 ELSE SaleType END SaleType,
	SaleOrderIdkey,name,Spec,name+ISNull(Spec,''''''''),
	DownUnit,
	Unit,num,NumEx,Note from V_StockFrom where DeliveryAt = @@DeliveryAt

select RePlACE(REPLACE((select 
	 
	case When 
		SaleType = 2 
	Then customerShortName +''''：''''+ dbo.xb_trim(Num) +DownUnit
	Else customerShortName  +''''：''''+  dbo.xb_trim(NumEx) + DownUnit
	End +CASE WHEN isNull(Note,'''''''')='''''''' THEN '''''''' ELSE ''''【''''+Note+''''】'''' END as f
   from  @StockFromTable where  ShipperCode = x.ShipperCode and productCode = x.productCode and saleType = x.saleType Order By NumEx DESC
   for xml path),''''<row><f>'''',''''''''),''''</f></row>'''',''''；'''') as FromList,
   Min(IdKey) as IDKey,
   ShipperCode,
   Case when SaleType = 2 then Min(name)+''''【按斤结算】'''' else Min(Ng) end  as name,
   dbo.xb_trim(Sum(Case when SaleType = 2 Then Num Else NumEx End))  + Min(DownUnit) as TotalNum
from  @StockFromTable x 
where  @@condition group by ShipperCode,productCode,saleType
Order By ShipperCode,IdKey ''

set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 

set nocount off



















' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DisData_LabelPrint]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DisData_LabelPrint]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec sp_build_DisData_LabelPrint ''2024-09-17'',''''

CREATE Proc [dbo].[sp_build_DisData_LabelPrint] 
	@DeliveryAt smalldatetime,
	@ConditionValue VarChar(100)
as
/**
	生成标签打印数据
		@DeliveryAt smalldatetime,送货日
		@ConditionValue   条件
**/
set NoCount On
declare @szCommand nvarchar(max),@Url varchar(200)
set @Url = ''127.0.0.1:3054/linkeDisSystem/checkReports/index.html?'';
if @ConditionValue='''' set @ConditionValue = ''1=1''
set @szCommand =''
Select @@DeliveryAt as DeliveryAt,* from (
select a.*,a.numEx as distributionnum,b.ShortName as ShipperShortName from (
select a.*,b.ShortName as customershortname,isNull(b.LineName,'''''''') as LineName from 
(select a.billNumber,a.ProductCode,a.ProductName as name,a.spec,a.Unit,a.num,[dbo].[xb_trim](Cast(a.numEx as varchar(20)))+a.unit as numEx,a.replaceNumEx,a.CustomerCode,b.ShipperCode,a.Note from (
select OrderIdkey,productCode,CustomerCode,billNumber,
			case when Isnull(note,'''''''')='''''''' then Name else Name+''''(''''+note+'''')'''' end ProductName,
			Unit,
			Spec,
			Num,NumEx,replaceNumEx,note,DeliveryAt
			 from V_Bill_Sales_Tab where DeliveryAt = @@DeliveryAt
) a left Join 
(select a.SaleOrderIdkey,@@DeliveryAt AS DeliveryAt, b.ShipperCode FROM 

	(
		select Min(BillNumber) as BillNumber,SaleOrderIdkey,sum(Num) as Num,sum(NumEx) as NumEx From L_Bill_PurchaseOrders_Tab# where DeliveryAt  = @@DeliveryAt group by SaleOrderIdkey
	)a,L_Bill_PurchaseOrder_Tab b 
	where  a.BillNumber = b.BillNumber) b
on a.OrderIdKey = b.SaleOrderIdkey

) a Left Join V_Basic_Customer_Tab b on a.CustomerCode = b.idCode
) a Left Join V_Basic_Shipper_Tab b on a.ShipperCode = b.IdCode 
) x where @@condition order by customershortname,num
''
--set @szCommand = replace(@szCommand,''@@Url'',@Url)
set @szCommand = replace(@szCommand,''@@DeliveryAt'',''''''''+Convert(char(10),@DeliveryAt,120)+'''''''')
set @szCommand = replace(@szCommand,''@@condition'',@ConditionValue)

--print @szCommand
exec sp_executesql  @szCommand 

set NoCount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_build_DownGroup]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_build_DownGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_build_DownGroup] 
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
    CASE WHEN a.ShipperCode = 0 THEN ''备用存货'' 
        ELSE (SELECT name FROM L_Basic_Company_Tab WHERE idcode = a.ShipperCode) 
    END AS ShipperName,
    (SELECT TOP 1 ExamineUserCode FROM L_Bill_PurchaseOrder_Tab WHERE BillNumber = a.BillNumber) AS ExamineUserCode,
    a.ProductCode,
    b.name + ISNULL(spec, '''') AS Name,
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
                SELECT ''；'' + customerName + ''['' + [dbo].[xb_trim](OrderNum) + DownUnit
                    + CASE WHEN ISNULL(Note, '''') = '''' THEN '''' ELSE ''('' + Note + '')'' END
                    + CASE WHEN QualityGrade = 0 THEN '''' ELSE ''次'' END + '']''
                FROM CTE_STOCKFROM 
                WHERE ShipperCode = x.ShipperCode AND ProductCode = x.ProductCode AND SaleType = x.SaleType  
                ORDER BY orderNum DESC FOR XML PATH('''')
            ), 1, 1, ''''
        ) AS PackList,
        MAX(costPrice) AS CostPrice
    FROM CTE_STOCKFROM x 
    GROUP BY DeliveryAt, BillNumber, ShipperCode, ProductCode, SaleType
) a, L_Basic_Product_Tab b 
WHERE a.ProductCode = b.Idcode 
ORDER BY a.ShipperCode, a.Idkey

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_Offer]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_Offer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[Sp_Build_Offer] 
	@CustomerCode Int
as
 
set NoCount On
	
	declare @TempTabs Table (
		RowId int,
		Name varchar(100),
		Spec varchar(50),
		Price Float 
	)
	truncate table Offer_Tab

	declare @RowId int,@Name varChar(100),@Spec varChar(50),@Price Float,@i int,@startRowId int,@MaxId int
	select @MaxId = max(rowid) from (select  ROW_NUMBER() OVER(Order by SerialNumber) AS RowId,Name,Spec,Price from V_Offer where PCode = @CustomerCode) x
	set @i=0 
	set @startRowId = 1
	declare _Cursor cursor 
	 for select  ROW_NUMBER() OVER(Order by SerialNumber) AS RowId,Name,Spec,Price from V_Offer where PCode = @CustomerCode
	
	open _Cursor
	fetch next from _Cursor into @RowId,@Name,@Spec,@Price
	While (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		insert into @TempTabs(RowId,Name,Spec,Price) values (@RowId,@Name,@Spec,@Price)
		if @RowId % 3 = 0 or @MaxId = @RowId
		begin
			insert into Offer_Tab
			select * from 
				(select RowId,Name,Spec,Price from @TempTabs where rowid=@startRowId+0) a left join
				( select RowId,Name,Spec,Price from @TempTabs where rowid=@startRowId+1) b on a.RowId<>b.RowId left join
				( select RowId,Name,Spec,Price from @TempTabs where rowid=@startRowId+2) c on  c.RowId<>b.RowId
			set @startRowId = @RowId+1
		end;
	/*------------------------------*/
	fetch next from _Cursor into @RowId,@Name,@Spec,@Price
	end --销售游标循环结束
	close   _Cursor  --关闭销售游标   
	deallocate   _Cursor--删除销售游标  
	select * from Offer_Tab
set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_PayMent]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_PayMent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Build_PayMent] 
	@ShipperCode bigInt,
	@CurBillNumber varchar(20)
as 
/* 
***************************************************
	功能：生成付款单						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：
		更新 L_Bill_SaleOrders_Tab 表状态(status=2)已送货待收货
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20)

	select @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_PayMent_Tab 
		where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)
	set @thisBillNumber = ''PM''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''0'',4)
	Insert Into L_Bill_PayMent_Tab 
	(
		BillNumber,
		ShipperCode,
		SubjectCode,
		PayTypeCode,
		Money,
		ExamineAt,
		ExamineUserCode,
		BillType
	) values
	(
		@thisBillNumber,
		@ShipperCode,
		201,201,
		0,
		GETDATE(),
		0,
		50201
	)
	
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_PayMents_Tab where billnumber = @thisBillNumber
  
	Insert Into L_Bill_PayMents_Tab
	(
		IdKey,
		Type,
		BillNumber,
		CurBillNumber,
		CurMoney,
		OweMoney,
		Money,
		FreeMoney,
		ExamineUserCode,
		At
	) select 
		@thisBillNumber+''-''+dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
		0,
		@thisBillNumber,
		BillNumber,
		costMoney,
		OweMoney,
		OweMoney,
		0,
		0,
		getDate()
	 From L_Bill_Purchase_Tab where BillNumber = @CurBillNumber
	select @thisBillNumber as fieldName --返回单号
	
set nocount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_PurchaseGoup_List]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_PurchaseGoup_List]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[Sp_Build_PurchaseGoup_List]
    @DeliveryAt VARCHAR(10) = NULL,
    @ShowOweOnly BIT = 1
AS
SET NOCOUNT ON

DECLARE @ImportStock BIT
SET @ImportStock = 1
--SELECT @ImportStock = ISNULL(importStock, 0) FROM L_Sys_Parmars_Tab

DECLARE @StockTemp TABLE (
	AccountBookCode INT, 
	AreaCode INT, 
	ProductCode INT,
	BatchNumber VARCHAR(100),
	AllowedNum DECIMAL(18, 2),
	Money DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)
            
INSERT INTO @StockTemp (
	AccountBookCode, 
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
        MAX(DownWg) AS DownWg,
        MAX(DownUnit) AS DownUnit,
        MAX(BillType) AS BillType
    FROM (
        SELECT
            AreaCode,
            ProductCode,
            DownWG,
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
        FROM V_Bill_SaleOrders_Tab
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
        b.Name + ISNULL(b.Spec, '''') AS ng,
        b.BarCode,
        b.PicSrc,
        b.Unit,
        b.PUnit,
        b.CateCode,
        a.BillType,
        c.Name AS cateName,
        c.SerialNum,
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
ORDER BY SerialNum ASC
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_Receivables]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_Receivables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Build_Receivables] 
	@CustomerCode bigInt,
	@CurBillNumber varchar(20)
as 
/* 
***************************************************
	功能：生成收款单						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：
		更新 L_Bill_SaleOrders_Tab 表状态(status=2)已送货待收货
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20)

	select @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_Receivables_Tab 
		where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)
	set @thisBillNumber = ''PR''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''0'',4)
	Insert Into L_Bill_Receivables_Tab 
	(
		BillNumber,
		CustomerCode,
		SubjectCode,
		PayTypeCode,
		Money,
		ExamineAt,
		ExamineUserCode,
		BillType
	) values
	(
		@thisBillNumber,
		@CustomerCode,
		101,201,
		0,
		GETDATE(),
		0,
		50201
	)
	
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_Receivabless_Tab where billnumber = @thisBillNumber
  
	Insert Into L_Bill_Receivabless_Tab
	(
		IdKey,
		Type,
		BillNumber,
		CurBillNumber,
		CurMoney,
		OweMoney,
		Money,
		FreeMoney,
		ExamineUserCode,
		At
	) select 
		@thisBillNumber+''-''+dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
		0,
		@thisBillNumber,
		BillNumber,
		saleMoney,
		OweMoney,
		OweMoney,
		0,
		0,
		getDate()
	 From L_Bill_Sale_Tab where BillNumber = @CurBillNumber
	select @thisBillNumber as fieldName --返回单号
	
set nocount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_Stock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_Stock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--   exec Sp_Buid_History_InOut_Reports ''2023-11-01'',''2023-11-20'',1，101,12624,0

CREATE proc [dbo].[Sp_Build_Stock] 
/*计算库存*/
	@ToDay Smalldatetime
AS
set nocount on
SET ANSI_WARNINGS OFF --关闭警告: 聚合或其它 SET 操作消除了空值
	if DATEDIFF(MONTH,@ToDay,getDate())<-1
	begin
		Raiserror(''日期跨度不能超过1个月'',16,1)
		return
	end; 
	declare @MaxAt Smalldatetime
	select @MaxAt = Convert(Varchar(10),Max(dat),120) from l_sys_GroupInf_Tab
	declare @TempTabx Table (
			AccountBookCode int,AreaCode int,ProductCode varchar(20),
			StartNum decimal(18, 8),StartMoney  decimal(18, 8),PurchaseNum  Float,PurchaseMoney Float,SaleNum Float,SaleMoney decimal(18, 8),
			StockSwapNum decimal(18, 8),StockSwapMoney decimal(18, 8),
			AreaExChangeNum decimal(18, 8),AreaExChangeMoney decimal(18, 8),StockChangeNum decimal(18, 8),
			StockChangeMoney decimal(18, 8),StockReceiveNum decimal(18, 8),StockReceiveMoney decimal(18, 8),
			EndNum as [StartNum]+[PurchaseNum]-[SaleNum]+[StockSwapNum]-[areaExChangeNum]+[StockChangeNum]-[StockReceiveNum],
			EndMoney as [StartMoney]+[PurchaseMoney]-[SaleMoney]+[StockSwapMoney]-[AreaExChangeMoney]+[StockChangeMoney]-[StockReceiveMoney]
		)
	declare @TempTab Table (
			AccountBookCode int,AreaCode int,ProductCode varchar(20),
			StartNum decimal(18, 8),StartMoney  decimal(18, 8),PurchaseNum  decimal(18, 8),PurchaseMoney decimal(18, 8),SaleNum decimal(18, 8),SaleMoney decimal(18, 8),
			StockSwapNum decimal(18, 8),StockSwapMoney decimal(18, 8),
			AreaExChangeNum decimal(18, 8),AreaExChangeMoney decimal(18, 8),StockChangeNum decimal(18, 8),
			StockChangeMoney decimal(18, 8),StockReceiveNum decimal(18, 8),StockReceiveMoney decimal(18, 8),
			EndNum as [StartNum]+[PurchaseNum]-[SaleNum]+[StockSwapNum]-[areaExChangeNum]+[StockChangeNum]-[StockReceiveNum],
			EndMoney as [StartMoney]+[PurchaseMoney]-[SaleMoney]+[StockSwapMoney]-[AreaExChangeMoney]+[StockChangeMoney]-[StockReceiveMoney]
		)
		Insert into @TempTabX (AccountBookCode,AreaCode,ProductCode,StartNum,StartMoney,PurchaseNum,PurchaseMoney,SaleNum,SaleMoney,StockSwapNum,StockSwapMoney,
				AreaExChangeNum,AreaExChangeMoney,StockChangeNum,StockChangeMoney,StockReceiveNum,StockReceiveMoney)
			
			select AccountBookCode,AreaCode,ProductCode,Sum(StartNum),Sum(StartMoney),Sum(PurchaseNum),Sum(PurchaseMoney),Sum(SaleNum),Sum(SaleMoney),
				Sum(StockSwapNum),Sum(StockSwapMoney),
				Sum(AreaExChangeNum),Sum(AreaExChangeMoney),Sum(StockChangeNum),Sum(StockChangeMoney),
				Sum(StockReceiveNum),Sum(StockReceiveMoney) from (
					--汇总
					Select AccountBookCode,AreaCode,ProductCode,EndNum as StartNum,case when EndNum =0 then 0 else EndMoney end StartMoney,0 as PurchaseNum,0 as PurchaseMoney,0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Group_InOut_tab  where At = @MaxAt-1 
					Union All --采购
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,(NumEx) as PurchaseNum,(NumEx*ActualCostPrice) as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Purchases_Tab  
					where DeliveryAt BetWeen @MaxAt and @ToDay-1
					Union All  -- 销售
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase as SaleNum,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase*
						(ActualCostPrice/DoubleNumExBase/PackBase) as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Sales_Tab  
					where DeliveryAt  BetWeen @MaxAt and @ToDay-1
					Union All --清点
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,(ChangeNum) as StockChangeNum,(ChangeNum*costprice) as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockChanges_Tab 
					where changeAt  BetWeen @MaxAt and @ToDay-1 and examineUserCode>0
					Union All --领用
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						(num*-1) as StockReceiveNum,(Num*-1*costprice) as StockReceiveMoney from L_Bill_StockReceives_Tab 
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay-1 and examineUserCode>0
					Union All --拆零
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,(Num*type) as StockSwapNum,(Num*type*costprice) as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockSwaps_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay-1 and examineUserCode>0
					Union All --调拨
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						(Num*ExChangeType) as AreaExChangeNum,(Num*ExChangeType*CostPrice) as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_AreaExChanges_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay-1 and examineUserCode>0
			) x Group by AccountBookCode,AreaCode,ProductCode

		Insert into @TempTab (AccountBookCode,AreaCode,ProductCode,StartNum,StartMoney,PurchaseNum,PurchaseMoney,SaleNum,SaleMoney,StockSwapNum,StockSwapMoney,
				AreaExChangeNum,AreaExChangeMoney,StockChangeNum,StockChangeMoney,StockReceiveNum,StockReceiveMoney)
			
			select AccountBookCode,AreaCode,ProductCode,Sum(StartNum),Sum(StartMoney),Sum(PurchaseNum),Sum(PurchaseMoney),Sum(SaleNum),Sum(SaleMoney),
				Sum(StockSwapNum),Sum(StockSwapMoney),
				Sum(AreaExChangeNum),Sum(AreaExChangeMoney),Sum(StockChangeNum),Sum(StockChangeMoney),
				Sum(StockReceiveNum),Sum(StockReceiveMoney) from (
					--汇总
					Select AccountBookCode,AreaCode,ProductCode,EndNum as StartNum,EndMoney as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Group_InOut_tab  where At = @MaxAt-1 
					Union All --采购
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,(NumEx) as PurchaseNum,(NumEx*ActualCostPrice) as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Purchases_Tab  
					where DeliveryAt BetWeen @MaxAt and @ToDay 
					Union All  -- 销售
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase as SaleNum,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase*
						(ActualCostPrice/DoubleNumExBase/PackBase) as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Sales_Tab  
					where DeliveryAt  BetWeen @MaxAt and @ToDay
					Union All --清点
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,(ChangeNum) as StockChangeNum,(ChangeNum*costprice) as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockChanges_Tab 
					where changeAt  BetWeen @MaxAt and @ToDay and examineUserCode>0
					Union All --领用
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						(num*-1) as StockReceiveNum,(Num*-1*costprice) as StockReceiveMoney from L_Bill_StockReceives_Tab 
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
					Union All --拆零
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,(Num*type) as StockSwapNum,(Num*type*costprice) as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockSwaps_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
					Union All --调拨
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						(Num*ExChangeType) as AreaExChangeNum,(Num*ExChangeType*CostPrice) as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_AreaExChanges_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
			) x Group by AccountBookCode,AreaCode,ProductCode
--select AccountBookCode,AreaCode,ProductCode,StartNum,EndNum from @TempTab 

--select AccountBookCode,AreaCode,ProductCode,StartNum,EndNum from @TempTabx 

if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_Stock]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_Stock

select a.AccountBookCode,a.AreaCode,b.CateCode,a.ProductCode,b.BarCode,b.SelfCode, b.Name,isNull(b.Spec,'''') as Spec,b.Unit,cast(a.startNum as decimal(18, 8)) as startNum ,
cast(a.startMoney as decimal(18, 8)) as startMoney,cast(a.EndNum as decimal(18, 8)) as EndNum,cast(a.EndMoney as decimal(18, 8)) as EndMoney 
into Reports_Stock from 
(select case when a.AccountBookCode is null then b.AccountBookCode else  a.AccountBookCode end AccountBookCode,
	 case when a.AreaCode is null then b.AreaCode else  a.AreaCode end AreaCode,
	 case when a.ProductCode is null then b.ProductCode else  a.ProductCode end ProductCode,
	 isNull(a.EndNum,0) as startNum,isNull(a.EndMoney,0) as startMoney,
	 b.EndNum,b.EndMoney from @TempTabx a full join  @TempTab b on a.AccountBookCode = b.AccountBookCode and a.AreaCode = b.AreaCode and a.ProductCode=b.ProductCode
) a left join L_Basic_Product_Tab b on a.productCode = b.idcode

set nocount off
SET ANSI_WARNINGS On --关闭警告: 聚合或其它 SET 操作消除了空值


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Build_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Build_StockCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[sp_Build_StockCheck] as 
/**
	生成库存清点临时表
**/
set nocount on


truncate table L_stockCheck_Temp_Tab
insert Into L_stockCheck_Temp_Tab (ProductCode,StockNum,checkNum,avgPrice)
	select ProductCode,Num +WaitInNum-WaitOutNum as num,0,avgPrice from V_Stock where Num +WaitInNum-WaitOutNum<>0
set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Build_StockEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Build_StockEx]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--   exec Sp_Buid_History_InOut_Reports ''2023-11-01'',''2023-11-20'',1，101,12624,0

CREATE proc [dbo].[Sp_Build_StockEx] 
/*计算当日库存（入库连在途量）*/
	@ToDay Smalldatetime,
	@ExcludeToDayStockChange bit = 0 --排除当日的清点 回推清点数据时有用
AS
set nocount on
SET ANSI_WARNINGS OFF --关闭警告: 聚合或其它 SET 操作消除了空值
	/*if DATEDIFF(MONTH,@ToDay,getDate())<-1
	begin
		Raiserror(''日期跨度不能超过1个月'',16,1)
		return
	end; */
	declare @MaxAt Smalldatetime
	select @MaxAt = Convert(Varchar(10),Max(dat),120) from l_sys_GroupInf_Tab
	declare @TempTab Table (
			AccountBookCode int,AreaCode int,ProductCode varchar(20),
			StartNum decimal(18, 8),StartMoney  decimal(18, 8),PurchaseNum  decimal(18, 8),PurchaseMoney decimal(18, 8),SaleNum decimal(18, 8),SaleMoney decimal(18, 8),
			StockSwapNum decimal(18, 8),StockSwapMoney decimal(18, 8),
			AreaExChangeNum decimal(18, 8),AreaExChangeMoney decimal(18, 8),StockChangeNum decimal(18, 8),
			StockChangeMoney decimal(18, 8),StockReceiveNum decimal(18, 8),StockReceiveMoney decimal(18, 8),
			EndNum as [StartNum]+[PurchaseNum]-[SaleNum]+[StockSwapNum]-[areaExChangeNum]+[StockChangeNum]-[StockReceiveNum],
			EndMoney as [StartMoney]+[PurchaseMoney]-[SaleMoney]+[StockSwapMoney]-[AreaExChangeMoney]+[StockChangeMoney]-[StockReceiveMoney]
		)

		Insert into @TempTab (AccountBookCode,AreaCode,ProductCode,StartNum,StartMoney,PurchaseNum,PurchaseMoney,SaleNum,SaleMoney,StockSwapNum,StockSwapMoney,
				AreaExChangeNum,AreaExChangeMoney,StockChangeNum,StockChangeMoney,StockReceiveNum,StockReceiveMoney)
			
			select AccountBookCode,AreaCode,ProductCode,Sum(StartNum),Sum(StartMoney),Sum(PurchaseNum),Sum(PurchaseMoney),Sum(SaleNum),Sum(SaleMoney),
				Sum(StockSwapNum),Sum(StockSwapMoney),
				Sum(AreaExChangeNum),Sum(AreaExChangeMoney),Sum(StockChangeNum),Sum(StockChangeMoney),
				Sum(StockReceiveNum),Sum(StockReceiveMoney) from (
					--汇总
					Select AccountBookCode,AreaCode,ProductCode,EndNum as StartNum,EndMoney as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Group_InOut_tab  where At = @MaxAt-1 
					Union All --采购
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,(NumEx) as PurchaseNum,(NumEx*ActualCostPrice) as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Purchases_Tab  
					where DeliveryAt BetWeen @MaxAt and @ToDay 
					Union All  -- 销售
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase as SaleNum,
						(NumEx-replaceNumEx)*DoubleNumExBase*PackBase*
						(ActualCostPrice/DoubleNumExBase/PackBase) as SaleMoney,
						0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from V_Bill_Sales_Tab  
					where DeliveryAt  BetWeen @MaxAt and @ToDay
					Union All --清点
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,(ChangeNum) as StockChangeNum,(ChangeNum*costprice) as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockChanges_Tab 
					where changeAt  BetWeen @MaxAt and CASE WHEN @ExcludeToDayStockChange=0 THEN @ToDay ELSE @ToDay -1 END and examineUserCode>0
					Union All --领用
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						(num*-1) as StockReceiveNum,(Num*-1*costprice) as StockReceiveMoney from L_Bill_StockReceives_Tab 
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
					Union All --拆零
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,(Num*type) as StockSwapNum,(Num*type*costprice) as StockSwapMoney,
						0 as AreaExChangeNum,0 as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_StockSwaps_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
					Union All --调拨
					Select AccountBookCode,AreaCode,ProductCode,0 as StartNum,0 as StartMoney,0 as PurchaseNum,0 as PurchaseMoney,
						0 as SaleNum,0 as SaleMoney,0 as StockSwapNum,0 as StockSwapMoney,
						(Num*ExChangeType) as AreaExChangeNum,(Num*ExChangeType*CostPrice) as AreaExChangeMoney,0 as StockChangeNum,0 as StockChangeMoney,
						0 as StockReceiveNum,0 as StockReceiveMoney from L_Bill_AreaExChanges_Tabs  
					where Convert(VarChar(10),at,120) BetWeen @MaxAt and @ToDay and examineUserCode>0
			) x Group by AccountBookCode,AreaCode,ProductCode
--select AccountBookCode,AreaCode,ProductCode,StartNum,EndNum from @TempTab 

--select AccountBookCode,AreaCode,ProductCode,StartNum,EndNum from @TempTabx 

if exists (select * from dbo.sysobjects where id = object_id(N''[dbo].[Reports_StockEx]'') and OBJECTPROPERTY(id, N''IsUserTable'') = 1)
	drop table [dbo].Reports_StockEx

select a.AccountBookCode,a.AreaCode,b.CateCode,a.ProductCode,b.BarCode,b.SelfCode, b.Name,isNull(b.Spec,'''') as Spec,b.Unit,cast(a.EndNum as decimal(18, 8)) as EndNum,cast(a.EndMoney as decimal(18, 8)) as EndMoney 
into Reports_StockEx from  @TempTab  a left join L_Basic_Product_Tab b on a.productCode = b.idcode

set nocount off
SET ANSI_WARNINGS On --关闭警告: 聚合或其它 SET 操作消除了空值

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CalcCostPrice_FromPurchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CalcCostPrice_FromPurchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[Sp_CalcCostPrice_FromPurchase] 
    @BillNumber VARCHAR(20),
    @UpdateType INT
AS
/**
    采购收货，退货审核时以当天相同产品计算平均单价，并更新当天的销售单成本价
    @BillNumber VARCHAR(20) 采购入库单
**/
SET NOCOUNT ON

DECLARE @DeliveryAt SMALLDATETIME
DECLARE @PurchaseOrderBillNumber VARCHAR(20)

SELECT 
    @DeliveryAt = DeliveryAt,
    @PurchaseOrderBillNumber = OrderBillNumber 
FROM L_Bill_Purchase_Tab 
WHERE BillNumber = @BillNumber

IF @UpdateType = 1
BEGIN
    UPDATE a 
    SET a.JumpUpdateTrigger = 1,
        a.CostPrice = b.costprice 
    FROM L_Bill_PurchaseOrders_Tab# a,
        (
            SELECT BatchNumber, costprice 
            FROM L_Bill_Purchases_Tab 
            WHERE billnumber = @BillNumber
        ) b 
    WHERE a.BatchNumber = b.BatchNumber
END

DECLARE @PurchaseTemp TABLE 
(
    SaleOrderIdkey VARCHAR(100),
    ProductCode VARCHAR(20),
    num DECIMAL(18, 2),
    numex DECIMAL(18, 2),
    CostPrice DECIMAL(18, 8),
    BatchNumber VARCHAR(100)
)

INSERT INTO @PurchaseTemp 
(
    SaleOrderIdkey,
    ProductCode,
    num,
    numex,
    CostPrice,
    BatchNumber
)
SELECT 
    SaleOrderIdkey,
    ProductCode,
    num,
    numex,
    CostPrice,
    BatchNumber
FROM L_Bill_PurchaseOrders_Tab#
WHERE DeliveryAt = @DeliveryAt 
    AND BillNumber = @PurchaseOrderBillNumber

UPDATE a SET a.costprice = b.CostPrice FROM  L_Bill_Sales_Tabs a,@PurchaseTemp b
WHERE a.DeliveryAt= @DeliveryAt AND a.ProductCode = b.ProductCode and a.BatchNumber = b.BatchNumber

UPDATE a 
SET a.BatchNumber = b.BatchNumberList,
    a.costprice = b.CostPrice,
    a.ActualCostPrice = b.CostPrice 
FROM L_Bill_Sales_Tab a,
(
    SELECT 
        SaleOrderIdkey,
        SUM(CostPrice * NumEx) / SUM(NumEx) AS CostPrice,
        STUFF
        (
            (
                SELECT '','' + BatchNumber 
                FROM @PurchaseTemp t2 
                WHERE t2.SaleOrderIdkey = t1.SaleOrderIdkey 
                FOR XML PATH('''')
            ), 1, 1, ''''
        ) AS BatchNumberList
    FROM @PurchaseTemp t1
    GROUP BY SaleOrderIdkey
) b 
WHERE a.OrderIdKey = b.SaleOrderIdkey


UPDATE a 
SET a.AvgCostPrice = b.AvgCostPrice 
FROM L_Basic_Product_Tab a,
(
    SELECT 
        ProductCode,
        SUM(numex * CostPrice) / SUM(Numex) AS AvgCostPrice 
    FROM V_Bill_Purchases_Tab 
    WHERE DeliveryAt = @DeliveryAt 
    GROUP BY ProductCode
) b 
WHERE a.IdCode = b.ProductCode

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalcInPirce]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CalcInPirce]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec [sp_CalcInPirce] ''2023-11-11'',1

CREATE proc [dbo].[sp_CalcInPirce] 
	@at smallDateTime,
	@updateStyle int
as
/* 将报损金额平均到对应出库单中
	@billNumber --报损单号
*/

set nocount on
	declare @Purchases Table(
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL
	)
	
	declare @sales Table(
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL
	)
	declare @StockChange Table(
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL,
		[changeNum] [float] NOT NULL,
		[CostMoney] [float] NOT NULL
	)

	--1.返回对应送货日销售总数
	insert into @sales
	select ProductCode,SUM(ExChangeNumEx) as num
		from V_Bill_Sales_Tab a 
	where EXISTS (
		select 1 from L_Bill_StockChanges_Tab
		where  CONVERT(char(10),changeAt,120)=@at and 
			a.ProductCode = ProductCode
	) and  CONVERT(char(10),DeliveryAt,120)=@at group by ProductCode
	


	--2.返回报损数量
	insert into @StockChange
	select ProductCode,SUM(Num) as num,sum(abs(changeNum)) as chanegNum,sum(abs(changeNum)*costprice) as CostMoney 
		from L_Bill_StockChanges_Tab a 
	where CONVERT(char(10),changeAt,120)=@at and  ChangeNum<0
	group by ProductCode


	--3.平均单价
	update a set a.ActualCostPrice = a.CostPrice+
		b.addPrice * DoubleNumExBase * PackBase *
		@updateStyle,
		a.LossNote=  case when @updateStyle =1 then a.LossNote +'';''+ b.LossNote else '''' end from L_Bill_Sales_Tab a,
	(
		select a.ProductCode,b.CostMoney/(a.num) as addPrice,
			''  报损数量:''+dbo.xb_trim(b.changeNum)+
			''  报损金额:''+dbo.xb_trim(b.CostMoney)+
			''  当日销量:''+dbo.xb_trim(a.num)+
			''  平均报损单价:''+dbo.xb_trim(b.CostMoney/(a.num)) +
			''  平均报损单价=报损金额÷当日销量''
			as LossNote
		from @sales a,@StockChange b
		where  a.ProductCode = b.ProductCode
	) b
	where CONVERT(char(10),DeliveryAt,120)=@at and a.ProductCode = b.ProductCode
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalcSalePirce]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CalcSalePirce]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_CalcSalePirce] @at smallDateTime
as
/*计算销售成本与变更成本*/
set nocount on
declare 
	@AllowedExceedStock bit, --是否可以负库存
	@CostPriceInPurchare bit --以当日进货平均
select @AllowedExceedStock  = AllowedExceedStock,@CostPriceInPurchare=CostPriceInPurchare from L_Sys_Parmars_Tab
	declare @CTE_DATA Table (
		AreaCode int Not Null,
		ProductCode VarChar(20) Not Null,
		EndNum decimal(18, 8) Not Null default 0,
		EndMoney decimal(18, 8) Not Null default 0,
		TodayNum decimal(18, 8) Not Null,
		TodayMoney decimal(18, 8) Not Null,
		AvgCostPrice decimal(18, 8) Not Null
	) 
	if @CostPriceInPurchare = 0 
	begin
		exec Sp_Build_Stock @at
		Insert Into @CTE_DATA (AreaCode,ProductCode,EndNum,EndMoney,TodayNum,TodayMoney,AvgCostPrice)
			select AreaCode,ProductCode,EndNum,EndMoney,TodayNum,TodayMoney,CostMoney / NumEx From (
				select AreaCode,productCode,Sum(EndNum) as EndNum,Sum(EndMoney) as EndMoney,Sum(TodayNum) as TodayNum,
					Sum(TodayMoney) as TodayMoney,SUM(CostMoney) as CostMoney,SUM(numEx) as NumEx 
				from (
						select AreaCode,ProductCode,NumEx as ToDayNum,NumEx * costprice as TodayMoney,0 as EndNum,0 as EndMoney, numEx,NumEx * costprice as CostMoney from V_Bill_Purchases_Tab where DeliveryAt = @At and billtype in (0,2)  and examineUserCode >0
						union all 
						select AreaCode,ProductCode,Num as ToDayNum,Num*costprice as ToDayMoney,0 as EndNum,0 as EndMoney,num as NumEx,Num*costprice as CostMoney From L_Bill_StockSwaps_Tabs  where type = 1 and CONVERT(char(10),at,120)=@at  and examineUserCode >0
						Union All
						select AreaCode,ProductCode,Num as ToDayNum,Num*costprice as ToDayMoney,0 as EndNum,0 as EndMoney,num as NumEx,Num*costprice as CostMoney From L_Bill_StockSplits_Tabs  where  CONVERT(char(10),changeAt,120)=@at  and examineUserCode >0
						Union All
						select AreaCode,ProductCode,0 as TodayNum,0 as TodayMoney,StartNum,StartMoney, StartNum as NumEx,StartMoney as CostMoney From Reports_Stock
				) x group by AreaCode,ProductCode
			) x where NumEx<>0

		update a set 
			a.ActualCostPrice =  b.AvgCostPrice * DoubleNumExBase * PackBase,
			a.costprice=b.AvgCostPrice * DoubleNumExBase * PackBase,
			lossNote =
				''期初存货:''
				+ dbo.xb_trim(b.EndNum) 
				+''   期初金额:''
				+dbo.xb_trim(b.EndMoney)
				+''   当日来货量:''
				+dbo.xb_trim(b.TodayNum / CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   当日来货金额:''
				+dbo.xb_trim(b.TodayMoney)
				+''   平均单价:''
				+dbo.xb_trim(b.AvgCostPrice*CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   成本单价不含报损=(期初金额+当日来货金额)÷(期初存货+当日来货量)''
				+'';''
		from L_Bill_Sales_Tab a,@CTE_DATA b 
		where a.DeliveryAt=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode 
		update a set 
			a.ActualCostPrice =  b.AvgCostPrice * DoubleNumExBase * PackBase,
			a.costprice=b.AvgCostPrice * DoubleNumExBase * PackBase,
			lossNote =
				''期初存货:''
				+dbo.xb_trim(b.EndNum) 
				+''   期初金额:''
				+dbo.xb_trim(b.EndMoney)
				+''   当日来货量:''
				+dbo.xb_trim(b.TodayNum / CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   当日来货金额:''
				+dbo.xb_trim(b.TodayMoney)
				+''   平均单价:''
				+dbo.xb_trim(b.AvgCostPrice*CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   成本单价不含报损=(期初金额+当日来货金额)÷(期初存货+当日来货量)''
				+'';''
		from L_Bill_Sales_Tab# a,@CTE_DATA b 
		where a.DeliveryAt=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode
	end
	if @CostPriceInPurchare = 1 
	begin
		Insert Into @CTE_DATA (AreaCode,ProductCode,EndMoney,TodayNum,TodayMoney,AvgCostPrice)
			select AreaCode,ProductCode,EndMoney,TodayNum,TodayMoney,CostMoney / NumEx From (
				select AreaCode,productCode,Sum(EndNum) as EndNum,Sum(EndMoney) as EndMoney,Sum(TodayNum) as TodayNum,
					Sum(TodayMoney) as TodayMoney,SUM(CostMoney) as CostMoney,SUM(numEx) as NumEx 
				from (
						select AreaCode,ProductCode,SaleType,NumEx as ToDayNum,NumEx * costprice as TodayMoney,0 as EndNum,0 as EndMoney, numEx,NumEx * costprice as CostMoney from V_Bill_Purchases_Tab where DeliveryAt = @At and billtype in (0,2) and examineUserCode >0
						Union All
						select AreaCode,ProductCode,0 as SaleType,Num as ToDayNum,Num*costprice as ToDayMoney,0 as EndNum,0 as EndMoney,num as NumEx,Num*costprice as CostMoney From L_Bill_StockSwaps_Tabs  where type = 1 and CONVERT(char(10),at,120)=@at  and examineUserCode >0
						Union All
						select AreaCode,ProductCode,0 as SaleType,Num as ToDayNum,Num*costprice as ToDayMoney,0 as EndNum,0 as EndMoney,num as NumEx,Num*costprice as CostMoney From L_Bill_StockSplits_Tabs  where  CONVERT(char(10),changeAt,120)=@at  and examineUserCode >0
					) x group by AreaCode,ProductCode
			) x where NumEx<>0

		update a set 
			a.ActualCostPrice =  b.AvgCostPrice * DoubleNumExBase * PackBase,
			a.costprice=b.AvgCostPrice * DoubleNumExBase * PackBase,
			lossNote =
				+''   当日来货量:''
				+dbo.xb_trim(b.TodayNum / CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   当日来货金额:''
				+dbo.xb_trim(b.TodayMoney)
				+''   平均单价:''
				+dbo.xb_trim(b.AvgCostPrice *CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   成本单价不含报损=当日来货金额÷当日来货量''
				+'';''
		from L_Bill_Sales_Tab a,@CTE_DATA b 
		where a.DeliveryAt=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

		update a set 
			a.ActualCostPrice =  b.AvgCostPrice * DoubleNumExBase * PackBase,
			a.costprice	=	b.AvgCostPrice * DoubleNumExBase * PackBase,
			lossNote =
				+''   当日来货量:''
				+dbo.xb_trim(b.TodayNum /CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   当日来货金额:''
				+dbo.xb_trim(b.TodayMoney)
				+''   平均单价:''
				+dbo.xb_trim(b.AvgCostPrice*CASE WHEN a.SaleType=3 then a.Pack ELSE 1 END)
				+''   成本单价不含报损=当日来货金额÷当日来货量''
				+'';''
		from L_Bill_Sales_Tab# a,@CTE_DATA b 
		where a.DeliveryAt=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode
			
	end
	/**更新商品表中的平均成本**/
	update a set a.AvgCostPrice = b.AvgCostPrice  From L_Basic_Product_Tab a,@CTE_DATA b where a.IdCode = b.ProductCode 

	/**不加价客户直接用成本价代替销售单价**/
	update L_Bill_Sales_Tab set salePrice = costprice/**CASE WHEN SaleType=3 then Pack ELSE 1 END*/ where Idkey in (
		select Idkey from (
			select a.*,b.notAddPrice from V_Bill_Sales_Tab a,L_Basic_Company_Tab b where a.DeliveryAt=@at and a.CustomerCode = b.IdCode 
		) x where notAddPrice = 1
	)
	update L_Bill_Sales_Tab# set salePrice = costprice/**CASE WHEN SaleType=3 then Pack ELSE 1 END*/ where Idkey in (
		select Idkey from (
			select a.*,b.notAddPrice from V_Bill_Sales_Tab a,L_Basic_Company_Tab b where a.DeliveryAt=@at and a.CustomerCode = b.IdCode 
		) x where notAddPrice = 1
	)


	update a set a.ActualCostPrice = b.AvgCostPrice* DoubleNumExBase * PackBase,
		a.costprice=b.AvgCostPrice* DoubleNumExBase * PackBase
	from (select * from L_Bill_Sales_Tab x where DeliveryAt=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where a.DeliveryAt=@At and a.ProductCode = b.IdCode 

	update a set a.ActualCostPrice = b.AvgCostPrice* DoubleNumExBase * PackBase,a.costprice=b.AvgCostPrice* DoubleNumExBase * PackBase
	from (select * from L_Bill_Sales_Tab# x where DeliveryAt=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where a.DeliveryAt=@At and a.ProductCode = b.IdCode 

--变更
	update a set a.costprice=b.AvgCostPrice from  L_Bill_StockChanges_Tab a,@CTE_DATA b  
	where  CONVERT(char(10),changeAt,120)=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

	update a set a.costprice=b.AvgCostPrice
	from (select * from L_Bill_StockChanges_Tab x where CONVERT(char(10),changeAt,120)=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where CONVERT(char(10),changeAt,120)=@At and a.ProductCode = b.IdCode 

--调拨
	update a set a.costprice=b.AvgCostPrice from L_Bill_AreaExChanges_Tabs a,@CTE_DATA b  
	where CONVERT(char(10),At,120)=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

	update a set a.costprice=b.AvgCostPrice
	from (select * from L_Bill_AreaExChanges_Tabs x where CONVERT(char(10),at,120)=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where CONVERT(char(10),at,120)=@At and a.ProductCode = b.IdCode 
--拆零
/*	update a set a.costprice=b.AvgCostPrice from  L_Bill_StockSwaps_Tabs a,@CTE_DATA b  
	where CONVERT(char(10),at,120)=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

	update a set a.costprice=b.AvgCostPrice
	from (select * from L_Bill_StockSwaps_Tabs x where CONVERT(char(10),at,120)=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where CONVERT(char(10),at,120)=@At and a.ProductCode = b.IdCode 
*/
--领用
	update a set a.costprice=b.AvgCostPrice from  L_Bill_StockReceives_Tab a,@CTE_DATA b  
	where CONVERT(char(10),at,120)=@At and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

	update a set a.costprice=b.AvgCostPrice
	from (select * from L_Bill_StockReceives_Tab x where CONVERT(char(10),at,120)=@At and not Exists (select 1 from @CTE_DATA where x.productCode = productCode and x.AreaCode=AreaCode) ) a,L_Basic_Product_Tab b 
	where CONVERT(char(10),at,120)=@At and a.ProductCode = b.IdCode 
/**end else begin
	/**
		允许负库存的情况
		直接取最后进货的平均成本
	**/
	update a set a.costPrice = b.avgprice,a.ActualCostPrice = b.avgprice from L_Bill_Sales_Tab a,
		(select DeliveryAt,productcode,SUM(numEx*costPrice)/SUM(numEx) as avgprice from V_Bill_Purchases_Tab where DeliveryAt = @at  group by productcode,DeliveryAt) b
	where a.DeliveryAt = b.DeliveryAt and a.ProductCode = b.ProductCode
end;
**/
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Calculate_Loss]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Calculate_Loss]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[sp_Calculate_Loss]
    @DeliveryAt SMALLDATETIME ,
	@UpdateType Int
AS
/*
***************************************************
    功能：计算当日损耗
    参数：
        @DeliveryAt 送货日期
**************************************************
*/

SET NOCOUNT ON

DECLARE @LossMoney FLOAT
DECLARE @SaleNum FLOAT
DECLARE @SaleTotalNum FLOAT



DECLARE @ProductLoss TABLE (
    ProductCode INT,
	BatchNumber VARCHAR(50),
    LossMoney FLOAT
)

INSERT INTO @ProductLoss (
    ProductCode,
	BatchNumber,
    LossMoney
)
SELECT ProductCode,
		BatchNumber,
       SUM(ChangeNum * CostPrice) 
FROM L_Bill_StockChanges_Tabs 
WHERE ChangeAt = @DeliveryAt 
  AND ChangeNum <> 0
GROUP BY ProductCode,BatchNumber


UPDATE a 
SET a.LossMoney = a.LossMoney + b.Rate * b.LossMoney * @UpdateType , 
	a.ActualCostPrice = a.costprice + (a.LossMoney + b.Rate * b.LossMoney * @UpdateType ) *-1 / a.numEx 
FROM L_Bill_Sales_Tab a 
INNER JOIN (
    SELECT a.IdKey,
           a.BillNumber,
           a.ProductCode,
		   a.BatchNumber,
           a.NumEx,
           CONVERT(DECIMAL(18,2), a.NumEx * 1.0 / SUM(a.NumEx) OVER(PARTITION BY a.ProductCode,a.BatchNumber)) AS Rate,
           b.LossMoney 
    FROM V_Bill_Sales_Tab a 
    INNER JOIN @ProductLoss b ON a.ProductCode = b.ProductCode
    WHERE a.DeliveryAt = @DeliveryAt 
		AND a.BatchNumber = b.BatchNumber 
		AND a.LossAllocation = 1
) b ON a.IdKey = b.IdKey

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_calcuPack]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_calcuPack]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[Sp_calcuPack] 
	@num float,
	@NumList varchar(200),
	@outNum float OUTPUT,
	@AcceptPack varchar(200) OUTPUT,
	@OwePack varchar(200) OUTPUT 
as
/*
	计算输入数量分包
		@num bigint,--操作的数量
		@NumList varchar(200),--原先的包装列表
		@outNum bigint out, --超出的数理
		@AcceptPack varchar(200),--接单包装
		@OwePack varchar(200)--欠数包装

*/
set nocount on
declare @doNum decimal(18, 2),@thisNum float,@thisVal float,@ResNumList varchar(200)='''',@OweNumList Varchar(200)='''',@i int
set @doNum = @num


		 
declare __Cursor cursor for select col from dbo.f_splitSTR(@NumList,'','') where col<>''0''
	
		open __Cursor

		fetch next from __Cursor into @thisVal
			
		While (@@Fetch_status=0)--游标循环开始
		Begin
		/*------------------------------*/
	
			set @thisNum = @doNum
			set @doNum = @doNum - @thisVal
			if @doNum <=0
			begin
				if @thisNum >0
				begin
					set @ResNumList= @ResNumList+'',''+Cast(@thisNum as varchar(10))
					if @doNum<>0
						set @OweNumList= @OweNumList+'',''+Cast(abs(@doNum) as varchar(10))
				end
				if @thisNum <=0 
					set @OweNumList= @OweNumList+'',''+Cast(abs(@thisVal) as varchar(10))

			end else begin
				if @thisVal <>0
				set @ResNumList= @ResNumList+'',''+Cast(@thisVal as varchar(10))

			end
		/*------------------------------*/
		fetch next from __Cursor into @thisVal
		end --销售游标循环结束
		close   __Cursor  --关闭销售游标   
		deallocate   __Cursor--删除销售游标  
		
		set @ResNumList = STUFF(@ResNumList, 1, 1, '''')
		set @OweNumList = STUFF(@OweNumList, 1, 1, '''')
	
		set @i = dbo.f_countSTR(@ResNumList,'','') 
		while(@i<4)
		begin
			set @ResNumList = @ResNumList + '',0''
			set @i=@i+1
		end
		set @i = dbo.f_countSTR(@OweNumList,'','') 
		while(@i<4)
		begin
			set @OweNumList = @OweNumList + '',0''
			set @i=@i+1
		end
		
		if @doNum >0 
			set @outNum = @doNum
		else 
			set @outNum = 0
			
		set @AcceptPack = isNull(@ResNumList,''0,0,0,0'')
		set @OwePack = isNull(@OweNumList,''0,0,0,0'')
		
set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CancelAutoAccept]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CancelAutoAccept]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[Sp_CancelAutoAccept] 
	@BillNumber Varchar(20)
as
/**
撤销自动分流，条件为对应的采购订单没有审核,用于销售订单
**/
set noCount on
	 IF (SELECT count(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber and ISNULL(DisTributionNum,0)>0)>0 
	 BEGIN
		RAISERROR(''订单已存在配货，不能反签'',16,1)
		RETURN 
	 END 
	declare @SaleOrderKey varchar(20),@PurchareBillNumber VarChar(20)
	declare __Cursor cursor for select Idkey from L_Bill_SaleOrders_Tab where BillNumber = @BillNumber
	open __Cursor
	fetch next from __Cursor into @SaleOrderKey
	While (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		Select @PurchareBillNumber = BillNumber  from L_Bill_PurchaseOrders_Tab# where SaleOrderIdkey = @SaleOrderKey
		If (select status from L_Bill_PurchaseOrder_Tab where BillNumber = @PurchareBillNumber)=0
		Begin
			delete L_Bill_PurchaseOrders_Tab# where SaleOrderIdkey = @SaleOrderKey
		ENd
	/*------------------------------*/
	fetch next from __Cursor into @SaleOrderKey
	end --销售游标循环结束
	close   __Cursor  --关闭销售游标   
	deallocate   __Cursor--删除销售游标  
set noCount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelProduct]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CancelProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_CancelProduct] 
	@BillNumber varchar(20),
	@Idkey varchar(100),
	@prodcutcode varchar(20),
	@cancelNum float,
	@cancelNumEx float
as 
/* 
***************************************************
	功能：取消单个商品						
	参数：	
			@BillNumber :订单号 
			@Idkey :主键
			@prodcutcode：商品号
			@cancelNum 取消数量
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @DeliveryBillNumber varchar(20),--送货单号
			@curNumList varchar(200)
	declare @oNum bigint,
		@AcceptPack varchar(200),
		@OwePack varchar(200)
	/**判断数据是否被采购完**/
	If (select count(*)	from V_Purchase_Group_Detail_Tab a where Idkey=@Idkey)=0
	BEGIN
		Raiserror( ''数据已被其它用户采购，取消失败'',16,1)
		return 
	end;	
	Select @DeliveryBillNumber=DeliveryBillNumber from L_Bill_SaleOrder_Tab where BillNumber=@BillNumber
	update a
		set a.num=a.num-@cancelNum / DoubleNumBase,
			a.numEx = a.NumEx -@cancelNumEx / DoubleNumExBase
	from L_Bill_Sales_Tab a,
		(select ProductCode From L_Bill_SaleOrders_Tab where BillNumber=@BillNumber and Idkey=@Idkey) b
	where a.Billnumber=@DeliveryBillNumber and a.ProductCode=b.ProductCode and OrderIdKey =  @Idkey
	
	delete L_Bill_Sales_Tab where BillNumber=@DeliveryBillNumber and num<=0
	
	update L_Bill_SaleOrders_Tab 
		set num = num-@cancelNum/ DoubleNumBase,
			numEx = NumEx -@cancelNumEx / DoubleNumExBase,
			AcceptStatus = 1 --取消商品时接单状态为1
	where billnumber=@BillNumber and ProductCode = @prodcutcode and Idkey = @Idkey
	
	delete L_Bill_SaleOrders_Tab where BillNumber=@BillNumber and num<=0

	if (Select COUNT(*) from L_Bill_SaleOrders_Tab where billnumber = @BillNumber)=0
	begin --删除对应订单
		delete L_Bill_SaleOrder_Tab where BillNumber=@BillNumber
	end
	
	if (Select COUNT(*) from L_Bill_Sales_Tab where billnumber = @DeliveryBillNumber)=0
	begin --删除对应送货单
		delete L_Bill_Sale_Tab where BillNumber=@DeliveryBillNumber
	end

set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CateSwapRows]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CateSwapRows]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- Exec sp_CateSwapRows ''10101'',10102,10101
CREATE Proc [dbo].[Sp_CateSwapRows] 
	@ChangeIdCodeList VarChar(4000),
	@SourceIdCode Int,
	@TargetIdCode int,
	@Direction int
as
/**
	分类排序
	@ChangeIdCodeList VarChar(4000),要排序的IDCDOE 表表
	@SourceIdCode Int,  拖动的IdCode
	@TargetIdCode int   拖动完成时的IDCODE
	@Direction int 方向 向上1，向下-1
**/
set Nocount on
	declare @TempIdCode bigint;
	declare @SourceListTab Table (
	  IdCode bigint
	)
	Insert Into @SourceListTab 	select Col From dbo.f_splitSTR(@ChangeIdCodeList,'';'') Order By Col Desc

	
	IF @SourceIdCode >10000 
	BEGIN --两级分类
		SET @TempIdCode = 90000 + @SourceIdCode
		Update L_Basic_Cate_Tab set IdCode = @TempIdCode WHERE IdCode = @SourceIdCode
		Update a set a.idCode = a.idCode + 1*@Direction From L_Basic_Cate_Tab a,@SourceListTab b where a.idCode = b.IdCode
		Update L_Basic_Cate_Tab set IdCode = @TargetIdCode WHERE IdCode = @TempIdCode

		Update L_Basic_Product_Tab set CateCode = @TempIdCode WHERE CateCode = @SourceIdCode
		Update a set a.CateCode = a.CateCode + 1*@Direction From L_Basic_Product_Tab a,@SourceListTab b where a.CateCode = b.IdCode
		Update L_Basic_Product_Tab set CateCode = @TargetIdCode WHERE CateCode = @TempIdCode
	END;
	IF @SourceIdCode <10000 
	BEGIN -- 一级分类
		SET @TempIdCode = 90000 + @SourceIdCode
		Update L_Basic_Cate_Tab set IdCode = @TempIdCode WHERE IdCode = @SourceIdCode
		Update a set a.idCode = a.idCode + 1*@Direction From L_Basic_Cate_Tab a,@SourceListTab b where a.idCode = b.IdCode
		Update L_Basic_Cate_Tab set IdCode = @TargetIdCode WHERE IdCode = @TempIdCode

		Update L_Basic_Cate_Tab set PCode = @TempIdCode WHERE PCode = @SourceIdCode
		Update a set a.PCode = a.PCode + 1*@Direction,a.IdCode = REPLACE(a.IdCode,a.PCode,PCode+1*@Direction) From L_Basic_Cate_Tab a,@SourceListTab b where a.PCode = b.IdCode
		Update L_Basic_Cate_Tab set PCode = @TargetIdCode, idCode = REPLACE(IdCode,PCode- 90000,@TargetIdCode) WHERE PCode = @TempIdCode

		Update L_Basic_Product_Tab set CateCode = CateCode*100 WHERE CateCode/100 = @SourceIdCode
		Update a set a.CateCode = REPLACE(a.CateCode,a.CateCode/100,a.CateCode/100+1) From L_Basic_Product_Tab a,@SourceListTab b where a.CateCode /100 = b.IdCode
		Update L_Basic_Product_Tab set CateCode = REPLACE(CateCode/100,CateCode /10000,@TargetIdCode) WHERE CateCode/10000  = @SourceIdCode

	END;

set NoCount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChanageSaleDeliveryAt]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChanageSaleDeliveryAt]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_ChanageSaleDeliveryAt] 
	@BillNumber varchar(20),
	@DeliveryAt date
as
/**
	修改送货日期
		@BillNumber varchar(20),
		@DeliveryAt date
**/


set NoCount on
	if (select ExamineUserCode from L_Bill_Sale_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''审核过的单据不能修改送货日期,不能修改'',16,1)
		return 
	end
	/*if (select datediff(day,Getdate(),@DeliveryAt) from L_Bill_Sale_Tab where billnumber=@billnumber)<0 
	begin
		Raiserror( ''送货日期不能小于当前日期,不能修改'',16,1)
		return 
	end
	*/
	update L_Bill_Sales_Tab set DeliveryAt = @DeliveryAt where billnumber = @BillNumber
	update L_Bill_Sale_Tab set DeliveryAt = @DeliveryAt where billnumber = @BillNumber
set NoCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProduct]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[sp_ChangeProduct] 
	@BillNumber VARCHAR(20),
	@Idkey VARCHAR(100),
	@ProductCode VARCHAR(20),
	@DownUnit VARCHAR(20),
	@DownWg FLOAT,
	@SaleType INT,--此参数无用
	@num FLOAT,
	@numEx FLOAT,
	@numList VARCHAR(200),
	@costprice FLOAT,
	@saleprice FLOAT,
	@note VARCHAR(200),
	@defaultShipperCode BIGINT
AS 
/* 
***************************************************
	功能：换商品						
	参数：	
			@BillNumber :销售订单号 
			@Idkey :原商品主键
			@prodcutcode：新商品号
			@num：数量
			@numList：包装
			@costprice：成本
			@saleprice：单价,
			@note: 备注
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON

	DECLARE @DeliveryBillNumber VARCHAR(20),--送货单号
			@CurProductCode VARCHAR(20), --原商品号
			@CurProductName VARCHAR(50),--原商品名
			@NewProductName VARCHAR(50),--新商品名
			@ExaMINeUserCode INT,
			@CurSaleType INT,
			@CurDownWg FLOAT,
			@MAXKey VARCHAR(20),
			@CustomerCode BIGINT,
			@CustomerPrice FLOAT,
			@DoMethod VARCHAR(100),
			@CurDetailNote VARCHAR(MAX),
			@DetailNote VARCHAR(MAX),
			@replaceNumEx FLOAT,--代打数量
			@MagnIFication INT, --倍率 用于KG转500g
			@dr FLOAT, --折扣
			@decimalBIT INT, --小数位
			@SaleFROMQuotePrice BIT, --销售时一定要取报价
			@Pcode INT
	
	/**判断数据是否被采购完**/
	IF (SELECT COUNT(*)	FROM V_PurchASe_Group_Detail_Tab a WHERE Idkey=@Idkey)=0
	BEGIN
		RAISERROR( ''数据已被其它用户采购，换货失败'',16,1)
		RETURN 
	END;

	DECLARE @oNum BIGINT,@orderIdKey VARCHAR(100),@DownUnitType INT
	/**如果不存在原数据退出，防止多人操作时会无刷新时出现多余的菜*/
	IF (SELECT COUNT(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber = @BillNumber and Idkey = @Idkey)=0
	BEGIN
		RAISERROR( ''原商品不存在，可能已换其它商品'',16,1)
		RETURN 
	END;	
	SELECT @DeliveryBillNumber=DeliveryBillNumber,@ExaMINeUserCode= ExaMINeUserCode,@CustomerCode = CustomerCode FROM L_Bill_SaleOrder_Tab WHERE BillNumber=@BillNumber
	SELECT @CurProductCode=productCode,@CurSaleType=SaleType,@CurDownWg=DownWg,@CurDetailNote = DetailNote,@replaceNumEx=replaceNumEx FROM L_Bill_SaleOrders_Tab WHERE Idkey=@Idkey
	SELECT @DownUnitType = DownUnitType,@dr=Dr,@decimalBIT= decimalBIT,@SaleFROMQuotePrice=SaleFROMQuotePrice FROM V_BASic_Customer_Tab WHERE IdCode = @CustomerCode
	SELECT @dr=Dr,@decimalBIT= decimalBIT,@SaleFROMQuotePrice=SaleFROMQuotePrice, @Pcode = ISNULL(Pcode,0) FROM V_BASic_Customer_Tab WHERE IdCode = @CustomerCode
	IF @Pcode <>0
	BEGIN
		SELECT TOP 1 @CustomerCode = IdCode FROM V_BASic_Customer_Tab WHERE PCode = @Pcode ORDER BY IdCode
	END
	IF @SaleFROMQuotePrice = 1 AND (SELECT COUNT(IDkey) FROM V_Customer_Price_Tab WHERE PCode = @CustomerCode AND ProductCode = @ProductCode AND SaleType = @SaleType)=0	
	BEGIN
		 RAISERROR( ''新商品对应客户无报价不能换'',16,1)
		 RETURN 
	END

	IF @SaleType = 4 AND @DownUnitType = 0 
	BEGIN
		SET @SaleType = 0
		SET @DownUnit = ''斤''
	END
	IF @SaleType = 3 
	BEGIN
		SET @costprice = @costprice * @DownWg
	END
	SET @MagnIFication = CASE WHEN @SaleType = 4 THEN 2 ELSE 1 END
	IF (@ProductCode = @CurProductCode and @CurSaleType=@SaleType and @CurDownWg=@DownWg)
	BEGIN
		RAISERROR( ''不能换相同的商品'',16,1)
		RETURN 
	END;
	
	IF @num>(SELECT OweNum*CASE WHEN SaleType = 4 THEN 2 ELSE 1 END FROM L_Bill_SaleOrders_Tab WHERE Idkey=@Idkey)
	BEGIN
		RAISERROR( ''换菜数量不能大于订单欠数'',16,1)
		RETURN 
	END;
	
	/*用报价代替前端送入的单价，用以解决多选换货*/
	SELECT @CustomerPrice = price FROM L_BASic_Customer_Price_Tab WHERE PCode = @CustomerCode and ProductCode = @ProductCode and SaleType = @SaleType

	SELECT @NewProductName = name FROM L_BASic_Product_Tab WHERE IdCode = @ProductCode
	SELECT @CurProductName = name FROM L_BASic_Product_Tab WHERE IdCode = @CurProductCode
	SET @DetailNote = @CurDetailNote +'';''+ Convert(VARCHAR(20),getDate(),120)+''从【''+@CurProductName+''】换成【''+@NewProductName+''】''

	IF (SELECT COUNT(*) FROM L_Bill_SaleOrders_Tab 
		WHERE billnumber = @BillNumber and ProductCode = @ProductCode and SaleType = @SaleType
		and Idkey <> @Idkey and ISNULL(Note,'''')=@Note)>0
	BEGIN --销售订单存在要换的商品-->数量增加,并将接单状态 AcceptStatus设成未接单 (多行时换到第一个）
		UPDATE L_Bill_SaleOrders_Tab 
			SET num = num+ (@num+@replaceNumEx) / @MagnIFication ,
				numEx = numEx+ (@numEx++@replaceNumEx) / @MagnIFication,
				replaceNumEx = replaceNumEx + @replaceNumEx,
				AcceptStatus = 0,
				DetailNote = ISNULL(DetailNote,0) +'';''+@DetailNote
		WHERE Idkey = (SELECT MIN(idkey) FROM L_Bill_SaleOrders_Tab WHERE BillNumber=@BillNumber and ProductCode = @ProductCode and SaleType = @SaleType)
	END ELSE 
	BEGIN
		SELECT @MAXKey = ISNULL(MAX(RIGHT(idkey,4)),0)+1 FROM L_Bill_SaleOrders_Tab WHERE BillNumber=@BillNumber
		SET @orderIdKey = @BillNumber+''-''+dbo.SETNBIT(@MAXKey,''0'',4) --订单IdKey号用于更新销售出库单
		Insert INTO L_Bill_SaleOrders_Tab (
			Idkey,
			BillNumber,
			CustomerCode,
			AccountBookCode,
			AreaCode,
			ProductCode,
			DownUnit,
			DownWg,
			Pack,
			SaleType,
			StockNum,
			num,
			NumEx,
			replaceNumEx,
			costPrice,
			curSalePrice,
			bASePrice,
			salePrice,
			At,
			DeliveryAt,
			billtype,
			ExaMINeUserCode,
			Note,
			DetailNote) 
			SELECT 
				BillNumber+''-''+dbo.SETNBIT(@MAXKey,''0'',4),
				BillNumber,
				CustomerCode,
				AccountBookCode,
				Areacode,
				@ProductCode,
				@DownUnit,
				@DownWg,
				@DownWg AS Pack,
				@SaleType,
				0,
				(@num+@replaceNumEx) / @MagnIFication,
				(@numEx+@replaceNumEx)/ @MagnIFication,
				@replaceNumEx,
				@costprice,
				ISNULL(@CustomerPrice,@saleprice),--ISNULL(@saleprice,0),
				ISNULL(@CustomerPrice,@saleprice),--ISNULL(@saleprice,0),
				ROUND(ISNULL(@CustomerPrice,@saleprice)*@dr,@decimalBIT),--ISNULL(@saleprice,0),
				ExaMINeAt,
				DeliveryAt,
				billType,
				@ExaMINeUserCode,
				@note,
				@DetailNote
			FROM L_Bill_SaleOrder_Tab WHERE BillNumber = @BillNumber		 
		--设置仓位
		UPDATE a SET a.AreaCode=b.AreaCode	FROM L_Bill_SaleOrders_Tab a,
				(SELECT IdCode,AreaCode FROM L_BASic_Product_Tab WHERE IdCode = @ProductCode ) b 
		WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	END;
	
	UPDATE L_Bill_SaleOrders_Tab 
			SET num = num-(@num+@replaceNumEx) / @MagnIFication,
				numEx = (num-(@num+@replaceNumEx) / @MagnIFication)*DownWg,
				replaceNumEx = 0
	WHERE BillNumber=@BillNumber and idkey = @Idkey 
	
	DELETE L_Bill_SaleOrders_Tab WHERE BillNumber=@BillNumber and num<=0
	

	IF (SELECT COUNT(*) FROM L_Bill_Sales_Tab WHERE BillNumber =@DeliveryBillNumber and ProductCode = @ProductCode and SaleType = @SaleType and ISNULL(Note,'''')=@Note)>0
	BEGIN --销售单存在商品数量增加
		UPDATE L_Bill_Sales_Tab 
			SET num = num+(@num+@replaceNumEx)/@MagnIFication,
				numEx = numEx+(@numEx+@replaceNumEx)/@MagnIFication,
				OrderNum = OrderNum+(@num+@replaceNumEx)/@MagnIFication,
				replaceNumEx = replaceNumEx+@replaceNumEx,
				DetailNote = ISNULL(DetailNote,0) +'';''+@DetailNote
		WHERE OrderIdKey = (SELECT MIN(idkey) FROM L_Bill_SaleOrders_Tab WHERE BillNumber=@BillNumber and ProductCode = @ProductCode) 
	END ELSE
	BEGIN
		SELECT @MAXKey = ISNULL(MAX(RIGHT(idkey,4)),0)+1 FROM L_Bill_Sales_Tab WHERE BillNumber=@DeliveryBillNumber
		Insert INTO L_Bill_Sales_Tab (
			Idkey,
			OrderIdKey,
			BillNumber,
			CustomerCode,
			AccountBookCode,
			AreaCode,
			ProductCode,
			DownUnit,
			DownWg,
			Pack,
			SaleType,
			StockNum,
			OrderNum,
			num,
			NumEx,
			replaceNumEx,
			costPrice,
			cursaleprice,
			bASePrice,
			salePrice,
			At,
			DeliveryAt,
			billtype,
			[Status],
			ExaMINeUserCode,
			Note,
			DetailNote
		) SELECT 
			BillNumber+''-''+dbo.SETNBIT(@MAXKey,''0'',4),
			@orderIdKey,
			BillNumber,
			CustomerCode,
			AccountBookCode,
			Areacode,
			@ProductCode,
			@DownUnit,
			@DownWg,
			@DownWg AS Pack,
			@SaleType,
			0,
			(@num+@replaceNumEx)/@MagnIFication,
			(@num+@replaceNumEx)/@MagnIFication,
			(@NumEx+@replaceNumEx)/@MagnIFication,
			@replaceNumEx,
			@costprice,
			ISNULL(@CustomerPrice,@saleprice),--ISNULL(@saleprice,0),
			ISNULL(@CustomerPrice,@saleprice),--ISNULL(@saleprice,0),
			ROUND(ISNULL(@CustomerPrice,@saleprice)*@dr,@decimalBIT),--ISNULL(@saleprice,0),
			ExaMINeAt,
			DeliveryAt,
			billType,
			1,
			0,
			@note,
			@DetailNote
		FROM L_Bill_Sale_Tab WHERE BillNumber = @DeliveryBillNumber
		--设置仓位
		UPDATE a SET a.AreaCode=b.AreaCode
			FROM L_Bill_Sales_Tab a,(SELECT IdCode,AreaCode FROM L_BASic_Product_Tab  WHERE IdCode = @ProductCode ) b 
		WHERE a.billnumber=@DeliveryBillNumber and a.ProductCode=b.IdCode
	END;

	SELECT @num = num-(@num+@replaceNumEx)/@MagnIFication	FROM L_Bill_Sales_Tab WHERE billnumber=@DeliveryBillNumber and OrderIdKey = @Idkey
	

	UPDATE L_Bill_Sales_Tab 
		SET num = @num ,
			numex = @num*DownWg,
			OrderNum = @num,
			replaceNumEx = 0
	WHERE billnumber=@DeliveryBillNumber and OrderIdKey = @Idkey
	
	UPDATE L_Bill_SaleOrders_Tab 
		SET AcceptStatus = 1
	WHERE billnumber=@BillNumber and OweNum <=0
	
	DELETE L_Bill_Sales_Tab WHERE BillNumber=@DeliveryBillNumber and num<=0

SET NOCOUNT OFF





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProduct_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProduct_FromShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[sp_ChangeProduct_FromShipper]
	@PurchASeOrderBillNumber VARCHAR(20),
	@CurOrderIdKey VARCHAR(50),
	@CurProductCode VARCHAR(20),
	@ProductCode VARCHAR(20),
	@Num FLOAT,
	@NumEx FLOAT,
	@CurSaleType INT,
	@SaleType INT,
	@CostPrice FLOAT,
	@DownUnit VARCHAR(20),
	@DownWg FLOAT,
	@Note VARCHAR(50), --备注
	@ChangeType INT,
	@CustomerCode INT=0,--客户名
	@salePrice FLOAT=0 --销售价
AS
/**
	供货商换货（采购订单中）换货
	换菜时数量不能更改
	@PurchASeOrderBillNumber 采购订单号,
	@CurOrderIdKey 采购订单旧商品IDKE,
	@CurProductCode 旧商品号,
	@ProductCode 新商品号,
	@Num 数量,
	@NumEx 数理,
	@CurSaleType 旧商品类型,
	@SaleType 新商品类型
	@CostPrice 单价,
	@DownUnit 下单单位,
	@DownWg 换子,
	@Note  --备注
	@ChangeType 换货方式 1单个换2合并换
**/
SET NOCOUNT ON
	DECLARE @SaleOrderIdKey VARCHAR(50),
		@PurcharOrderIdKey VARCHAR(50),
		@tempMAXIdkey VARCHAR(100),
		@MAXIdkey VARCHAR(100),
		@ShipperCode INT,
		@DeliveryAt date,
		@PurchASeBillNumber VARCHAR(20),
		@UPDATEUserCode INT,
		@CurNum FLOAT,
		@CurNumEx FLOAT,
		@DIFfNum FLOAT,
		@DIFfNumEx FLOAT,
		@RowIndex INT,
		@dr FLOAT, --折扣
		@decimalBIT INT, --小数位
		@SaleFROMQuotePrice BIT, --销售时一定要取报价
		@Pcode INT

	IF @CurProductCode = @ProductCode
	BEGIN
		RAISERROR( ''不能换相同商品，换货失败'',16,1)
		RETURN 
	END;

	SELECT @ShipperCode = ShipperCode,@DeliveryAt=DeliveryAt,@PurchASeBillNumber=PurchASeBillNumber,@UPDATEUserCode = ExaMINeUserCode FROM L_Bill_PurchASeOrder_Tab WHERE BillNumber = @PurchASeOrderBillNumber
	SELECT @SaleOrderIdKey = SaleOrderIdKey FROM L_Bill_PurchASeOrders_Tab# WHERE Idkey = @CurOrderIdKey
	SELECT @CurNum = Num,@CurNumEx = NumEx  FROM L_Bill_PurchASeOrders_Tab WHERE Idkey = @CurOrderIdKey

	SELECT @dr=Dr,@decimalBIT= decimalBIT,@SaleFROMQuotePrice=SaleFROMQuotePrice, @Pcode = ISNULL(Pcode,0) FROM V_BASic_Customer_Tab WHERE IdCode = @CustomerCode
	IF @Pcode <>0
	BEGIN
		SELECT TOP 1 @CustomerCode = IdCode FROM V_BASic_Customer_Tab WHERE PCode = @Pcode ORDER BY IdCode
	END
	IF @SaleFROMQuotePrice = 1 AND (SELECT COUNT(IDkey) FROM V_Customer_Price_Tab WHERE PCode = @CustomerCode AND ProductCode = @ProductCode AND SaleType = @SaleType)=0	
	BEGIN
		 RAISERROR( ''新商品对应客户无报价不能换'',16,1)
		 RETURN 
	END
	IF @ChangeType = 2
	BEGIN/**合并换菜方式*/
		SET @DIFfNum = @Num - @CurNum
		SET @DIFfNumEx = @NumEx - @CurNumEx
		--1.将源数据更新
		IF (SELECT COUNT(*) FROM L_Bill_PurchASeOrders_Tab WHERE BillNumber = @PurchASeOrderBillNumber and ProductCode=@ProductCode)=0
		BEGIN--如果换的新菜不存在，就更改原菜(相当于删除原菜再增加新菜)
			UPDATE L_Bill_PurchASeOrders_Tab 
				SET ProductCode = @ProductCode,
					DownWg = @DownWg,
					DownUnit = @DownUnit,
					Num = @Num,
					NumEx = @NumEx,
					SaleType = @SaleType,
					costprice = @CostPrice
			WHERE Idkey = @CurOrderIdKey
		END ELSE BEGIN --如果换的新菜已存在，就删除原菜
			DELETE L_Bill_PurchASeOrders_Tab WHERE Idkey = @CurOrderIdKey
		END


		DECLARE _OrderCursor CURSOR FOR 
			SELECT ROW_NUMBER() OVER(ORDER BY IdKey) AS RowIndex, Idkey AS PurcharOrderIdKey,SaleOrderIdKey
			FROM L_Bill_PurchASeOrders_Tab# 
			WHERE BillNumber = @PurchASeOrderBillNumber and
				  ProductCode = @CurProductCode and
				  SaleType = @CurSaleType
		OPEN _OrderCursor
		FETCH NEXT FROM _OrderCursor INTO @RowIndex,@PurcharOrderIdKey,@SaleOrderIdKey
		WHILE (@@FETCH_STATUS=0)--游标循环开始
		BEGIN
		/*------------------------------*/
			--2.更改已接单情况
			IF @RowIndex = 1 and (ABS(@DIFfNum)>0 or ABS(@DIFfNumEx)>0)
			BEGIN --数量不相等时且第一行
				UPDATE L_Bill_PurchASeOrders_Tab# 
					SET ProductCode = @ProductCode,
						Num	= Num + @DIFfNum,
						NumEx = NumEx + @DIFfNumEx,
						DownWg = @DownWg,
						DownUnit = @DownUnit,
						SaleType = @SaleType,
						costprice = @CostPrice
				WHERE Idkey = @PurcharOrderIdKey
			END ELSE BEGIN
				UPDATE L_Bill_PurchASeOrders_Tab# 
					SET ProductCode = @ProductCode,
						DownWg = @DownWg,
						DownUnit = @DownUnit,
						SaleType = @SaleType,
						costprice = @CostPrice
				WHERE Idkey = @PurcharOrderIdKey
			END
			--3.更改客户订单
			UPDATE L_Bill_SaleOrders_Tab  
				SET ProductCode = @ProductCode,
					DownWg = @DownWg,
					DownUnit = @DownUnit,
					SaleType = @SaleType,
					costprice = @CostPrice,
					curSalePrice = @salePrice,
					bASePrice = @salePrice,
					salePrice = ROUND(@salePrice * @dr,@decimalBIT)
			WHERE Idkey = @SaleOrderIdKey
			--4.更改送货单
			UPDATE L_Bill_Sales_Tab  
				SET ProductCode = @ProductCode,
					DownWg = @DownWg,
					DownUnit = @DownUnit,
					SaleType = @SaleType,
					costprice = @CostPrice,
					curSalePrice = @salePrice,
					bASePrice = @salePrice,
					salePrice = ROUND(@salePrice * @dr,@decimalBIT)
			WHERE OrderIdKey = @SaleOrderIdKey
		/*------------------------------*/
		FETCH NEXT FROM _OrderCursor INTO @RowIndex,@PurcharOrderIdKey,@SaleOrderIdKey
		END --销售游标循环结束
		CLOSE   _OrderCursor  --关闭销售游标   
		DEALLOCATE   _OrderCursor--删除销售游标 
	END
	IF @ChangeType = 1
	BEGIN			
		/***2.进行换货操作
			IF 新货不在本单 then
			BEGIN
				IF 商品只存在一个客户 then 直接更新采购订货单商品号为新商品 ELSE 增加
			END esle BEGIN
				更新新货的数量
			END;
		*/
		IF (SELECT COUNT(*) FROM L_Bill_PurchASeOrders_Tab# WHERE SaleOrderIdkey = @SaleOrderIdKey)>1
		BEGIN
			RAISERROR(''商品存在多点供货,不能换,请用其它方式处理'',16,1)
			RETURN
		END 
		IF (SELECT COUNT(billnumber) FROM L_Bill_PurchASeOrders_Tab WHERE BillNumber=@PurchASeOrderBillNumber and ProductCode=@ProductCode and SaleType=@SaleType)=0
		BEGIN --采购订单号不存在换货的商品
			/**如果此商品只含一个客户 直接更新商品订货表,否则新加*/
			IF (SELECT COUNT(idkey) FROM L_Bill_PurchASeOrders_Tab# WHERE BillNumber=@PurchASeOrderBillNumber and ProductCode = @CurProductCode and SaleType=@SaleType)=1
			BEGIN
				UPDATE L_Bill_PurchASeOrders_Tab 
					SET ProductCode = @ProductCode,
						DownWg = @DownWg,
						DownUnit = @DownUnit,
						Num = @Num,
						NumEx = @NumEx,
						SaleType = @SaleType,
						costprice = @CostPrice
				WHERE  BillNumber=@PurchASeOrderBillNumber and ProductCode = @CurProductCode and SaleType=@SaleType
			END ELSE BEGIN
				SELECT @tempMAXIdkey= ISNULL(MAX(RIGHT(idkey,4)),0)+1 FROM L_Bill_PurchASeOrders_Tab WHERE billnumber=@PurchASeOrderBillNumber
				SET @MAXIdkey = @PurchASeOrderBillNumber+''-''+dbo.SETNBIT(@tempMAXIdkey,''0'',4)
				Insert INTO L_Bill_PurchASeOrders_Tab
				(
					IdKey,
					BillNumber,
					ShipperCode,
					ProductCode,
					DownUnit,
					DownWg,
					SaleType,
					Num,
					NumEx,
					CostPrice,
					salePrice,
					ExaMINeUserCode,
					At,
					DeliveryAt,
					Status
				) values (
					@MAXIdkey,
					@PurchASeOrderBillNumber,
					@ShipperCode,
					@ProductCode,
					@DownUnit,
					@DownWg,
					@SaleType,
					@Num,
					@NumEx,
					@CostPrice,0,0,
					GETDATE(),
					@DeliveryAt,0
				)
			END;
		END ELSE --存在 
		BEGIN
			UPDATE a SET a.num = b.Num,a.numEx = b.NumEx,a.costprice = b.AvePrice FROM L_Bill_PurchASeOrders_Tab a,(
				SELECT BillNumber,ProductCode,SaleType,SUM(Num) AS Num,SUM(Numex) AS NumEx,SUM(NumEx*CostPrice)/SUM(NumEx) AS AvePrice FROM L_Bill_PurchASeOrders_Tab#
					WHERE BillNumber = @PurchASeOrderBillNumber and ProductCode = @ProductCode 
					Group by BillNumber,ProductCode,SaleType
				) b
			WHERE a.BillNumber = b.BillNumber and a.ProductCode = b.ProductCode and a.SaleType = b.SaleType
		END
			
		--2.更改已接单情况
		UPDATE L_Bill_PurchASeOrders_Tab# 
			SET ProductCode = @ProductCode,
				DownWg = @DownWg,
				DownUnit = @DownUnit,
				Num = @Num,
				NumEx = @NumEx,
				SaleType = @SaleType,
				costprice = @CostPrice
		WHERE Idkey = @CurOrderIdKey
		/*1.计算换走商品的总数量并更新采购订单对应商品
			IF 换走商品没空了 then 删除采购订单对应商品 ELSE 更新数量等
		*/
		IF (SELECT COUNT(idkey) FROM L_Bill_PurchASeOrders_Tab# WHERE BillNumber=@PurchASeOrderBillNumber and ProductCode = @CurProductCode and SaleType=@SaleType)=0
		BEGIN
			DELETE  L_Bill_PurchASeOrders_Tab WHERE  BillNumber=@PurchASeOrderBillNumber and ProductCode = @CurProductCode and SaleType=@CurSaleType
		END ELSE BEGIN
			UPDATE a SET a.num = b.Num,a.numEx = b.NumEx,a.costprice = b.AvePrice FROM L_Bill_PurchASeOrders_Tab a,(
				SELECT BillNumber,ProductCode,SaleType,SUM(Num) AS Num,SUM(Numex) AS NumEx,SUM(NumEx*CostPrice)/SUM(NumEx) AS AvePrice FROM L_Bill_PurchASeOrders_Tab#
					WHERE BillNumber = @PurchASeOrderBillNumber and ProductCode = @CurProductCode 
					Group by BillNumber,ProductCode,SaleType
				) b
			WHERE a.BillNumber = b.BillNumber and a.ProductCode = b.ProductCode and a.SaleType = b.SaleType
		END;
		--3.更改客户订单
		UPDATE L_Bill_SaleOrders_Tab  
			SET ProductCode = @ProductCode,
				DownWg = @DownWg,
				DownUnit = @DownUnit,
				Num = @Num,
				NumEx = @NumEx,
				SaleType = @SaleType,
				costprice = @CostPrice,
				curSalePrice = @salePrice,
				bASePrice = @salePrice,
				salePrice = ROUND(@salePrice * @dr,@decimalBIT)
		WHERE Idkey = @SaleOrderIdKey
		--4.更改送货单
		UPDATE L_Bill_Sales_Tab  
			SET ProductCode = @ProductCode,
				DownWg = @DownWg,
				DownUnit = @DownUnit,
				Num = @Num,
				NumEx = @NumEx,
				SaleType = @SaleType,
				costprice = @CostPrice,
				curSalePrice = @salePrice,
				bASePrice = @salePrice,
				salePrice = ROUND(@salePrice * @dr,@decimalBIT)
		WHERE OrderIdKey = @SaleOrderIdKey
	
		
	END;
	IF @UPDATEUserCode <>0
		EXEC sp_PurchASeOrderToPurchASe_repeat @PurchASeBillNumber,@PurchASeOrderBillNumber,@UPDATEUserCode
SET NOCOUNT OFF


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangeProductNumber]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ChangeProductNumber]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_ChangeProductNumber] 
	@BillNumber varchar(20),
	@Idkey varchar(100),
	@num float,
	@numEx float,
	@Note varchar(100),
	@replaceNum float
as 
/* 
***************************************************
	功能：更改订单数量						
	参数：	
			@BillNumber :销售订单号 
			@Idkey :商品主键
			@num：数量
			@replaceNum 代打
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on

	declare @DeliveryBillNumber varchar(20),--送货单号
		@AcceptNum Float,--已接单数量
		@AcceptNumEx Float,
		@FreeNum Float,
		@FreeNumEx Float
		
	Select @DeliveryBillNumber=DeliveryBillNumber from L_Bill_SaleOrder_Tab where BillNumber=@BillNumber
	Select @AcceptNum = AcceptNum,@AcceptNumEx = AcceptNumEx,@FreeNum = FreeNum, @FreeNumEx = freeNumEx From L_Bill_SaleOrders_Tab where BillNumber=@BillNumber and Idkey = @Idkey
	update L_Bill_SaleOrders_Tab 
			set num = @AcceptNum + (@FreeNum + @num) / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				numEx = @AcceptNumEx + (@FreeNumEx + @numEx) / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				replaceNumEx = @replaceNum  / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				Note = @Note
		where BillNumber=@BillNumber and Idkey = @Idkey
	update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where BillNumber=@BillNumber and Idkey = @Idkey and OweNum <=0

	update L_Bill_Sales_Tab 
			set num = @AcceptNum + (@FreeNum + @num) / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				numEx = @AcceptNumEx + (@FreeNumEx + @numEx) / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				OrderNum = @AcceptNum + (@FreeNum + @num) / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				replaceNumEx = @replaceNum  / CASE WHEN SaleType = 4 THEN 2 ELSE 1 END,
				Note = @Note
		where billnumber=@DeliveryBillNumber and OrderIdKey = @Idkey
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CheckStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec Sp_CheckStock ''冲红'',''CH202311210001''

CREATE proc [dbo].[Sp_CheckStock] 
	@TypeTxt Varchar(20),
	@BillNumBer VarChar(20)
as
/**
	检测库存数量，并提示
**/
set NoCount on
	declare @TempStockList Table(
		[ProductCode] [varchar](20) NOT NULL,
		[ProductName] [varchar](100) NOT NULL,
		[ProductSpec] [varchar](50) NOT NULL,
		[Qnum] [float] NOT NULL,
		[outnum] [float] NOT NULL,
		[stocknum] [float] NOT NULL
	)
	declare @ErrTxt varChar(max)

	IF 	@TypeTxt=''采购退货''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,Sum(abs(numEx)) as num from L_Bill_Purchases_Tab where billnumber=@billnumber  group by AccountBookCode,areaCode,ProductCode
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+''规格：''+Isnull(ProductSpec,'''')+char(10)+''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''退货数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+''库存不足，不能退货''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

	IF 	@TypeTxt=''冲红''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,Sum(abs(numEx)) as num from L_Bill_Purchases_Tab where billnumber=@billnumber and numEx<0 group by AccountBookCode,areaCode,ProductCode
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+
				''规格：''+Isnull(ProductSpec,'''')+char(10)+
				''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''退货数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+
				''库存不足，不能冲红''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

	IF 	@TypeTxt=''销售''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,Sum(abs(numEx)) as num from L_Bill_Sales_Tab where billnumber=@billnumber  group by AccountBookCode,areaCode,ProductCode
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+''规格：''+Isnull(ProductSpec,'''')+char(10)+''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''销售数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+''库存不足，不能出库''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

	IF 	@TypeTxt=''库存变更''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,abs(Num) as num from L_Bill_StockChanges_Tab where BillNumber=@BillNumber and ChangeNum<0 
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+''规格：''+Isnull(ProductSpec,'''')+char(10)+''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''变更数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+''库存不足，不能变更''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

	IF 	@TypeTxt=''领用''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,abs(Num) as num from L_Bill_StockReceives_Tab where billnumber=@billnumber
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+''规格：''+Isnull(ProductSpec,'''')+char(10)+''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''领用数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+''库存不足，不能领用''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

	IF 	@TypeTxt=''拆零''	
	BEGIN
		INSERT INTO @TempStockList (ProductCode,ProductName,ProductSpec,Qnum,outnum,stocknum)
			select a.ProductCode,c.name,isNull(c.spec,'''') as spec,isnull(b.num,0)-abs(a.num) as Qnum,a.num,isnull(b.num,0) from (
				select AccountBookCode,areaCode,ProductCode,abs(Num) as num from L_Bill_StockSwaps_Tab where billnumber=@billnumber
			) a 
			left join (select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab group by AccountBookCode,areaCode,ProductCode) b 
			on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 
			left join  L_Basic_Product_Tab c on a.ProductCode = c.IdCode
		if (Select Count(ProductCode) from @TempStockList where Qnum<0)>0 
		begin
			Select @ErrTxt=
				''品名：''+ProductName+char(10)+''规格：''+Isnull(ProductSpec,'''')+char(10)+''库存数量：''+CAST(stocknum as varchar(10))+char(10)+
				''拆零数量：''+CAST(outnum as varchar(10))+char(10)+char(10)+''库存不足，不能拆零''
			from @TempStockList where Qnum<0

			Raiserror(@ErrTxt,16,1)
			return 
		end
	END;

set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckSumit]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_CheckSumit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec Sp_CheckSumit ''冲红'',''CH202311210001''

CREATE proc [dbo].[Sp_CheckSumit] 
	@TypeTxt Varchar(20),
	@BillNumBer VarChar(20),
	@UpdateType Int
as
/**
	检测审核，并提示
**/
set NoCount on
	declare @ErrTxt varChar(max)
	declare 
		@AllowedExceedStock bit,		--允许负库存
		@OutNotCalclStock bit,			--不计算库存
		@OutMustDis bit				--出货要先配货		
	select	@ErrTxt = '''',@AllowedExceedStock =AllowedExceedStock,@OutNotCalclStock=OutNotCalclStock,	@OutMustDis	=OutMustDis	from L_Sys_Parmars_Tab	

	IF 	@TypeTxt=''收货''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select MrUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select ShipperCode from V_Bill_Purchase_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt =''此单无指定供货商，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber and numex=0)>0	
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核'' 
			--IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
			--	SET @ErrTxt = ''审核日期不能小于送货日期,不能审核''
			--IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)<-2						
			--	SET @ErrTxt = ''审核日期与送货日期已超过3日,不能审核''
		END ELSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0 						
				SET @ErrTxt = ''此单已入帐,不能反签''
			IF @ErrTxt='''' and (Select AlreadyMoney from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 					
				SET @ErrTxt =''单据已存在付款，不能反签''
			IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 				
				SET @ErrTxt = ''只能反签当天的当据,操作失败'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;

	IF 	@TypeTxt=''采购退货''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select MrUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select ShipperCode from V_Bill_Purchase_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt =''此单无指定供货商，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber and numex=0)>0	
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核'' 
			IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''审核日期不能小于送货日期,不能审核''
			--IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)<-2						
			--	SET @ErrTxt = ''审核日期与送货日期不超过3日,不能审核''
		END ELSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0 						
				SET @ErrTxt = ''此单已入帐,不能反签''
			IF @ErrTxt='''' and (Select AlreadyMoney from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 					
				SET @ErrTxt =''单据已存在付款，不能反签''
			IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 				
				SET @ErrTxt = ''只能反签当天的当据,操作失败'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;

	IF 	@TypeTxt=''冲红''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select MrUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select ShipperCode from V_Bill_Purchase_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt =''此单无指定供货商，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Purchases_Tab where billnumber=@billnumber and numex=0)>0	
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核'' 
			IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''审核日期不能小于送货日期,不能审核''
			IF @ErrTxt='''' and (Select DATEDIFF(day,GETDATE(),DeliveryAt) from V_Bill_Purchase_Tab where billnumber=@billnumber)<-2						
				SET @ErrTxt = ''审核日期与送货日期不超过3日,不能审核''
		END ELSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from V_Bill_Purchase_Tab where billnumber=@billnumber)>0 						
				SET @ErrTxt = ''此单已入帐,不能反签''
			IF @ErrTxt='''' and (Select AlreadyMoney from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 					
				SET @ErrTxt =''单据已存在付款，不能反签''
			IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from V_Bill_Purchase_Tab where billnumber=@billnumber)<>0 				
				SET @ErrTxt = ''只能反签当天的当据,操作失败'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;

	IF 	@TypeTxt=''销售''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and @OutNotCalclStock=0 and (select COUNT(billNumber) from V_Bill_Purchase_Tab where MrUserCode>0 and ExamineUserCode = 0)>0 						
				SET @ErrTxt = ''存在未入帐的采购单,不能审核''
			IF @ErrTxt='''' and (select datediff(day,DeliveryAt,Getdate()) from V_Bill_Sale_Tab where billnumber=@billnumber)<0 						
				SET @ErrTxt = ''审核日期不能小于送货日期,不能审核''
			IF @ErrTxt='''' and (Select ExamineUserCode from V_Bill_Sale_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select CustomerCode from V_Bill_Sale_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt =''此单无指定客户，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Sales_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from V_Bill_Sales_Tab where billnumber=@billnumber and numex=0)>0	
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核'' 
			IF @ErrTxt='''' and @OutMustDis=1 and (select Count(BillNumber) From V_Bill_Sales_Tab where BillNumber=@billnumber and num<>0 and isNull(distributionnum,0)=0)>0/**下单量num =0 代表直接在送货单加的商品*/
				SET @ErrTxt = ''此单存在未配货的商品,不能审核'' 
		END ElSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from V_Bill_Sale_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt = ''此单还末审核，不能反签''
			IF @ErrTxt='''' and (Select AlreadyMoney from V_Bill_Sale_Tab where billnumber=@billnumber)<>0 					
				SET @ErrTxt =''单据已存在收款，不能反签''
			--IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from V_Bill_Sale_Tab where billnumber=@billnumber)<>0 				
			--	SET @ErrTxt = ''只能反签当天的当据，不能反签'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;

	IF 	@TypeTxt=''库存变更''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockChange_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select AccountBookCode from L_Bill_StockChange_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt =''请指定分店，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from L_Bill_StockChanges_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
		END ElSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockChange_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt = ''此单还末审核，不能反签''
			--IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_StockChange_Tab where billnumber=@billnumber)<>0 				
			--	SET @ErrTxt = ''只能反签当天的当据，不能反签'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;
	IF 	@TypeTxt=''领用''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockReceive_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select AccountBookCode from L_Bill_StockReceive_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt =''请指定分店，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from L_Bill_StockReceives_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from L_Bill_StockReceives_Tab where billnumber=@billnumber and Num=0)>0 				
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核''
		END ElSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockReceive_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt = ''此单还末审核，不能反签''
			IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_StockReceive_Tab where billnumber=@billnumber)<>0 				
				SET @ErrTxt = ''只能反签当天的当据，不能反签'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;

	IF 	@TypeTxt=''拆零''	
	BEGIN
		IF @UpdateType = 1 BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockSwap_Tab where billnumber=@billnumber)>0						
				SET @ErrTxt = ''此单已审核,不能重复审核''
			IF @ErrTxt='''' and (Select AccountBookCode from L_Bill_StockSwap_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt =''请指定分店，不能审核''
			IF @ErrTxt='''' and (Select Count(BillNumber) from L_Bill_StockSwaps_Tab where billnumber=@billnumber)=0				
				SET @ErrTxt = ''此单无数据,不能审核'' 
			IF @ErrTxt='''' and (Select Count(BillNumber) from L_Bill_StockSwaps_Tab where billnumber=@billnumber and Num=0)>0 				
				SET @ErrTxt = ''此单存在数量为0的商品,不能审核''
			IF @ErrTxt='''' and (Select count(*) From L_Bill_StockSwaps_Tab where  billnumber=@billnumber Group By ProductCode Having Count(ProductCode)>1)>1				
				SET @ErrTxt = ''商品名重复,不能审核''
		END ElSE BEGIN
			IF @ErrTxt='''' and (Select ExamineUserCode from L_Bill_StockSwap_Tab where billnumber=@billnumber)=0						
				SET @ErrTxt = ''此单还末审核，不能反签''
			IF @ErrTxt='''' and (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_StockSwap_Tab where billnumber=@billnumber)<>0 				
				SET @ErrTxt = ''只能反签当天的当据，不能反签'' 
		END;
		IF @ErrTxt <>'''' BEGIN Raiserror(@ErrTxt,16,1);return; END
	END;
set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Clear_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Clear_Purchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[sp_Clear_Purchase] 
 @BillNumber VARCHAR(20)
AS
/**
	清空收货单数据
	@BillNumber 收货单号
**/
SET NOCOUNT ON
	DECLARE @OrderBillNumber VARCHAR(20),@IdKey VARCHAR(50)
	SELECT @OrderBillNumber = OrderBillNumber FROM V_Bill_Purchase_Tab WHERE BillNumber = @BillNumber;

	DECLARE _Cursor CURSOR FOR SELECT Idkey FROM L_Bill_PurchaseOrders_Tab# WHERE BillNumber = @OrderBillNumber
	OPEN _Cursor
	FETCH NEXT FROM _Cursor INTO @IdKey
	WHILE (@@Fetch_status=0)--游标循环开始
	BEGIN
		DELETE L_Bill_PurchaseOrders_Tab# WHERE Idkey = @IdKey 
		FETCH NEXT FROM _Cursor INTO @IdKey
	END --销售游标循环结束
	CLOSE   _Cursor  --关闭销售游标   
	DEALLOCATE  _Cursor--删除销售游标  
	
	DELETE L_Bill_Purchase_Tab WHERE BillNumber = @BillNumber
	DELETE L_Bill_Purchase_Tab# WHERE BillNumber = @BillNumber

SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Copy_FoodMenu] 
	@BillNumber varchar(20),
	@CustomerCode bigInt,
	@DeliveryAt date,
	@FromDeliveryAt Date,
	@FromCustomerCode bigInt
as 

/**
 客户订单，复制菜普
**/

SET NOCOUNT ON
	DECLARE @DownUnitType INT 
	SELECT @DownUnitType = DownUnitType FROM V_Basic_Customer_Tab WHERE IdCode = @CustomerCode
	IF (SELECT count(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber = @BillNumber)>0
	BEGIN
		Raiserror( ''本单已存在商品，不能复制'',16,1)
		return 
	END
	IF @FromCustomerCode=0
	BEGIN
		Raiserror( ''请输定复制来源客户，不能复制'',16,1)
		return 
	END
	DECLARE @Dr Float,@decimalBit Int,@SaleFromQuotePrice Bit,@pcode Int
	SELECT @dr=Dr,@decimalBit= decimalBit,@SaleFromQuotePrice=SaleFromQuotePrice,@pcode = PCode FROM V_Basic_Customer_Tab WHERE IdCode = @CustomerCode
	
	IF @pcode <>0
	BEGIN
		SELECT TOP 1 @CustomerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @pcode ORDER BY IdCode
	END

	INSERT INTO L_Bill_SaleOrders_Tab (
		Idkey,
		BillNumber,
		CustomerCode,
		AccountBookCode,
		AreaCode,
		ProductCode,
		DownUnit,
		DownWg,
		Pack,
		DownUnitType,
		SaleType,
		Num,
		NumEx,
		replaceNumEx,
		costprice,
		curSalePrice,
		basePrice,
		salePrice,
		At,
		DeliveryAt,
		BillType,
		Status,
		AcceptStatus,
		Note)
	SELECT 
		@BillNumber+''-''+dbo.SetNBit(CAST(RowId as varchar(10)),''0'',4) as Idkey,
		@BillNumber,
		@CustomerCode,
		AccountBookCode,
		AreaCode,
		a.ProductCode,
		CASE WHEN SaleType = 0 THEN CASE WHEN @DownUnitType=1 THEN ''公斤'' ELSE ''斤'' END ELSE DownUnit END DownUnit,
		DownWg,
		Pack,
		@DownUnitType,
		CASE WHEN SaleType = 0 AND @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
		Num,
		NumEx,
		0,
		costprice,
		ISNULL(b.price,0) AS curSalePrice,
		isNull(b.price,0) as basePrice,
		ROUND(isNull(b.price,0)*@Dr,@decimalBit) as salePrice,
		GETDATE() AS At,
		@DeliveryAt,
		BillType,
		0 AS Status,
		0 AS AcceptStatus,
		Note
	 FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY IdKey) AS RowId,
			CASE WHEN SaleType = 4 THEN 0 ELSE SaleType END SaleType,
			CASE WHEN SaleType = 4 THEN costprice / 2 ELSE costprice END costprice,
			AccountBookCode,AreaCode,ProductCode,DownUnit,DownWG,Pack,Num,NumEx,BillType,Note FROM V_Bill_SaleOrders_Tab WHERE  CustomerCode = @FromCustomerCode and DeliveryAt = @FromDeliveryAt
		) a	LEFT JOIN 
		(SELECT ProductCode,price FROM L_Basic_Customer_Price_Tab WHERE PCode = @CustomerCode) b
	  ON a.ProductCode = b.ProductCode
SET NOCOUNT OFF






' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu_Add]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Copy_FoodMenu_Add] 
	@UserCode int,
	@CustomerCode bigInt,
	@DeliveryAt date,
	@FromDeliveryAt Date,
	@FromCustomerCode bigInt
as 

/**
 复制菜普到临时数据
**/

set noCount on
	if (select count(*) from L_Bill_SaleOrders_Add_Tab where UserCode = @UserCode)>0
	begin
		Raiserror( ''已存在商品，不能复制'',16,1)
		return 
	end
	if @FromCustomerCode=0
	begin
		Raiserror( ''请输定复制来源客户，不能复制'',16,1)
		return 
	end
	DECLARE @Dr Float,@decimalBit Int,@SaleFromQuotePrice Bit,@pcode Int
	SELECT @dr=Dr,@decimalBit= decimalBit,@SaleFromQuotePrice=SaleFromQuotePrice,@pcode = PCode FROM V_Basic_Customer_Tab WHERE IdCode = @CustomerCode
	IF @pcode <>0
	BEGIN
		SELECT TOP 1 @CustomerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @pcode ORDER BY IdCode
	END

	insert into L_Bill_SaleOrders_Add_Tab (
		Idkey,
		UserCode,
		AreaCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		Num,
		NumEx,
		replaceNumEx,
		costprice,
		curSalePrice,
		BasePrice,
		salePrice,
		Note)
	select 
		REPLACE(Idkey,billnumber,@UserCode)+''-''+cast(RowId as varchar(10)) as Idkey,
		@UserCode,
		AreaCode,
		a.ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		Num,
		NumEx,
		0,
		costprice,
		isNull(b.price,0) as curSalePrice,
		isNull(b.price,0) as basePrice,
		ROUND(isNull(b.price,0)*@Dr,@decimalBit) as salePrice,
		Note
	 from (select ROW_NUMBER() OVER(Order by IdKey) AS RowId,* from V_Bill_SaleOrders_Tab where  CustomerCode = @FromCustomerCode and DeliveryAt = @FromDeliveryAt)a
		left join 
		(select ProductCode,price from L_Basic_Customer_Price_Tab where PCode = @CustomerCode) b
	  on a.ProductCode = b.ProductCode
set noCount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_FoodMenu_ToW]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_FoodMenu_ToW]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Copy_FoodMenu_ToW] 
	@BillNumber varchar(20),
	@CustomerCode bigInt,
	@DeliveryAt date,
	@FromDeliveryAt Date,
	@FromCustomerCode bigInt
as 

/**
 客户订单，复制菜普
**/

SET NOCOUNT ON
	DECLARE @DownUnitType INT 
	SELECT @DownUnitType = DownUnitType FROM V_Basic_Customer_Tab WHERE IdCode = @CustomerCode
	IF (SELECT count(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber = @BillNumber)>0
	BEGIN
		Raiserror( ''本单已存在商品，不能复制'',16,1)
		return 
	END
	IF @FromCustomerCode=0
	BEGIN
		Raiserror( ''请输定复制来源客户，不能复制'',16,1)
		return 
	END
	DECLARE @Dr Float,@decimalBit Int,@SaleFromQuotePrice Bit,@pcode Int
	SELECT @dr=Dr,@decimalBit= decimalBit,@SaleFromQuotePrice=SaleFromQuotePrice,@pcode = PCode FROM V_Basic_Customer_Tab WHERE IdCode = @CustomerCode
	
	IF @pcode <>0
	BEGIN
		SELECT TOP 1 @CustomerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @pcode ORDER BY IdCode
	END

	INSERT INTO L_Bill_Sales_TabEx (
		Idkey,
		BillNumber,
		CustomerCode,
		AccountBookCode,
		AreaCode,
		ProductCode,
		DownUnit,
		DownWg,
		Pack,
		DownUnitType,
		SaleType,
		Num,
		NumEx,
		replaceNumEx,
		costprice,
		curSalePrice,
		salePrice,
		At,
		DeliveryAt,
		BillType,
		Status,
		examineUserCode,
		Note)
	SELECT 
		@BillNumber+''-''+dbo.SetNBit(CAST(RowId as varchar(10)),''0'',4) as Idkey,
		@BillNumber,
		@CustomerCode,
		AccountBookCode,
		AreaCode,
		a.ProductCode,
		CASE WHEN SaleType = 0 THEN CASE WHEN @DownUnitType=1 THEN ''公斤'' ELSE ''斤'' END ELSE DownUnit END DownUnit,
		DownWg,
		Pack,
		@DownUnitType,
		CASE WHEN SaleType = 0 AND @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
		Num,
		NumEx,
		0,
		costprice,
		ISNULL(b.price,0) AS curSalePrice,
		ROUND(isNull(b.price,0)*@Dr,@decimalBit) as salePrice,
		GETDATE() AS At,
		@DeliveryAt,
		BillType,
		0 AS Status,
		0,
		Note
	 FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY IdKey) AS RowId,
			CASE WHEN SaleType = 4 THEN 0 ELSE SaleType END SaleType,
			CASE WHEN SaleType = 4 THEN costprice / 2 ELSE costprice END costprice,
			AccountBookCode,AreaCode,ProductCode,DownUnit,DownWG,Pack,Num,NumEx,BillType,Note FROM V_Bill_SaleOrders_Tab WHERE  CustomerCode = @FromCustomerCode and DeliveryAt = @FromDeliveryAt
		) a	LEFT JOIN 
		(SELECT ProductCode,price FROM L_Basic_Customer_Price_Tab WHERE PCode = @CustomerCode) b
	  ON a.ProductCode = b.ProductCode
SET NOCOUNT OFF






' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Copy_SaleBill_ToEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Copy_SaleBill_ToEx]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--  exec Sp_Copy_SaleBill_ToEx 90004,''2024-08-01'',''2024-08-31''

CREATE  proc [dbo].[Sp_Copy_SaleBill_ToEx] 
	@CustomerCode Int,
	@StartAt  smalldatetime,
	@EndAt  smalldatetime
AS
/**
复制单据，供外帐使用
**/
SET NOCOUNT ON


INSERT INTO L_Bill_Sale_TabEx (
	BillNumber,AccountBookCode,AreaCode,CurBillNumber,OrderBillNumber,CustomerCode,SettlementType,AccountDay,
	SalesMan,DriverCode,DeliveryCode,MakingUserCode,MakingAt,ExamineUserCode,ExamineAt,DeliveryAt,
	billType,Status,type,costMoney,saleMoney,Note
) 
SELECT BillNumber,AccountBookCode,AreaCode,CurBillNumber,'''' as OrderBillNumber,CustomerCode,SettlementType,AccountDay,
	SalesMan,DriverCode,DeliveryCode,MakingUserCode,MakingAt,0 as ExamineUserCode,ExamineAt,DeliveryAt,
	billType,Status,type,costMoney,saleMoney,Note
FROM V_Bill_Sale_Tab 
WHERE CustomerCode = @CustomerCode and DeliveryAt BETWEEN @StartAt and @EndAt

INSERT INTO L_Bill_SaleS_TabEx (
	Idkey,OrderIdKey,billnumber,CustomerCode,AccountBookCode,AreaCode,ShipperCode,
	ProductCode,BatchNumber,StockNum,OrderNum,DownWg,SaleType,num,numEx,BoxNum,DispNum,DisTributionNum,DisTributionUserCode,DisTributionAt,
	DisTributionChecked,ActualCostPrice,costprice,cursaleprice,salePrice,BoxPrice,examineUserCode,at,BillType,DeliveryAt,Status,DisTributionStatus,
	Note,lossNote,DetailNote,EntryUserCode,EntryAt,replaceNumEx,pack,DownUnitType
)
SELECT Idkey,OrderIdKey,billnumber,CustomerCode,AccountBookCode,AreaCode,ShipperCode,
	ProductCode,BatchNumber,StockNum,OrderNum,DownWg,SaleType,num,numEx,BoxNum,DispNum,DisTributionNum,DisTributionUserCode,DisTributionAt,
	DisTributionChecked,ActualCostPrice,costprice,cursaleprice,salePrice,BoxPrice,0 as examineUserCode,at,BillType,DeliveryAt,Status,DisTributionStatus,
	Note,lossNote,DetailNote,EntryUserCode,EntryAt,replaceNumEx,pack,DownUnitType
FROM V_Bill_SaleS_Tab
WHERE BillNumber In (
	SELECT BillNumber FROM V_Bill_Sale_Tab 
	WHERE CustomerCode = @CustomerCode and DeliveryAt BETWEEN @StartAt and @EndAt
)
SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_Stock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_Stock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Copy_Stock] 
	@BillNumber		varchar(20),
	@AreaCode   int
as
/* 
***************************************************
	功能：调入现有库存						
	参数：	
			@@BillNumber	单号
			@AreaCode   仓库
			
	结果：

	作者：2019-03-24  张建明
**************************************************
*/
	set nocount on
	declare @ChnageAt date,@OutMustDis bit--出货要先配货
	select @ChnageAt=changeAt  from L_Bill_StockChange_Tab where BillNumber = @BillNumber
	select  @OutMustDis=OutMustDis from L_Sys_Parmars_Tab	


	if @AreaCode = 0
	begin
		Raiserror( ''请指定仓库，不能调入库存'',16,1)
		return 
	end
	/*if (select COUNT(BillNumber) from L_Bill_Purchase_Tab where CONVERT(char(10),DeliveryAt,120)= @ChnageAt and examineUserCode = 0)>0
	begin
		delete L_Bill_StockChange_Tab 
		Raiserror( ''损溢日期存在没入帐的采购单'',16,1)
		return 
	end
	if @OutMustDis=1 and (select Count(BillNumber) From L_Bill_Sales_Tab where  CONVERT(char(10),DeliveryAt,120)= @ChnageAt and isNull(distributionnum,0)=0)>0
	begin
		Raiserror(''损溢日期商品配货未完成'',16,1)
		return 
	end;
	*/
    if (select COUNT(BillNumber) from L_Bill_StockChanges_Tab where billnumber=@BillNumber)>0
	begin
		Raiserror( ''当前单据已存在数据，不能调入库存'',16,1)
		return 
	end
	Exec Sp_Build_Stock @ChnageAt
	insert into L_Bill_StockChanges_Tab (
		Idkey,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BillNumber,
		ProductCode,
		StockNum,
		num,
		BatchNumber,
		costprice,
		at)
	select @billNumber+''-''+dbo.SetNBit(RowId,''0'',4),
		1,
		case when @AreaCode=0 then AreaCode else @AreaCode end as AreaCode,
		0,
		@BillNumber,
		productCode,
		EndNum as Num,
		0 ,
		--@billNumber+''-''+dbo.SetNBit(RowId,''0'',4),
		@billNumber+''-''+dbo.SetNBit(RowId,''0'',4),
		EndMoney / EndNum avgPrice,
		GETDATE() 
	from (
		Select ROW_NUMBER() OVER(Order by ProductCode) AS RowId,* From  Reports_Stock where AreaCode = @AreaCode and EndNum <>0
	) a
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Copy_Stock_FromCate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Copy_Stock_FromCate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec sp_Copy_Stock_FromCate ''SC202311140001'',101,''''
CREATE PROCEDURE [dbo].[sp_Copy_Stock_FromCate] 
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
    RAISERROR(''请指定仓库，不能调入库存'', 16, 1)
    RETURN 
END

IF (SELECT COUNT(BillNumber) FROM L_Bill_StockChanges_Tab WHERE billnumber = @BillNumber) > 0
BEGIN
    RAISERROR(''当前单据已存在数据，不能调入库存'', 16, 1)
    RETURN 
END

IF (SELECT COUNT(BillNumber) FROM V_Bill_Purchase_Tab WHERE DeliveryAt = @ChangeAt AND MrUserCode = 0) > 0
BEGIN
    RAISERROR(''损溢日期存在未审核的收货单，不能操作'', 16, 1)
    RETURN 
END

DECLARE @StockTemp TABLE (
	AccountBookCode INT, 
	AreaCode INT, 
	ProductCode INT,
	BatchNumber VARCHAR(50),
	AllowedNum DECIMAL(18, 2),
	Money DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)

DECLARE @StockGroupTemp TABLE (
	AccountBookCode INT, 
	AreaCode INT, 
	ProductCode INT,
	
	AllowedNum DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)
            
INSERT INTO @StockTemp (
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	BatchNumber,
	AllowedNum,
	Money,
	avgPrice
)
EXEC Sp_GetDatStock @ChangeAt,1

INSERT INTO @StockGroupTemp (
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	AllowedNum,
	avgPrice
)
SELECT 
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	SUM(AllowedNum),
	CASE WHEN SUM(AllowedNum) = 0 THEN 0 ELSE SUM(Money) / SUM(AllowedNum) END avgPrice
FROM @StockTemp GROUP BY AccountBookCode,AreaCode,ProductCode

INSERT INTO L_Bill_StockChanges_Tab (
    Idkey,
    AccountBookCode,
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
SELECT @billNumber + ''-'' + dbo.SetNBit(RowId, ''0'', 4),
       1,
       CASE WHEN @AreaCode = 0 THEN AreaCode ELSE @AreaCode END AS AreaCode,
       0,
       @BillNumber,
       productCode,
       AllowedNum,
       0,
       @billNumber + ''-'' + dbo.SetNBit(RowId, ''0'', 4),
       avgPrice,
       @ChangeAt,
       GETDATE() 
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY ProductCode) AS RowId, *
    FROM @StockGroupTemp 
    WHERE AreaCode = @AreaCode 
      AND AllowedNum <> 0
) a

SET NOCOUNT OFF



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_customUpdateProductSalePrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_customUpdateProductSalePrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[sp_customUpdateProductSalePrice] 
 @ProductCode int,
 @SalePrice Float
AS
/**
	自定义修改商品成本价，用于开始使用系统时以前存货未知价格
	@ProductCode int 商品编码
	@SalePrice Float 进价 
**/
set NoCount on
	Update L_Basic_Product_Tab Set inPrice = @SalePrice,AvgCostPrice = @SalePrice where IdCode = @ProductCode
set NoCount Off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_DelGroup]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_DelGroup]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_Data_DelGroup] @At smalldatetime as
/*删除日汇总*/
set nocount on
/*
if (Select COUNT(BillNumber) from L_Pos_Sale_Tab)>0
begin
	if (Select datediff(day,min(At),@at) from L_Pos_Sale_Tab)<=2
	begin
		Raiserror( ''删除汇总日期不能超出基本表保留日期'',16,1) --以前台基本表最小日期为准
		return 
	end; 
end;
*/
delete l_Group_inOut_Area_Tab where At=@at;
delete l_Group_inOut_Cate_Tab where At=@at;
delete l_Group_inOut_Shipper_Tab where At=@at;
delete l_Group_inout_Tab where At=@at;
delete l_Group_inout_Tab# where At=@at;

delete l_Group_Sale_Tab where AT=@At;
delete l_Group_Sale_Tab# where AT=@At;
delete l_Group_Sale_Area_Tab where At=@at;
delete l_Group_Sale_Cate_Tab where At=@at;
delete l_Group_Sale_Customer_Tab where At=@at;
delete l_Group_Sale_Customer_Tabs where At=@at;

delete l_Group_Sale_Driver_Tab where At=@at;
delete l_Group_Sale_Driver_Tabs where At=@at;

delete l_Group_Sale_SalesMan_Tab where At=@at;
delete l_Group_Sale_SalesMan_Tabs where At=@at;

delete l_Group_Sale_SalesPerson_Tab where At=@at;
delete l_Group_Sale_SalesPerson_Tabs where At=@at;

delete L_Group_Sale_Shipper_Tab where At=@at;
delete L_Group_Sale_Shipper_Tabs where At=@at;

delete l_Group_Sale_Store_Tab where At=@at;
delete L_Group_Sale_Total_Tab where At=@at;

delete L_Group_InOut_Accounts_Tab where At=@at;

--反计算报损成本
	exec sp_CalcInPirce @at,-1
update L_sys_GroupInf_Tab set dat=@At

set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_empty]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_empty]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Data_empty] @AccountBookCode varchar(10) as
/*开业清库*/
set nocount on
delete L_Bill_AreaExChange_Tab
delete L_Bill_PayMent_Tab
delete L_Bill_PriceChange_Tab
delete L_Bill_Purchases_Tab
delete L_Bill_Purchase_Tab
delete L_Bill_PurchaseOrders_Tab
delete L_Bill_PurchaseOrder_Tab
delete L_Bill_PurchaseOrders_Tab#
delete l_bill_receivables_tab
update L_Bill_Sales_Tab set DisTributionNum = 0;--先将配货数量清空
delete L_Bill_Sale_Tab
delete L_Bill_SaleOrder_Tab
delete L_Bill_StockChanges_Tab
delete L_Bill_StockChanges_Tabs
delete L_Bill_StockChange_Tab


delete L_Bill_StockSwaps_Tab
delete L_Bill_StockSwaps_Tabs
delete L_Bill_StockSwap_Tab

delete L_Bill_StockCheck_Tab
delete L_Bill_StockReceive_Tab
delete L_Bill_StoreExChange_Tab
delete l_bill_SubjectChange_Tab

--delete L_Bill_QuotedPrices_Tab
--delete L_Bill_QuotedPrice_Tab
truncate table L_Bill_PurchaseOrders_Tab#
truncate table l_Group_inOut_Area_Tab
truncate table l_Group_inOut_Cate_Tab
truncate table l_Group_inOut_Shipper_Tab
truncate table l_Group_inout_Tab
truncate table l_Group_inout_Tab#

truncate table l_Group_Sale_Area_Tab
truncate table l_Group_Sale_Cate_Tab
truncate table l_Group_Sale_Customer_Tab
truncate table l_Group_Sale_Customer_Tabs
truncate table l_Group_Sale_Driver_Tab
truncate table l_Group_Sale_Driver_Tabs
truncate table l_Group_Sale_SalesMan_Tab
truncate table l_Group_Sale_SalesMan_Tabs
truncate table l_Group_Sale_SalesPerson_Tab
truncate table l_Group_Sale_SalesPerson_Tabs
truncate table L_Group_Sale_Shipper_Tab
truncate table L_Group_Sale_Shipper_Tabs
truncate table l_Group_Sale_Store_Tab
truncate table L_Group_Sale_Total_Tab

truncate table L_Group_Sale_Tab
truncate table L_Group_Sale_Tab#

truncate Table L_Bill_Purchase_Tab#
truncate Table L_Bill_Purchases_Tab#

truncate Table L_Bill_Sale_Tab#
truncate Table L_Bill_Sales_Tab#
truncate Table L_BIll_Sales_Tabs

--truncate table L_Stock_Tab

truncate table L_Group_InOut_Accounts_Tab

update L_Basic_Accounts_Tab set Money = 0,initMoney = 0

update L_sys_GroupInf_Tab set dat=getdate()-1
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Data_Init]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Data_Init]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_Data_Init]  @AccountBookCode varchar(10) as
/*系统初始化*/
set nocount on
delete L_Basic_Company_Tab where IdCode<1 and IdCode>90001

delete L_Basic_Customer_Price_Tab
delete L_Basic_Product_Tab;
delete L_Basic_Product_Comb_Tab;
Exec Sp_Data_Empty @AccountBookCode;

set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Deposit]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Deposit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Deposit] 
	@Type			Int,
	@CompanyCode	BigInt,
	@OrderBillNumber Varchar(20),
	@SubjiectCode	int,
	@PayTypeCode	int,
	@Money			float,
	@RateMoney		float,
	@Note			varchar(100),
	@ComputerNumBer	varchar(10),
	@UserCode	int as
/* 
***************************************************
	功能：订金收取						
	参数：	
			@Type			Int			操作类型
			@CompanyCode	BigInt,		单位编码
			@OrderBillNumber Varchar(20),订单号
			@SubjiectCode	int,		科目编码(帐号 期初时)
			@PayTypeCode	int,		支付方式
			@Money			float,		金额
			@RateMoney		float,		手续费
			@Note			varchar(100)摘要
			@ComputerNumBer	varchar(10),机号	
			@UserCode	int			操作员
	结果：
		更新应收应付和帐号数据
	作者：2019-03-24  张建明
**************************************************
*/
	set nocount on
	declare @HeaderText	varchar(20),
			@BillNumber varchar(20),
			@MaxR varchar(20),
			@IdKey Varchar(100),
			@AccountBookCode Int,
			@CustomerCode bigint,--客户号
			@ShAreaCode bigint,--商户号
			@OrderType int -- 订单类型 0 pc下单,1 线上，2购买商户
	
	select @MaxR=Isnull(max(Right(BillNumber,8)),0)+1 from L_Bill_subjectChange_Tab
	set @BillNumber = @HeaderText+dbo.SetNBit(@ComputerNumBer,''0'',3)+dbo.SetNBit(@maxR,''0'',8)
	if @Money<=0 
	begin
		Raiserror( ''金额要大于0，不能继续操作'',16,1)
		return 
	end;
	if @CompanyCode=0 
	begin
		Raiserror( ''请指定单位，不能继续操作'',16,1)
		return 
	end;
	if @SubjiectCode=0
	begin
		Raiserror( ''请指定科目，不能继续操作'',16,1)
		return 
	end;
	if @PayTypeCode=0
	begin
		Raiserror( ''请指定支付方式，不能继续操作'',16,1)
		return 
	end;
	
	select @CustomerCode = CustomerCode,@ShAreaCode=ShAreaCode,@OrderType=[Type] from L_Bill_SaleOrder_Tab
	if @OrderType = 2
	begin--购买商号
		Exec Sp_Buy_Store @billnumber,@CustomerCode,@ShAreaCode,1 
	end;
	if @OrderType >0
	begin
		exec sp_SaleOrderToSale @OrderBillNumber,@UserCode  
	end;
	
	Exec [sp_Subject_Ins_Rec] @Type,@CompanyCode,@SubjiectCode,@PayTypeCode,@Money,@RateMoney,@Note,@ComputerNumBer,@UserCode
	select @AccountBookCode = toAccounts from l_Basic_PayType_Tab where idCode = @PayTypeCode
	Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @AccountBookCode

	--订单更新成完成有订金状态
	update L_Bill_SaleOrder_Tab set Status = 2,
		DepositBillNumber = @BillNumber,
		DepositMoney	= @Money
		where BillNumber =@OrderBillNumber 
	update L_Bill_SaleOrders_Tab set Status = 2 where BillNumber=@OrderBillNumber

	
	
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Edit_Express]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Edit_Express]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[Sp_Edit_Express]
	@BillNumber varchar(20),-- 销售单号
	@InvNumber varchar(50),--发票号
	@InvMoney varchar(20),--发票金额
	@ExpressName varchar(50),--快递公司
	@ExpressNumber varchar(50) -- 快递单号
as
set noCount on
	declare @OrderBillNumber varchar(20)--订单号
	if @InvMoney ='''' 
	begin
		set @InvMoney = 0
	end
	Select @OrderBillNumber = OrderBillNumber From L_Bill_Sale_Tab where BillNumber = @BillNumber
	Update L_Bill_Sale_Tab 
		set InvNumber = @InvNumber,
			InvMoney  = @InvMoney
	where BillNumber = @BillNumber
	
	Update l_bill_SaleOrder_Tab 
		set ExpressName = @ExpressName,
			ExpressNumber  = @ExpressNumber
	where BillNumber = @OrderBillNumber
	
set noCount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseDetailNum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_EditPurchaseDetailNum] 
	@ParentIdKey varchar(50),
	@DetailIdKey varchar(50),
	@InputNum Float,
	@InputNumEx Float,
	@InputCostPrice Float,
	@InputNote Varchar(100)
as
set nocount on

declare @BillNumber Varchar(20),
		@ProductCode varchar(20),
		@PurchaseOrderIdKey varchar(20),
		@SaleType int,
		@DownWg Float,
		@Num Float,
		@NumEx float,
		@AvgCostPrice Float,
		@Deliveryat varchar(20)
	Select @ProductCode = ProductCode,@BillNumber=BillNumber, @Deliveryat=DeliveryAt,@SaleType=SaleType,@DownWg = DownWg from  L_Bill_PurchaseOrders_Tab# where Idkey = @DetailIdKey	
	
	--得到对应的采购订单行Key
	select @PurchaseOrderIdKey =IdKey from L_Bill_PurchaseOrders_Tab where BillNumber = @BillNumber and ProductCode = @ProductCode and @SaleType=SaleType and @DownWg = DownWg

	Update L_Bill_PurchaseOrders_Tab# Set Num = @InputNum,NumEx = @InputNumEx,CostPrice = @InputCostPrice where Idkey = @DetailIdKey	
	/**执行Sp_EditPurchaseOrderDetailNum后会用L_Bill_PurchaseOrders_Tab里面的更新触发器改变收货单的数量与单价*/
	Exec Sp_EditPurchaseOrderDetailNum @PurchaseOrderIdKey,@DetailIdKey,@InputNum,@InputNumEx,@InputCostPrice,@InputNote
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseEntryDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseEntryDetailNum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_EditPurchaseEntryDetailNum] 
	@ParentIdKey varchar(50),
	@DetailIdKey varchar(50),
	@InputNum Float,
	@InputNumEx Float,
	@InputCostPrice Float,
	@InputNote Varchar(100)
as
set nocount on

declare @BillNumber Varchar(20),
		@ProductCode varchar(20),
		@SaleOrderIdKey varchar(20),
		@SaleType int,
		@DownWg Float,
		@Num Float,
		@NumEx float,
		@AvgCostPrice Float,
		@Deliveryat varchar(20)
	Select @ProductCode = ProductCode,@BillNumber=BillNumber,@SaleOrderIdKey=SaleOrderIdKey, @Deliveryat=DeliveryAt,@SaleType=SaleType,@DownWg = DownWg from  L_Bill_PurchaseOrders_Tab# where Idkey = @DetailIdKey	

	IF @InputNum = 0 
		Delete L_Bill_PurchaseOrders_Tab# Where Idkey = @DetailIdKey
	Else	
		Update L_Bill_PurchaseOrders_Tab# Set Num = @InputNum,NumEx = @InputNumEx,CostPrice = @InputCostPrice where Idkey = @DetailIdKey	
	/**执行Sp_EditPurchaseOrderDetailNum后会用L_Bill_PurchaseOrders_Tab里面的更新触发器改变收货单的数量与单价*/
	Exec Sp_EditPurchaseOrderDetailNum @SaleOrderIdKey,@DetailIdKey,@InputNum,@InputNumEx,@InputCostPrice,@InputNote
set nocount off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNum]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE  Proc [dbo].[Sp_EditPurchaseNum] 
	@IdKey varchar(100),
	@Num float,
	@NumEx Float,
	@Price float,
	@Deliveryat varchar(20)
AS 
/*修改采购单数量*/
Set nocount on

declare @BillNumber Varchar(20),
		@ProductCode Varchar(20),
		@SaleType Int,
		@DownWg float,
		@DoIdkey varchar(100),
		@DoSaleOrderIdkey varchar(100),
		@DoNum Float,
		@DoNumEx Float,
		@NewNum Float,
		@NewNumEx Float,
		@CurNum Float,
		@NewAcceptNum float,
		@NewAcceptNumEx float

declare @oNum Float,
		@AcceptPack varchar(200),
		@OwePack varchar(200)	
			
set @NewNum = @num
set @NewNumEx = @NumEx

select @BillNumber=BillNumber,@CurNum = num,@ProductCode=ProductCode,@SaleType=SaleType,@DownWg=DownWg from L_Bill_PurchaseOrders_Tab where Idkey = @IdKey

if @NewNum>@CurNum
begin
	Raiserror( ''数量不能增大，要想改变下单数量，请删除重新下单'',16,1)
	return 
end

if @NewNum = @CurNum
begin
	Update L_Bill_PurchaseOrders_Tab set NumEx = @NumEx,costprice = @Price where Idkey = @IdKey
end;

update L_Bill_PurchaseOrders_Tab set num = @Num,	NumEx = @NumEx,costprice = @Price where Idkey = @IdKey

declare __Cursor cursor for
	select Idkey,Num,NumEx from L_Bill_PurchaseOrders_Tab# where BillNumber = @BillNumber and @ProductCode=ProductCode and SaleType=@SaleType and DownWg=@DownWg
open __Cursor
fetch next from __Cursor into @DoIdkey,@doNum, @doNumEx
While (@@Fetch_status=0)--游标循环开始
Begin
	IF @Num < @doNum
	 BEGIN
		IF @Num<=0
			Update L_Bill_PurchaseOrders_Tab# set Num = 0,NumEx = 0 Where Idkey = @DoIdkey
		ELSE
			Update L_Bill_PurchaseOrders_Tab# set Num = @Num,NumEx = @NumEx Where Idkey = @DoIdkey
	END;
	SET @Num =  @Num - @DoNum
	SET @NumEx = @NumEx - @DoNumEx 
	fetch next from __Cursor into @DoIdkey,@doNum, @doNumEx
end --游标循环结束
close   __Cursor  --关闭游标   
deallocate   __Cursor--删除游标  
--insert into a_temp (a,b,c) values (@BillNumber,@ProductCode,'''')
Update a Set a.AcceptNum = b.num,a.AcceptNumEx = b.NumEx From L_Bill_SaleOrders_Tab a,
	(select SaleOrderIdkey,Sum(Num) as Num,Sum(NumEx) as NumEx from L_Bill_PurchaseOrders_Tab# where BillNumber<>''free'' and Deliveryat = @Deliveryat and ProductCode=@ProductCode Group by SaleOrderIdkey) b
Where a.Idkey = b.SaleOrderIdkey

delete L_Bill_PurchaseOrders_Tab# where BillNumber = @BillNumber and Num<=0 
delete L_Bill_PurchaseOrders_Tab where BillNumber = @BillNumber and Num<=0 
		
/*供货商删除商品时
	1.删除对应采购订单头（如果单据没有内容）
*/
if (select COUNT(idkey) from L_Bill_PurchaseOrders_Tab where billnumber=@BillNumber)=0
begin
	delete L_Bill_PurchaseOrder_Tab where billnumber =@BillNumber
end;
		
/*供货商删除商品时
	1.删除对应采购单
	2.删除对应采购单头（如果单据没有内容）
*/
declare @EditBillNumber varchar(20)
Select @EditBillNumber = billnumber from L_Bill_Purchase_Tab where OrderBillNumber = @BillNumber
delete L_Bill_Purchases_Tab where billnumber =@EditBillNumber and num=0 and numEx=0
if (select COUNT(idkey) from L_Bill_Purchases_Tab where billnumber=@EditBillNumber)=0
begin
	delete L_Bill_Purchase_Tab where billnumber =@EditBillNumber
end;
		
--将销售订单中的状态设成已接单状态
update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where OweNum<=0
update L_Bill_SaleOrders_Tab set AcceptStatus = 0 where OweNum>0


set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNum_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNum_FromShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE  Proc [dbo].[Sp_EditPurchaseNum_FromShipper] 
	@CurOrderIdKey varchar(100),
	@Num float,
	@NumEx Float,
	@CostPrice float,
	@Deliveryat varchar(20)
AS 
/*供货商端修改采购单数量,单价*/
Set nocount on
	set @Num = abs(@Num)
	set @NumEx = Abs(@NumEx)
	declare
		@SaleOrderIdKey varchar(50),
		@PurcharOrderIdKey varchar(50),
		@PurchaseOrderBillNumber varChar(20),
		@ProductCode varChar(20),
		@SaleType int,
		@CurNumEx Float,
		@CurNum Float,
		@DiffNum Float,
		@DiffNumEx Float,
		@RowIndex Int,
		@AllowedOutOrderNum bit --下单量是否可超订单量
	select @AllowedOutOrderNum = AllowedOutOrderNum from L_Sys_Parmars_Tab
	select @PurchaseOrderBillNumber = billNumber,@ProductCode = ProductCode,@SaleType = SaleType,@CurNum = Num,@CurNumEx = NumEx  From L_Bill_PurchaseOrders_Tab where Idkey = @CurOrderIdKey
	set @DiffNum = @Num - @CurNum
	set @DiffNumEx = @NumEx - @CurNumEx
	If @AllowedOutOrderNum=0 and @DiffNumEx>0
	BEGIN
		Raiserror( ''接单数量不能大于下单数量'',16,1)
		return 
	end;
	declare _OrderCursor cursor for 
			select ROW_NUMBER() OVER(Order by IdKey) as RowIndex, Idkey as PurcharOrderIdKey,SaleOrderIdKey
			from L_Bill_PurchaseOrders_Tab# 
			where BillNumber = @PurchaseOrderBillNumber and
				  ProductCode = @ProductCode and
				  SaleType = @SaleType
	open _OrderCursor
	fetch next from _OrderCursor into @RowIndex,@PurcharOrderIdKey,@SaleOrderIdKey
	While (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		if @Num =0
		begin
			delete L_Bill_PurchaseOrders_Tab# 	where Idkey = @PurcharOrderIdKey 
		end else 
		begin
			if @RowIndex = 1 and (ABS(@DiffNum)>0 or ABS(@DiffNumEx)>0)
			begin --数量不相等时,且第一行
				update L_Bill_PurchaseOrders_Tab# 
					set ProductCode = @ProductCode,
						Num	= Num + @DiffNum,
						NumEx = NumEx + @DiffNumEx,
						Costprice = @CostPrice
				where Idkey = @PurcharOrderIdKey
			end else begin
				update L_Bill_PurchaseOrders_Tab# 
					set ProductCode = @ProductCode,
						costprice = @CostPrice
				where Idkey = @PurcharOrderIdKey
			end
			delete L_Bill_PurchaseOrders_Tab# 	where Idkey = @PurcharOrderIdKey and Num = 0
		end;
	/*------------------------------*/
	fetch next from _OrderCursor into @RowIndex,@PurcharOrderIdKey,@SaleOrderIdKey
	end --销售游标循环结束
	close   _OrderCursor  --关闭销售游标   
	deallocate   _OrderCursor--删除销售游标 


set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseNumEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseNumEx]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_EditPurchaseNumEx] 
	@IdKey varchar(50)
as
set nocount on

declare @BillNumber Varchar(20),
		@PurchaseBillNumber Varchar(20),
		@SaleOrderBillNumber Varchar(20),
		@SaleBillNumber Varchar(20),
		@SaleOrderIdKey Varchar(20),
		@ProductCode varchar(20),
		@SaleType int,
		@DownWg Float,
		@NumEx float	

	Select top 1 @ProductCode = ProductCode,@BillNumber=BillNumber,@SaleOrderBillNumber=SaleOrderBillNumber,@SaleOrderIdKey = SaleOrderIdkey,@SaleType=SaleType,@DownWg = DownWg from  L_Bill_PurchaseOrders_Tab# where Idkey = @IdKey
	--返回采购单号
	select @PurchaseBillNumber = PurchaseBillNumber from L_Bill_PurchaseOrder_Tab where BillNumber=@BillNumber
	--返回送货单号
	select @SaleBillNumber = DeliveryBillNumber from L_Bill_SaleOrder_Tab where BillNumber = @SaleOrderBillNumber
	select @NumEx = Sum(NumEx) from  L_Bill_PurchaseOrders_Tab# where BillNumber=@BillNumber and BillNumber<>''free'' and ProductCode=@ProductCode and SaleType = @SaleType and DownWg = @DownWg 

	update L_Bill_Purchases_Tab set numEx = @NumEx	where billnumber = @PurchaseBillNumber and ProductCode=@ProductCode and SaleType = @SaleType and DownWg = @DownWg
	update L_Bill_PurchaseOrders_Tab set numEx = @NumEx	where billnumber=@BillNumber and ProductCode=@ProductCode and SaleType = @SaleType and DownWg = @DownWg


	select @NumEx = Sum(NumEx) from  L_Bill_PurchaseOrders_Tab# where SaleOrderBillNumber=@SaleOrderBillNumber  and BillNumber<>''free'' and ProductCode=@ProductCode and SaleType = @SaleType and DownWg = @DownWg 

	update L_Bill_SaleOrders_Tab set NumEx = @NumEx where Idkey = @SaleOrderIdKey
	--下面代码  如果同一单有两个相同商品时 有Bug
	update L_Bill_Sales_Tab set NumEx = @NumEx where billnumber =@SaleBillNumber and ProductCode = @ProductCode and SaleType = @SaleType and DownWg = @DownWg 
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_EditPurchaseOrderDetailNum]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_EditPurchaseOrderDetailNum]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_EditPurchaseOrderDetailNum] 
	@ParentIdKey varchar(50),
	@DetailIdKey varchar(50),
	@InputNum Float,
	@InputNumEx Float,
	@InputCostPrice Float,
	@InputNote Varchar(100)
as
set nocount on

declare @BillNumber Varchar(20),
		@ProductCode varchar(20),
		@SaleType int,
		@DownWg Float,
		@Num Float,
		@NumEx float,
		@AvgCostPrice Float,
		@Deliveryat varchar(20)
	Select @ProductCode = ProductCode,@BillNumber=BillNumber,@Deliveryat=DeliveryAt,@SaleType=SaleType,@DownWg = DownWg from  L_Bill_PurchaseOrders_Tab# where Idkey = @DetailIdKey	

	Update L_Bill_PurchaseOrders_Tab# 
		Set Num = @InputNum,
			NumEx = @InputNumEx,
			CostPrice = @InputCostPrice 
	where Idkey = @DetailIdKey	
	
	select @Num = IsNull(Sum(Num),0), 
		@NumEx = IsNull(Sum(NumEx),0),  
		@AvgCostPrice = case when Sum(NumEx)=0 then 0 else Sum(NumEx*CostPrice)/Sum(NumEx) end
	from  L_Bill_PurchaseOrders_Tab# 
	where BillNumber=@BillNumber and 
		BillNumber<>''free'' and 
		ProductCode=@ProductCode and 
		SaleType = @SaleType and 
		DownWg = @DownWg
	 
	update L_Bill_PurchaseOrders_Tab 
		set Num = @Num, 
			numEx = @NumEx,
			costprice=@AvgCostPrice	
	where billnumber=@BillNumber and 
		ProductCode=@ProductCode and 
		SaleType = @SaleType and
		DownWg = @DownWg
	
	Exec Sp_EditPurchaseNum @ParentIdKey,@Num,@NumEx,@AvgCostPrice,@Deliveryat
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[Sp_FreePurchase] 
	@ProductCode varchar(20),
	@FreeNum float,
	@FreeNumEx Float,
	@DeliveryAt date,
	@OrderList Varchar(4000)
as
/**
免采,可用库存不会以仓位分开（是累加的）
**/
SET NOCOUNT ON
SET ANSI_WARNINGS OFF
	Declare @AllowedStockNum Float,@DStock Float,@DiffNum Float,@DiffNumEx float,
			@DoBillNumber varchar(100),
			@DoIdkey varchar(100),
			@DoOweNum Float,
			@DoOweNumEx Float,
			@DoProductCode varchar(20),
			@doNum float,
			@doNumEx float,
			@DownUnit varchar(20),
			@SaleType int,
			@DownWg float,
			@DoCustomerCode int
	Declare @AllowedStock_Tab Table (
		Stock Float Not Null,
		DStock Float  Not Null
	)
	
	--① 取可用库存
	set @AllowedStockNum = 
		(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock_Get WHERE ProductCode = @ProductCode)+
		(select IsNull(sum((NumEx-replaceNumEx)*DoubleNumExBase*PackBase),0) from L_Bill_Sales_Tab where DeliveryAt >= @DeliveryAt and  ProductCode = @ProductCode) -
		(select isNull(Sum(NumEx*Case When SaleType=3 then DownWg else Case When SaleType=4 then 2 else 1 end end),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = @DeliveryAt and  ProductCode = @ProductCode and BillNumber=''free'' and DisStatus <>1)
	
	set @DStock = (select isNull(Sum(NumEx*Case When SaleType=3 then DownWg else Case When SaleType=4 then 2 else 1 end end),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = @DeliveryAt and  ProductCode = @ProductCode and CustomerCode=0)

	InSert Into @AllowedStock_Tab (Stock,DStock) Values(@AllowedStockNum,@DStock)
	if @AllowedStockNum + @DStock < @FreeNumEx
	begin
		Raiserror( ''可用存货不足，不可以免采'',16,1)
		return 
	end;

	set @DiffNumEx = @FreeNumEx
	set @DiffNum = @FreeNum
	
	--②以欠数进行循环 从小到大
	declare __Cursor cursor for select BillNumber,Idkey,DownUnit,DownWg,SaleType,OweNum,OweNumEx,ProductCode,CustomerCode
			from V_Purchase_Group_Detail_Tab a 
			where EXISTS (Select 1 from dbo.f_splitSTR(@OrderList,'','') where col=a.billnumber) 
				and a.productCode = @ProductCode and a.DeliveryAt=@DeliveryAt order by OweNumEx
	open __Cursor
	fetch next from __Cursor into @DoBillNumber, @DoIdkey,@DownUnit,@DownWg,@SaleType,@DoOweNum,@DoOweNumEx,@DoProductCode,@DoCustomerCode
	While (@@Fetch_status=0)--游标循环开始
	Begin 
	/*------------------------------*/
		set @AllowedStockNum = 
			(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock WHERE ProductCode = @ProductCode)+
			(select IsNull(sum((NumEx-replaceNumEx)*DoubleNumExBase*PackBase),0) from L_Bill_Sales_Tab where DeliveryAt >= @DeliveryAt and  ProductCode = @ProductCode) -
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = @DeliveryAt and  ProductCode = @ProductCode and BillNumber=''free'' and DisStatus <>1)
		set @DStock = (select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = @DeliveryAt and  ProductCode = @ProductCode and CustomerCode=0)
	
		if @DiffNum < @DoOweNum set @DoOWeNum = @DiffNum
		if @DiffNumEx < @DoOweNumEx set @DoOWeNumEx = @DiffNumEx  
		if @DoOweNumEx >0
		Begin 	
			DECLARE @DoDiffFreeNum Float,@DoDiffFreeNumEx Float,@DoFreeNum Float,@DoFreeNumEx Float
			If @AllowedStockNum >= @DoOweNumEx set @DoFreeNum=@DoOweNum Else Set @DoFreeNum =@AllowedStockNum
			IF @AllowedStockNum >= @DoOweNumEx Set @DoFreeNumEx = @DoOweNumEx Else Set @DoFreeNumEx =@AllowedStockNum

			SET @DoDiffFreeNum		=	@DoOweNum - @DoFreeNum
			SET @DoDiffFreeNumEx	=	@DoOweNumEx - @DoFreeNumEx
			--可用量(今早余量）有时先将此部分可用量免采
			If @DoFreeNumEx>0
			BEGIN
				EXEC Sp_FreePurchase_Sub_Free @DoIdkey,@DoBillNumber,@DeliveryAt,@ProductCode,@DownUnit,@SaleType,
					@DownWg,@DOCustomerCode,@DoFreeNum,@DoFreeNumEx
			End
			IF @DoDiffFreeNumEx >0 
			BEGIN
				--多采部分拆分
				 EXEC Sp_FreePurchase_Sub_Split @DeliveryAt,@ProductCode ,@SaleType,@DoCustomerCode,@DoDiffFreeNum,@DoDiffFreeNumEx,
					@DoBillNumber,@DoIdkey	
			END;
		END
		set @DiffNum = @DiffNum - @DoOWeNum
		set @DiffNumEx = @DiffNumEx - @DoOWeNumEx
	/*------------------------------*/
	fetch next from __Cursor into @DoBillNumber, @DoIdkey,@DownUnit,@DownWg,@SaleType,@DoOweNum,@DoOweNumEx,@DoProductCode,@DoCustomerCode
	end --销售游标循环结束
	close   __Cursor  --关闭销售游标   
	deallocate   __Cursor--删除销售游标  


SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase_Sub_Free]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase_Sub_Free]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[Sp_FreePurchase_Sub_Free]
    @SaleOrderIdkey varchar(100),
    @BillNumber varchar(100),--销售订单号
    @DeliveryAt date,
    @ProductCode VarChar(20),
    @DownUnit varchar(20),--下单单位
    @SaleType int,
    @DownWg float,
    @CustomerCode int,
    @FreeNum Float,
    @FreeNumEx Float,
    @Note VARCHAR(200) = ''''--备注
as
Set NoCount On

DECLARE @StockTemp TABLE (
    AccountBookCode INT,
    AreaCode INT,
    ProductCode INT,
    BatchNumber VARCHAR(100),
    AllowedNum DECIMAL(18, 2),
    Money DECIMAL(18, 2),
    avgPrice DECIMAL(18, 8)
)

INSERT INTO @StockTemp (
    AccountBookCode,
    AreaCode,
    ProductCode,
    BatchNumber,
    AllowedNum,
    Money,
    avgPrice
)
EXEC Sp_GetDatStock @DeliveryAt, 1

DECLARE @MatchBatchNumber VARCHAR(100) = ''''
DECLARE @MatchNum DECIMAL(18, 2) = 0
DECLARE @RemainingNum DECIMAL(18, 2)
DECLARE @MatchCostPrice DECIMAL(18, 8) = 0
DECLARE @CurrentBatch VARCHAR(100)
DECLARE @CurrentAllowedNum DECIMAL(18, 2)
DECLARE @DeliveryBillNumber VARCHAR(20)
DECLARE @SaleIdkey VARCHAR(20)

DECLARE @I INT

SET @I = 0
SELECT @RemainingNum = ISNULL(@FreeNum, 0)

SELECT @DeliveryBillNumber = DeliveryBillNumber FROM L_Bill_SaleOrder_Tab WHERE BillNumber = @BillNumber
SELECT @SaleIdkey = Idkey FROM L_Bill_Sales_Tab WHERE billnumber = @DeliveryBillNumber and OrderIdKey = @SaleOrderIdkey


DECLARE batch_cursor CURSOR FOR
SELECT BatchNumber, AllowedNum, avgPrice
FROM @StockTemp
WHERE ProductCode = @ProductCode
    AND AreaCode = (SELECT AreaCode FROM L_Bill_SaleOrders_Tab WHERE Idkey = @SaleOrderIdkey)
    AND AllowedNum > 0
ORDER BY BatchNumber ASC

OPEN batch_cursor
FETCH NEXT FROM batch_cursor INTO @CurrentBatch, @CurrentAllowedNum, @MatchCostPrice

WHILE @@FETCH_STATUS = 0 AND @RemainingNum > 0
BEGIN
	SET @I = @I + 1
    SET @MatchBatchNumber = @CurrentBatch
    SET @MatchNum = CASE WHEN @CurrentAllowedNum >= @RemainingNum THEN @RemainingNum ELSE @CurrentAllowedNum END
    SET @RemainingNum = @RemainingNum - @MatchNum

    Insert Into L_Bill_PurchaseOrders_Tab#(
        Idkey,
        BillNumber,
        DeliveryAt,
        CustomerCode,
        ProductCode,
        DownUnit,
        DownWg,
        SaleType,
        num,
        NumEx,
        CostPrice,
        SaleOrderBillNumber,
        SaleOrderIdkey,
        BatchNumber,
        Note
    ) values (
        @SaleOrderIdkey+''-''+CAST(@I AS VARCHAR(10)) ,
        ''free'',
        @DeliveryAt,
        @CustomerCode,
        @ProductCode,
        @DownUnit,
        @DownWg,
        @SaleType,
        @MatchNum,
        @MatchNum * Case When @SaleType = 3 Then @DownWg Else 1 End,
        @MatchCostPrice,
        @BillNumber,
        @SaleOrderIdkey,
        @MatchBatchNumber,
        @Note
    )


	--更新对应销售单中的批次
	INSERT INTO L_Bill_Sales_Tabs (AccountBookCode,AreaCode,SaleIdkey,DeliveryAt,BillNumber,ProductCode,BatchNumber,SaleType,num,numEx,
	DoubleNumExBase,PackBase,costprice) 
	SELECT AccountBookCode,AreaCode,@SaleIdkey,@DeliveryAt,billnumber,@ProductCode,@MatchBatchNumber,SaleType,
		@MatchNum,
        @MatchNum * Case When @SaleType = 3 Then @DownWg Else 1 End,
		DoubleNumExBase,
		PackBase,
        @MatchCostPrice
	FROM V_Bill_Sales_Tab WHERE OrderIdkey = @SaleOrderIdkey 


    FETCH NEXT FROM batch_cursor INTO @CurrentBatch, @CurrentAllowedNum, @MatchCostPrice
END

CLOSE batch_cursor
DEALLOCATE batch_cursor

update L_Bill_SaleOrders_Tab set
    FreeNum = FreeNum + @FreeNum,
    FreeNumEx = FreeNumEx + @FreeNumEx * Case When @SaleType = 3 Then @DownWg Else 1 End
where Idkey = @SaleOrderIdkey

update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where Idkey = @SaleOrderIdkey and OweNum <= 0

Set NoCount Off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_FreePurchase_Sub_Split]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_FreePurchase_Sub_Split]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[Sp_FreePurchase_Sub_Split]
	@DeliveryAt date,
	@ProductCode VarChar(20),
	@SaleType int,
	@CustomerCode int,
	@FreeNum Float,
	@FreeNumEx Float,
	@SaleOrderBillNumber VarChar(20),
	@SaleOrderIdkey VarChar(50)	
as
/**
	免采时拆分多采部分
	@DeliveryAt date,送货日期
	@ProductCode VarChar(20),商品货号
	@SaleType int,商品类型
	@CustomerCode int,订货客户
	@FreeNum Float,免采数
	@FreeNumEx Float,免采数
	@SaleOrderBillNumber VarChar(20),客户订单号
	@SaleOrderIdkey VarChar(50) 客户订单中商品的主键
**/
Set NoCount On
	declare	@tempmaxIdkey varchar(100),@maxIdkey varchar(100),@PurchaseOrderNumber varchar(20),@Idkey varchar(20)
	declare @Temp_Tab Table (
		Idkey varchar(20),
		BillNumber varchar(20),
		DeliveryAt date,
		ProductCode varchar(20),
		DownUnit  varchar(20),
		DownWg  varchar(20),
		SaleType int,
		DoNum Float,
		DoNumEx Float,
		CostPrice Float,
		Note varchar(50)
	)
	declare @DoIdkey varchar(20),
		@DoBillNumber varchar(20),
		@DoDeliveryAt date,
		@DoProductCode varchar(20),
		@DoDownUnit  varchar(20),
		@DoDownWg  varchar(20),
		@DoSaleType int,
		@DoNum Float,
		@DoNumEx Float,
		@CostPrice Float,
		@Note varchar(50),
		@DiffFreeNum Float,
		@DiffFreeNumEx Float
	--①将当日多采的数据送入临时表并返回对应主键，采购订单号（有可能是多行）
	Insert into @Temp_Tab select Idkey,BillNumber,DeliveryAt,ProductCode ,DownUnit,DownWg,SaleType,Num,NumEx,CostPrice,Note From L_Bill_PurchaseOrders_Tab# where DeliveryAt = @DeliveryAt and ProductCode = @ProductCode and SaleType = @SaleType and CustomerCode=0
	Select @Idkey = Idkey,@PurchaseOrderNumber =BillNumber From @Temp_Tab
	declare ___Cursor cursor for select Idkey,BillNumber,DeliveryAt,ProductCode ,DownUnit,DownWg,SaleType,DoNum,DoNumEx,CostPrice,Note from @Temp_Tab
	open ___Cursor
	fetch next from ___Cursor into @DoIdkey,@DoBillNumber,@DoDeliveryAt,@DoProductCode,@DoDownUnit,@DoDownWg,@DoSaleType,@DoNum,@DoNumEx,@CostPrice,@Note
	While (@@Fetch_status=0)--游标循环开始
	Begin 
		IF @FreeNum>=@DoNum Set @DiffFreeNum = @DoNum Else Set @DiffFreeNum = @FreeNum
		IF @FreeNumEx>=@DoNumEx Set @DiffFreeNumEx = @DoNumEx Else Set @DiffFreeNumEx = @FreeNumEx
	
		--Set @DiffFreeNum = IIF(@FreeNum>=@DoNum,@DoNum,@FreeNum)
		--Set @DiffFreeNumEx = IIF(@FreeNumEx>=@DoNumEx,@DoNumEx,@FreeNumEx)
		If @DiffFreeNumEx>0 BEGIn
			--②将对应多采的数据行减出要免采的数量
			update L_Bill_PurchaseOrders_Tab# set JumpUpdateTrigger = 1, num = num - @DiffFreeNum ,NumEx = NumEx - @DiffFreeNumEx where Idkey = @DoIdkey
			--③将免采的部分拆出来送入采购表中 IsFromSplit标识要置1代表是拆来的，预防后期再删除对应商品时根据此标识进行回退到备用存货
			select @tempmaxIdkey= isnull(max(RIGHT(Idkey,4)),0)+1 from L_Bill_PurchaseOrders_Tab# where BillNumber = @DoBillNumber	
			set @maxIdkey = @DoBillNumber+''-''+dbo.SetNBit(@tempmaxIdkey,''0'',4)
			Insert Into L_Bill_PurchaseOrders_Tab#(
				Idkey,
				BillNumber,
				DeliveryAt,
				CustomerCode,
				ProductCode,
				DownUnit,
				DownWg,
				SaleType,
				num,
				NumEx,
				CostPrice,
				SaleOrderBillNumber,
				SaleOrderIdkey,
				Note,
				IsFromSplit
			) select 
				@maxIdkey,
				BillNumber,
				DeliveryAt,
				@CustomerCode,
				ProductCode,
				DownUnit,
				DownWg,
				SaleType,
				@DiffFreeNum,
				@DiffFreeNumEx*Case When @SaleType=3 Then DownWg Else 1 End,
				CostPrice,
				@SaleOrderBillNumber,
				@SaleOrderIdkey,
				Note,1 from @Temp_Tab where Idkey = @DoIdkey
			--④如果多采部分全部拆完（数量为0）就删除
			delete L_Bill_PurchaseOrders_Tab#  where Idkey = @DoIdkey and Numex <=0
			update L_Bill_SaleOrders_Tab set AcceptNum = AcceptNum+@DiffFreeNum,
				AcceptNumEx = AcceptNumEx + @DiffFreeNumEx *Case When @SaleType=3 Then DownWg Else 1 End where Idkey = @SaleOrderIdkey
			--将销售订单中的状态设成已接单状态	
			update L_Bill_SaleOrders_Tab set AcceptStatus = 1 where Idkey = @SaleOrderIdkey and OweNum<=0

			Set @FreeNum = @FreeNum - @DoNum
			Set @FreeNumEx = @FreeNumEx - @DoNumEx
		END
	fetch next from ___Cursor into @DoIdkey,@DoBillNumber,@DoDeliveryAt,@DoProductCode,@DoDownUnit,@DoDownWg,@DoSaleType,@DoNum,@DoNumEx,@CostPrice,@Note
	end --销售游标循环结束
	close   ___Cursor  --关闭销售游标   
	deallocate   ___Cursor--删除销售游标  
Set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_list]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_list]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec sp_Get_list ''2023-09-15''
CREATE proc [dbo].[sp_Get_list] 
	@DeliveryAt smalldatetime
AS
WITH CTE1 as (
	select CustomerName,ProductCode,SaleType,DownWG from V_Bill_SaleOrders_Tab where DeliveryAt = ''2023-09-15''
),
CTE2 as (
	select ProductCode,(select CustomerName+'','' from cte1

                              where ProductCode= tb.ProductCode

                              for xml path(''''))as CustomerList

    from cte1 as tb

    group by ProductCode
)
SELECT 
		b.IdCode, 
		a.ProductCode,
		b.Name, 
		b.Name + isnull(b.Spec,'''') AS ng,
		b.BarCode, 
		b.PicSrc, 
		b.Unit, 
		b.PUnit,
		b.CateCode,
		(select name From L_Basic_Cate_Tab where idCode = b.CateCode) as cateName,
		(select SerialNum From L_Basic_Cate_Tab where idCode = b.CateCode) as SerialNum,
		b.spec,
		--a.num,
		(select sum(num) from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg) as num,
		(select sum(numex) from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg) as numex,
		--(select stuff((select '';''+CustomerName from CTE_Data where ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg for xml path('''')),1,1,'''')) as CustomerList,
		(select CustomerList From CTE2 where ProductCode = a.ProductCode) as CustomerList,
		a.AcceptNum,
		a.AcceptNumEx,
		a.FreeNum,
		a.FreeNumEx,
		a.OweNum, 
		a.OweNumEx,
		a.AcceptStatus as Status,  
		b.Price1, 
		b.inPrice as costPrice, 
		a.DeliveryAt,
		a.SaleType,
		a.DownWg ,
		DownUnit,
		--ISNULL((SELECT SUM(AllowedNum)	FROM V_Stock WHERE a.ProductCode = ProductCode), 0) AS Stock
		(
			(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock WHERE a.ProductCode = ProductCode) -
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt and  a.ProductCode = ProductCode and BillNumber=''free'' and disStatus <> 1)
		 ) AS Stock
FROM  (SELECT  ProductCode, 
				SUM(OweNum) AS OweNum,
				SUM(FreeNum) as FreeNum,
				SUM(AcceptNum) as AcceptNum,
				SUM(OweNumEx) AS OweNumEx,
				SUM(FreeNumEx) as FreeNumEx,
				SUM(AcceptNumEx) as AcceptNumEx,
				DeliveryAt, 
				min(AcceptStatus) as AcceptStatus,
				saleType,
				max(DownWg) as DownWg,
				max(DownUnit) as DownUnit
        FROM  (select ProductCode,OweNum,OweNumEx,FreeNum,FreeNumEx,AcceptNumEx,AcceptNum,DeliveryAt,AcceptStatus,SaleType,DownUnit,DownWg
		 from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = @DeliveryAt and examineUserCode<>0 and (AcceptStatus <2 or OweNum>0)) x
		GROUP BY DeliveryAt, ProductCode,/*AcceptStatus,*/SaleType/*,DownWg*/
       ) AS a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode































' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetDatStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetDatStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROC [dbo].[Sp_GetDatStock]
    @Dat SMALLDATETIME,
    @FilterEmptyBatch BIT = 0
AS
/***
    根据日期返回对应日期的库存
    最后一日汇总数 + 采购 - 销售 + 损溢 - 仓位调拨 + 拆零 - 领用
    @FilterEmptyBatch: 是否过滤批次为空的销售数据 1=过滤 0=不过滤
***/

SET NOCOUNT ON

DECLARE @EndGroupDat SMALLDATETIME

SELECT TOP 1 @EndGroupDat = CONVERT(VARCHAR(10), dat, 120)
FROM l_sys_GroupInf_Tab

SELECT AccountBookCode,
       AreaCode,
       ProductCode,
       BatchNumber,
       CAST(SUM(Num) AS DECIMAL(18, 2)) AS AllowedNum,
       SUM(Money) AS Money,
       CASE WHEN CAST(SUM(Num) AS DECIMAL(18, 2)) = 0
            THEN 0
            ELSE SUM(Money) / SUM(Num)
       END AS avgPrice
FROM (
    -- 最后一日汇总数
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, EndNum AS Num, EndMoney AS Money
    FROM L_Group_InOut_tab
    WHERE at = @EndGroupDat - 1

    UNION ALL

    -- 采购(包括冲红)
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, numEx AS Num, numEx * CostPrice AS Money
    FROM V_Bill_Purchases_Tab
    WHERE DeliveryAt BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 销售
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber,
           (numEx) * -1 * DoubleNumExBase * PackBase AS Num,
           (numEx) * CostPrice * -1 AS Money
    FROM L_Bill_Sales_Tabs
    WHERE DeliveryAt BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 变更
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, ChangeNum AS Num, ChangeNum * CostPrice AS Money
    FROM L_Bill_StockChanges_Tabs
    WHERE changeAt BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 仓位调拨
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * (ExChangeType * -1) AS Num, num * (ExChangeType * -1) * CostPrice AS Money
    FROM L_Bill_AreaExChanges_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat

    UNION ALL

    -- 拆零
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * Type AS Num, num * Type * CostPrice AS Money
    FROM L_Bill_StockSwaps_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 领用
    SELECT AccountBookCode, AreaCode, ProductCode, '''' as BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockReceives_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 加工出
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockSplits_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0

    UNION ALL

    -- 加工入
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num AS Num, num * CostPrice AS Money
    FROM L_Bill_StockSplits_TabS
    WHERE CONVERT(VARCHAR(10), At, 120) BETWEEN @EndGroupDat AND @Dat
      AND examineUserCode > 0
) x
GROUP BY AccountBookCode, AreaCode, ProductCode, BatchNumber
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetFoodMenu]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetFoodMenu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec sp_getFoodMenu 90002,''2022-09-13''
CREATE proc [dbo].[Sp_GetFoodMenu] 
	@CustomerCode bigint,
	@DeliveryAt varchar(10)
as 
/**菜单调出*/
select b.IdCode,
	a.ProductCode,
	b.PicSrc,
	barcode,
	name,
	spec,
	Unit,
	Punit,
	a.DownUnit,
	a.downwg,
	DownUnitList,
	DownWgSpec,
	doMethod,
	a.saleType,
	saleTypeList,
	a.Num,
	a.NumEx,
	b.inPrice as costPrice,
	a.salePrice,
	picsrc,
	a.note
from (
	select ProductCode,saleType,sum(num) as Num,sum(numEx) as NumEx,max(salePrice) as salePrice,min(DownUnit) as DownUnit,min(downwg) as downwg, min(note) as note 
	from L_Bill_SaleOrders_Tab 
	where CustomerCode=@CustomerCode and DeliveryAt=@DeliveryAt
	group by ProductCode,saleType
) a,V_Prodcut b where a.ProductCode = b.IdCode' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPageList]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPageList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec [Sp_GetPageList] ''V_Reports_Sale'',''*'',''isnull(Sum(SaleMoney),0) as SaleMoney,isnull(Sum(CostMoney),0) as CostMoney,isnull(Sum(profit),0) as Profit'',''productCode'','''',10,1

CREATE proc [dbo].[Sp_GetPageList] 
	@TableName			nvarchar(100),
	@Fields				nvarchar(2000), 
	@TotalFields		nvarchar(2000),       
	@SortFields			nvarchar(200), 
	@Condition			nvarchar(500),   
	@PageSize			int,      
	@page				int              
as
/* 
***************************************************
	功能：分页查询					
	参数：	@tableName    ----要显示的表或多个表的连接
			@SortField     ----排序字段
			@Fields      ----要显示的字段列表
			@TotalFields	----汇总行字段
			@Condition	  ----条件
			@PageSize     ----每页显示的记录个数
			@page         ----要显示那一页的记录
			
	结果：
		
	作者：2019-03-02  张建明
**************************************************
*/
set nocount on
	declare @szCommand nVarchar(4000),@TotalCommandText nVarchar(4000)
	set @TotalCommandText = '''';
	if @PageSize = 0
	begin
		set @PageSize = 999999999
		set @TotalFields = ''''
	end;
	if @TotalFields<>''''
		set @TotalCommandText = ''Select @@TotalFields From @@TableName @@Condition;''
		
	if @Condition <> '''' 
		set @Condition = '' Where ''+ @Condition
		
	Set @szCommand = 
		''Select Top @@PageSize @@Fields	From ( 
				select @@Fields,ROW_NUMBER() OVER(Order by @@SortFields) AS RowId From @@TableName n @@Condition
		) as b 	Where RowId >(@@Page-1)*@@PageSize;
		@@TotalCommandText''
	
	set @TotalCommandText = replace(@TotalCommandText,''@@TotalFields'',@TotalFields)
	set @TotalCommandText = replace(@TotalCommandText,''@@TableName'',@TableName)
	set @TotalCommandText = replace(@TotalCommandText,''@@Condition'',@Condition)
			
	set @szCommand = replace(@szCommand,''@@PageSize'',@PageSize)
	set @szCommand = replace(@szCommand,''@@Page'',@Page)
	set @szCommand = replace(@szCommand,''@@Fields'',@Fields)
	set @szCommand = replace(@szCommand,''@@SortFields'',@SortFields)
	set @szCommand = replace(@szCommand,''@@TotalFields'',@TotalFields)
	set @szCommand = replace(@szCommand,''@@TableName'',@TableName)
	set @szCommand = replace(@szCommand,''@@Condition'',@Condition)
	set @szCommand = replace(@szCommand,''@@TotalCommandText'',@TotalCommandText)
	
	set @szCommand = replace(@szCommand,''#26'',''%'')

	--print @szCommand
	Update l_sqlText_Tab set sqlText = @szCommand
	exec sp_executesql  @szCommand 
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPriceLogs]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPriceLogs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[Sp_GetPriceLogs] 
@customerCode Int,
@productCode Int,
@saleType Int
AS
SET NOCOUNT ON
DECLARE @PCode Int
SELECT @PCode = Pcode FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode
IF @PCode > 0 
BEGIN
	SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @PCode
END
SELECT a.*,b.Name as UserName FROM
 (SELECT Top 100 * FROM L_Basic_Customer_Price_Tab_Logs WHERE CustomerCode = @customerCode AND ProductCode = @productCode AND SaleType = @saleType) a
 LEFT JOIN  L_Basic_User_Tab b 
ON a.userCode = b.IdCode ORDER BY Date DESC

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProduct(作废)]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProduct(作废)]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec [Sp_GetProductInfEx] ''10001'',''0'',''0'',1,0,0,0


CREATE proc [dbo].[Sp_GetProduct(作废)] 
	@inputText		varchar(100),
	@customerCode	varchar(50),
	@AccountBookCode		int,
	@AreaCode		int,
	@BillType		int
as
/* 
***************************************************
	功能：商品选择						
	参数：	@inputText		输入
			@mchCode varchar(20),用户账号
			@customerCode	客户
			@AccountBookCode		分店
			@AreaCode		柜组
			@BillType		单类 用以控制品态返回
			@IsS4			返回四周销
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @szCommand nVarchar(4000),@condition varchar(400),@priceLevel int 
	if dbo.isChinese(@inputText)=0 and dbo.isEnglish(@inputText) =0 --全部数字
	begin
		set @condition= '' where status<2 and (IdCode=''''''+@inputText+''''''''+
					'' or RIGHT(BarCode,6)=''''''+@inputText+''''''''+
					'' or BarCode=''''''+@inputText+''''''''+
					'' or SelfCode = ''''''+@inputText+'''''')''
	end else 
	begin
	set @condition= '' where  status<2 and  (SelfCode = ''''''+@inputText+''''''''+
					'' or PymCode like ''''''+''%''+@inputText+''%''+''''''''+
					'' or Name like ''''''+''%''+@inputText+''%''+''''''''+
					'' or spec like ''''''+''%''+@inputText+''%''+'''''')''
	end
	if @BillType = 21 or @BillType=6 --商品组合，库存变更
	begin
		set @condition = @condition +'' and IdCode>10000''
	end;
	
	select @priceLevel = priceLevel From L_Basic_Company_Tab where IdCode = @customerCode
	
	Set @szCommand = 
	''select IdCode,
			selfCode,
			PymCode,
			BarCode,
			name,
			spec,
			Unit,
			Punit,
			DownUnit,
			DownWgSpec,
			doMethod,
			ShipperCode,
			AreaCode,
			SaleType,
			inprice as CostPrice,
			Case when SalePrice IS NULL then 
				case When @@priceLevel = 0 and Price1<>0 then	Price1  
					 When @@priceLevel = 1 and Price2<>0  then	Price2
					 When @@priceLevel = 2 and Price3<>0  then	Price3 
					 When @@priceLevel = 3 and Price4<>0  then	Price4	  
					 When @@priceLevel = 4 and Price5<>0  then	Price5
					 else Price1 
				end
			else SalePrice end SalePrice,
			Price1,
			Price2 as VipPrice,
			price2,
			Price3,
			Price4,
			price5,
			Note,
			case When @@AreaCode=0 then
				isnull((select Sum(num-waitOutNum-QNum) as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
					and AreaCode=x.areaCode),0) 
			else 
				isnull((select Sum(num-waitOutNum-QNum) as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
					and (AreaCode=@@AreaCode or @@AreaCode=0)),0) 
			end Stock,
			Case when IdCode>10000 then
				case when @@AreaCode = 0 then
					isnull((select Sum(num-waitOutNum-QNum) as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
						and (AreaCode=x.AreaCode)),0)
				else
					isnull((select Sum(num-waitOutNum-QNum) as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
						and (AreaCode=@@AreaCode or @@AreaCode=0)),0) 
				end 
			else
				case when @@AreaCode = 0 then
					isnull((select Sum(num-waitOutNum-QNum)/x.pack as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
						and (AreaCode=x.AreaCode)),0)
				else
					isnull((select Sum(num-waitOutNum-QNum)/x.pack as Num from V_Stock_Get where x.idcodeEx=ProductCode and AccountBookCode=@@AccountBookCode 
						and (AreaCode=@@AreaCode or @@AreaCode=0)),0)
				end 
			end AllowStock
	from (
		select IdCode,case When IdCode<1000 then
					(select top 1 ProductCode from L_Basic_Product_Comb_Tab where PCode = b.idCode)
				else
					b.IdCode
				end as idcodeEx,
				selfCode,
				PymCode,
				BarCode,
				name,
				spec,
				case When IdCode<10000 then
					(Select Pack From L_Basic_Product_Tab Where IdCode = (select Top 1 ProductCode from L_Basic_Product_Comb_Tab where PCode = b.idCode))
				else
					b.Pack
				end as Pack,
				Unit,
				DownUnit,
				DownWgSpec,
				doMethod,
				Punit,
				SaleType,
				Brand,
				Origin,
				ShipperCode,
				AreaCode,
				inPrice,
				Price1,
				Case when @@customerCode = 0 then
					Price1
				else 
					Case when (Select Lastprice from L_Sys_Parmars_Tab)=0 then
						Null
					else
						(select Price from L_Basic_Customer_Price_Tab where pCode=@@customerCode and ProductCode = b.idcode) 
					end
				end SalePrice,
				Price2,
				Price3,
				Price4,
				price5,
				Note
		 from V_SelectProduct b
				 @@condition 
	) x order by Cast(IdCode as Bigint)''
	set @szCommand = replace(@szCommand,''@@customerCode'',@customerCode)
	set @szCommand = replace(@szCommand,''@@PriceLevel'',@PriceLevel)
	set @szCommand = replace(@szCommand,''@@AccountBookCode'',@AccountBookCode)
	set @szCommand = replace(@szCommand,''@@AreaCode'',@AreaCode)
	set @szCommand = replace(@szCommand,''@@condition'',@condition)
	--print @szCommand
	exec sp_executesql  @szCommand 
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductInf]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProductInf]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec Sp_GetProductInf '''',90003,0,1,1,'''',''customerLoad''

CREATE proc [dbo].[Sp_GetProductInf] 
	@mchCode varchar(20),
	@customerCode varchar(50),
	@AreaCode int,
	@pageNumber int,
	@fromQuotedPrice int,
	@condition varchar(1000),
	@actionType varchar(20),
	@FromFavorite int = 0 
as
/* 
***************************************************
	功能：商品选择（手机端)					
	参数：	
			@mchCode varchar(20),用户账号
			@customerCode 客户
			@AreaCode 仓位,
			@@pageNumber 页号
			@fromQuotedPrice 是否取报价商品,
			@@condition 条件,
			@actionType:类型 stockChange|none|customerLoad stockChange时要调入可用量,customerLoad客户用
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	DECLARE @szCommand nVarchar(4000) ,@StockSql VarChar(max),@importStock bit,@FromTable VarChar(50),@IdKeyText VarChar(20),@Pcode int
	SELECT @importStock = importStock FROM L_Sys_Parmars_Tab --,导入可用量
	SELECT @fromQuotedPrice = LookProductType FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode --限制只能从报价调商品

	--得到计价单位与项目编码
	SELECT @Pcode=Pcode FROM L_Basic_Company_Tab WHERE IdCode = @customerCode
	--如果项目编码不为0，将取价客户设成本项目第一个客户
	IF @Pcode>0
	BEGIN
		SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END

	IF @FromFavorite = 0 BEGIN 
		SET @FromTable = ''V_Prodcut'' 
		SET @IdKeyText = ''1 As IdKey''
	END ELSE BEGIN
		SET @FromTable=''V_Prodcut_From_Favorite''
		SET @IdKeyText = ''IdKey''
	END
	IF @actionType = ''customerLoad'' and @fromQuotedPrice = 1
	BEGIN
		IF @condition <>'''' and @customerCode<>0
		BEGIN
			set @condition= '' WHERE ''+@condition + '' and EXISTS (select 1 from L_Basic_Customer_Price_Tab where pCode=@@customerCode  and ProductCode = n.IdCode and SaleType=n.SaleType ) and status<2''
			set @condition = replace(@condition,''@@customerCode'',@customerCode)
		END 
		IF @condition ='''' and @customerCode<>0
		BEGIN
			set @condition= '' WHERE EXISTS (select 1 from L_Basic_Customer_Price_Tab where pCode=@@customerCode  and ProductCode = n.IdCode and SaleType=n.SaleType ) and status<2''
			set @condition = replace(@condition,''@@customerCode'',@customerCode)
		END 
		IF @condition <>'''' and @customerCode=0
		BEGIN
			set @condition= '' where ''+@condition +'' and status<2''
		END 
		IF @condition ='''' and @customerCode=0 begin
			set @condition= '' where status<2''
		END;
	END ELSE BEGIN	
		if @condition<>''''
		BEGIN
			set @condition= '' where ''+@condition +'' and status<2''
		END ELSE BEGIN
			set @condition= '' where status<2''
		END;
	END;
	IF  (@importStock = 1 or @actionType=''stockChange'') and @actionType <>''customerLoad''
	BEGIN
		SET @StockSql =
			''
			case When @@AreaCode=0 then
				(select Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num from V_Stock_Get where x.idcode=ProductCode and AreaCode=x.areaCode) 
			else 
				(select Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num from V_Stock_Get where x.idcode=ProductCode	and (AreaCode=@@AreaCode or @@AreaCode=0))
			end Stock, 
			case When @@AreaCode=0 then
				(select  Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num from V_Stock_Get where x.idcode=ProductCode and AreaCode=x.areaCode)+ 
				(select IsNull(sum(NumEx),0) from L_Bill_Sales_Tab where DeliveryAt > convert(char(10),getdate(),120) and  ProductCode = x.idcode and AreaCode=x.areaCode) 
			 else 
				(select Cast(IsNull(Sum(AllowedNum),0) as [decimal](18, 2)) as Num from V_Stock_Get where x.idcode=ProductCode and (AreaCode=@@AreaCode or @@AreaCode=0))+
				(select IsNull(sum(NumEx),0) from L_Bill_Sales_Tab where DeliveryAt > convert(char(10),getdate(),120) and  ProductCode = x.idcode and AreaCode=@@AreaCode) 
			end ToDayStock
			''
	end else begin
		set @StockSql = ''0 as Stock,0 as ToDayStock''
	end;
	set @StockSql = replace(@StockSql,''@@AreaCode'',@AreaCode)

	Set @szCommand = 
	''declare @DownUnitType Int
	SELECT @DownUnitType = DownUnitType FROM L_Basic_Company_Tab where IdCode = @@customerCode
	SELECT IdKey,
			IdCode,
			barcode,
			name as BasicName,
			CASE WHEN ProductAliasName IS NULL THEN
				Name
			ELSE ProductAliasName end name,
			name+isnull(spec,'''''''') as ng,
			spec,
			cateCode,
			Unit,
			Punit,
			DownUnitList,
			DownWgSpec,
			downUnit,
			doMethod,
			Pack,
			saleType,
			saleTypeList,
			inPrice,
			--Case when Price IS NULL then cast(Price1 as Decimal(18,2)) else Cast(Price as  Decimal(18,2)) end price,
			Case when Price IS NULL then Price1 else Price end price,
			defaultShipperCode,
			picsrc,
			note,
			@@StockSql
			
	from (
		select top 20 
				@@IdKeyText,
				IdCode,
				barcode,
				name,
				spec,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN ''''公斤'''' ELSE Unit END AS Unit,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN ''''公斤'''' ELSE Unit END AS DownUnit,
				Punit,
				saleTypeList,
				DownUnitList,
				DownWgSpec,
				doMethod,
				Pack,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
				areaCode,
				cateCode,
				inPrice,
				Price1,
				Case when @@customerCode = 0 then
					null
				else 
					(select AliasName from L_Basic_Customer_Price_Tab WITH(INDEX(IX_L_Basic_Customer_Price_Tab_ProductCode)) where pCode=@@customerCode and ProductCode = b.idcode  and saleType=b.saleType) 
				end ProductAliasName,
				Case when @@customerCode = 0 then
					b.Price1
				else 
					(select Price from L_Basic_Customer_Price_Tab WITH(INDEX(IX_L_Basic_Customer_Price_Tab_ProductCode)) where pCode=@@customerCode and ProductCode = b.idcode  and saleType=b.saleType) 
				end Price,
				Case when @@customerCode = 0 then
					1
				else 
					(select defaultShipperCode from L_Basic_Customer_Price_Tab WITH(INDEX(IX_L_Basic_Customer_Price_Tab_ProductCode)) where pCode=@@customerCode and ProductCode = b.idcode  and saleType=b.saleType) 
				end defaultShipperCode,
				picsrc,
				note
		 from ( 
			select *,ROW_NUMBER() OVER(Order by IdCode) AS RowId from @@FromTable  n
				 @@condition
			) as b 
			where RowId >(@@pageNumber-1)*20
	) x''
	set @szCommand = replace(@szCommand,''@@IdKeyText'',@IdKeyText)
	set @szCommand = replace(@szCommand,''@@customerCode'',@customerCode)
	set @szCommand = replace(@szCommand,''@@AreaCode'',@AreaCode)
	set @szCommand = replace(@szCommand,''@@pageNumber'',@pageNumber)
	set @szCommand = replace(@szCommand,''@@condition'',@condition)
	set @szCommand = replace(@szCommand,''@@FromTable'',@FromTable)
	set @szCommand = replace(@szCommand,''@@StockSql'',@StockSql)
	--print @szCommand
	exec sp_executesql  @szCommand 
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductInfEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetProductInfEx]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec Sp_GetProductInfEx ''10001'','''',90004,1,0,0,0,''2024-05-05''
CREATE PROCEDURE [dbo].[Sp_GetProductInfEx]
    @inputText VARCHAR(100),
    @mchCode VARCHAR(20),
    @customerCode VARCHAR(50),
    @AccountBookCode INT,
    @AreaCode INT,
    @BillType INT,
    @IsS4 BIT,
    @Date SMALLDATETIME = ''2024-05-01''
AS
/*
***************************************************
    功能：商品选择（PC端）
    参数：
        @inputText VARCHAR(100)  - 输入
        @mchCode VARCHAR(20)     - 用户账号
        @customerCode VARCHAR(50)- 客户
        @AccountBookCode INT           - 分店
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

 DECLARE @StockTemp TABLE (
	AccountBookCode INT, 
	AreaCode INT, 
	ProductCode INT,
	BatchNumber VARCHAR(50),
	AllowedNum DECIMAL(18, 2),
	Money DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)

DECLARE @StockGroupTemp TABLE (
	AccountBookCode INT, 
	AreaCode INT, 
	ProductCode INT,
	
	AllowedNum DECIMAL(18, 2),
	avgPrice DECIMAL(18, 8)
)


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
    SET @realCustomerCode = ''0''
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
            
INSERT INTO @StockTemp (
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	BatchNumber,
	AllowedNum,
	Money,
	avgPrice
)
EXEC Sp_GetDatStock @Date,1

INSERT INTO @StockGroupTemp (
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	AllowedNum,
	avgPrice
)
SELECT 
	AccountBookCode, 
	AreaCode, 
	ProductCode,
	SUM(AllowedNum),
	CASE WHEN SUM(AllowedNum) = 0 THEN 0 ELSE SUM(Money) / SUM(AllowedNum) END avgPrice
FROM @StockTemp GROUP BY AccountBookCode,AreaCode,ProductCode
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
    CASE WHEN ISNULL(b.AliasName, '''') = '''' THEN b.name ELSE b.name + ''/'' + b.AliasName END AS AliasNameList,
    b.spec,
    b.weight,
    b.Pack,
    CASE WHEN b.SaleType = 2 AND @DownUnitType = 1 THEN ''公斤'' ELSE b.Unit END AS Unit,
    b.Punit,
    CASE WHEN b.SaleType = 0 AND @DownUnitType = 1 THEN ''公斤'' ELSE b.DownUnit END AS DownUnit,
    b.DownWgSpec,
    b.doMethod,
    b.ShipperCode,
    b.AreaCode,
    b.CateCode,
    (SELECT Name FROM l_Basic_Cate_Tab WHERE IdCode = b.CateCode) AS CateName,
    CASE WHEN b.SaleType = 0 AND @BillType <> 302 AND @DownUnitType = 1 THEN 4 ELSE b.SaleType END AS SaleType,
    b.inPrice * CASE WHEN (b.SaleType = 0 OR b.SaleType = 2) AND @DownUnitType = 1 THEN 2 ELSE 1 END AS inPrice,
    CASE 
        WHEN @needStock = 1 AND EXISTS(SELECT 1 FROM v_Stock WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode) 
            THEN (SELECT avgCostPrice FROM v_Stock WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode)
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
    /*CASE WHEN @needStock = 1 THEN
        CASE WHEN @AreaCode = 0 THEN
            (SELECT CAST(ISNULL(SUM(AllowedNum), 0) AS DECIMAL(18, 2)) FROM V_Stock WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode)
        ELSE
            (SELECT CAST(ISNULL(SUM(AllowedNum), 0) AS DECIMAL(18, 2)) FROM V_Stock WHERE ProductCode = b.IdCode AND (AreaCode = @AreaCode OR @AreaCode = 0))
        END
    ELSE 0 END AS Stock,*/
	0 AS STock,
    CASE WHEN @needStock = 1 THEN
        CASE WHEN @AreaCode = 0 THEN
            ISNULL((SELECT AllowedNum FROM @StockGroupTemp WHERE ProductCode = b.IdCode AND AreaCode = b.AreaCode), 0)
        ELSE
            ISNULL((SELECT AllowedNum FROM @StockGroupTemp WHERE ProductCode = b.IdCode AND AreaCode = @AreaCode), 0)
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
        AND (b.Name LIKE ''%'' + @inputText + ''%'' OR b.AliasName LIKE ''%'' + @inputText + ''%'')
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
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetPurchaeBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetPurchaeBatchNotMatch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetPurchaeBatchNotMatch]
    @BillNumber VARCHAR(20) = ''''
AS
/**采购没有匹配**/
SET NOCOUNT ON

DECLARE @SaleNotMatch TABLE (
    Idkey VARCHAR(50),
	CustomerCode INT,
    ProductCode VARCHAR(50),
    DownUnit VARCHAR(50),
    SaleType INT,
    num DECIMAL(18, 4),
    numEx DECIMAL(18, 4),
    salePrice DECIMAL(18, 4),
    BatchNumber VARCHAR(50),
    billnumber VARCHAR(50),
    DeliveryAt DATETIME,
    Name VARCHAR(100),
    Spec VARCHAR(100)
)

INSERT INTO @SaleNotMatch
EXEC Sp_GetSaleBatchNotMatch '''' 

SELECT 
    a.Idkey,
    a.ProductCode,
    a.DownUnit,
    a.SaleType,
    a.num - ISNULL(c.num, 0) AS num,
    a.numEx - ISNULL(c.numEx, 0) AS numEx,
    a.costprice,
    a.BatchNumber,
    a.billnumber,
    a.DeliveryAt,
    b.Name,
    b.Spec
FROM L_Bill_Purchases_Tab a
INNER JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
LEFT JOIN (
    SELECT 
        ProductCode,
        SaleType,
        BatchNumber,
        SUM(num) AS num,
        SUM(NumEx) AS numEx
    FROM L_Bill_Sales_Tabs 
    WHERE billnumber = @BillNumber
    GROUP BY ProductCode, SaleType, BatchNumber
) c ON a.ProductCode = c.ProductCode 
    AND a.SaleType = c.SaleType 
    AND a.BatchNumber = c.BatchNumber
WHERE a.BillNumber = @BillNumber
    AND (a.num - ISNULL(c.num, 0) > 0 
        OR a.numEx - ISNULL(c.numEx, 0) > 0)
    AND EXISTS (
        SELECT 1 FROM @SaleNotMatch d
        WHERE d.ProductCode = a.ProductCode
            AND d.SaleType = a.SaleType
    )

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getRate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getRate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_getRate]
	@CustomerCode Int, 
	@InputName VarChar(20),
	@rate Float
as
SET NOCOUNT ON
/*SELECT * FROM (
SELECT DBO.FN_Resemble(@InputName,name)*100 as Rate,* from V_SELECTProduct where DBO.FN_Resemble(@InputName,name)>=@rate
) X ORDER By Rate  DESC
*/
	declare @DownUnitType Int,
			@Pcode Int

	--得到计价单位与项目编码
	SELECT @DownUnitType = DownUnitType,@Pcode=Pcode FROM V_Basic_Customer_Tab WHERE IdCode = @customerCode
	
	IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @customerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END     
	    
	SELECT IdCode ,
				name as BasicName,
				CASE WHEN ProductAliasName IS NULL THEN
					Name
				ELSE ProductAliasName end name,
				Case WHEN ISNull(AliasName,'''')='''' Then
					name 
				else 
					name+''/''+AliasName 
				end AliasNameList,
				Isnull(spec,'''') as Spec,
				Pack,
				CASE WHEN SaleType = 2 and @DownUnitType=1 THEN ''公斤'' ELSE Unit END AS  Unit,
				Punit,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN ''公斤'' ELSE DownUnit END AS DownUnit,
				DownWgSpec,
				doMethod,
				CASE WHEN SaleType = 0 and @DownUnitType=1 THEN 4 ELSE SaleType END SaleType,
				dbo.xb_trim(SalePrice) as SalePrice,
				Note,
				defaultShipperCode,
				IsQuotedPrice,
				Rate		
			FROM (
				SELECT IdCode,
					selfCode,
					PymCode,
					BarCode,
					name,
					b.AliasName,
					spec,
					Pack,
					Unit,
					DownUnit,
					DownWgSpec,
					doMethod,
					Punit,
					b.SaleType,
					ShipperCode,
					AreaCode,
					inPrice,
					AvgCostPrice,
					CASE WHEN c.ProductCode Is Null THEN b.Price1* CASE WHEN (b.SaleType = 0 Or b.SaleType = 2) and @DownUnitType=1 THEN 2 ELSE 1 END ELSE c.Price END as SalePrice,
					CASE WHEN c.ProductCode Is Null THEN Null ELSE c.AliasName END as ProductAliasName,
					CASE WHEN c.ProductCode Is Null THEN b.ShipperCode ELSE CASE WHEN c.defaultShipperCode<2 THEN b.ShipperCode ELSE c.defaultShipperCode END END as defaultShipperCode,
					CASE WHEN c.ProductCode Is Null THEN b.Note ELSE c.Note END as Note,
					CASE WHEN c.ProductCode Is Null THEN 0 ELSE 1 END IsQuotedPrice,
					b.Rate
				FROM (SELECT DBO.FN_Resemble(@InputName,name)*100 as Rate,* from V_SELECTProduct WHERE Status<2 AND DBO.FN_Resemble(@InputName,name)>=@rate) b LEFT JOIN 
				(SELECT ProductCode,AliasName,price,defaultShipperCode,SaleType,Note FROM L_Basic_Customer_Price_Tab WHERE PCode = @CustomerCode) c
				ON b.idCode = c.ProductCode AND CASE WHEN b.SaleType = 2 THEN 0 ELSE b.SaleType END = c.SaleType		
			) T ORDER BY IsQuotedPrice DESC,Rate DESC
SET NOCOUNT OFF


--  EXEC sp_getRate 90002,''肠粉'',0.5' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetSaleBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_GetSaleBatchNotMatch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_GetSaleBatchNotMatch]
    @BillNumber VARCHAR(20) = ''''
AS
/**销售没有匹配**/
SET NOCOUNT ON

SELECT 
    a.Idkey,
	a.CustomerCode,
    a.ProductCode,
    a.DownUnit,
    a.SaleType,
    a.num - ISNULL(b.num, 0) AS num,
    a.numEx - a.replaceNumEx - ISNULL(b.numEx, 0) AS numEx,
    a.salePrice,
    a.BatchNumber,
    a.billnumber,
    a.DeliveryAt,
    c.Name,
    c.Spec
FROM L_Bill_Sales_Tab a
INNER JOIN L_Basic_Product_Tab c ON a.ProductCode = c.IdCode
LEFT JOIN ( 
    SELECT 
        billnumber,
        ProductCode, 
        SaleType, 
        SUM(num) AS num, 
        SUM(NumEx) AS numEx 
    FROM L_Bill_Sales_Tabs 
    WHERE billnumber = CASE WHEN @BillNumber = '''' THEN billnumber ELSE @BillNumber END
    GROUP BY billnumber, ProductCode, SaleType 
) b ON a.ProductCode = b.ProductCode 
    AND a.SaleType = b.SaleType 
    AND a.billnumber = b.billnumber
WHERE a.billnumber = CASE WHEN @BillNumber = '''' THEN a.billnumber ELSE @BillNumber END
    AND a.numEx - a.replaceNumEx <> ISNULL(b.numEx, 0)

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_End]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_End]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_Group_End] @dat smalldatetime  as
--汇总完成
 set nocount on
	/*update a set a.CostPrice = b.costprice from L_Stock_Tab a,
	(select ProductCode,(EndNum),(EndMoney)/(EndNum) as costprice from L_Group_InOut_tab where at = @dat and (EndNum) <>0) b
	where a.ProductCode=b.productCode
	
	update a set a.num = b.endnum,a.CostPrice = case when b.EndNum=0 then  a.CostPrice else  b.Endmoney /EndNum end from  L_Stock_Tab a,
	(select AccountBookCode,AreaCode,ProductCode,sum(endNum) as EndNum,sum(EndMoney) as EndMoney from L_Group_InOut_tab where at=@dat group by AccountBookCode,AreaCode,ProductCode) b
	where a.AccountBookCode = b.AccountBookCode and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode


	Insert into L_Stock_Tab (AccountBookCode,AreaCode,ShipperCode,ProductCode,Num,CostPrice)
    Select a.AccountBookCode,a.AreaCode,0,a.ProductCode,a.EndNum,a.EndMoney/a.EndNum from 
    (
		select AccountBookCode,AreaCode,ProductCode,sum(endNum) as EndNum,sum(EndMoney) as EndMoney from L_Group_InOut_tab where at=@dat group by AccountBookCode,AreaCode,ProductCode
	) a Where not EXISTS (
			Select 1 from L_Group_InOut_Tab 
			where At		=	@dat and 
				ProductCode	=	a.ProductCode and 
				AccountBookCode	=	a.AccountBookCode and
				AreaCode	=	a.AreaCode
		) 
	*/
	update L_Sys_GroupInf_Tab set dat=@dat+1,Status=0
 set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_Extend]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_Extend]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec Sp_Group_Extend ''2024-01-28''

CREATE proc [dbo].[Sp_Group_Extend] @dat smalldatetime  as
--数据移到扩展表
	SET NOCOUNT ON
	IF ( SELECT Status FROM L_Sys_GroupInf_Tab WHERE idCode = 4)=1
	BEGIN
		RETURN
	END;
	DECLARE @PosToExpandDay int,
			@GroupToExpandDay int,--汇总数据保留日基它转到扩展
			@DataReserveDay int --数据保留日
			
	SELECT @PosToExpandDay	=	PosToExpandDay,
		@GroupToExpandDay	=	GroupToExpandDay 
	FROM L_Sys_Parmars_Tab
	
	SET @DataReserveDay = 7
	/**删除@DataReserveDay前的报价单数据**/
	DELETE L_Bill_QuotedPrices_Tab WHERE billnumber in (SELECT billnumber FROM L_Bill_QuotedPrice_Tab WHERE datediff(day,EndAt,@dat)>@DataReserveDay)
	DELETE L_Bill_QuotedPrice_Tab WHERE datediff(day,EndAt,@dat)>@DataReserveDay
	/**删除@DataReserveDay前的接单数据**/
	DELETE L_Bill_PurchaseOrders_Tab# WHERE datediff(day,DeliveryAt,@dat)>@DataReserveDay
	/**删除@DataReserveDay前的客户订单数据**/
	DELETE L_Bill_SaleOrders_Tab WHERE datediff(day,DeliveryAt,@dat)>@DataReserveDay
	DELETE L_Bill_SaleOrder_Tab WHERE datediff(day,DeliveryAt,@dat)>@DataReserveDay
	/**删除@DataReserveDay前的采购订单数据**/
	DELETE L_Bill_PurchaseOrders_Tab WHERE datediff(day,DeliveryAt,@dat)>@DataReserveDay
	DELETE L_Bill_PurchaseOrder_Tab WHERE datediff(day,DeliveryAt,@dat)>@DataReserveDay


	/**进销存数据转到扩展表**/
	INSERT INTO l_group_Inout_Tab# (
		At,
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StartNum,
		StartMoney,
		PurchaseNum,
		PurchaseMoney,
		SaleNum,
		SaleMoney,
		StockSwapNum,
		StockSwapMoney,
		AreaExChangeNum,
		AreaExChangeMoney,
		StockChangeNum,
		StockChangeMoney,
		StockCheckNum,
		StockCheckMoney,
		StockReceiveNum,
		StockReceiveMoney,
		PriceChangeNum,
		PriceChangeMoney,
		DiffNum,
		DiffMoney
	) SELECT 
		At,
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StartNum,
		StartMoney,
		PurchaseNum,
		PurchaseMoney,
		SaleNum,
		SaleMoney,
		StockSwapNum,
		StockSwapMoney,
		AreaExChangeNum,
		AreaExChangeMoney,
		StockChangeNum,
		StockChangeMoney,
		StockCheckNum,
		StockCheckMoney,
		StockReceiveNum,
		StockReceiveMoney,
		PriceChangeNum,
		PriceChangeMoney,
		DiffNum,
		DiffMoney
	FROM l_group_Inout_Tab WHERE datediff(day,At,@dat)=0
	DELETE l_group_Inout_Tab WHERE datediff(day,At,@dat)>=@GroupToExpandDay
	/**销售汇总数据转到扩展表**/
	INSERT INTO l_group_Sale_Tab# (
		At,
		AccountBookCode,
		AreaCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney,
		[Type]
	) SELECT 
		At,
		AccountBookCode,
		AreaCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney,
		[Type]
	FROM l_group_Sale_Tab WHERE datediff(day,At,@dat)=0
	DELETE l_group_Sale_Tab WHERE datediff(day,At,@dat)>=@GroupToExpandDay
	
	/**采购收货单@DataReserveDay日前转至扩展表**/
	INSERT INTO L_Bill_Purchase_Tab# (
		BillNumber,AccountBookCode,AreaCode,CurBillNumber,OrderBillNumber, InvNumber,InvMoney,
		ShipperCode,SETtlementType,SETtlementAt,AccountDay,SalesMan,
		MakingUserCode,MakingAt,MrUserCode,MrAt,
		ExamineUserCode,ExamineAt,DeliveryAt,
		billType,Status,type,ActualCostMoney,costMoney,saleMoney,FreeMoney,
		AlreadyMoney,Note
	)
	SELECT 
		BillNumber,AccountBookCode,AreaCode,CurBillNumber,OrderBillNumber,InvNumber,InvMoney,
		ShipperCode,SETtlementType,SETtlementAt,AccountDay,SalesMan,
		MakingUserCode,MakingAt,MrUserCode,MrAt,
		ExamineUserCode,ExamineAt,DeliveryAt,
		billType,Status,type,ActualCostMoney,costMoney,saleMoney,FreeMoney,
		AlreadyMoney,Note 
	FROM L_Bill_Purchase_Tab  WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0
	
	INSERT INTO L_Bill_Purchases_Tab# (
		Idkey,billnumber,ShipperCode,AccountBookCode,AreaCode,
		ProductCode,StockNum,OrderNum,DownUnit,DownWg,SaleType,
		num,numEx,boxNum,DispNum,BatchNumber,
		ActualCostPrice,costprice,salePrice,BoxPrice,VipPrice,
		BillType,examineUserCode,MrUserCode,MrAt,At,DeliveryAt,
		SETtlementAt,Status,Note
	) SELECT Idkey,billnumber,ShipperCode,AccountBookCode,AreaCode,
		ProductCode,StockNum,OrderNum,DownUnit,DownWg,SaleType,
		num,numEx,boxNum,DispNum,BatchNumber,
		ActualCostPrice,costprice,salePrice,BoxPrice,VipPrice,
		BillType,examineUserCode,MrUserCode,MrAt,At,DeliveryAt,
		SETtlementAt,Status,Note
	FROM L_Bill_Purchases_Tab WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0

	DELETE L_Bill_Purchase_Tab WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0
	DELETE L_Bill_Purchases_Tab WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0

	/**采购送货单@DataReserveDay日前转至扩展表**/
	INSERT INTO L_Bill_Sale_Tab# (
		BillNumber,AccountBookCode,AreaCode,CurBillNumber,OrderBillNumber,InvNumber,InvMoney,
		CustomerCode,SETtlementType,AccountDay,SalesMan,DriverCode,DeliveryCode,
		MakingUserCode,MakingAt,ExamineUserCode,EntryUserCode,EntryAt,ExamineAt,DeliveryAt,
		billType,Status,type,costMoney,saleMoney,AlreadyMoney,FreeMoney,
		DisType,Note
	) SELECT BillNumber,AccountBookCode,AreaCode,CurBillNumber,OrderBillNumber,InvNumber,InvMoney,
		CustomerCode,SETtlementType,AccountDay,SalesMan,DriverCode,DeliveryCode,
		MakingUserCode,MakingAt,ExamineUserCode,EntryUserCode,EntryAt,ExamineAt,DeliveryAt,
		billType,Status,type,costMoney,saleMoney,AlreadyMoney,FreeMoney,
		DisType,Note
	FROM L_Bill_Sale_Tab  WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay and ExamineUserCode>0
	

	INSERT INTO L_Bill_Sales_Tab# (
		Idkey,OrderIdKey,billnumber,CustomerCode,AccountBookCode,AreaCode,ShipperCode,DriverCode,
		SalesPersonCode,SalesManCode,
		ProductCode,BatchNumber,StockNum,OrderNum,
		DownUnit,DownWg,SaleType,Pack,
		num,numEx,BoxNum,DispNum,DisTributionNum,DisTributionUserCode,DisTributionAt,
		ActualCostPrice,costprice,cursaleprice,salePrice,BoxPrice,basePrice,
		examineUserCode,At,BillType,DeliveryAt,status,
		Note,lossNote,DetailNote,PlaceholderNote,EntryUserCode,EntryAt,
		replaceNumEx,CheckReportsAsCode,DownUnitType
	) SELECT Idkey,OrderIdKey,billnumber,CustomerCode,AccountBookCode,AreaCode,ShipperCode,DriverCode,
		SalesPersonCode,SalesManCode,
		ProductCode,BatchNumber,StockNum,OrderNum,
		DownUnit,DownWg,SaleType,Pack,
		num,numEx,BoxNum,DispNum,DisTributionNum,DisTributionUserCode,DisTributionAt,
		ActualCostPrice,costprice,cursaleprice,salePrice,BoxPrice,basePrice,
		examineUserCode,At,BillType,DeliveryAt,status,
		Note,lossNote,DetailNote,PlaceholderNote,EntryUserCode,EntryAt,
		replaceNumEx,CheckReportsAsCode,DownUnitType
	FROM L_Bill_Sales_Tab  WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0

	DELETE L_Bill_Sale_Tab WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0
	DELETE L_Bill_Sales_Tab WHERE datediff(day,DeliveryAt,@dat)>@GroupToExpandDay  and ExamineUserCode>0

	update L_sys_GroupInf_Tab SET Status=1 WHERE idCode=4
	SET NOCOUNT OFF


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_InOut]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_InOut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec [Sp_Group_InOut] ''2020-03-28''

CREATE proc [dbo].[Sp_Group_InOut] @dat smalldatetime  as
--汇总进销存
 set nocount on
 if ( select Status from L_Sys_GroupInf_Tab where idCode = 2)=1
 begin
	return
end;
 CREATE TABLE [dbo].[#Temp_InOut_Tab](
	[ProductCode] [varchar](20) NOT NULL,
	[AccountBookCode] [int] NOT NULL,
	[AreaCode] [int] NOT NULL,
	[ShipperCode] [int] NOT NULL,
	[BatchNumber] [varchar](50) NOT NULL default '''',
	[PurchaseNum] [float] NOT NULL default 0,
	[PurchaseMoney] [float] NOT NULL default 0,
	[SaleNum] [float] NOT NULL default 0,
	[SaleMoney] [float] NOT NULL default 0,
	[StockSwapNum] [float] NOT NULL default 0,
	[StockSwapMoney] [float] NOT NULL default 0,
	[AreaExChangeNum] [float] NOT NULL default 0,
	[AreaExChangeMoney] [float] NOT NULL default 0,
	[StockChangeNum] [float] NOT NULL default 0,
	[StockChangeMoney] [float] NOT NULL default 0,
	[StockCheckNum] [float] NOT NULL default 0,
	[StockCheckMoney] [float] NOT NULL default 0,
	[StockReceiveNum] [float] NOT NULL default 0,
	[StockReceiveMoney] [float] NOT NULL default 0,
	[PriceChangeNum] [float] NOT NULL default 0,
	[priceChangeMoney] [float] NOT NULL default 0,
	[DiffNum] [float] NOT NULL default 0,
	[DiffMoney] [float] NOT NULL default 0,
	) 
	--销售
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		SaleNum,
		SaleMoney
	)	
	select 
		ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(NumEx),
		sum(CostMomey) 
	from (
		Select ProductCode,
			AccountBookCode,
			AreaCode,
			ShipperCode,
			(NumEx-replaceNumEx)*PackBase*DoubleNumExBase as NumEx,
			(NumEx-replaceNumEx)*CostPrice as CostMomey 
		from V_Bill_Sales_Tab 
		where datediff(day,DeliveryAt,@dat)=0
	) a Group by ProductCode,AccountBookCode,AreaCode
	--进货
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		PurchaseNum,
		PurchaseMoney
	)
	select 
		ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(NumEx),
		sum(NumEx*ActualCostPrice) 
	from V_Bill_Purchases_Tab
	where datediff(day,DeliveryAt,@dat)=0 and examineUserCode<>0
	Group by ProductCode,AccountBookCode,AreaCode
	
	--拆零
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StockSwapNum,
		StockSwapMoney
	)
	Select ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(Num*Type),
		sum(Num*CostPrice*Type) 
	from L_Bill_StockSwaps_Tabs 
	where datediff(day,At,@dat)=0  and examineUserCode<>0 
	Group by AccountBookCode,AreaCode,ProductCode

	--加工
	INSERT INTO [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StockSwapNum,
		StockSwapMoney
	)
	SELECT ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(Num),
		sum(Num*CostPrice) 
	FROM (
		SELECT AccountBookCode,AreaCode,ProductCode,num*-1 AS NUM,changeAt,costprice FROM L_Bill_StockSplits_Tab WHERE datediff(day,At,@dat)=0  and examineUserCode<>0 
		UNION ALL
		SELECT AccountBookCode,AreaCode,ProductCode,num,changeAt,costprice FROM L_Bill_StockSplits_TabS WHERE datediff(day,At,@dat)=0  and examineUserCode<>0 
	) a
	GROUP BY AccountBookCode,AreaCode,ProductCode
	
	--仓位调拨
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		AreaExChangeNum,
		AreaExChangeMoney
	)
	Select ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(Num*ExChangetype),
		sum(Num*CostPrice*ExChangetype) 
	from L_Bill_AreaExChanges_Tabs 
	where datediff(day,At,@dat)=0   and examineUserCode<>0
	Group by ProductCode,AccountBookCode,AreaCode
	
	--库存变更
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StockChangeNum,
		StockChangeMoney
	)
	Select ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(ChangeNum),
		sum(ChangeNum*CostPrice) 
	from L_Bill_StockChanges_Tab 
	where datediff(day,changeAt,@dat)=0   and examineUserCode<>0
	Group by ProductCode,AccountBookCode,AreaCode

	--领用
	Insert into [#Temp_InOut_Tab] (
		ProductCode,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BatchNumber,
		StockReceiveNum,
		StockReceiveMoney
	)
	Select ProductCode,
		AccountBookCode,
		AreaCode,
		0,
		'''',
		sum(Num),
		sum(Num*CostPrice) 
	from L_Bill_StockReceives_Tab
	where datediff(day,At,@dat)=0   and examineUserCode<>0
	Group by ProductCode,AccountBookCode,AreaCode

  Insert into L_Group_InOut_Tab (At,ProductCode,AccountBookCode,AreaCode,BatchNumber,ShipperCode,StartNum,StartMoney)
    Select @dat,a.ProductCode,a.AccountBookCode,a.areaCode,'''',0,0,0 from 
    (
		select ProductCode,
			AccountBookCode,
			AreaCode
		from [#Temp_InOut_Tab] a 
		Group by ProductCode,AccountBookCode,AreaCode
	) a Where not EXISTS (
			Select 1 from L_Group_InOut_Tab 
			where At		=	@dat and 
				ProductCode	=	a.ProductCode and 
				AccountBookCode	=	a.AccountBookCode and
				AreaCode	=	a.AreaCode
		)--插入进销存中没的商品

update a set a.PurchaseNum			=	b.PurchaseNum,
			 a.PurchaseMoney		=	b.PurchaseMoney,
			 a.SaleNum				=	b.SaleNum,
			 a.SaleMoney			=	b.SaleMoney,
			 a.StockSwapNum			=	b.StockSwapNum,
			 a.StockSwapMoney		=	b.StockSwapMoney,
			 a.AreaExChangeNum		=	b.AreaExChangeNum,
			 a.AreaExChangeMoney	=	b.AreaExChangeMoney,
			 a.StockChangeNum		=	b.StockChangeNum,
			 a.StockChangeMoney		=	b.StockChangeMoney,
			 a.StockCheckNum		=	b.StockCheckNum,
			 a.StockCheckMoney		=	b.StockCheckMoney,
			 a.StockReceiveNum		=	b.StockReceiveNum,
			 a.StockReceiveMoney	=	b.StockReceiveMoney,
			 a.PriceChangeNum		=	b.PriceChangeNum,
			 a.priceChangeMoney		=	b.priceChangeMoney,
			 a.DiffNum				=	b.DiffNum,
			 a.DiffMoney			=	b.DiffMoney
from L_Group_InOut_Tab a,
   (select productCode,
		   AccountBookCode,
		   AreaCode,
		   sum(isnull(PurchaseNum,0))			as PurchaseNum,
		   sum(isnull(PurchaseMoney,0))			as PurchaseMoney,
		   sum(isnull(SaleNum,0))				as SaleNum,
		   sum(isnull(SaleMoney,0))				as SaleMoney,
		   sum(isnull(StockSwapNum,0))		as StockSwapNum,
		   sum(isnull(StockSwapMoney,0))	as StockSwapMoney,
		   sum(isnull(AreaExChangeNum,0))		as AreaExChangeNum,
		   sum(isnull(AreaExChangeMoney,0))		as AreaExChangeMoney,
		   sum(isnull(StockChangeNum,0))		as StockChangeNum,
		   sum(isnull(StockChangeMoney,0))		as StockChangeMoney,
		   sum(isnull(StockCheckNum,0))			as StockCheckNum,
		   sum(isnull(StockCheckMoney,0))		as StockCheckMoney,
		   sum(isnull(StockReceiveNum,0))		as StockReceiveNum,
		   sum(isnull(StockReceiveMoney,0))		as StockReceiveMoney,
		   sum(isnull(PriceChangeNum,0))		as PriceChangeNum,
		   sum(isnull(priceChangeMoney,0))		as priceChangeMoney,
		   sum(isnull(DiffNum,0))				as DiffNum,
		   sum(isnull(DiffMoney,0))				as DiffMoney
	 from [#Temp_InOut_Tab] a Group by AccountBookCode,AreaCode,productCode
	) b 
	where At			=	@dat and 
		a.productCode	=	b.productCode and 
		a.AccountBookCode		=	b.AccountBookCode	and
		a.AreaCode		=	b.AreaCode

--柜组	
 insert into L_Group_InOut_Area_tab (
		At,
		AccountBookCode,
		AreaCode,
		StartNum,
		StartMoney,
		PurchaseNum,
		PurchaseMoney,
		SaleNum,
		SaleMoney,
		StockSwapNum,
		StockSwapMoney,
		AreaExChangeNum,
		AreaExChangeMoney,
		StockChangeNum,
		StockChangeMoney,
		StockCheckNum,
		StockCheckMoney,
		StockReceiveNum,
		StockReceiveMoney,
		PriceChangeNum,
		priceChangeMoney,
		DiffNum,
		DiffMoney
	)
  select @dat,
		AccountBookCode,
		AreaCode,
		Sum(StartNum),
		Sum(StartMoney),
		Sum(PurchaseNum),
		Sum(PurchaseMoney),
		Sum(SaleNum),
		Sum(SaleMoney),
		Sum(StockSwapNum),
		Sum(StockSwapMoney),
		Sum(AreaExChangeNum),
		Sum(AreaExChangeMoney),
		Sum(StockChangeNum),
		Sum(StockChangeMoney),
		Sum(StockCheckNum),
		Sum(StockCheckMoney),
		Sum(StockReceiveNum),
		Sum(StockReceiveMoney),
		Sum(PriceChangeNum),
		Sum(priceChangeMoney),
		Sum(DiffNum),
		Sum(DiffMoney)
   from L_Group_InOut_Tab where At=@dat group by AccountBookCode,AreaCode
	
--分类	
 insert into L_Group_InOut_Cate_tab (
		At,
		AccountBookCode,
		CateCode,
		StartNum,
		StartMoney,
		PurchaseNum,
		PurchaseMoney,
		SaleNum,
		SaleMoney,
		StockSwapNum,
		StockSwapMoney,
		AreaExChangeNum,
		AreaExChangeMoney,
		StockChangeNum,
		StockChangeMoney,
		StockCheckNum,
		StockCheckMoney,
		StockReceiveNum,
		StockReceiveMoney,
		PriceChangeNum,
		priceChangeMoney,
		DiffNum,
		DiffMoney
	)
  select @dat,
		AccountBookCode,
		CateCode,
		Sum(StartNum),
		Sum(StartMoney),
		Sum(PurchaseNum),
		Sum(PurchaseMoney),
		Sum(SaleNum),
		Sum(SaleMoney),
		Sum(StockSwapNum),
		Sum(StockSwapMoney),
		Sum(AreaExChangeNum),
		Sum(AreaExChangeMoney),
		Sum(StockChangeNum),
		Sum(StockChangeMoney),
		Sum(StockCheckNum),
		Sum(StockCheckMoney),
		Sum(StockReceiveNum),
		Sum(StockReceiveMoney),
		Sum(PriceChangeNum),
		Sum(priceChangeMoney),
		Sum(DiffNum),
		Sum(DiffMoney)
   from (select a.*,b.CateCode from L_Group_InOut_Tab a,L_Basic_Product_Tab b where At=@dat and a.ProductCode=b.IdCode) x
   group by AccountBookCode,CateCode
    	
	drop table [dbo].[#Temp_InOut_Tab]
	
	--帐号处理
	Insert into L_Group_InOut_Accounts_Tab (At,AccountsCode,StartMoney)
    Select @dat,a.idCode,a.initMoney from 
		L_Basic_Accounts_Tab a
	 Where not EXISTS (
			Select 1 from L_Group_InOut_Accounts_Tab 
			where At		=	@dat and 
				AccountsCode	=	a.idCode
		)--插入帐号进销中没的
	
	update a set a.InMoney=B.Money 
	from	L_Group_InOut_Accounts_Tab a,(
		select AccountsCode,SUM(Money) as Money from V_Reports_rec where ExamineAt=@dat Group by ExamineAt,AccountsCode
	) b where a.AccountsCode = b.AccountsCode and at= @dat
	
	update a set a.outMoney=B.Money 
	from	L_Group_InOut_Accounts_Tab a,(
		select AccountsCode,SUM(Money) as Money from V_Reports_Pay where ExamineAt=@dat Group by ExamineAt,AccountsCode
	) b where a.AccountsCode = b.AccountsCode and at= @dat
	
	update L_Sys_GroupInf_Tab set Status=1 where idCode=2
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_InOut_Copy]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_InOut_Copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE    proc [dbo].[Sp_Group_InOut_Copy] @dat smalldatetime as
/******************************************/
/*********--复制前一日的汇总数据    ********/
/*********  1,进销存数据           ********/
/*********  参数：@dat 汇总日期    ********/
/*********  2020-02-11 张建明     ********/
/****************************************/
 set nocount on
/****   Begin *****************/
/*******复制前一日进销存  *************/
if (select COUNT(*) from L_Bill_Purchases_Tab where DeliveryAt=@dat and ExamineUserCode = 0)>0
begin
	Raiserror( ''汇总日期存在对应送货日期未审核的收货单'',16,1)
	return 
end

if (select COUNT(*) from L_Bill_Sale_Tab where DeliveryAt=@dat and ExamineUserCode = 0)>0
begin
	Raiserror( ''汇总日期存在对应送货日期未审核的送货单'',16,1)
	return 
end

 if ( select Status from L_Sys_GroupInf_Tab where idCode = 1)=1
 begin
	return
end;
--重新计算清点单中的存货量
IF (select pushbackcheckstock FROM L_Sys_Parmars_Tab)=1
BEGIN
	EXEC Sp_PushBack_StockCheck @dat
END

--计算销售与变更单成本
exec sp_CalcSalePirce @dat
--如果要报损成本更平摊
IF (select NotAvgLose from L_Sys_Parmars_Tab) =0 
BEGIN
	EXEC sp_CalcInPirce @dat,1
END;

insert into L_Group_InOut_Tab (At,ProductCode,AccountBookCode,AreaCode,ShipperCode,BatchNumber,StartNum,StartMoney)
 select @dat,ProductCode,AccountBookCode,AreaCode,ShipperCode,BatchNumber,EndNum,case when EndNum=0 then 0 else  EndMoney end  EndMoney from l_Group_inOut_Tab 
           where At=@dat-1 and EndNum<>0
/*
update a set a.StockNum = x.num from 
(select * from L_Bill_StockChanges_Tab where changeAt = @dat) a,

(select  AreaCode,ProductCode,Sum(Num) as Num,Sum(Money) as Money 
	from (
		select AreaCode,ProductCode,Sum(EndNum) as Num,Sum(EndMoney) as Money from L_Group_InOut_tab where At=@dat-1 group by AreaCode,ProductCode
		union all
		select AreaCode,ProductCode,sum(numex),sum(numex*ActualCostPrice) from L_Bill_Purchases_Tab where  DeliveryAt = @dat group by AreaCode,ProductCode
		union all
		select AreaCode,ProductCode,sum(numex*-1),sum(numex*ActualCostPrice*-1) from L_Bill_Sales_Tab where  DeliveryAt =@dat group by AreaCode,ProductCode
	) b group by AreaCode,ProductCode
) x where a.AreaCode = x.AreaCode and a.ProductCode = x.ProductCode
*/         
insert into L_Group_InOut_Accounts_Tab (At,AccountsCode,StartMoney) select @dat,AccountsCode,EndMoney from L_Group_InOut_Accounts_Tab  where At=@dat-1

          
update l_Sys_GroupInf_Tab set Status=1 where IdCode=1
/********End *******************/
 

  set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Group_Sale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Group_Sale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec [Sp_Group_Sale] ''2020-03-31''
-- select * from L_Group_Sale_SalesPerson_Tabs

CREATE proc [dbo].[Sp_Group_Sale] @dat smalldatetime  as
--汇总销售
 set nocount on
  if ( select Status from L_Sys_GroupInf_Tab where idCode = 3)=1
 begin
	return
end;
 create TABLE [dbo].[#Temp_Sale_tab](
	[productCode] [varchar](20) NULL,
	[AccountBookCode] [int] NOT NULL,
	[AreaCode] [int] NOT NULL,
	[CustomerCode] [int] NOT NULL,
	[ShipperCode] [int] NOT NULL,
	[Num] [float] Not NULL,
	[CostPrice] [float] Not NULL,
	[SalePrice] [float] Not NULL,
	[Type] [smallint] Not null
	) 

	
	Insert into [#Temp_Sale_tab] (
		productCode,
		AccountBookCode,
		AreaCode,
		CustomerCode,
		ShipperCode,
		Num,
		CostPrice,
		SalePrice,
		Type)
	select productCode,
		AccountBookCode,
		AreaCode,
		CustomerCode,
		ShipperCode,
		NumEx,
		CostPrice,
		SalePrice,
		Type 
	from (
		Select productCode,
			AccountBookCode,
			AreaCode,
			CustomerCode,
			ShipperCode,
			(NumEx-replaceNumEx)*PackBase*DoubleNumExBase as NumEx,
			ActualCostPrice / DoubleNumExBase/PackBase as CostPrice,
			SalePrice /  DoubleNumExBase/PackBase as SalePrice,
			1 as Type 
		from V_Bill_Sales_Tab where datediff(day,DeliveryAt,@dat)=0
		union all
		Select productCode,
			AccountBookCode,
			AreaCode,
			0 as CustomerCode,
			ShipperCode,
			Num,
			CostPrice,
			SalePrice,
			2 as Type 
		from l_Bill_StoreExChanges_Tabs where datediff(day,at,@dat)=0 
	) a
	
	--销售总表
	if (select COUNT(productCode) from [#Temp_Sale_tab]) = 0 
	begin
		insert into L_Group_Sale_Total_Tab (At,AccountBookCode,Num,CostMoney,SaleMoney,DayGroup,MonthGroup) values 
			(@dat,0,0,0,0,1,0)
	end
	else
	begin
		insert into L_Group_Sale_Total_Tab (
			At,
			AccountBookCode,
			Num,
			CostMoney,
			SaleMoney,
			DayGroup,
			MonthGroup
		)
		select @dat,
			AccountBookCode,
			isnull(SUM(Num),0),
			isnull(SUM(Num*CostPrice),0),
			isnull(SUM(Num*SalePrice),0),1,0 
		from [#Temp_Sale_tab]
		Group by AccountBookCode 
	end

	--销售
	Insert into l_Group_Sale_Tab (
		At,
		AccountBookCode,
		AreaCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney,
		Type
	)
	select 
		@dat,
		AccountBookCode,
		AreaCode,
		ProductCode,
		isnull(SUM(Num),0),
		isnull(SUM(Num*CostPrice),0),
		isnull(SUM(Num*SalePrice),0),
		Type 
	from [#Temp_Sale_tab]
	Group by AccountBookCode,AreaCode,ProductCode,Type 
	--分店汇总表
	Insert into L_Group_Sale_Store_Tab (
		At,
		AccountBookCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		SUM(Num),
		SUM(Num*CostPrice),
		SUM(Num*SalePrice)
	From [#Temp_Sale_tab] 
	Group by AccountBookCode
	--柜组汇总表
	Insert into L_Group_Sale_Area_Tab (
		At,
		AccountBookCode,
		AreaCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		AreaCode,
		SUM(Num),
		SUM(Num*CostPrice),
		SUM(Num*SalePrice)
	From [#Temp_Sale_tab] 
	Group by AccountBookCode,AreaCode
	
	--分类汇总表
	Insert into L_Group_Sale_Cate_Tab (
		At,
		AccountBookCode,
		CateCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		CateCode,
		SUM(Num),
		SUM(Num*CostPrice),
		SUM(Num*SalePrice)
	From (Select a.*,b.CateCode from [#Temp_Sale_tab] a,L_Basic_Product_Tab b where a.productCode=b.IdCode) x
	Group by AccountBookCode,CateCode

/*
	--员工销售明细
	Insert into L_Group_Sale_SalesPerson_Tabs (
		At,
		AccountBookCode,
		UserCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	) 
	select @dat,
		AccountBookCode,
		SalesPersonCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	from (
		select AccountBookCode,
			ProductCode,
			SalesPersonCode,
			sum(Num) as Num,
			sum(Num*costprice) as CostMoney,
			sum(Num*salePrice) as SaleMoney
		from [#Temp_Sale_tab] a 
		Group by ProductCode,AccountBookCode,SalesPersonCode
	) a

	--员工销售汇总表
	Insert into L_Group_Sale_SalesPerson_Tab (
		At,
		AccountBookCode,
		UserCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		UserCode,
		SUM(Num),
		SUM(CostMoney),
		SUM(SaleMoney)
	From L_Group_Sale_SalesPerson_Tabs 
	where AT=@dat
	Group by AccountBookCode,UserCode

	--司机销售明细
	Insert into L_Group_Sale_Driver_Tabs (
		At,
		AccountBookCode,
		UserCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	) 
	select @dat,
		AccountBookCode,
		DriverCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	from (
		select AccountBookCode,
			DriverCode,
			ProductCode,
			sum(Num) as Num,
			sum(Num*costprice) as CostMoney,
			sum(Num*salePrice) as SaleMoney
		from [#Temp_Sale_tab] a 
		Group by ProductCode,AccountBookCode,DriverCode
	) a
	
	--司机销售汇总表
	Insert into L_Group_Sale_Driver_Tab (
		At,
		AccountBookCode,
		UserCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		UserCode,
		SUM(Num),
		SUM(CostMoney),
		SUM(SaleMoney)
	From L_Group_Sale_Driver_Tabs 
	where AT=@dat
	Group by AccountBookCode,UserCode
	
	--业务销售明细
	Insert into L_Group_Sale_SalesMan_Tabs (
		At,
		AccountBookCode,
		UserCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	) 
	select @dat,
		AccountBookCode,
		SalesManCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
		
	from (
		select AccountBookCode,
			ProductCode,
			SalesManCode,
			sum(Num) as Num,
			sum(Num*costprice) as CostMoney,
			sum(Num*salePrice) as SaleMoney
		from [#Temp_Sale_tab] a 
		Group by ProductCode,AccountBookCode,SalesManCode
	) a
	--业务销售汇总表
	Insert into L_Group_Sale_SalesMan_Tab (
		At,
		AccountBookCode,
		UserCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		UserCode,
		SUM(Num),
		SUM(CostMoney),
		SUM(SaleMoney)
	From L_Group_Sale_SalesMan_Tabs 
	where AT=@dat
	Group by AccountBookCode,UserCode
*/	
	--客户销售明细
	Insert into L_Group_Sale_Customer_Tabs (
		At,
		AccountBookCode,
		CustomerCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	) 
	select @dat,
		AccountBookCode,
		CustomerCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	from (
		select AccountBookCode,
			ProductCode,
			CustomerCode,
			sum(Num) as Num,
			sum(Num*costprice) as CostMoney,
			sum(Num*salePrice) as SaleMoney
		from [#Temp_Sale_tab] a 
		Group by ProductCode,AccountBookCode,CustomerCode
	) a
	
	--客户销售汇总表
	Insert into L_Group_Sale_Customer_Tab (
		At,
		AccountBookCode,
		CustomerCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		CustomerCode,
		SUM(Num),
		SUM(CostMoney),
		SUM(SaleMoney)
	From L_Group_Sale_Customer_Tabs 
	where AT=@dat
	Group by AccountBookCode,CustomerCode
	
	--货商销售明细
	Insert into L_Group_Sale_Shipper_Tabs (
		At,
		AccountBookCode,
		ShipperCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	) 
	select @dat,
		AccountBookCode,
		ShipperCode,
		ProductCode,
		Num,
		CostMoney,
		SaleMoney
	from (
		select AccountBookCode,
			ProductCode,
			ShipperCode,
			sum(Num) as Num,
			sum(Num*costprice) as CostMoney,
			sum(Num*salePrice) as SaleMoney
		from [#Temp_Sale_tab] a 
		Group by ProductCode,AccountBookCode,ShipperCode
	) a
	
	--货商销售汇总表
	Insert into L_Group_Sale_Shipper_Tab (
		At,
		AccountBookCode,
		ShipperCode,
		Num,
		CostMoney,
		SaleMoney
	) select @dat,
		AccountBookCode,
		ShipperCode,
		SUM(Num),
		SUM(CostMoney),
		SUM(SaleMoney)
	From L_Group_Sale_Shipper_Tabs 
	where AT=@dat
	Group by AccountBookCode,ShipperCode
		
		
	TRUNCATE TABLE [#Temp_Sale_tab]
	drop Table [#Temp_Sale_tab]
	
	update L_Sys_GroupInf_Tab set Status=1 where IdCode=3
	set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ImportData_Update]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_ImportData_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_ImportData_Update] 
 @JsonData varchar(max)
as 
/**将excel数据转成json并存入供后续使用*/
set nocount on
	update Import_Data_Tab set JsonData = @JsonData where idCode = 1
set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertQuotePrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_InsertQuotePrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec Sp_InsertQuotePrice 90025,''10003'',6

CREATE proc [dbo].[Sp_InsertQuotePrice]
	@CustomerCode BigInt,
	@ProdcuctCode VarChar(20),
	@SalePrice Float
as
set NoCount on

declare @BillNumber VarChar(20),@MaxId int,@MaxSerialNumber int,@aliasName varchar(50)
select @BillNumber= BillNumber from L_bill_QuotedPrice_Tab where CustomerCode = @CustomerCode and EndAt = (select MAX(EndAt) from L_bill_QuotedPrice_Tab where CustomerCode = @CustomerCode)
select @MaxId = IsNull(Max(RIGHT(Idkey,4)),0)+1 From L_bill_QuotedPrices_Tab where BillNumber = @BillNumber
select @MaxSerialNumber = IsNull(Max(SerialNumber),0)+1 From L_bill_QuotedPrices_Tab where BillNumber = @BillNumber
select @aliasName = name From L_Basic_Product_Tab where IdCode = @ProdcuctCode
if @BillNumber is not null
BEGIn
	insert into L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,aliasName,SerialNumber,curSalePrice,salePrice,At)
	select @BillNumber+''-''+dbo.SetNBit(cast(@MaxId as Varchar(10)),''0'',4),@BillNumber,@ProdcuctCode,@aliasName, @MaxSerialNumber,0,@SalePrice,getDate()
End
if (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode=@CustomerCode and ProductCode = @ProdcuctCode)=0
Begin
	select @MaxId=IsNull(Max(RIGHT(Idkey,4)),0)+1 From L_Basic_Customer_Price_Tab where PCode = @CustomerCode
	insert into L_Basic_Customer_Price_Tab (IdKey,Pcode,ProductCode,aliasName,SerialNumber,Price)
		select Cast(@CustomerCode as varchar(20))+''-''+dbo.SetNBit(cast(@MaxId as Varchar(10)),''0'',4),@CustomerCode,@ProdcuctCode,@aliasName, @MaxSerialNumber,@SalePrice
end
set NoCount Off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_LoadCustomerPrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_LoadCustomerPrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_LoadCustomerPrice] 
	@CurCustomerCode	int,
	@CustomerCode		int,
	@FromBasic			int
as
/*调入报价
	@CurCustomerCode	原客户
	@CustomerCode		本客户
	@FromBasic			1,调入取部商品 
*/
if (Select Count(IdKey) from L_Basic_Customer_Price_Tab where PCode = @CustomerCode)>0 
begin
	Raiserror( ''此客户存在报价，不能调入或复制'',16,1)
	return 
end
	
if @FromBasic =  0 
begin
	Insert into L_Basic_Customer_Price_Tab (
				IdKey,
				MchCode,
				PCode,
				ProductCode,
				SerialNumber,
				Price
	) select 
				Cast(@CustomerCode as varchar(10))+''-''+dbo.SetNBit(CAST(ROW_NUMBER() OVER(Order by IdKey) as varchar(10)),''0'',4),
				MchCode,
				@CustomerCode,
				ProductCode,
				SerialNumber,
				Price
	from L_Basic_Customer_Price_Tab where PCode = @CurCustomerCode order by SerialNumber
end else 
begin
	
	Insert into L_Basic_Customer_Price_Tab (
				IdKey,
				MchCode,
				PCode,
				ProductCode,
				SerialNumber,
				Price
	) select 
				Cast(@CustomerCode as varchar(10))+''-''+dbo.SetNBit(CAST(ROW_NUMBER() OVER(Order by idCode) as varchar(10)),''0'',4),
				'''' as mchcode,
				@CustomerCode,
				IdCode,
				ROW_NUMBER() OVER(Order by CateCode,IdCode) AS RowId,
				Price1
	from L_Basic_Product_Tab where [status] = 0 order by CateCode,idcode
end;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Clear]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Clear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--select * from L_Basic_Customer_Price_Tab

create proc [dbo].[Sp_Offer_Clear]
@CustomerCode bigInt
as
/**
清空报价
**/
set noCount on
	delete  L_Basic_Customer_Price_Tab where Pcode = @CustomerCode
set noCount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Copy]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--select * from L_Basic_Customer_Price_Tab

CREATE proc [dbo].[Sp_Offer_Copy]
@CustomerCode bigInt,
@CurCustomerCode bigInt
as
/**
复制报价
**/
set noCount on
	if @CurCustomerCode = @CustomerCode
	begin
		Raiserror( ''来源与目标不能相同'',16,1)
		return 
	end;
	if (select count(Idkey) from L_Basic_Customer_Price_Tab where Pcode = @CustomerCode)>0
	begin
		Raiserror( ''已存在报价不能复制'',16,1)
		return 
	end;
	insert into L_Basic_Customer_Price_Tab (IdKey,PCode,ProductCode,SerialNumber,Price)
	select CAST(@CustomerCode as Varchar(10))+''-''+dbo.SetNBit(rowId,''0'',4),@CustomerCode,ProductCode, RowId,Price From (
		select  ProductCode,Price, ROW_NUMBER() OVER(Order by SerialNumber) AS RowId from L_Basic_Customer_Price_Tab where Pcode = @CurCustomerCode
	) a
set noCount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Offer_Load]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Offer_Load]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--select * from L_Basic_Customer_Price_Tab

CREATE proc [dbo].[Sp_Offer_Load] 
@CustomerCode bigInt
as
/**
调入商品
**/
set noCount on
	if (select count(Idkey) from L_Basic_Customer_Price_Tab where Pcode = @CustomerCode)>0
	begin
		Raiserror( ''已存在报价不能调入'',16,1)
		return 
	end;
	insert into L_Basic_Customer_Price_Tab (IdKey,PCode,ProductCode,SerialNumber,Price)
	select CAST(@CustomerCode as Varchar(10))+''-''+dbo.SetNBit(rowId,''0'',4),@CustomerCode,idCode, RowId,Price1 From (
		select  idCode,Price1, ROW_NUMBER() OVER(Order by CateSerialNum,idcode) AS RowId from (
			select idCode,Price1,cateCode,(select SerialNum from L_Basic_Cate_Tab where idCode=a.catecode) as CateSerialNum From L_Basic_Product_Tab a where Status = 0
		) x
	) a
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_OrderToQuotePrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_OrderToQuotePrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
 CREATE Proc [dbo].[Sp_OrderToQuotePrice] 
	@CompanyCode int,
	@BillNumber VarChar(20),
	@FROM VarChar(20)

 As
/**
	@CompanyCode int,	客户编码
	@BillNumber VarChar(20), 单号
	@FROM VarChar(20) 来源 SALES送货单|SALEORDERS客户订单
**/
 --以下代码将新商品加入报价表
	declare @QuoteBillNumber varchar(20)
	declare @MaxKey int,@MaxSerialNumber int,@ChangeAblePrice bit,@Pcode Int
	--是否定价 与 项目编码
	SELECT @ChangeAblePrice = ChangeAblePrice,@Pcode = Pcode FROM L_Basic_Company_Tab WHERE IdCode = @CompanyCode

	IF @ChangeAblePrice = 1 --如果定价客户不进行报价与报价更新
	BEGIN
		RETURN
	END
	 --如果项目编码不为0，将客户设成本项目第一个客户
	IF @Pcode>0
	BEGIN
		SELECT TOP 1 @CompanyCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END
	SELECT @QuoteBillNumber= BillNumber FROM L_bill_QuotedPrice_Tab WHERE CustomerCode = @CompanyCode and ENDAt = (SELECT MAX(ENDAt) FROM L_bill_QuotedPrice_Tab WHERE CustomerCode = @CompanyCode)
	 
	 IF @FROM = ''SALES''
	 BEGIN
 		IF  @CompanyCode>90001
		BEGIN
			SELECT @MaxKey =isnull(max(RIGHT(Idkey,4)),0),@MaxSerialNumber = count(idkey) FROM L_Basic_Customer_Price_Tab WHERE PCode =@CompanyCode
			INSERT INTO L_Basic_Customer_Price_Tab (idkey,SerialNumber,CustomerProcudeCode,mchCode,PCode,productCode,aliasName,Price,SaleType)
			SELECT 
				cast(@CompanyCode as varchar(20))+''-''+dbo.SetNBit(cast(@MaxKey+RowId as varchar(10)),''0'',4),
				@MaxSerialNumber+RowId  ,
				ProductCode as CustomerProcudeCode,
				''FROMSale'' as mchCode,--mchcode 代表价格来源
				@CompanyCode,ProductCode,aliasName,
				basePrice,
				SaleType
			FROM (
				SELECT 
					ROW_NUMBER() OVER(Order by ProductCode) AS RowId,ProductCode,saleType, 
					(SELECT Name FROM L_Basic_Product_Tab WHERE x.ProductCode=IdCode) as aliasName, 
					Max(basePrice) as basePrice FROM  (
							SELECT ProductCode,CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END AS SaleType,basePrice,salePrice FROM V_Bill_Sales_Tab WHERE billnumber = @BillNumber
						)  x
				WHERE NOT EXISTS (
					SELECT 1 FROM L_Basic_Customer_Price_Tab WHERE ProductCode=x.ProductCode and 
						SaleType = x.SaleType and 
						PCode=@CompanyCode
				)--插入报价表中没的商品
				Group by ProductCode,saleType
			) a

			IF IsNull(@QuoteBillNumber,'''')<>'''' 
			BEGIN
				SELECT @MaxKey =isnull(max(RIGHT(Idkey,4)),0),@MaxSerialNumber = count(idkey) FROM L_bill_QuotedPrices_Tab WHERE billnumber = @QuoteBillNumber
				INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,SaleType,aliasName,SerialNumber,CustomerProcudeCode,curSalePrice,salePrice,At)
				SELECT 
					@QuoteBillNumber+''-''+dbo.SetNBit(cast(@MaxKey+RowId as varchar(10)),''0'',4),
					@QuoteBillNumber,ProductCode,
					SaleType,
					aliasName,
					@MaxSerialNumber+RowId ,
					ProductCode as CustomerProcudeCode,
					0 as curSalePrice,basePrice,getDate()
				FROM (
					SELECT 
						ROW_NUMBER() OVER(Order by ProductCode) AS RowId,ProductCode,
						SaleType,
						(SELECT Name FROM L_Basic_Product_Tab WHERE x.ProductCode=IdCode) as aliasName,
						Max(basePrice) as basePrice FROM(
							SELECT ProductCode,CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END AS SaleType,basePrice,salePrice FROM V_Bill_Sales_Tab WHERE billnumber = @BillNumber
						)  x
					WHERE NOT EXISTS (
						SELECT 1 FROM L_bill_QuotedPrices_Tab WHERE ProductCode=x.ProductCode  and SaleType = x.SaleType and billnumber = @QuoteBillNumber
					)--插入报价表中没的商品
					Group by ProductCode,SaleType
				) a
			END;
		END;	
		 --以下代码更新报价
		IF @ChangeAblePrice=0 and @CompanyCode>90001
		BEGIN
			INSERT INTO L_Basic_Customer_Price_Tab_Logs (Date,CustomerCode,ProductCode,SaleType,CurSalePrice,NewSalePrice,UserCode,BillNumber,Note)
			SELECT GETDATE(),@CompanyCode,b.ProductCode,b.SaleType,a.Price,b.BasePrice,UserCode,@billNumber,''销售单审核改变'' 
			FROM L_Basic_Customer_Price_Tab a,
				(
					SELECT ProductCode,Max(examineUserCode) as UserCode,
						 CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(basePrice) as basePrice  
					FROM V_Bill_Sales_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.PCode=@CompanyCode and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType 

			update a set a.Price=b.basePrice 
				FROM L_Basic_Customer_Price_Tab a,
				(
					SELECT ProductCode,
						 CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(basePrice) as basePrice  
					FROM V_Bill_Sales_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.PCode=@CompanyCode and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType

			

			/*update a set a.salePrice=b.salePrice 
				FROM L_bill_QuotedPrices_Tab a,
				(
					SELECT ProductCode,
						CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(salePrice) as salePrice  
					FROM V_Bill_Sales_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.billnumber=@QuoteBillNumber and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType
			*/
		END;
	END;

	IF @FROM = ''SALEORDERS''
	 BEGIN
 		IF  @CompanyCode>90001
		BEGIN
			SELECT @MaxKey =isnull(max(RIGHT(Idkey,4)),0),@MaxSerialNumber = count(idkey) FROM L_Basic_Customer_Price_Tab WHERE PCode =@CompanyCode
			INSERT INTO L_Basic_Customer_Price_Tab (idkey,SerialNumber,CustomerProcudeCode,mchCode,PCode,productCode,SaleType,aliasName,Price)
			SELECT 
				cast(@CompanyCode as varchar(20))+''-''+dbo.SetNBit(cast(@MaxKey+RowId as varchar(10)),''0'',4),
				@MaxSerialNumber+RowId  ,
				ProductCode as CustomerProcudeCode,
				''FROMSale'' as mchCode,--mchcode 代表价格来源
				@CompanyCode,ProductCode,
				CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END AS SaleType,
				aliasName,basePrice 
			FROM (
				SELECT 
					ROW_NUMBER() OVER(Order by ProductCode) AS RowId,ProductCode,SaleType,
					(SELECT Name FROM L_Basic_Product_Tab WHERE x.ProductCode=IdCode) as aliasName, 
					Max(basePrice) as basePrice FROM (
						SELECT ProductCode,CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END AS SaleType,basePrice,salePrice FROM L_Bill_SaleOrders_Tab WHERE billnumber = @BillNumber
					) x
				WHERE  not EXISTS (
					SELECT 1 FROM L_Basic_Customer_Price_Tab WHERE ProductCode=x.ProductCode and SaleType = x.SaleType and PCode=@CompanyCode
				)--插入报价表中没的商品
				Group by ProductCode,SaleType
			) a

			IF IsNull(@QuoteBillNumber,'''')<>'''' 
			BEGIN
				SELECT @MaxKey =isnull(max(RIGHT(Idkey,4)),0),@MaxSerialNumber = count(idkey) FROM L_bill_QuotedPrices_Tab WHERE billnumber = @QuoteBillNumber
				INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,SaleType,aliasName,SerialNumber,CustomerProcudeCode,curSalePrice,salePrice,At)
				SELECT 
					@QuoteBillNumber+''-''+dbo.SetNBit(cast(@MaxKey+RowId as varchar(10)),''0'',4),
					@QuoteBillNumber,ProductCode,
					CASE WHEN SaleType = 2 Then 0 ELse SaleType END AS SaleType,
					aliasName,
					@MaxSerialNumber+RowId ,
					ProductCode as CustomerProcudeCode,
					0 as curSalePrice,basePrice,getDate()
				FROM (
					SELECT 
						ROW_NUMBER() OVER(Order by ProductCode) AS RowId,ProductCode,SaleType,
						(SELECT Name FROM L_Basic_Product_Tab WHERE x.ProductCode=IdCode) as aliasName,
						Max(basePrice) as basePrice FROM  (
							SELECT ProductCode,CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END AS SaleType,basePrice,salePrice FROM L_Bill_SaleOrders_Tab WHERE billnumber = @BillNumber
						)  x
					WHERE  not EXISTS (
					SELECT 1 FROM L_bill_QuotedPrices_Tab WHERE ProductCode=x.ProductCode and SaleType = x.SaleType and  billnumber = @QuoteBillNumber
				)--插入报价表中没的商品
					Group by ProductCode,SaleType
				) a
			END;
		END;	
		 --以下代码更新报价
		IF @ChangeAblePrice=0 and @CompanyCode>90001
		BEGIN
			INSERT INTO L_Basic_Customer_Price_Tab_Logs (Date,CustomerCode,ProductCode,SaleType,CurSalePrice,NewSalePrice,UserCode,BillNumber,Note)
			SELECT GETDATE(),@CompanyCode,b.ProductCode,b.SaleType,a.Price,b.BasePrice,UserCode,@billNumber,''销售订单审核改变'' 
			FROM L_Basic_Customer_Price_Tab a,
				(
					SELECT ProductCode,Max(examineUserCode) as UserCode,
						 CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(basePrice) as basePrice  
					FROM L_Bill_SaleOrders_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.PCode=@CompanyCode and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType 

			update a set a.Price=b.basePrice 
				FROM L_Basic_Customer_Price_Tab a,
				(
					SELECT ProductCode,
						 CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(basePrice) as basePrice  
					FROM L_Bill_SaleOrders_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.PCode=@CompanyCode and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType

			/*update a set a.salePrice=b.salePrice 
				FROM L_bill_QuotedPrices_Tab a,
				(
					SELECT ProductCode,
						CASE WHEN SaleType = 2 Or SaleType = 4 Then 0 ELse SaleType END SaleType,
						Max(salePrice) as salePrice  
					FROM L_Bill_SaleOrders_Tab b
					WHERE billnumber=@billnumber and salePrice>0 
					Group by ProductCode,SaleType
				) b
				WHERE a.billnumber=@QuoteBillNumber and a.ProductCode=b.ProductCode and a.SaleType = b.SaleType
			*/
		END;
	END;' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pay]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Pay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[sp_Pay] 
	@BillNumber varchar(20),
	@MonthText varchar(10),
	@Money float,
	@PayType int,
	@Type int,
	@UserCode int,
	@ShipperCode int,
	@updatestyle int
as 
/* 
***************************************************
	功能：付款（只付到分）					
	参数：	
			@BillNumber :收货单号 
			@MonthText: 月份
			@Money float,金额
			@PayType int,支付方式
			@Type int,类型 0 按单 1按月
			@UserCode int,操作员
			@ShipperCode int,客户
			@updatestyle int 
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/


set nocount on
	declare @OweMoney float,
			@CurMoney float,
			@Domoney float,
			@tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@maxKey int --当前最大Ikey的后四位值
	
	if @Type = 0
		select @CurMoney=costMoney,@OweMoney = oweMoney from V_Report_PayList_Tab where BillNumber = @BillNumber
	if @Type = 1
		select @CurMoney=costMoney,@OweMoney = oweMoney from V_Report_PayList_Month_Tab where ShipperCode=@ShipperCode and MonthText = @MonthText
	
	if (ROUND(@OweMoney,2)< @Money)
	begin
		Raiserror( ''付款金额不能大于欠款'',16,1)
		return 
	end
	
	select  @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_PayMent_Tab 
			where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)
	set @thisBillNumber = ''PM''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''0'',4)

	Insert Into L_Bill_PayMent_Tab (
			BillNumber,
			ShipperCode,
			SubjectCode,
			PayTypeCode,
			ExamineAt,
			ExamineUserCode,
			Money
		) Values (
			@thisBillNumber,
			@ShipperCode,
			201,
			@PayType,
			getdate(),
			0,
			@Money
		)
	if @Type = 0
	begin	
		
		select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_PayMents_Tab where billnumber = @thisBillNumber
		Insert Into L_Bill_PayMents_Tab (
			IdKey,
			Type,
			BillNumber,
			CurBillNumber,
			CurMoney,
			OweMoney,
			Money,
			FreeMoney,
			At,
			ExamineUserCode
		) Values (
			@thisBillNumber+ +dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
			502,
			@thisBillNumber,
			@BillNumber,
			@CurMoney,
			@OweMoney,
			@Money,
			0,
			getdate(),
			0
		)
	end
	if @Type = 1
	begin --按月
		declare _Cursor cursor for 
			select BillNumber,costMoney,OweMoney from V_Report_PayList_Tab 
				where @MonthText=CONVERT(varchar(7),ExamineAt,120) and ShipperCode = @ShipperCode order by ExamineAt
		open _Cursor
		fetch next from _Cursor into @BillNumber,@CurMoney,@OweMoney
		While (@@Fetch_status=0)--游标循环开始
		Begin
		/*------------------------------*/
			if @Money >= @OweMoney
			begin
				set @Domoney = @OweMoney
			end else
			begin
				set @Domoney = @Money
			end

			select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_PayMents_Tab where billnumber = @thisBillNumber
			Insert Into L_Bill_PayMents_Tab (
				IdKey,
				Type,
				BillNumber,
				CurBillNumber,
				CurMoney,
				OweMoney,
				Money,
				FreeMoney,
				At,
				ExamineUserCode
			) Values (
				@thisBillNumber+ +dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
				501,
				@thisBillNumber,
				@BillNumber,
				@CurMoney,
				@OweMoney,
				@Domoney,
				0,
				getdate(),
				0
			)
			set @Money = @Money - @OweMoney
			
			if @Money <=0
				break
		/*------------------------------*/
		fetch next from _Cursor into  @BillNumber,@CurMoney,@OweMoney
		end --销售游标循环结束
		close   _Cursor  --关闭销售游标   
		deallocate   _Cursor--删除销售游标  
	end
   
	exec sp_Pay_Pc @thisBillnumber,@UserCode,1
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Pay_Pc]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Pay_Pc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[sp_Pay_Pc] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int,
	@inputPayTypeCode int,
	@inputNote varchar(100)
as 
/* 
***************************************************
	功能：付款						
	参数：	
			@BillNumber :订单号 
			@@updateuserid int,操作员
			@updatestyle int ,
			@payTypeCode int 支付方式
			@note 摘要
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/


set nocount on
	 if dbo.is_Rhz(Getdate())=1
	 begin
		Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
		return 
	 end
	if (Select examineUserCode from L_Bill_PayMent_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_PayMents_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能审核'',16,1)
		return 
	end
	if (Select PayTypeCode from L_Bill_PayMent_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''请指定支付方式,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_PayMents_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''此单存在无金额的付款,不能审核'',16,1)
		return
	end
	
	/*更新主表的付款金额,支付方式，摘要*/
	update a set a.Money = b.Money,a.PayTypeCode = @inputPayTypeCode,Note = @inputNote   
		from L_Bill_PayMent_Tab a,
			(Select Sum(Money) as Money From L_Bill_PayMents_Tab where BillNumber = @billnumber) b
	where a.BillNumber = @billnumber
	
	/*更新帐号的金额*/
	
	Declare @PayTypeCode int,@AccountBookCode int,@Money Float
	select @PayTypeCode = PayTypeCode,@Money = Money from L_Bill_PayMent_Tab where BillNumber=@billnumber
	select @AccountBookCode=toAccounts from l_Basic_PayType_Tab where idCode = @PayTypeCode
	Update L_Basic_Accounts_Tab set Money = Money - @Money where idCode = @AccountBookCode
	
	/*更新对应单据的已付，免付金额 如果欠款<0.01代表已完成收款*/
	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_Purchase_Tab a,(Select * from L_Bill_PayMents_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber

	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_Purchase_Tab# a,(Select * from L_Bill_PayMents_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber

	update L_Bill_Purchase_Tab 
		set Status = 5
	where BillNumber in (Select CurBillNumber from L_Bill_PayMents_Tab where BillNumber=@billnumber) and Abs(OweMoney)<=0.01	

	update L_Bill_Purchase_Tab#
		set Status = 5
	where BillNumber in (Select CurBillNumber from L_Bill_PayMents_Tab where BillNumber=@billnumber) and Abs(OweMoney)<=0.01	
	
	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_SubjectChange_Tab a,(Select * from L_Bill_PayMents_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber
	
	update L_Bill_SubjectChange_Tab 
		set Status = 2
	where BillNumber in (Select CurBillNumber from L_Bill_PayMents_Tab where BillNumber=@billnumber) and Abs(OweMoney)<=0.01	
	
	Update L_Bill_PayMent_Tab 
		set examineUserCode=@updateuserid,
			examineAt=GETDATE()
	where billnumber=@billnumber;

	update L_Bill_PayMents_Tab 
		set examineUserCode=@updateuserid,
			At=GETDATE()
	where billnumber=@billnumber
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseOrderToPurchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseOrderToPurchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_PurchaseOrderToPurchase]
    @BillNumber VARCHAR(20),
    @UserCode INT
AS
/*
***************************************************
    功能：采购订单转至采购入库单
    参数：
        @BillNumber VARCHAR(20)  - 订单号
        @UserCode INT          - 操作员
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @tempBillNumber VARCHAR(20)
DECLARE @thisBillNumber VARCHAR(20)
DECLARE @ShipperCode BIGINT
DECLARE @mchCode VARCHAR(20)
DECLARE @DeliveryAt DATE
DECLARE @MakingUserCode INT
DECLARE @maxKey INT

-- 获取采购订单信息
SELECT @ShipperCode = ShipperCode,
       @MakingUserCode = MakingUserCode,
       @mchCode = mchCode,
       @DeliveryAt = DeliveryAt
FROM L_Bill_PurchaseOrder_Tab
WHERE BillNumber = @BillNumber

-- 生成入库单号
SELECT @tempBillNumber = ISNULL(MAX(CAST(SUBSTRING(billnumber, 11, 4) AS INT)), 0) + 1
FROM L_Bill_Purchase_Tab
WHERE CONVERT(CHAR(10), makingAt, 120) = CONVERT(CHAR(10), GETDATE(), 120)

SET @thisBillNumber = ''RK'' + RIGHT(CONVERT(VARCHAR(20), GETDATE(), 112), 8) + dbo.SetNBit(@tempBillNumber, ''0'', 4)

-- 插入采购入库单主表
INSERT INTO L_Bill_Purchase_Tab
(
    BillNumber,
    mchCode,
    OrderBillNumber,
    ShipperCode,
    MakingUserCode,
    MakingAt,
    ExamineuserCode,
    ExamineAt,
    DeliveryAt,
    billType,
    Type,
    Status
)
VALUES
(
    @thisBillNumber,
    @mchCode,
    @BillNumber,
    @ShipperCode,
    @MakingUserCode,
    GETDATE(),
    0,
    GETDATE(),
    @DeliveryAt,
    0,
    1,
    0
)

-- 获取当前最大ID后四位
SELECT @maxKey = ISNULL(MAX(RIGHT(idkey, 4)), 0)
FROM L_Bill_Purchases_Tab
WHERE billnumber = @thisBillNumber

-- 插入采购入库单明细表
INSERT INTO L_Bill_Purchases_Tab
(
    IdKey,
    BillNumber,
    mchCode,
    AreaCode,
    ShipperCode,
    ProductCode,
    DownUnit,
    DownWg,
    SaleType,
    OrderNum,
    OpenNum,
    Num,
    NumEx,
    OpenCostPrice,
    CostPrice,
    salePrice,
    ExamineUserCode,
    At,
    DeliveryAt,
    BatchNumber,
    qualityGrade,
    Status
)
SELECT
    @thisBillNumber + ''-'' + dbo.SetNBit(CAST(@maxKey + ROW_NUMBER() OVER (ORDER BY IdKey) AS VARCHAR(10)), ''0'', 4),
    @thisBillNumber,
    @mchCode,
    areaCode,
    @ShipperCode,
    ProductCode,
    DownUnit,
    DownWg,
    SaleType,
    num AS OrderNum,
    NumEx,
    Num,
    NumEx,
    Costprice,
    Costprice,
    salePrice,
    0,
    GETDATE(),
    @DeliveryAt,
    BatchNumber,
    qualityGrade,
    0
FROM V_Bill_PurchaseOrders_Tab
WHERE Billnumber = @BillNumber

-- 更新销售订单中的采购入库单号
UPDATE L_Bill_PurchaseOrder_Tab
SET PurchaseBillNumber = @thisBillNumber
WHERE BillNumber = @BillNumber

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseOrderToPurchase_repeat]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseOrderToPurchase_repeat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_PurchaseOrderToPurchase_repeat] 
	@PurchaseBillNumber varchar(20),
	@PurchaseOrderBillNumber varchar(20),
	@UserCode int
as 
/* 
***************************************************
	功能：采购订单转至采购入库单(用于供应商换货)						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：

	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @ShipperCode int 
	select @ShipperCode = ShipperCode From L_Bill_Purchase_Tab where BillNumber = @PurchaseBillNumber
	delete L_Bill_Purchases_Tab where billnumber = @PurchaseBillNumber;
	 
	Insert Into L_Bill_Purchases_Tab
	(
		IdKey,
		BillNumber,
		mchCode,
		AreaCode,
		ShipperCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		OrderNum,
		Num,
		NumEx,
		CostPrice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		Status
	) 
	Select 
		@PurchaseBillNumber+''-'' +dbo.SetNBit(CAST(ROW_NUMBER() OVER(Order by IdKey) as varchar(10)),''0'',4),
		@PurchaseBillNumber,
		'''',
		areaCode,
		@ShipperCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		num as OrderNum,
		Num,
		NumEx,
		Costprice,
		salePrice,
		0,
		getdate(),
		DeliveryAt,
		0
	from V_Bill_PurchaseOrders_Tab 
		where Billnumber=@PurchaseOrderBillNumber
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PurchaseToSaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PurchaseToSaleOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec [sp_PurchaseToSaleOrder] ''RD202402030001'',1
CREATE proc [dbo].[sp_PurchaseToSaleOrder] 
	@BillNumber varchar(20),
	@UserCode int
as 
/* 
***************************************************
	功能：采购订单转至采购入库单						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：

	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @dbName varchar(100),@szCommand varchar(max)
	select @dbName = Isnull(SubBookName,'''') from L_Sys_Parmars_Tab
	if @dbName ='''' return
	set @szCommand = ''
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@ShipperCode bigint,
			@mchCode varchar(20),
			@DeliveryAt date,
			@MakingUserCode int

	Select @ShipperCode=ShipperCode,@MakingUserCode = MakingUserCode,@mchCode=mchCode,@DeliveryAt=DeliveryAt from L_Bill_PurchaseOrder_Tab where BillNumber=@@BillNumber

	select @tempBillNumber = isnull(max(SUBSTRING(billnumber,11,4)),0)+1 from [@@DBNAME].dbo.L_Bill_SaleOrder_Tab 
		where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
	set @thisBillNumber = ''''XD''''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''''0'''',4)
	Insert Into [@@DBNAME].dbo.L_Bill_SaleOrder_Tab  
	(
		BillNumber,
		CustomerCode,
		MakingUserCode,
		MakingAt,
		ExamineuserCode,
		ExamineAt,
		DeliveryAt,
		BillType,
		Type,
		Status
	) values
	(
		@thisBillNumber,
		90002,
		@MakingUserCode,--@UserCode,
		GETDATE(),
		0,
		GETDATE(),
		@DeliveryAt,
		0,
		17,
		0
	)
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0) from [@@DBNAME].dbo.L_Bill_SaleOrders_Tab  where billnumber = @thisBillNumber
	
	Insert Into [@@DBNAME].dbo.L_Bill_SaleOrders_Tab 
	(
		IdKey,
		BillNumber,
		mchCode,
		AreaCode,
		customerCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		Num,
		NumEx,
		CostPrice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		Status
	) 
	Select 
		@thisBillNumber+''''-'''' +dbo.SetNBit(CAST(@maxKey+ROW_NUMBER() OVER(Order by IdKey) as varchar(10)),''''0'''',4),
		@thisBillNumber,
		@mchCode,
		areaCode,
		90002,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		Num,
		NumEx,
		Costprice,
		Costprice,--salePrice,
		0,
		getdate(),
		DeliveryAt,
		0
	from V_Bill_PurchaseOrders_Tab 
		where Billnumber=@@BillNumber
	''
	set @szCommand = replace(@szCommand,''@@DBNAME'',@dbName)
	set @szCommand = replace(@szCommand,''@@BillNumber'',''''''''+@BillNumber+'''''''')
	--print @szCommand
	exec(@szCommand)
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_PushBack_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_PushBack_StockCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec Sp_PushBack_StockCheck ''2024-04-26''

CREATE Proc [dbo].[Sp_PushBack_StockCheck] 
	@dat smalldatetime
as
/**
回推清点存货
**/
SET NOCOUNT OFF
	DECLARE @BillNumber VARCHAR(20),@AreaCode Int,@MaxIdKey Int
	Exec Sp_Build_StockEx @dat,1
	DECLARE _Cursor CURSOR FOR 	SELECT billnumber,AreaCode FROM L_Bill_StockChange_Tab WHERE changeAt = @dat GROUP BY billnumber,AreaCode
	OPEN _Cursor
	FETCH NEXT FROM _Cursor INTO @BillNumber,@AreaCode
	WHILE (@@Fetch_status=0)--游标循环开始
	BEGIN
		SELECT @MaxIdKey = Max(RIGHT(IdKey,4)) FROM L_Bill_StockChanges_Tab WHERE billnumber = @BillNumber
		--1插入当日清点表中没有的商品
		INSERT INTO L_Bill_StockChanges_Tab (
			Idkey,AccountBookCode,AreaCode,ShipperCode,BillNumber,ProductCode,StockNum,num,costprice,changeAt, at)
		SELECT @billNumber+''-''+dbo.SetNBit(@MaxIdKey+RowId,''0'',4),1,
			AreaCode,0,@BillNumber,productCode,EndNum as StockNum,0 ,EndMoney / EndNum avgPrice,@dat,@dat  
		FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY ProductCode) AS RowId,* FROM  Reports_StockEx a
			WHERE AreaCode = @AreaCode and EndNum <>0 AND NOT EXISTS (
				SELECT 1 FROM L_Bill_StockChanges_Tab 
				WHERE billnumber=	@BillNumber and ProductCode	=a.ProductCode and AccountBookCode=a.AccountBookCode and AreaCode=a.AreaCode
			)
		) a
		--2更新原有的存货数量
		UPDATE a SET a.StockNum = ISNull(b.EndNum,0),
				a.costprice = CASE WHEN ISNull(b.EndNum,0) = 0 THEN a.costprice ELSE b.EndMoney / b.EndNum END  
		FROM L_Bill_StockChanges_Tab a, Reports_StockEx b
				WHERE billnumber=@BillNumber and b.ProductCode=a.ProductCode and b.AccountBookCode=a.AccountBookCode and b.AreaCode	=a.AreaCode

		--3 删除无改变商品
		--DELETE L_Bill_StockChanges_Tab WHERE billnumber = @BillNumber and ChangeNum = 0

		FETCH NEXT FROM _Cursor INTO @BillNumber,@AreaCode
	END --销售游标循环结束
	CLOSE   _Cursor  --关闭销售游标   
	DEALLOCATE   _Cursor--删除销售游标  
SET NOCOUNT ON

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_PushBackCheckStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_PushBackCheckStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[Sp_PushBackCheckStock]
	@Table TYPE_SalesTable READONLY
As
/** 回推清点单存量 用于销售单触发器 有问题 如果库存变成0，没有删除
	@Table表参数 {
		[IdKey] [varchar](100) Not NULL,
		[AreaCode] [Int] Not Null,
		[ProductCode] [varchar](100) Not NULL,
		[DeliveryAt] [date] Not Null
	}

**/
set NoCount On
	update x set x.stockNum = y.num From  L_Bill_StockChanges_Tab x,(
	select a.ProductCode,a.AreaCode,
		AllowedNum +IsNull((select Sum(NumEx) from L_Bill_Sales_Tab where DeliveryAt>a.DeliveryAt and AreaCode = a.AreaCode and ProductCode=a.ProductCode group by AreaCode,ProductCode),0) as num
	from @Table a left Join V_Stock b 
	on a.AreaCode = b.AreaCode and a.ProductCode = b.ProductCode) y
	where x.AreaCode = y.AreaCode and x.ProductCode = y.ProductCode
set NoCount Off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Clear]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Clear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_QuotedPrice_Clear]
@BillNumber VarChar(20)
as
/**
清空报价
**/
set noCount on
	delete from L_bill_QuotedPrices_Tab where BillNumber=@BillNumber
set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Clear_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Clear_Shipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create proc [dbo].[Sp_QuotedPrice_Clear_Shipper]
@BillNumber VarChar(20)
as
/**
清空报价
**/
set noCount on
	delete from L_Basic_Shipper_Price_Tab where PCode=@BillNumber
set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Copy]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_QuotedPrice_Copy]
    @BillNumber VARCHAR(20),
    @CurCustomerCode BIGINT AS

/*
***************************************************
    功能：复制报价
    参数：
        @BillNumber: 单号
        @CurCustomerCode: 当前客户编码
**************************************************
*/

SET NOCOUNT ON

DECLARE @CustomerCode BIGINT
DECLARE @startAt DATE
DECLARE @endAt DATE
DECLARE @Pcode INT

SELECT @CustomerCode = CustomerCode,
       @startAt = StartAt,
       @endAt = EndAt 
FROM L_Bill_QuotedPrice_Tab 
WHERE BillNumber = @BillNumber

SELECT @Pcode = Pcode 
FROM L_Basic_Company_Tab 
WHERE IdCode = @CustomerCode

IF EXISTS (
    SELECT 1 
    FROM L_bill_QuotedPrice_Tab 
    WHERE BillNumber <> @BillNumber 
      AND CustomerCode = @CustomerCode 
      AND EndAt = @endAt
)
BEGIN
    RAISERROR(''已存在相同结束日期的报价单，不能复制'', 16, 1)
    RETURN 
END

IF EXISTS (
    SELECT 1 
    FROM L_bill_QuotedPrices_Tab 
    WHERE BillNumber = @BillNumber
)
BEGIN
    RAISERROR(''已单已存在报价不能复制'', 16, 1)
    RETURN 
END

INSERT INTO L_bill_QuotedPrices_Tab (
    IdKey,
    BillNumber,
    ProductCode,
    SaleType,
    aliasName,
    SerialNumber,
    CustomerProcudeCode,
    CurSalePrice,
    salePrice,
    At,
    defaultShipperCode,
	QualityGrade,
    TenSaleNum
)
SELECT @BillNumber + ''-'' + dbo.SetNBit(rowId, ''0'', 4),
       @BillNumber,
       ProductCode,
       SaleType,
       name,
       SerialNumber,
       CustomerProcudeCode,
       Price,
       Price,
       GETDATE(),
       defaultShipperCode,
	   QualityGrade,
       ISNULL(TenSaleNum, 0) 
FROM (
    SELECT a.ProductCode,
           a.SaleType,
           name,
           Price,
           SerialNumber,
           CustomerProcudeCode,
           RowId,
           defaultShipperCode,
		   QualityGrade,
           b.TenSaleNum 
    FROM (
        SELECT ProductCode,
               SaleType,
               name,
               Price,
               SerialNumber,
               CustomerProcudeCode,
               defaultShipperCode,
			   QualityGrade,
               ROW_NUMBER() OVER (ORDER BY SerialNumber) AS RowId 
        FROM V_Customer_Price_Tab 
        WHERE Pcode = @CurCustomerCode 
          AND CateCode IS NOT NULL
    ) a 
    LEFT JOIN (
        SELECT ProductCode,
               saleType,
               SUM(numex) AS TenSaleNum 
        FROM V_Bill_Sales_Tab  
        WHERE Pcode = @Pcode 
          AND DATEDIFF(DAY, DeliveryAt, GETDATE()) <= 30 
        GROUP BY ProductCode,
                 SaleType
    ) b ON a.ProductCode = b.ProductCode 
       AND a.SaleType = b.SaleType
) a

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Copy_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Copy_Shipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[Sp_QuotedPrice_Copy_Shipper]
@ShipperCode bigInt,
@CurShipperCode bigInt
as
/**
复制报价
调入当前日期10日前的销售数量（无审核的可能不会调入，因为CustomerCode 可能为空
**/
set noCount on
	if (select count(Pcode) from L_Basic_Shipper_Price_Tab where  PCode = @ShipperCode)>0
	begin
		Raiserror( ''已存在报价数据不能调入'',16,1)
		return 
	end;
	insert into  L_Basic_Shipper_Price_Tab (IdKey,PCode,ProductCode,curPrice,Price)
	select Cast(@ShipperCode as VarChar(10))+''-''+dbo.SetNBit(rowId,''0'',4),@ShipperCode,ProductCode,Price,Price From (
		select  ProductCode,Price, ROW_NUMBER() OVER(Order by IdKey) AS RowId from L_Basic_Shipper_Price_Tab where Pcode = @CurShipperCode
	) a
set noCount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_GetNotExists]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_GetNotExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--exec Sp_QuotedPrice_GetNotExists ''''

CREATE proc [dbo].[Sp_QuotedPrice_GetNotExists]
	@where varchar(200)
as
/**
	返回导入数据品名与基本库不匹配数据(用于导入报价表)
**/
set noCount on
	declare @Json varchar(max),@CommandSql varchar(max) 
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N''[dbo].[TempImportDatax]'') AND type in (N''U''))
	DROP TABLE [dbo].[TempImportDatax]


select @Json = JsonData from Import_Data_Tab
exec Hr_Sp_parseJSON @Json,@CommandSql output
set @CommandSql = '' select * Into TempImportDatax from ( ''+ @CommandSql +'') a''
exec (@CommandSql)



select 序号 as idcode,品名 as name,规格 as spec,单位 as unit, 单价 as price from TempImportDatax a where Not EXISTS(
		select * from L_Basic_Product_Tab b where a.品名=REPLACE(REPLACE(isNull(b.Name,''''),''['',''''),'']'','''') and a.规格=REPLACE(REPLACE(isNull(spec,''''),''['',''''),'']'','''') and a.单位=b.Unit
) order by 序号


--delete TempImportDatax
--drop table TempImportDatax
set noCount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Import]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Import]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- EXEC [Sp_QuotedPrice_Import] ''QP202308220001''

CREATE proc [dbo].[Sp_QuotedPrice_Import]
	@BillNumber VarChar(20)
as
/**
	将EXcel报表数据导入到预报价单
**/

SET NOCOUNT ON
	DECLARE @ErrInf varchar(200);
	DECLARE @CustomerCode bigint,@startAt date,@ENDAt date
	SELECT @CustomerCode = CustomerCode,@startAt=StartAt,@ENDAt=ENDAt FROM L_Bill_QuotedPrice_Tab WHERE BillNumber = @billnumber

	IF (SELECT count(BillNumber) FROM L_bill_QuotedPrice_Tab WHERE  BillNumber <>@BillNumber and CustomerCode=@CustomerCode and ENDAt = @ENDAt)>0
	BEGIN
		RAISERROR( ''已存在相同结束日期的报价单，不能导入'',16,1)
		RETURN 
	END;

	/*IF (SELECT count(Idkey) FROM L_bill_QuotedPrices_Tab WHERE BillNumber=@BillNumber)>0
	BEGIN
		RAISERROR( ''已单已存在报价不能调入'',16,1)
		RETURN 
	END;*/

	DECLARE @Json varchar(max),@CommandSql varchar(max),@maxKey bigint 
	SELECT @Json = JsonData FROM Import_Data_Tab
	EXEC Hr_Sp_parseJSON @Json,@CommandSql output
	SET @CommandSql = ''SELECT * into TempImportData  FROM ( ''+ @CommandSql +'') a''
	EXEC (@CommandSql)
	
	IF (SELECT COUNT(*) FROM (SELECT 品名 as Name FROM TempImportData group by 品名,规格,单位 Having COUNT(*)>1) x)>0 
	BEGIN
		SET @ErrInf = ''品名：''+ stuff((SELECT '';''+Name FROM (SELECT 品名 as Name FROM TempImportData group by 品名,规格,单位 Having COUNT(*)>1) x for xml path('''')),1,1,'''') +'',重复，处理好再处理''
	;	RAISERROR( @ErrInf,16,1)
		RETURN 
	END
	SELECT @maxKey = isnull(max(RIGHT(Idkey,4)),0) from L_bill_QuotedPrices_Tab where billnumber = @BillNumber
	IF COL_LENGTH(''TempImportData'', ''客户别名'') IS NOT NULL
	BEGIN
		INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,CustomerProcudeCode, AliasName,SerialNumber,curSalePrice,salePrice,At,defaultShipperCode)
		SELECT @BillNumber+''-''+dbo.SETNBit(@maxKey+rowId,''0'',4),@BillNumber,idCode,selfcode,CustomerProductName, @maxKey+rowId,0,ISNULL(Price,0),getDate(),defaultShipperCode FROM (
			SELECT  idCode,name,
			CASE WHEN CustomerProductName='''' THEN Name ELSE CustomerProductName END AS CustomerProductName,
			Price,selfCode,RowId,defaultShipperCode FROM (
				SELECT top 50000 a.编码 as selfcode, b.IdCode,b.name, a.客户别名 as CustomerProductName,b.spec,
					CASE 
						 WHEN PATINDEX(''%[^0-9.]%'', a.单价) = 0 THEN a.单价
						ELSE ''0''
					END AS Price,
					ROW_NUMBER() OVER(Order by a.序号) AS RowId,0 as defaultShipperCode
				FROM TempImportData a,L_Basic_Product_Tab b WHERE b.Status=0 and 
					a.品名= REPLACE(REPLACE(isNull(b.Name,''''),''['',''''),'']'','''') and 
					a.规格=REPLACE(REPLACE(isNull(spec,''''),''['',''''),'']'','''') and 
					a.单位=b.Unit order by a.序号) x
		) a
	END
	ELSE
	BEGIN
		INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,CustomerProcudeCode, AliasName,SerialNumber,curSalePrice,salePrice,At,defaultShipperCode)
		SELECT @BillNumber+''-''+dbo.SETNBit(@maxKey+rowId,''0'',4),@BillNumber,idCode,selfcode,name, @maxKey+rowId,0,Price,getDate(),defaultShipperCode FROM (
			SELECT  idCode,name,Price,selfCode,RowId,defaultShipperCode FROM (
				SELECT top 50000 a.编码 as selfcode, b.IdCode,b.name,b.spec,
					CASE 
						 WHEN PATINDEX(''%[^0-9.]%'', a.单价) = 0 THEN a.单价
						ELSE ''0''
					END AS Price,
					ROW_NUMBER() OVER(Order by a.序号) AS RowId,0 as defaultShipperCode
				FROM TempImportData a,L_Basic_Product_Tab b WHERE b.Status=0 and 
					a.品名= REPLACE(REPLACE(isNull(b.Name,''''),''['',''''),'']'','''') and 
					a.规格=REPLACE(REPLACE(isNull(spec,''''),''['',''''),'']'','''') and 
					a.单位=b.Unit order by a.序号) x
		) a
	END

	
	update a SET a.SaleType = CASE WHEN b.SaleType=2 Or b.SaleType=3 THEN 1 ELSE b.saleType END FROM L_Bill_QuotedPrices_Tab a,L_Basic_Product_Tab b WHERE a.billnumber= @BillNumber and a.ProductCode = b.idcode
delete TempImportData
DROP TABLE TempImportData

SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Load]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Load]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_QuotedPrice_Load]
@BillNumber VarChar(20),
@CateCodeList varChar(max)
as
/**
调入商品
	@BillNumber VarChar(20),单号
	@CateCodeList varChar(max) 分类列表
**/
SET NOCOUNT ON
	declare @CustomerCode bigint,@startAt date,@ENDAt date
	SELECT @CustomerCode = CustomerCode,@startAt=StartAt,@ENDAt=ENDAt FROM L_Bill_QuotedPrice_Tab WHERE BillNumber = @billnumber

	IF (SELECT count(BillNumber) FROM L_bill_QuotedPrice_Tab WHERE  BillNumber <>@BillNumber and CustomerCode=@CustomerCode and ENDAt = @ENDAt)>0
	BEGIN
		RAISERROR( ''已存在相同结束日期的报价单，不能复制'',16,1)
		RETURN 
	END;

	IF (SELECT count(Idkey) FROM L_bill_QuotedPrices_Tab WHERE BillNumber=@BillNumber)>0
	BEGIN
		RAISERROR( ''已单已存在报价不能调入'',16,1)
		RETURN 
	END;
	INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,AliasName, SerialNumber,CustomerProcudeCode,curSalePrice,salePrice,At,SaleType)
	SELECT @BillNumber+''-''+dbo.SetNBit(rowId,''0'',5),@BillNumber,idCode,name, RowId,selfCode as CustomerProcudeCode,Price1,Price1,GETDATE(),
		CASE WHEN SaleType = 2 Or SaleType = 3 THEN 1 ELSE SaleType END  
	FROM (
		SELECT  idCode,selfCode,name,Price1,SaleType, ROW_NUMBER() OVER(Order by CateSerialNum,idcode) AS RowId FROM (
			SELECT idCode,selfCode,name,Price1,cateCode,(SELECT SerialNum FROM L_Basic_Cate_Tab WHERE idCode=a.catecode) as CateSerialNum,SaleType 
				FROM L_Basic_Product_Tab a 
				WHERE cateCode in (SELECT col FROM [dbo].[f_splitSTR](@CateCodeList,'','')) and  Status = 0
		) x
	) a

SET NOCOUNT OFF




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Load_Shipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Load_Shipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_QuotedPrice_Load_Shipper]
@ShipperCode int,
@CateCodeList varChar(max)
as
/**
调入商品
	@@ShipperCode int,货商编码
	@CateCodeList varChar(max) 分类列表
**/
set noCount on

	if (select count(Pcode) from L_Basic_Shipper_Price_Tab where  PCode = @ShipperCode)>0
	begin
		Raiserror( ''已存在报价数据不能调入'',16,1)
		return 
	end;

	insert into L_Basic_Shipper_Price_Tab (IdKey,PCode,ProductCode,curPrice,Price)
	select Cast(@ShipperCode as VarChar(10))+''-''+dbo.SetNBit(rowId,''0'',8),@ShipperCode,idCode,InPrice,InPrice From (
		select  idCode,name,InPrice, ROW_NUMBER() OVER(Order by CateSerialNum,idcode) AS RowId from (
			select idCode,name,InPrice,cateCode,(select SerialNum from L_Basic_Cate_Tab where idCode=a.catecode) as CateSerialNum 
				From L_Basic_Product_Tab a 
				where cateCode in (select col from [dbo].[f_splitSTR](@CateCodeList,'','')) and  Status = 0
		) x
	) a
set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_QuotedPrice_Merge]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_QuotedPrice_Merge]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[Sp_QuotedPrice_Merge]
@BillNumber VarChar(20),
@CurCustomerCode bigInt
as
/**
合并报价
	合并客户的报价单
**/
SET NOCOUNT ON
	DECLARE @CustomerCode bigint,@startAt date,@endAt date,@MaxID Int
	SELECT @CustomerCode = CustomerCode,@startAt=StartAt,@endAt=EndAt From L_Bill_QuotedPrice_Tab where BillNumber = @billnumber
	SELECT @MaxID = Cast(ISNULL(RIGHT(IdKey,4),0) as Int)+1 From L_Bill_QuotedPrices_Tab where BillNumber = @billnumber

	IF @CurCustomerCode = @CustomerCode
	BEGIN
		Raiserror( ''不能合并自身'',16,1)
		return 
	END;

	INSERT INTO L_bill_QuotedPrices_Tab (IdKey,BillNumber,ProductCode,SaleType,aliasName,SerialNumber,CustomerProcudeCode,CurSalePrice,salePrice,At,defaultShipperCode,TenSaleNum)
	SELECT @BillNumber+''-''+dbo.SetNBit(IsNull(@MaxID,0)+rowId,''0'',4),@BillNumber,ProductCode,SaleType,aliasName, IsNull(@MaxID,0)+rowId as SerialNumber,CustomerProcudeCode,Price,Price,getDate(),defaultShipperCode,0 From (
		SELECT ROW_NUMBER() OVER(Order by IdKey) AS RowId,ProductCode,SaleType,CustomerProcudeCode,aliasName,Price,SerialNumber,defaultShipperCode,Note
		From L_Basic_Customer_Price_Tab x
		WHERE Pcode = @CurCustomerCode AND  NOT EXISTS (
			SELECT 1 FROM L_bill_QuotedPrices_Tab WHERE billnumber = @BillNumber and ProductCode=x.ProductCode and SaleType = x.SaleType
		)
	) a

	DELETE L_Basic_Customer_Price_Tab WHERE PCode = @CurCustomerCode 
SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rec]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rec]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[sp_Rec] 
	@BillNumber varchar(20),
	@MonthText varchar(10),
	@Money float,
	@PayType int,
	@Type int,
	@UserCode int,
	@CustomerCode int,
	@updatestyle int
as 
/* 
***************************************************
	功能：收款(只收到分)						
	参数：	
			@BillNumber :订单号 
			@MonthText: 月份
			@Money float,金额
			@PayType int, 支付方式
			@Type int,类型 0 按单 1按月
			@UserCode int,操作员
			@CustomerCode int,客户
			@updatestyle int 
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @OweMoney float,
			@CurMoney float,
			@Domoney float,
			@tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@maxKey int --当前最大Ikey的后四位值

	if @Type = 0
		select @CurMoney=saleMoney,@OweMoney = oweMoney from V_Report_RecList_Tab where BillNumber = @BillNumber
	if @Type = 1
		select @CurMoney=saleMoney,@OweMoney = oweMoney from V_Report_RecList_Month_Tab where CustomerCode = @CustomerCode and MonthText = @MonthText
	if (round(@OweMoney,2)<@Money)
	begin
		Raiserror( ''收款金额不能大于欠款'',16,1)
		return 
	end
	
	select  @tempBillNumber=isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_Receivables_Tab 
			where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)

	set @thisBillNumber = ''PR''+RIGHT(convert(varchar(20),getdate(),112),6)+dbo.SetNBit(@tempBillNumber,''0'',4)
	Insert Into L_Bill_Receivables_Tab (
		BillNumber,
		CustomerCode,
		SubjectCode,
		PayTypeCode,
		ExamineAt,
		ExamineUserCode,
		Money
	) Values (
		@thisBillNumber,
		@CustomerCode,
		101,
		@PayType,
		getdate(),
		0,
		@Money
	)
	
	if @type = 0
	begin
		select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_Receivabless_Tab where billnumber = @thisBillNumber
		Insert Into L_Bill_Receivabless_Tab (
				IdKey,
				Type,
				BillNumber,
				CurBillNumber,
				CurMoney,
				OweMoney,
				Money,
				FreeMoney,
				At,
				ExamineUserCode
			) Values (
				@thisBillNumber+ +dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
				501,
				@thisBillNumber,
				@BillNumber,
				@CurMoney,
				@OweMoney,
				@Money,
				0,
				getdate(),
				0
			)
	end
    if @Type = 1
	begin --按月
		declare _Cursor cursor for 
			select BillNumber,Salemoney,OweMoney from V_Report_RecList_Tab 
				where @MonthText=CONVERT(varchar(7),ExamineAt,120) and CustomerCode = @CustomerCode
		open _Cursor
		fetch next from _Cursor into @BillNumber,@CurMoney,@OweMoney
		While (@@Fetch_status=0)--游标循环开始
		Begin
		/*------------------------------*/
			if @Money >= @OweMoney
			begin
				set @Domoney = @OweMoney
			end else
			begin
				set @Domoney = @Money
			end

			select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_Receivabless_Tab where billnumber = @thisBillNumber
			Insert Into L_Bill_Receivabless_Tab (
				IdKey,
				Type,
				BillNumber,
				CurBillNumber,
				CurMoney,
				OweMoney,
				Money,
				FreeMoney,
				At,
				ExamineUserCode
			) Values (
				@thisBillNumber+ +dbo.SetNBit(CAST(@maxKey as varchar(10)),''0'',4),
				501,
				@thisBillNumber,
				@BillNumber,
				@CurMoney,
				@OweMoney,
				@Domoney,
				0,
				getdate(),
				0
			)
			set @Money = @Money - @OweMoney
			
			if @Money <=0
				break
		/*------------------------------*/
		fetch next from _Cursor into  @BillNumber,@CurMoney,@OweMoney
		end --销售游标循环结束
		close   _Cursor  --关闭销售游标   
		deallocate   _Cursor--删除销售游标  
	end
    exec sp_Rec_Pc @thisBillnumber,@UserCode,1
set nocount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Rec_Pc]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rec_Pc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[sp_Rec_Pc] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int,
	@inputPayTypeCode int,
	@inputNote varchar(100)
as 
/* 
***************************************************
	功能：收款						
	参数：	
			@BillNumber :订单号 
			@@updateuserid int,操作员
			@updatestyle int,
			@payTypeCode int 支付方式
			@note 摘要
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/


set nocount on
	 if dbo.is_Rhz(Getdate())=1
	 begin
		Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
		return 
	 end
	if (Select examineUserCode from L_Bill_Receivables_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能审核'',16,1)
		return 
	end
	if (Select PayTypeCode from L_Bill_Receivables_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''请指定支付方式,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_Receivabless_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能付款'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_Receivabless_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''此单存在无金额的收款,不能付款'',16,1)
		return
	end
	
	Declare @PayTypeCode int,@AccountBookCode int,@Money Float
	/*更新主表的收款金额 ,支付方式，摘要*/
	update a set a.Money = b.Money,a.PayTypeCode = @inputPayTypeCode,Note = @inputNote   
		from L_Bill_Receivables_Tab a,
			(Select Sum(Money) as Money From L_Bill_Receivabless_Tab where BillNumber = @billnumber) b
	where a.BillNumber = @billnumber
	
	/*更新帐号的金额*/
	select @PayTypeCode = PayTypeCode,@Money = Money from L_Bill_Receivables_Tab where BillNumber=@billnumber
	select @AccountBookCode=toAccounts from l_Basic_PayType_Tab where idCode = @PayTypeCode
	Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @AccountBookCode

	/*更新对应单据的已收，免收金额 如果欠款<0.001代表已完成收款*/
	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_Sale_Tab a,(Select * from L_Bill_Receivabless_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber

	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_Sale_Tab# a,(Select * from L_Bill_Receivabless_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber
	
	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_StoreExChange_Tab a,(Select * from L_Bill_Receivabless_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber
	
	update a set a.AlreadyMoney = a.AlreadyMoney+b.Money,
		a.FreeMoney = a.FreeMoney + b.FreeMoney
	From L_Bill_SubjectChange_Tab a,(Select * from L_Bill_Receivabless_Tab where BillNumber=@billnumber) b
	where a.BillNumber = b.CurBillNumber
	
	
	update L_Bill_Sale_Tab 
		set Status = 2
	where BillNumber in (Select CurBillNumber from L_Bill_Receivabless_Tab where BillNumber=@billnumber) and Abs(oweMoney)<=0.01	
	
	update L_Bill_Sale_Tab# 
		set Status = 2
	where BillNumber in (Select CurBillNumber from L_Bill_Receivabless_Tab where BillNumber=@billnumber) and Abs(oweMoney)<=0.01	
	

	update L_Bill_StoreExChange_Tab 
		set Status = 2
	where BillNumber in (Select CurBillNumber from L_Bill_Receivabless_Tab where BillNumber=@billnumber) and Abs(OweMoney)<=0.01	
	
	update L_Bill_SubjectChange_Tab 
		set Status = 2
	where BillNumber in (Select CurBillNumber from L_Bill_Receivabless_Tab where BillNumber=@billnumber) and Abs(OweMoney)<=0.01	
	
	
	Update L_Bill_Receivables_Tab 
		set examineUserCode=@updateuserid,
			examineAt=GETDATE()
	where billnumber=@billnumber;

	update L_Bill_Receivabless_Tab 
		set examineUserCode=@updateuserid,
			At=GETDATE()
	where billnumber=@billnumber
set nocount off




' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SaleOrder_Temp_Clear]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SaleOrder_Temp_Clear]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[Sp_SaleOrder_Temp_Clear] @UserCode int as

/***
清空订单临时数据
	@UserCode int 操作员
*/
set NoCount on
	delete L_Bill_SaleOrders_Add_Tab Where UserCode = @UserCode
set NoCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderAddToSaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderAddToSaleOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_SaleOrderAddToSaleOrder]
	@SaleOrderBillNumber varchar(20),
	@CustomerCode Bigint, 
	@DeliveryAt date,
	@UserCode int
as 
/* 
***************************************************
	功能：客户加单转客户订单						
	参数：	
			@SaleOrdedrBillNumber: 订单号
			@CustomerCode 客户编码
			@DeliveryAt	:送货日期      
			@UserCode :操作员  
	结果：
	作者：2022-10-15  张建明
**************************************************
*/
set nocount on
	declare 
			@type int,
			@DisType int,--配送方式
			@Note varchar(50),--备注
			@Money Float --金额

		set @Money = 0
		
		Insert Into L_Bill_SaleOrder_Tab 
		(
			BillNumber,
			DeliveryAt,
			CustomerCode,
			MakingUserCode,
			MakingAt,
			ExamineuserCode,
			ExamineAt,
			BillType,
			Type,
			DisType,
			Status,
			Note
		) values
		(
			@SaleOrderBillNumber,
			@DeliveryAt,
			@CustomerCode,
			@UserCode,
			GETDATE(),
			0,
			GETDATE(),
			17,
			0,
			0,
			0,
			''''
		)
	
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0)+1 from L_Bill_SaleOrders_Tab where billnumber = @SaleOrderBillNumber
             
	Insert Into L_Bill_SaleOrders_Tab
	(
		IdKey,
		BillNumber,
		AreaCode,
		CustomerCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		downUnitType,
		Num,
		NumEx,
		replaceNumEx,
		CostPrice,
		cursaleprice,
		basePrice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		Status,
		Note
	) 
	Select 
		@SaleOrderBillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		@SaleOrderBillNumber,
		areaCode,
		@CustomerCode,
		ProductCode,
		DownUnit,
		DownWg,
		SaleType,
		downUnitType,
		Num,
		NumEx,
		replaceNumEx,
		Costprice,
		curSalePrice,
		basePrice,
		salePrice,0,getdate(),
		@DeliveryAt,
		0, 
		Note
	from (
		select 
			ROW_NUMBER() OVER(Order by IdKey) AS RowId,
			AreaCode,
			ProductCode,
			num,
			NumEx,
			replaceNumEx,
			Costprice,
			curSalePrice,
			basePrice,
			salePrice,
			SaleType,
			downUnitType,
			DownUnit,
			DownWg,
			Note
		From L_Bill_SaleOrders_Add_Tab x
		where UserCode=@UserCode
	) a 
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToPurchaseTemp]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToPurchaseTemp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_SaleOrderToPurchaseTemp] 
	@ProductCode varchar(20),
	@ShipperCode Bigint,
	@num float,
	@Price float,
	@DeliveryAt date
as --作废
set nocount on
	Insert into L_Bill_PurchaseTemp_Tab (ProductCode,ShipperCode,Num,Price,At,DeliveryAt) values 
		(@ProductCode,@ShipperCode,@num,@Price,GETDATE(),@DeliveryAt)
	update L_Bill_SaleOrders_Tab set Status = 1 where ProductCode=@ProductCode and DeliveryAt = @DeliveryAt
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToPurchasOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToPurchasOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[sp_SaleOrderToPurchasOrder] 
	@BillNumber varchar(20),
	@UserCode int,
	@IdentIFying varchar(100)
as 
/* 
***************************************************
	功能：销售订单转至采购订单						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员,
			@IdentIFying 加单标识 不为空时代表加单（值为: ''加单''+convert(varchar(50),getdate(),120)）
	结果：
		更新 L_Bill_SaleOrders_Tab 表状态(status=2)已送货待收货
	作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON
	DECLARE @tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@DeliveryAt date,
			@DefaultShipperCode bigint,
			@ProductCode VarChar(20),
			@DownUnit varchar(20),
			@DownWg Float,
			@SaleType Int,
			@CostPrice Float,
			@Num Float,
			@Numex Float,
			@Note VarChar(100),
			@AcceptUserCode int
	SELECT @AcceptUserCode = Case WHEN AcceptUserCode =0 THEN @UserCode ELSE AcceptUserCode END FROM L_Sys_Parmars_Tab

	--排序一定要用欠数从大到小，不然同一张单有两个商品时会出错
	IF @IdentIFying = '''' 
		DECLARE _OrderCursor CURSOR FOR 
			SELECT DeliveryAt, defaultShipperCode,ProductCode,DownUnit,DownWg,SaleType,OweNum * DoubleNumBase,OweNumEx * DoubleNumExBase,costprice,Note
			FROM L_Bill_SaleOrders_Tab  
			WHERE BillNumber = @BillNumber and defaultShipperCode >1 and 
				defaultShipperCode in (SELECT idcode FROM V_Basic_Shipper_Tab WHERE Status=0) 
			ORDER BY  ProductCode ASC,OweNumEx DESC
	ELSE 
		DECLARE _OrderCursor CURSOR FOR 
			SELECT DeliveryAt, defaultShipperCode,ProductCode,DownUnit,DownWg,SaleType,OweNum * DoubleNumBase ,OweNumex * DoubleNumExBase,costprice,Note
			FROM L_Bill_SaleOrders_Tab  
			WHERE BillNumber = @BillNumber and DetailNote = @IdentIFying and defaultShipperCode >1 and 
				defaultShipperCode in (SELECT idcode FROM V_Basic_Shipper_Tab WHERE Status=0) 
			ORDER BY ProductCode ASC,OweNumEx DESC
	OPEN _OrderCursor
	FETCH NEXT FROM _OrderCursor INTO @DeliveryAt, @DefaultShipperCode,@ProductCode,@DownUnit,@DownWg,@SaleType,@Num,@Numex,@CostPrice,@Note
	WHILE (@@Fetch_status=0)--游标循环开始
	BEGIN
		/*------------------------------*/
		EXEC sp_AcceptOrder ''AutoAccept'',
			@ProductCode,
			@DefaultShipperCode,
			@Num,
			@NumEx,
			@CostPrice,
			@DeliveryAt,
			@AcceptUserCode,/*@usercode,--自动生成的采购员统一用“系统员",不然不同的采购员会生成不同的单号*/
			@BillNumber,
			0
		/*------------------------------*/
		FETCH NEXT FROM _OrderCursor INTO @DeliveryAt, @DefaultShipperCode,@ProductCode,@DownUnit,@DownWg,@SaleType,@Num,@Numex,@CostPrice,@Note
	END --销售游标循环结束
	CLOSE   _OrderCursor  --关闭销售游标   
	DEALLOCATE  _OrderCursor--删除销售游标 
	
SET NOCOUNT OFF


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderToSale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderToSale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--销售订单TO销售单
CREATE proc [dbo].[sp_SaleOrderToSale] 
	@BillNumber varchar(20),
	@UserCode int
as 
/* 
***************************************************
	功能：销售订单转至销售出库单						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：
		更新 L_Bill_SaleOrders_Tab 表状态(status=2)已送货待收货
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@CustomerOrderId Varchar(20),--客户订单号
			@mchCode varchar(20),
			@CustomerCode bigint,
			@DeliveryAt date,
			@type int,
			@DisType int,--配送方式
			@Note varchar(50),--备注
			@Money Float --金额

	Select @CustomerCode=CustomerCode,
		@CustomerOrderId = CustomerOrderId,
		@DeliveryAt=DeliveryAt,
		@mchCode=mchCode,
		@type = [type],
		@DisType = DisType,
		@Note   = Note,
		@Money = SaleMoney
	from L_Bill_SaleOrder_Tab 
	where BillNumber=@BillNumber
	
		set @Money = 0
		select @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_Sale_Tab 
			where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
		set @thisBillNumber = ''XS''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''0'',4)

		Insert Into L_Bill_Sale_Tab 
		(
			BillNumber,
			mchCode,
			OrderBillNumber,
			DeliveryAt,
			CustomerCode,
			CustomerOrderId,
			MakingUserCode,
			MakingAt,
			ExamineuserCode,
			ExamineAt,
			BillType,
			AlreadyMoney,
			Type,
			DisType,
			Status,
			Note
		) values
		(
			@thisBillNumber,
			@mchCode,
			@BillNumber,
			@DeliveryAt,
			@CustomerCode,
			@CustomerOrderId,
			@UserCode,
			GETDATE(),
			0,
			GETDATE(),
			3,
			@Money,
			@type,
			@DisType,
			0,
			@Note
		)
	
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0) from L_Bill_Sales_Tab where billnumber = @thisBillNumber
             
	Insert Into L_Bill_Sales_Tab
	(
		IdKey,
		OrderIdKey,
		BillNumber,
		CustomerOrderId,
		mchCode,
		AreaCode,
		CustomerCode,
		ProductCode,
		Pack,
		DownUnit,
		DownWg,
		DownUnitType,
		SaleType,
		OrderNum,
		Num,
		NumEx,
		replaceNumEx,
		ActualCostPrice,
		CostPrice,
		basePrice,
		cursaleprice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		Status,
		Note
	) 
	Select 
		@thisBillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		OrderIdKey,
		@thisBillNumber,
		@CustomerOrderId,
		@mchCode,
		areaCode,
		@CustomerCode,
		ProductCode,
		Pack,
		DownUnit,
		DownWg,
		DownUnitType,
		SaleType,
		numEx as OrderNum,
		Num,
		NumEx,
		replaceNumEx,
		CostPrice,
		Costprice,
		baseprice,
		curSalePrice,
		salePrice,0,getdate(),
		@DeliveryAt,
		1, --1待配货，--2配送完成
		Note
	from (
		select 
			ROW_NUMBER() OVER(Order by IdKey) AS RowId,
			Idkey as OrderIdKey,
			AreaCode,
			ProductCode,
			Pack,
			DownUnitType,
			num,
			NumEx,
			replaceNumEx,
			Costprice,
			baseprice,
			curSalePrice,
			salePrice,
			SaleType,
			DownUnit,
			DownWg,
			Note
		From L_Bill_SaleOrders_Tab x
		where Billnumber=@BillNumber
	) a 
	Where not EXISTS (Select 1 from L_Bill_Sales_Tab where billnumber=@thisBillNumber and ProductCode=a.ProductCode) 
	
	
	/* 增加 分行数据
	Insert Into L_Bill_Sales_view_Tab
	(
		IdKey,
		OrderIdKey,
		BillNumber,
		mchCode,
		CustomerCode,
		ProductCode,
		OrderNum,
		Num,
		NumList,
		CostPrice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		Status
	) 
	Select 
		@thisBillNumber+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		OrderIdKey,
		@thisBillNumber,
		@mchCode,
		@CustomerCode,
		ProductCode,
		num,
		num,
		NumList,
		Costprice,
		salePrice,0,getdate(),
		@DeliveryAt,1 --1待配货，--2配送完成
	from (
		select 
			ROW_NUMBER() OVER(Order by x.IdKey) AS RowId,
			x.Idkey as OrderIdKey,
			ProductCode,
			b.col as num,
			NumList,
			Costprice,
			salePrice
		From L_Bill_SaleOrders_Tab x OUTER APPLY
		(select * from dbo.f_splitSTRandKey(x.numlist,'','',x.idkey) where Col<>0) b
		where x.Billnumber=@BillNumber and x.Idkey = b.idkey
	) a 
	Where not EXISTS (Select 1 from L_Bill_Sales_view_Tab where billnumber=@thisBillNumber and ProductCode=a.ProductCode) 
	*/
	--更新销售订单中的送货单
	update L_Bill_SaleOrder_Tab 
		set DeliveryBillNumber = @thisBillNumber 
	where BillNumber = @BillNumber
	
set nocount off


/****** Object:  StoredProcedure [dbo].[sp_SaleOrderAddToSaleOrder]    Script Date: 2023-11-09 02:06:22 ******/
SET ANSI_NULLS ON' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaleOrderUnToSale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SaleOrderUnToSale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_SaleOrderUnToSale] 
	@BillNumber varchar(20),
	@UserCode int
as 
/* 
***************************************************
	功能：删除销售单中的订单数据（用于反签订单）						
	参数：	
			@BillNumber :订单号 
			@UserCode :操作员
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on

	declare @DeliveryBillNumber varchar(20)--送货单号

	Select @DeliveryBillNumber=DeliveryBillNumber from L_Bill_SaleOrder_Tab where BillNumber=@BillNumber
	
	update a
		set a.num=a.num-b.num,a.numEx = a.numEx - b.NumEx,a.OrderNum=a.OrderNum-b.numEx
	from L_Bill_Sales_Tab a,
		(select IdKey,ProductCode,num,numEx From L_Bill_SaleOrders_Tab where BillNumber=@BillNumber) b
	where a.Billnumber=@DeliveryBillNumber and a.OrderIdKey=b.IdKey
	
	delete L_Bill_Sales_Tab where billnumber = @DeliveryBillNumber and num=0
	if (Select COUNT(*) from L_Bill_Sales_Tab where billnumber = @DeliveryBillNumber)=0
	begin --删除对应送货单
		delete L_Bill_Sale_Tab where BillNumber=@DeliveryBillNumber
	end

set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SendOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SendOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[Sp_SendOrder] 
	@shipperCode Int,
	@deliveryAt SmallDateTime,
	@updateUserCode Int,
	@updateStyle Int
AS
/**
* 送单 审核对应的采购下单
* @parmar {number} shipperCode 供货商编码
* @parmar {date} deliveryAt 送货日期 
* @parmar {number} updateUserCode 操作人 
* @parmar {number} updateStyle 操作类型1|-1  
* @returns 
*/
SET NOCOUNT ON
	DECLARE @BillNumber VarChar(20),@ExamineUserCode Int
	DECLARE _Cursor CURSOR FOR SELECT BillNumber,ExamineUserCode FROM L_Bill_PurchaseOrder_Tab WHERE DeliveryAt = @deliveryAt AND ShipperCode = @shipperCode	
	OPEN _Cursor
	FETCH NEXT FROM _Cursor INTO @BillNumber,@ExamineUserCode
	WHILE (@@Fetch_status=0)--游标循环开始
	BEGIN
	/*------------------------------*/
		IF @updateStyle = 1 and @ExamineUserCode =0 
			EXEC sp_Upd_PurchaseOrder @BillNumber,@deliveryat,@UpdateUserCode,1
		IF @updateStyle = -1 and @ExamineUserCode <>0 
			EXEC sp_Upd_PurchaseOrder @BillNumber,@deliveryat,@UpdateUserCode,-1
	/*------------------------------*/
	FETCH NEXT FROM _Cursor INTO @BillNumber,@ExamineUserCode
	END --销售游标循环结束
	CLOSE   _Cursor  --关闭销售游标   
	DEALLOCATE   _Cursor--删除销售游标  
SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ShipperAcceptOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_ShipperAcceptOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'/*供货商按明细接单
	1.更新 供货商配货表的数量
	2.更新送货单中的下单量与结算量
	3.更新采购订单中的接单量
*/
CREATE  Proc [dbo].[Sp_ShipperAcceptOrder] 
	@IdKey varchar(100),
	@Num float,
	@NumEx Float,
	@Price Float,
	@Note varchar(100)
AS 
Set nocount on
declare @oNum Float,
		@curNum Float,
		@SaleOrderIdkey varchar(max),
		@BillNumber varchar(20),
		@ProductCode varchar(20),
		@PurchaseBillNumber varchar(20)
			
select @CurNum = num,@SaleOrderIdkey= SaleOrderIdkey from L_Bill_PurchaseOrders_Tab# where Idkey = @IdKey

if @num>@CurNum
begin
	Raiserror( ''数量不能增大，要想改变下单数量，请删除重新下单'',16,1)
	return 
end

select @BillNumber = BillNumber,@ProductCode = ProductCode from L_Bill_PurchaseOrders_Tab# where Idkey = @IdKey	
	
--1.更新供货商配货表的数量
update L_Bill_PurchaseOrders_Tab# set num = @Num,numEx=@numEx  where Idkey = @IdKey

--2.更新采采购订单中的数量
	
update a set a.Num = b.Num,a.NumEx = b.NumEx from L_Bill_PurchaseOrders_Tab a,
	(select sum(Num) as Num,sum(NumEx) as NumEx from V_Shipper_DisDetail_Tab where BillNumber=@BillNumber and ProductCode = @ProductCode) b 
where a.BillNumber = @BillNumber and a.ProductCode = @ProductCode
--3.更新采购单中的下单量与结算量
select @PurchaseBillNumber = PurchaseBillNumber from L_Bill_PurchaseOrder_Tab where BillNumber=@BillNumber
update  a set a.Num = b.NumEx,a.NumEx=a.Num 
	from L_Bill_Purchases_Tab a,
		(select sum(Num) as Num,sum(NumEx) as NumEx from V_Shipper_DisDetail_Tab where BillNumber=@BillNumber and ProductCode = @ProductCode) b 
	where  billnumber = @PurchaseBillNumber and ProductCode = @ProductCode
--4更新销售订单中的接单量
update  l_bill_saleOrders_Tab  set AcceptNum = @Num,num=@NumEx where EXISTS (
						Select 1 from dbo.f_splitSTR(@SaleOrderIdkey,'','') 
							where col=l_bill_saleOrders_Tab.Idkey
					)
/*update  l_bill_sales_Tab  set num=@NumEx where EXISTS (
						Select 1 from dbo.f_splitSTR(@SaleOrderIdkey,'','') 
							where col=l_bill_sales_Tab.OrderIdkey
					)
*/
delete L_Bill_PurchaseOrders_Tab# where num = 0
delete L_Bill_PurchaseOrders_Tab where num = 0 
set nocount off

select * from l_bill_sales_Tab' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SplitSale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_SplitSale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--select * from [v_Bill_Sales_Split_Tab]
--  delete [L_Bill_Sales_Split_Tab]

--exec Sp_SplitSale ''clear'',''XS202406060001-0001'',1,10

CREATE proc [dbo].[Sp_SplitSale]
	@Action VARCHAR(10),
	@IDKEY VARCHAR(50) = '''',
	@UserCode INT=0,
	@Num FLOAT =0
	
AS
/**
	拆单调入数据
	@Action VARCHAR(10),clear|ins|del
	@IDKEY VARCHAR(50) = '''',
	@UserCode INT=0,
	@Num FLOAT =0
**/
SET NOCOUNT ON
	IF @Action = ''clear''
	BEGIN
		DELETE [L_Bill_Sales_Split_Tab] WHERE UserCode = @UserCode
	END ELSE IF @Action = ''del'' BEGIN
		DELETE [L_Bill_Sales_Split_Tab] WHERE UserCode = @UserCode AND Idkey = @IDKEY
	END ELSE 	BEGIN
		IF dbo.is_Rhz((SELECT DeliveryAt FROM V_Bill_Sale_Tab WHERE billNumber IN (SELECT billNumber From V_Bill_Sales_Tab WHERE	idKey = @IDKEY)))=1
		BEGIN
			RAISERROR(''送货日期已汇总，不能拆分'',16,1)
			RETURN
		END 
		IF (SELECT COUNT(IdKey) FROM L_Bill_Sales_Split_Tab WHERE Idkey = @IDKEY)>0
		BEGIN
			RAISERROR(''商品已存在'',16,1)
			RETURN
		END 
		IF (SELECT AlreadyMoney FROM V_Bill_Sale_Tab WHERE billNumber IN (SELECT billNumber From V_Bill_Sales_Tab WHERE	idKey = @IDKEY))>0
		BEGIN
			RAISERROR(''单据已收款，不能拆分'',16,1)
			RETURN
		END 

		INSERT INTO [L_Bill_Sales_Split_Tab] (
			Idkey,UserCode,CustomerCode,AccountBookCode,AreaCode,billnumber,ProductCode,DownUnit,Pack,DownWg,DownUnitType,SaleType,num,numEx,ActualCostPrice,costprice,salePrice,Note
		) 
		SELECT Idkey,@UserCode,CustomerCode,AccountBookCode,AreaCode,billnumber,ProductCode,DownUnit,Pack,DownWg,DownUnitType,SaleType,@Num,@Num,ActualCostPrice,costprice,salePrice,Note FROM V_Bill_Sales_Tab
		WHERE Idkey = @IDKEY
	END;
SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_StockSplit_Copy]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_StockSplit_Copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_StockSplit_Copy]
@BillNumber VarChar(20)
as
/**
复制可拆商品
**/
set noCount on
	declare @AccountBookCode Int,@AreaCode Int
	select @AccountBookCode = AccountBookCode,@AreaCode=AreaCode From L_Bill_StockSplit_Tab where BillNumber = @billnumber
	
	insert into L_Bill_StockSplitS_Tab (IdKey,AccountBookCode,AreaCode,BillNumber,ProductCode,num,costprice,changeAt,at)
	select @BillNumber+''-''+dbo.SetNBit(rowId,''0'',4),@AccountBookCode,@AreaCode, @BillNumber,IdCode,0,inPrice,getDate(),GETDATE() From (
		SELECT ROW_NUMBER() OVER(Order by Idcode) AS RowId ,* FROM L_Basic_Product_Tab A WHERE EXISTS (select 1 from L_Basic_Product_Comb_Tab WHERE A.IdCode = PCode)
		
	) a
set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_StockSplits_Copy]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_StockSplits_Copy]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[Sp_StockSplits_Copy]
@BillNumber VarChar(20),
@ProductCode VarChar(20)
as
/**
复制可拆商品
**/
set noCount on
	declare @AccountBookCode Int,@AreaCode Int,@CostPrice Float
	select @AccountBookCode = AccountBookCode,@AreaCode=AreaCode,@CostPrice = costprice From L_Bill_StockSplits_Tab where BillNumber = @billnumber and ProductCode=@ProductCode
	
	insert into L_Bill_StockSplitS_Tabs (IdKey,AccountBookCode,AreaCode,BillNumber,ProductCode,PCode,num,costprice,changeAt,at)
	select @BillNumber+''-''+@ProductCode+''-''+dbo.SetNBit(rowId,''0'',4),@AccountBookCode,@AreaCode, @BillNumber,ProductCode,Pcode,0,@CostPrice,getDate(),GETDATE() From (
		SELECT ROW_NUMBER() OVER(Order by Idkey) AS RowId ,* from L_Basic_Product_Comb_Tab WHERE PCode = @ProductCode
	) a
set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Subject_Ins_Pay]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Subject_Ins_Pay]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Subject_Ins_Pay] 
	@Type			Int,
	@CompanyCode	BigInt,
	@SubjiectCode	int,
	@PayTypeCode	int,
	@Money			float,
	@Note			varchar(100),
	@UserCode	int as
/* 
***************************************************
	功能：增加付款单(用于调帐通用)						
	参数：	
			@Type			Int			操作类型
			@CompanyCode	BigInt,		单位编码
			@SubjiectCode	int,		科目编码(帐号 期初时)
			@PayTypeCode	int,		支付方式
			@Money			float,		金额
			@Note			varchar(100)摘要
			@UserCode	int			操作员
	结果：
		更新应收应付和帐号数据
	作者：2019-03-24  张建明
**************************************************
*/
	set nocount on
	declare @HeaderText	varchar(20),
			@BillNumber varchar(20),
			@MaxR varchar(20),
			@IdKey Varchar(100),
			@AccountBookCode Int
		select @MaxR = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_PayMent_Tab 
			where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)
		set @BillNumber = ''PM''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@maxR,''0'',4)

		Insert Into L_Bill_PayMent_Tab (
				BillNumber,
				ShipperCode,
				SubjectCode,
				PayTypeCode,
				ExamineAt,
				ExamineUserCode,
				Money,
				Note
			) Values (
				@BillNumber,
				@CompanyCode,
				@SubjiectCode,
				@PayTypeCode,
				getdate(),
				@UserCode,
				@Money,
				@Note			
			);
		select @MaxR=Isnull(max(Right(IdKey,4)),0)+1 from L_Bill_PayMents_Tab where BillNumber = @BillNumber

		set @IdKey = @BillNumber+dbo.SetNBit(@maxR,''0'',4)
		Insert Into L_Bill_PayMents_Tab (
				IdKey,
				Type,
				BillNumber,
				CurBillNumber,
				CurMoney,
				Money,
				FreeMoney,
				At,
				ExamineUserCode
			) Values (
				@Idkey,
				80001,
				@BillNumber,
				'''',
				0,
				@Money,
				0,
				getdate(),
				@UserCode
			)
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Subject_Ins_Rec]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Subject_Ins_Rec]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Subject_Ins_Rec] 
	@Type			Int,
	@CompanyCode	BigInt,
	@SubjiectCode	int,
	@PayTypeCode	int,
	@Money			float,
	@Note			varchar(100),
	@UserCode	int as
/* 
***************************************************
	功能：增加收款单(用于调帐通用)					
	参数：	
			@Type			Int			操作类型
			@CompanyCode	BigInt,		单位编码
			@SubjiectCode	int,		科目编码(帐号 期初时)
			@PayTypeCode	int,		支付方式
			@Money			float,		金额
			@Note			varchar(100)摘要
			@UserCode	int			操作员
	结果：
		更新应收应付和帐号数据
	作者：2019-03-24  张建明
**************************************************
*/
	set nocount on
	declare @HeaderText	varchar(20),
			@BillNumber varchar(20),
			@MaxR varchar(20),
			@IdKey Varchar(100),
			@AccountBookCode Int
	
	set @HeaderText = Case @Type
		when	501		then	''PR''	--一般收入
		when	502		then	''PM''	--一般支出
		when	503		then	''SQC''	--供货商期初
		when	504		then	''CQC''	--客户期初
		when	505		then	''CYS''	--预收货款
		when	506		then	''SYF''	--预支货款
		when	507		then	''SQC''	--帐号期初
		when	508		then	''SEX''	--帐号调整 数据存入收款表
		when	509		then	''STF''	--内部转帐 数据 转出放入付款表，转入放入收款表
		when	510		then	''CA''	--提现
		when	511		then	''RE''	--充值
	 end
		select @MaxR = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_Receivables_Tab 
			where convert(char(10),ExamineAt,120)=convert(char(10),getdate(),120)
		set @BillNumber = ''PR''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@maxR,''0'',4)

		Insert Into L_Bill_Receivables_Tab (
				BillNumber,
				CustomerCode,
				SubjectCode,
				PayTypeCode,
				ExamineAt,
				ExamineUserCode,
				Money,
				Note
			) Values (
				@BillNumber,
				@CompanyCode,
				@SubjiectCode,
				@PayTypeCode,
				getdate(),
				@UserCode,
				@Money,
				@Note			
			);
		select @MaxR=Isnull(max(Right(IdKey,4)),0)+1 from L_Bill_Receivabless_Tab where BillNumber = @BillNumber
		set @IdKey = @BillNumber+dbo.SetNBit(@maxR,''0'',4)
		Insert Into L_Bill_Receivabless_Tab (
				IdKey,
				Type,
				BillNumber,
				CurBillNumber,
				CurMoney,
				Money,
				FreeMoney,
				At,
				ExamineUserCode
			) Values (
				@Idkey,
				@Type,
				@BillNumber,
				'''',
				0,
				@Money,
				0,
				getdate(),
				@UserCode
			)
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SubjectChange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_SubjectChange] 
	@Type			Int,
	@UserCode	int,
	@CompanyCode	BigInt,
	@SubjiectCode	int,
	@PayTypeCode	int,
	@Money			float,
	@Note			varchar(100) as
/* 
***************************************************
	功能：审核调帐单						
	参数：	
			@Type			Int			操作类型
			@CompanyCode	BigInt,		单位编码
			@SubjiectCode	int,		科目编码(帐号 期初时)
			@PayTypeCode	int,		支付方式
			@Money			float,		金额
			@RateMoney		float,		手续费
			@Note			varchar(100)摘要
			@ComputerNumBer	varchar(10),机号	
			@UserCode	int			操作员
	结果：
		更新应收应付和帐号数据
	作者：2019-03-24  张建明
**************************************************
*/
	set nocount on
	declare @HeaderText	varchar(20),
			@BillNumber varchar(20),
			@MaxR varchar(20),
			@IdKey Varchar(100),
			@AccountBookCode Int
	
	set @HeaderText = Case @Type
		when	501		then	''PR''	--一般收入
		when	502		then	''PM''	--一般支出
		when	503		then	''SQC''	--供货商期初
		when	504		then	''CQC''	--客户期初
		when	505		then	''CYS''	--预收货款
		when	506		then	''SYF''	--预支货款
		when	507		then	''SQC''	--帐号期初
		when	508		then	''SEX''	--帐号调整 数据存入收款表
		when	509		then	''STF''	--内部转帐 数据 转出放入付款表，转入放入收款表
		when	510		then	''CA''	--提现
	 end
	
	select @MaxR = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_subjectChange_Tab 
			where convert(char(10),at,120)=convert(char(10),getdate(),120)
	set @BillNumber = @HeaderText+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@maxR,''0'',4)

	if @Type = 503 or @Type = 504 or @Type = 505 or @Type = 506 or @Type = 510
	begin
		if @Money<=0 
		begin
			Raiserror( ''金额要大于0，不能继续操作'',16,1)
			return 
		end;
		if @CompanyCode=0 
		begin
			Raiserror( ''请指定单位，不能继续操作'',16,1)
			return 
		end;
	end;
	if @Type = 501 or @Type = 505
	begin
		if @Money<=0 
		begin
			Raiserror( ''金额要大于0，不能继续操作'',16,1)
			return 
		end;
		if @SubjiectCode=0
		begin
			Raiserror( ''请指定业务类型，不能继续操作'',16,1)
			return 
		end;
		if @PayTypeCode=0
		begin
			Raiserror( ''请指定支付方式，不能继续操作'',16,1)
			return 
		end;
		Exec [sp_Subject_Ins_Rec] @Type,@CompanyCode,@SubjiectCode,@PayTypeCode,@Money,@Note,@UserCode
		select @AccountBookCode = toAccounts from l_Basic_PayType_Tab where idCode = @PayTypeCode
		Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @AccountBookCode
	end;
	if @Type = 502 or @Type = 506  or @Type = 510
	begin
		if @Money<=0 
		begin
			Raiserror( ''金额要大于0，不能继续操作'',16,1)
			return 
		end;
		if @SubjiectCode=0
		begin
			Raiserror( ''请指定科目，不能继续操作'',16,1)
			return 
		end;
		if @PayTypeCode=0
		begin
			Raiserror( ''请指定支付方式，不能继续操作'',16,1)
			return 
		end;
		Exec [sp_Subject_Ins_Pay] @Type,@CompanyCode,@SubjiectCode,@PayTypeCode,@Money,@Note,@UserCode	
		select @AccountBookCode = toAccounts from l_Basic_PayType_Tab where idCode = @PayTypeCode
		Update L_Basic_Accounts_Tab set Money = Money - @Money where idCode = @AccountBookCode
	end;
	if @Type = 503 or @Type = 504 or @Type = 505 or @Type = 506
	begin
		declare @flg int
		if  @Type = 505 or @Type = 506 
			set @flg = -1
		Else
			set @flg = 1
		Insert Into L_Bill_SubjectChange_Tab 
			(BillNumber,
				CompanyCode,
				BillType,
				[Money],
				AlreadyMoney,
				FreeMoney,
				UserCode,
				At,
				Status,
				Note
			) Values (
				@BillNumber,
				@CompanyCode,
				@Type,
				@Money*@flg,
				0,
				0,
				@UserCode,
				GETDATE(),
				1,
				@Note
			)
	end;
	if @type = 507  --帐号期初
	begin
		declare @Accounts int
		set @Accounts	 = @PayTypeCode
		if @Money<=0 
		begin
			Raiserror( ''期初金额要大于0，不能继续操作'',16,1)
			return 
		end;
		if @Accounts=0
		begin
			Raiserror( ''请指定帐号，不能继续操作'',16,1)
			return 
		end;
		if (Select initMoney From L_Basic_Accounts_Tab where idCode = @Accounts)<>0
		begin
			Raiserror( ''此帐号已期初过，不能继续操作'',16,1)
			return 
		end
		if (Select Money From L_Basic_Accounts_Tab where idCode = @Accounts)<>0
		begin
			Raiserror( ''此帐号已发生业务,不能期初,要变动金额，请用【帐号调整】功能'',16,1)
			return 
		end
		
		Update L_Basic_Accounts_Tab set initMoney = @Money where idCode = @Accounts
		Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @Accounts
	end;
	if @type = 508  --帐号调整
	begin
		set @AccountBookCode = @PayTypeCode 
		if @AccountBookCode=0
		begin
			Raiserror( ''请指定帐号，不能继续操作'',16,1)
			return 
		end;
		select @PayTypeCode = idCode From l_Basic_PayType_Tab where toAccounts = @PayTypeCode
		Exec [sp_Subject_Ins_Rec] @Type,@CompanyCode,@SubjiectCode,@PayTypeCode,@Money,@Note,@UserCode	
		Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @AccountBookCode
	end;
	
	if @type = 509  --转帐
	begin
		declare @inAccounts int,@outAccounts int,@inAccountsName varchar(50),
			@OutAccountsName Varchar(50),@InNote Varchar(500),@OutNote Varchar(500),
			@InPayTypeCode int,@outPayTypeCode int
			
		set @outAccounts = @SubjiectCode
		set @inAccounts	 = @PayTypeCode
		
		if @Money<=0 
		begin
			Raiserror( ''转帐金额要大于0，不能继续操作'',16,1)
			return 
		end;
		if @outAccounts = @inAccounts
		begin
			Raiserror( ''转入，转出帐号不能相同，不能继续操作'',16,1)
			return 
		end
		if @outAccounts * @inAccounts = 0
		begin
			Raiserror( ''请指定转入，转出帐号，不能继续操作'',16,1)
			return 
		end
		if (select Money from L_Basic_Accounts_Tab where idCode = @outAccounts)<@Money
		begin
			Raiserror( ''转出帐号余额不足，不能继续操作'',16,1)
			return 
		end;
		select @OutAccountsName = Name From L_Basic_Accounts_Tab where idCode = @outAccounts
		select @InAccountsName = Name From L_Basic_Accounts_Tab where idCode = @inAccounts
		
		select @InPayTypeCode = idCode From l_Basic_PayType_Tab where toAccounts = @inAccounts
		select @outPayTypeCode = idCode From l_Basic_PayType_Tab where toAccounts = @outAccounts
		
		set @OutNote = @OutAccountsName+''转至''+@InAccountsName
		set @InNote = @OutAccountsName+''转至''+@InAccountsName
		
		Update L_Basic_Accounts_Tab set Money = Money - @Money where idCode = @outAccounts
		Update L_Basic_Accounts_Tab set Money = Money + @Money where idCode = @inAccounts
		
		Exec [sp_Subject_Ins_Pay] @Type,0,205,@outPayTypeCode,@Money,@OutNote,@UserCode
		Exec [sp_Subject_Ins_Rec] @Type,0,105,@InPayTypeCode,@Money,@InNote,@UserCode
	end;
	
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_To_Favorite]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_To_Favorite]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_To_Favorite] 
	@CustomerCode BIGINT,
	@ProductCode BIGINT,
	@SaleType INT,
	@IsAdd BIT = 0
AS
/**
收藏商品
@customerCode :客户编码 
@productCode : 商品编码 
@saleType    : 商品类型
**/
SET NOCOUNT ON
	IF @IsAdd = 1
	BEGIN
		IF @SaleType = 4 SET @SaleType = 0
		IF (SELECT COUNT(IdKey) FROM L_Customer_Favorite_Tab WHERE Pcode = @CustomerCode AND ProductCode = @ProductCode and SaleType=@SaleType)=0
		BEGIN
			DECLARE @MaxIdKey VARCHAR(20)
			SELECT @MaxIdKey = CAST(@CustomerCode AS VARCHAR(10))+''-''+ dbo.SetNBit(ISNULL(MAX(RIGHT(IdKey,4)),0)+1,''0'',4) from L_Customer_Favorite_Tab WHERE PCode = @CustomerCode
			INSERT INTO L_Customer_Favorite_Tab (IdKey,PCode,ProductCode,SaleType) VALUES 
				(@MaxIdKey,@CustomerCode,@ProductCode,CASE WHEN @SaleType=4 THEN 0 ELSE @SaleType END)

		END
	END ELSE BEGIN
		DELETE L_Customer_Favorite_Tab WHERE PCode = @CustomerCode AND ProductCode = @ProductCode AND SaleType = @SaleType
	END;
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ToSale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ToSale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_ToSale] @DeliveryAt Date,@UserCode int
as 
/* 
***************************************************
	功能：装已配货物转至销售出库单		作废				
	参数：	
			@deliveryat :送货日期 
			@UserCode :操作员
	结果：
		更新 L_Bill_SaleOrders_Tab 表状态(status=2)已送货待收货
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	if (Select COUNT(*) from  L_Bill_SaleOrders_Tab where DeliveryAt= @DeliveryAt and examineUserCode>0)=0 
	begin
		Raiserror( ''转订单失败（没有数据)'',16,1)
		return 
	end
	
	declare @tempBillNumber varchar(20),
			@maxBillNumber varchar(20),
			@CustomerCode bigint
	
	declare _cursor cursor for select CustomerCode from 
		(select CustomerCode from L_Bill_SaleOrders_Tab where DeliveryAt= @DeliveryAt and examineUserCode>0
			group by CustomerCode
		) a
	open _cursor
	fetch next from _cursor into @CustomerCode
	While (@@Fetch_status=0)--游标循环开始
	Begin
		select @tempBillNumber = isnull(max(SUBSTRING(billnumber,15,4)),0)+1 from L_Bill_Sale_Tab 
			where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
		set @maxBillNumber = ''XS0000''+convert(varchar(20),getdate(),112)+dbo.SetNBit(@tempBillNumber,''0'',4)
		Insert Into L_Bill_Sale_Tab 
			(
				BillNumber,
				CustomerCode,
				MakingUserCode,
				MakingAt,
				ExamineuserCode,
				ExamineAt,
				BillType,
				Status
			) values
			(
				@maxBillNumber,
				@CustomerCode,
				@UserCode,
				GETDATE(),
				0,
				GETDATE(),
				3,
				0
			)
		Insert Into L_Bill_Sales_Tab
			(
				IdKey,
				BillNumber,
				CustomerCode,
				ProductCode,
				Num,
				CostPrice,
				salePrice,
				ExamineUserCode,
				At,
				Status
			) 
			Select 
				@maxBillNumber+dbo.SetNBit(CAST(RowId as varchar(4)),''0'',4),
				@maxBillNumber,
				@CustomerCode,
				ProductCode,
				DisTributionNum,
				Costprice,
				salePrice,0,getdate(),0
			from (	
				select *,ROW_NUMBER() OVER(Order by ProductCode) AS RowId from (
					select ProductCode,
						SUM(DisTributionNum) as DisTributionNum,
						min(costPrice) as Costprice,
						MIN(salePrice) as salePrice 
					from L_Bill_SaleOrders_Tab  
					where CustomerCode=@CustomerCode and 
						DeliveryAt=@DeliveryAt 
					Group by ProductCode
				) a 
			) x
			--更新订单中的送货单号与状态
			update a 
				set  DeliveryBillNumber = @maxBillNumber,
					Status = 2
			from L_Bill_SaleOrder_Tab a,
				(select billnumber from L_Bill_SaleOrders_Tab  
						where CustomerCode=@CustomerCode and DeliveryAt=@DeliveryAt and examineUserCode>0) b
			where a.BillNumber = b.billnumber
			
		fetch next from _cursor into @CustomerCode
	end --游标循环结束
	close   _cursor  --关闭游标   
	deallocate   _cursor--删除游标  
	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ToSotckCheck]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ToSotckCheck]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create proc [dbo].[sp_ToSotckCheck] 
	@UserCode int
as 
/* 
***************************************************
	功能：临时盘点转盘点表						
	参数：	
			@UserCode :操作员
	结果：

	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20)

	select @tempBillNumber = isnull(max(SUBSTRING(billnumber,11,4)),0)+1 from L_Bill_StockChange_Tab 
		where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
	set @thisBillNumber = ''SC''+RIGHT(convert(varchar(20),getdate(),112),6)+dbo.SetNBit(@tempBillNumber,''0'',4)
	
	if (select count(*) from L_stockCheck_Temp_Tab where stockNum<>checkNum)=0
	begin
		return
	end;
	Insert Into L_Bill_StockChange_Tab 
	(
		BillNumber,
		AccountBookCode,
		AreaCode,
		MakingUserCode,
		MakingAt,
		ExamineuserCode,
		ExamineAt,
		BillType,
		Status
	) values
	(
		@thisBillNumber,
		1,
		0,
		@UserCode,
		GETDATE(),
		0,
		GETDATE(),
		5,
		0
	)

	insert into L_Bill_StockChanges_Tab (
		Idkey,
		AccountBookCode,
		AreaCode,
		ShipperCode,
		BillNumber,
		ProductCode,
		StockNum,
		num,
		BatchNumber,
		costprice,
		at)
	select @thisBillNumber+''-''+dbo.SetNBit(RowId,''0'',4),
		1,
		0,
		0,
		@thisBillNumber,
		productCode,
		stockNum,
		checkNum,
		@thisBillNumber+''-''+dbo.SetNBit(RowId,''0'',4),
		avgPrice,
		GETDATE() from
		(
			select ProductCode,stockNum,checkNum,avgPrice,ROW_NUMBER() OVER(Order by ProductCode) AS RowId from L_stockCheck_Temp_Tab
		) a

	exec sp_Upd_StockChange @thisBillNumber,@UserCode,1
	truncate table L_stockCheck_Temp_Tab
set nocount off


select * from L_Bill_StockChanges_Tab' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Transfer_Cancel]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Transfer_Cancel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[Sp_Transfer_Cancel]
	@SaleOrderBillNumber varchar(20),
	@PurchaseOrderIdkey  varchar(100),
	@SaleOrderIdkey varchar(100),
	@ProdcutCode varchar(20),
	@CancelNum float,
	@CancelNumEx float
as
/* 
***************************************************
	功能：取消单个商品						
	参数：	
			@SaleOrderBillNumber :销售订单号 
			@PurchaseOrderIdkey 采购订单IDKEY
			@SaleOrderIdkey :销售订单IDKEY
			@prodcutcode：商品号
			@cancelNum 取消数量
			@CancelNumEx 取消数量
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON
	--①删除已接单数据
		DELETE L_Bill_PurchaseOrders_Tab# where Idkey = @PurchaseOrderIdkey
	--②执行取消逻辑
		EXEC sp_CancelProduct @SaleOrderBillNumber,@SaleOrderIdkey,@prodcutCode,@CancelNum,@CancelNumEx
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Transfer_Free]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_Transfer_Free]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[Sp_Transfer_Free]
	@PurchaseOrderIdkey varchar(20),
	@SaleOrderIdkey varchar(20),
	@FreeNum float,
	@FreeNumEx Float,
	@SaleOrderList Varchar(4000)
as
/* 
***************************************************
	功能：换商品						
	参数：	
			@PurchaseOrderIdkey 采购订单中的IDKEY,
			@SaleOrderIdkey 销售订单中的IDKEY
			@FreeNum  数量,
			@FreeNumEx 数量,
			@SaleOrderList 销售单号列表可以多个以，号分隔
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON
	
	--①删除已接单数据
		DELETE L_Bill_PurchaseOrders_Tab# where Idkey = @PurchaseOrderIdkey
	--②执行免采逻辑
		DECLARE @ProductCode VarChar(20),@DeliveryAt SmallDateTime
		SELECT @ProductCode = ProductCode,@DeliveryAt=DeliveryAt From L_Bill_SaleOrders_Tab Where Idkey = @SaleOrderIdkey
		EXEC [Sp_FreePurchase] @ProductCode,@FreeNum,@FreeNumEx,@DeliveryAt,@SaleOrderList
SET NOCOUNT OFF

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferPCate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferPCate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create proc [dbo].[sp_TransferPCate] 
	@TargetPCateCode bigint,
	@SoureceCateCode bigint
as
/**
	二级分类转移到其它一级分类
	@TargetPCateCode bigint, 目标一级分类码
	@SoureceCateCode bigint 原二级分类码
**/
set noCount on
	Declare @MaxidCode bigint
	select @MaxidCode =ISNull(Max(IdCode),@TargetPCateCode*100)+1 from L_Basic_Cate_Tab where PCode = @TargetPCateCode
	Update L_Basic_Cate_Tab set PCode = @TargetPCateCode ,idCode = @MaxidCode where idCode = @SoureceCateCode
	Update L_Basic_Product_Tab set CateCode = @MaxidCode where CateCode = @SoureceCateCode
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferQualityGrade]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferQualityGrade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_TransferQualityGrade] 
	@PurchaseOrderBillNumber Varchar(20),
	@SaleOrderBillNumber Varchar(20),
	@ProductCode varchar(20),
	@PurchaseOrderIdKey VarChar(20),
	@SaleOrderIdKey VarChar(20),
	@Num Float,
	@NumEx Float,
	@InPrice float,
	@UserCode int,
	@QualityGrad Int
as
/**
	转质量
	@BillNumber Varchar(20),采购单号
	@ProductCode varchar(20),商品号
	@SaleType int,商品类型
	@TargetShipperCode bigint,目标货商
	@DeliveryAt date,送货日期
	@InPrice float,单价
	@UserCode int 操作人
**/
set noCount on
	
	IF (select ExamineUserCode from L_Bill_PurchaseOrder_Tab where BillNumber = @PurchaseOrderBillNumber)>0
	BEGIN
		Raiserror( ''对应采购订单已审核，不能转移'',16,1)
		return 
	END 
	DECLARE @DeliveryAt date
	DECLARE @BatchNumber VARCHAR(50)
	DECLARE @SaleBillNumber VARCHAR(20)
	DECLARE @SaleIdKey VARCHAR(20)
	DECLARE @TargetShipperCode INT

	SELECT @DeliveryAt = DeliveryAt,@TargetShipperCode = ShipperCode FROM L_Bill_PurchaseOrders_Tab# WHERE SaleOrderIdkey = @SaleOrderIdKey
	
	UPDATE L_Bill_SaleOrders_Tab SET QualityGrade = @QualityGrad WHERE Idkey = @SaleOrderIdKey

	DELETE L_Bill_PurchaseOrders_Tab# WHERE IDKEY = @PurchaseOrderIdKey
	
	EXEC sp_AcceptOrder 
			''AutoAccept'' ,
			@ProductCode,
			@TargetShipperCode,
			@num,
			@numEx,
			@InPrice,
			@DeliveryAt,
			@usercode,
			@SaleOrderBillNumber,
			0
	
	
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[sp_TransferShipper] 
	@BillNumber VARCHAR(20),
	@ProductCode VARCHAR(20),
	@SaleType INT,
	@TargetShipperCode BIGINT,
	@DeliveryAt DATE,
	@InPrice FLOAT,
	@UserCode INT
AS
/**
	采购订单转供货商
	@BillNumber Varchar(20),采购单号
	@ProductCode varchar(20),商品号
	@SaleType int,商品类型
	@TargetShipperCode bigint,目标货商
	@DeliveryAt date,送货日期
	@InPrice float,单价
	@UserCode int 操作人
**/
SET NOCOUNT ON
	
	DECLARE 
			@SaleOrderIdKey VARCHAR(50),
			@num FLOAT,
			@numEx FLOAT,
			@OrderList VARCHAR(4000),
			@free INT

	DECLARE @TempList TABLE(
		[SaleOrderIdKey] [varchar](50) NOT NULL,
		[SaleOrderBillNumber] [varchar](50) NOT NULL,
		[CustomerCode] [Int] Not Null,
		[num] [float] NOT NULL,
		[numEx] [float] NOT NULL
	)
	IF (SELECT ExamineUserCode from L_Bill_PurchaseOrder_Tab where BillNumber = @BillNumber)>0
	BEGIN
		RAISERROR( ''对应采购订单已审核，不能转移'',16,1)
		RETURN 
	END 
	IF (SELECT ShipperCode FROM L_Bill_PurchaseOrder_Tab WHERE BillNumber = @BillNumber)=@TargetShipperCode
	BEGIN
		RAISERROR( ''目标供货商不能与原供货商相同，不能转移'',16,1)
		RETURN 
	END; 
	INSERT INTO @TempList 
		SELECT SaleOrderIdKey,SaleOrderBillNumber,CustomerCode,Num,NumEx FROM V_Bill_Purchases_Detail_Tab WHERE  BillNumber = @BillNumber and ProductCode = @ProductCode and SaleType = @SaleType 
	IF (SELECT Count(*) FROM @TempList WHERE CustomerCode = 0)>0
	BEGIN
		RAISERROR( ''转移的商品存在备用存货，不能转移'',16,1)
		RETURN 
	END;
	IF (SELECT ExamineUserCode FROM L_Bill_PurchaseOrder_Tab WHERE BillNumber = @BillNumber)>0
	BEGIN
		RAISERROR( ''对应采购订单已审核，不能转移'',16,1)
		RETURN 
	END; 

	--换货商时更新全局
	IF (SELECT swapShipperToAll from L_Sys_Parmars_Tab) =1
	BEGIN
		UPDATE L_Basic_Product_Tab SET ShipperCode = @TargetShipperCode WHERE IdCode = @ProductCode
		UPDATE L_Bill_QuotedPrices_Tab SET defaultShipperCode = @TargetShipperCode WHERE ProductCode = @ProductCode
		UPDATE L_Basic_Customer_Price_Tab SET defaultShipperCode = @TargetShipperCode WHERE ProductCode = @ProductCode
	END

	DECLARE _OrderCursor cursor for SELECT SaleOrderIdKey,SaleOrderBillNumber,Num,NumEx FROM @TempList 
	OPEN _OrderCursor
	FETCH NEXT FROM _OrderCursor INTO @SaleOrderIdKey,@OrderList,@Num,@NumEx
	WHILE (@@Fetch_status=0)--游标循环开始
	BEGIN
	/*------------------------------*/
		DELETE L_Bill_PurchaseOrders_Tab# WHERE SaleOrderIdkey = @SaleOrderIdKey  -- BillNumber = @BillNumber and ProductCode = @ProductCode and SaleType = @SaleType
		EXEC sp_AcceptOrder 
			''AutoAccept'' ,
			@ProductCode,
			@TargetShipperCode,
			@num,
			@numEx,
			@InPrice,
			@DeliveryAt,
			@usercode,
			@OrderList,
			0
	/*------------------------------*/
	FETCH NEXT FROM _OrderCursor into @SaleOrderIdKey,@OrderList,@Num,@NumEx
	END --销售游标循环结束
	CLOSE   _OrderCursor  --关闭销售游标   
	DEALLOCATE   _OrderCursor--删除销售游标 
	
	
	
SET NOCOUNT OFF' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_Ex]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_Ex]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- Exec sp_TransferShipper_Ex ''RD202404010001,RD202404010002'',13714,2,3,1
-- Exec sp_TransferShipper ''RD202404010001'',13714,0,2,''2024-04-01'',3,1
-- select * from L_Bill_SaleOrders_Tab where billnumber=''RD202404010002''
CREATE proc [dbo].[sp_TransferShipper_Ex] 
	@BillNumberList Varchar(Max),
	@ProductCode varchar(20),
	@TargetShipperCode bigint,
	@InPrice float,
	@UserCode int
as
/**
	采购订单转供货商
	@BillNumber Varchar(20),采购单号
	@ProductCode varchar(20),商品号
	@SaleType int,商品类型
	@TargetShipperCode bigint,目标货商
	@DeliveryAt date,送货日期
	@InPrice float,单价
	@UserCode int 操作人
**/
set noCount on
	Declare @BillNumber VarChar(20),@SaleType int,@DeliveryAt date
	IF (SELECT ShipperCode FROM L_Bill_PurchaseOrder_Tab WHERE BillNumber = @BillNumber)=@TargetShipperCode
	BEGIN
		RAISERROR( ''目标供货商不能与原供货商相同，不能转移'',16,1)
		RETURN 
	END; 
	declare __OrderCursor cursor for Select col from dbo.f_splitSTR(@BillNumberList,'','')
	open __OrderCursor
	fetch next from __OrderCursor into @BillNumber
	While (@@Fetch_status=0)--游标循环开始
	Begin
	/*------------------------------*/
		SELECT @SaleType = SaleType,@DeliveryAt = DeliveryAt From L_Bill_PurchaseOrders_Tab where BillNumber= @BillNumber and ProductCode = @ProductCode
		Exec sp_TransferShipper 
			@BillNumber,
			@ProductCode,
			@SaleType,
			@TargetShipperCode,
			@DeliveryAt,
			@InPrice,
			@UserCode
	/*------------------------------*/
	fetch next from __OrderCursor into @BillNumber
	end --销售游标循环结束
	close   __OrderCursor  --关闭销售游标   
	deallocate   __OrderCursor--删除销售游标 
	
	
	
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_QualityGrade]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_QualityGrade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_TransferShipper_QualityGrade] 
	@PurchaseOrderBillNumber Varchar(20),
	@SaleOrderBillNumber Varchar(20),
	@ProductCode varchar(20),
	@PurchaseOrderIdKey VarChar(20),
	@SaleOrderIdKey VarChar(20),
	@TargetShipperCode bigint,
	@Num Float,
	@NumEx Float,
	@InPrice float,
	@UserCode int
as
/**
	转质量
	@BillNumber Varchar(20),采购单号
	@ProductCode varchar(20),商品号
	@SaleType int,商品类型
	@TargetShipperCode bigint,目标货商
	@DeliveryAt date,送货日期
	@InPrice float,单价
	@UserCode int 操作人
**/
set noCount on
	
	IF (select ExamineUserCode from L_Bill_PurchaseOrder_Tab where BillNumber = @PurchaseOrderBillNumber)>0
	BEGIN
		Raiserror( ''对应采购订单已审核，不能转移'',16,1)
		return 
	END 
	DECLARE @DeliveryAt date
	DECLARE @BatchNumber VARCHAR(50)
	DECLARE @SaleBillNumber VARCHAR(20)
	DECLARE @SaleIdKey VARCHAR(20)

	SELECT @DeliveryAt = DeliveryAt,@TargetShipperCode = ShipperCode, @BatchNumber = BatchNumber FROM L_Bill_PurchaseOrders_Tab# WHERE SaleOrderIdkey = @SaleOrderIdKey
	

	
	DELETE L_Bill_PurchaseOrders_Tab# WHERE IDKEY = @PurchaseOrderIdKey
	
	EXEC sp_AcceptOrder 
			''AutoAccept'' ,
			@ProductCode,
			@TargetShipperCode,
			@num,
			@numEx,
			@InPrice,
			@DeliveryAt,
			@usercode,
			@SaleOrderBillNumber,
			0
	
	
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TransferShipper_single]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TransferShipper_single]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_TransferShipper_single] 
	@PurchaseOrderBillNumber Varchar(20),
	@SaleOrderBillNumber Varchar(20),
	@ProductCode varchar(20),
	@PurchaseOrderIdKey VarChar(20),
	@SaleOrderIdKey VarChar(20),
	@TargetShipperCode bigint,
	@Num Float,
	@NumEx Float,
	@InPrice float,
	@UserCode int
as
/**
	采购订单转供货商(单商品，备用存货不能转)
	@BillNumber Varchar(20),采购单号
	@ProductCode varchar(20),商品号
	@SaleType int,商品类型
	@TargetShipperCode bigint,目标货商
	@DeliveryAt date,送货日期
	@InPrice float,单价
	@UserCode int 操作人
**/
set noCount on
	
	IF (select ExamineUserCode from L_Bill_PurchaseOrder_Tab where BillNumber = @PurchaseOrderBillNumber)>0
	BEGIN
		Raiserror( ''对应采购订单已审核，不能转移'',16,1)
		return 
	END 
	DECLARE @DeliveryAt date
	DECLARE @BatchNumber VARCHAR(50)
	DECLARE @SaleBillNumber VARCHAR(20)
	DECLARE @SaleIdKey VARCHAR(20)

	SELECT @DeliveryAt = DeliveryAt,@BatchNumber = BatchNumber FROM L_Bill_PurchaseOrders_Tab# WHERE SaleOrderIdkey = @SaleOrderIdKey
	SELECT @SaleBillNumber = DeliveryBillNumber FROM L_Bill_SaleOrder_Tab WHERE BillNumber = @SaleOrderBillNumber
	SELECT @SaleIdKey = Idkey FROM L_Bill_Sales_Tab WHERE BillNumber = @SaleOrderBillNumber AND OrderIdKey = @SaleOrderIdKey


	IF (SELECT SUM(Numex) FROM L_Bill_PurchaseOrders_Tab# WHERE Idkey = @PurchaseOrderIdKey)=@NumEx
	BEGIN
		DELETE L_Bill_PurchaseOrders_Tab# WHERE IDKEY = @PurchaseOrderIdKey
		DELETE l_bill_sales_tabs WHERE SaleIdkey = @SaleIdKey AND BatchNumber = @BatchNumber
	END ELSE BEGIN
		UPDATE L_Bill_PurchaseOrders_Tab# Set Num = Num - @Num,NumEx = NumEx - @NumEx WHERE IDKEY = @PurchaseOrderIdKey
		UPDATE l_bill_sales_tabs SET Num = Num - @Num,NumEx = NumEx - @NumEx WHERE SaleIdkey = @SaleIdKey AND BatchNumber = @BatchNumber
		
	END
	

	EXEC sp_AcceptOrder 
			''AutoAccept'' ,
			@ProductCode,
			@TargetShipperCode,
			@num,
			@numEx,
			@InPrice,
			@DeliveryAt,
			@usercode,
			@SaleOrderBillNumber,
			0
	
	
set noCount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_TransferStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_TransferStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[Sp_TransferStock]
	@ThisIdKey VarChar(50),
	@BillNumber VarChar(20),
	@ProductCode VarChar(20),
	@SaleType int,
	@TransferNum Float,
	@TransferNumEx Float,
	@ToB bit
AS
/**
	采购下单单个商品转到备用存货
**/
BEGIN
	SET NOCOUNT ON

	DECLARE @CurNum Float
	DECLARE @CurNumEx Float
	DECLARE @DiffNum Float
	DECLARE @DiffNumEx Float
	DECLARE @SaleOrderBillNumber VarChar(50)
	DECLARE @SaleOrderIdKey VarChar(50)
	DECLARE @tempmaxIdkey int
	DECLARE @MaxIdkey VarChar(50)
	DECLARE @ThisStockIdKey Varchar(50)
	DECLARE @StockCount int
	DECLARE @BatchNumber VARCHAR(50)
	DECLARE @SaleBillNumber VARCHAR(20)

	SELECT 
		@SaleOrderBillNumber = SaleOrderBillNumber,
		@SaleOrderIdKey= SaleOrderIdKey, 
		@CurNum = Num,
		@CurNumEx = NumEx,
		@BatchNumber = BatchNumber
	FROM L_Bill_PurchaseOrders_Tab# 
	WHERE Idkey = @ThisIdKey

	--送货单号
	SELECT @SaleBillNumber = DeliveryBillNumber 
	FROM L_Bill_SaleOrder_Tab 
	WHERE BillNumber = @SaleOrderBillNumber

	SET @DiffNum = @CurNum - @TransferNum 
	SET @DiffNumEx = @CurNumEx - @TransferNumEx 

	IF @ToB = 0 AND (@TransferNum > @CurNum OR @TransferNumEx > @CurNumEx)
	BEGIN
		RAISERROR(''转存数量不能大于原数量'', 16, 1)
		RETURN 
	END;

	-- 禁用所有触发器
	ALTER TABLE [dbo].[l_bill_sales_tab] DISABLE TRIGGER ALL

	--①将剩余部分保留 更新JumpUpdateTrigger为跳出更新触发器
	IF @ToB =0 
	BEGIN
		UPDATE L_Bill_SaleOrders_Tab 
		SET AcceptNum = @DiffNum, 
			AcceptNumEx = @DiffNumEx, 
			AcceptStatus = 0 
		WHERE Idkey = @SaleOrderIdKey;

		UPDATE L_Bill_PurchaseOrders_Tab# 
		SET JumpUpdateTrigger = 1, 
			num = @DiffNum, 
			NumEx = @DiffNumEx 
		WHERE Idkey = @ThisIdKey
	END

	-----------------------------------------------------------------------------------------------

	--②转存部分
	SELECT @StockCount = COUNT(billnumber) 
	FROM L_Bill_PurchaseOrders_Tab# 
	WHERE BillNumber = @BillNumber 
		AND ProductCode = @ProductCode 
		AND SaleType = @SaleType 
		AND customerCode = 0 
		AND BatchNumber = @BatchNumber

	IF @StockCount = 0
	BEGIN
		SELECT @tempmaxIdkey = ISNULL(MAX(RIGHT(Idkey, 4)), 0) + 1 
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE billnumber = @BillNumber

		SET @maxIdkey = @BillNumber + ''-'' + dbo.SetNBit(@tempmaxIdkey, ''0'', 4)

		INSERT INTO L_Bill_PurchaseOrders_Tab# 
		(
			Idkey, 
			BillNumber, 
			DeliveryAt, 
			SaleOrderBillNumber, 
			SaleOrderIdkey, 
			CustomerCode, 
			ProductCode,
			DownUnit, 
			DownWg, 
			SaleType, 
			num, 
			NumEx, 
			CostPrice,
			BatchNumber, 
			Note
		) 
		SELECT 
			@maxIdkey,
			@BillNumber,
			DeliveryAt,
			'''' AS SaleOrderBillNumber,
			BatchNumber,
			'''' AS SaleOrderIdkey,
			0 AS CustomerCode,
			ProductCode,
			DownUnit,
			DownWg,
			SaleType,
			@TransferNum,
			@TransferNumEx,
			CostPrice,
			'''' AS Note  
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE Idkey = @ThisIdKey
	END 
	ELSE 
	BEGIN
		SELECT TOP 1 @ThisStockIdKey = IdKey 
		FROM L_Bill_PurchaseOrders_Tab# 
		WHERE BillNumber = @BillNumber 
			AND ProductCode = @ProductCode 
			AND SaleType = @SaleType 
			AND customerCode = 0

		UPDATE L_Bill_PurchaseOrders_Tab# 
		SET JumpUpdateTrigger = 1, 
			num = num + @TransferNum, 
			NumEx = NumEx + @TransferNumEx 
		WHERE Idkey = @ThisStockIdKey
	END;

	--EXEC EnabledTrigger ''L_Bill_PurchaseOrders_Tab#'',''Shipper_DisDetail_Update'' --开启触发器

	IF @ToB = 0 
	BEGIN
		--③取消欠数部分
		EXEC [sp_CancelProduct] @SaleOrderBillNumber, @SaleOrderIdKey, @ProductCode, @TransferNum, @TransferNumEx

		--④删除接单量为0的行
		DELETE L_Bill_PurchaseOrders_Tab# 
		WHERE Num = 0 OR NumEx = 0

		--5修改已匹配的数据
		UPDATE l_bill_sales_tabs 
		SET num = num - @TransferNum, 
			numEx = numEx - @TransferNumEx 
		WHERE BillNumber = @SaleBillNumber 
			AND ProductCode = @ProductCode 
			AND BatchNumber = @BatchNumber
	END

	ALTER TABLE [dbo].[l_bill_sales_tab] ENABLE TRIGGER ALL

	SET NOCOUNT OFF
END;
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_AreaExChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_AreaExChange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[sp_Upd_AreaExChange] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核柜组调拨						
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on
 
  if dbo.is_Rhz(Getdate())=1
 begin
    Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
    return 
 end
 
declare	@AccountBookCode int,
		@InAreaCode int,
		@OutAreaCode int,
		@mchCode varchar(20)
		
select 
	@mchCode = mchCode,
	@AccountBookCode = AccountBookCode,
	@OutAreaCode	= OutAreaCode,
	@InAreaCode	= InAreaCode
from L_Bill_AreaExChange_Tab where billNumber = @billNumber

if @updatetype=1 
begin
	if (Select InAreaCode- OutAreaCode from L_Bill_AreaExChange_Tab where billnumber=@billnumber)=0
	begin
		Raiserror(''调出仓位与调入仓位不能相同'',16,1)
		return 
	end

	if (Select ExamineUserCode from L_Bill_AreaExChange_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能重复审核'',16,1)
		return 
	end
	if (Select AccountBookCode from L_Bill_AreaExChange_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''请指定分店'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_AreaExChanges_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_AreaExChanges_Tab where billnumber=@billnumber and Num=0)>0 
	begin
		Raiserror(''此单存在数量为0的商品,不能审核'',16,1)
		return 
	end

	Update L_Bill_AreaExChange_Tab 
		set examineUserCode=@updateuserid,
			examineAt=GETDATE(),
			Status=1 
	where billnumber=@billnumber;

	update L_Bill_AreaExChanges_Tab 
		set examineUserCode=@updateuserid,
			At=GETDATE()
	where billnumber=@billnumber

	update a set a.AccountBookCode=b.AccountBookCode
	from L_Bill_AreaExChanges_Tab a,
		(Select billnumber,AccountBookCode from L_Bill_AreaExChange_Tab where billnumber=@billnumber) b 
	where a.billnumber=b.billnumber

	if @InAreaCode<>0
	begin
		update L_Bill_AreaExChanges_Tab set InAreaCode=@InAreaCode
		where billnumber=@billnumber
	end else 
	begin
		update a set a.InAreaCode=b.AreaCode
			from L_Bill_AreaExChanges_Tab a,
				(Select IdCode,AreaCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_AreaExChanges_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	
	if @OutAreaCode<>0
	begin
		update L_Bill_AreaExChanges_Tab set OutAreaCode=@OutAreaCode
		where billnumber=@billnumber
	end else 
	begin
		update a set a.OutAreaCode=b.AreaCode
			from L_Bill_AreaExChanges_Tab a,
				(Select IdCode,AreaCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_AreaExChanges_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	
	update a set a.ShipperCode=b.ShipperCode
			from L_Bill_AreaExChanges_Tab a,
				(Select IdCode,ShipperCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_AreaExChanges_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
		
	
	
	declare @TempStockList Table(
		[Idkey] [varchar](50) NOT NULL,
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL,
		[outnum] [float] NOT NULL,
		[stocknum] [float] NOT NULL
	)
	
	declare @TempStockTabs Table(
		[AccountBookCode] [int] NOT NULL,
		[areaCode] [int] NOT NULL,
		[ProductCode] [varchar](20) NOT NULL,
		[BatchNumber] [varchar](50) NOT NULL,
		[StockNum] [float] NOT NULL,
		[CostPrice] [float] NOT NULL
	)

	insert into @TempStockList (Idkey,ProductCode,num,outnum,stocknum)
	select a.Idkey,a.ProductCode,isnull(b.num,0)-a.num as num,a.num,isnull(b.num,0) from 
	(
		select Idkey,AccountBookCode,OutAreaCode,ProductCode,abs(Num) as num from L_Bill_AreaExChanges_Tab where billnumber = @billnumber 
	) a left join 
	(
		select AccountBookCode,areaCode,ProductCode,SUM(num) as num from V_Stock_Tab group by AccountBookCode,areaCode,ProductCode
	) b on  a.AccountBookCode=b.AccountBookCode and a.OutAreaCode=b.areaCode and a.ProductCode=b.ProductCode  
				
if (Select Count(ProductCode) from @TempStockList where num<0)>0 
begin
	declare @errstr Varchar(100),@goodsinfo Varchar(100)
	Select @goodsinfo=
		''品名：''+name+char(10)+
		''规格：''+IsNull(spec,'''')+char(10)+
		''(库存数量''+CAST(stocknum as varchar(10))+'',调出数量''+CAST(outnum as varchar(10))+'')''+char(10)+char(10) from (select * from @TempStockList where num<0) a,L_Basic_Product_Tab b where a.ProductCode = b.IdCode
	Set  @Errstr = @goodsinfo+'' 库存不足，不能调拨''
	Raiserror(@Errstr,16,1)
	return 
end
	
	
	--调出数据
    insert into L_Bill_AreaExChanges_Tabs (
			IdKey,
			billnumber,
			ShipperCode,
			InAreaCode,
			OutAreaCode,
			AccountBookCode,
			AreaCode,
			ExChangeType,
			ProductCode,
			Num,
			BatchNumber,
			costprice,
			SalePrice,
			examineUserCode,
			At,
			Note)
		Select IdKey,
			billnumber,
			ShipperCode,
			InAreaCode,
			OutAreaCode,
			AccountBookCode,
			OutAreaCode as AreaCode,
			1 as ExChangeType,
			ProductCode,
			Num,
			'''' as BatchNumber,
			costprice,
			saleprice,
			@updateuserid,
			At,
			Note From L_Bill_AreaExChanges_Tab where billnumber = @billnumber
	--调入数据
	 insert into L_Bill_AreaExChanges_Tabs (
			IdKey,
			billnumber,
			ShipperCode,
			InAreaCode,
			OutAreaCode,
			AccountBookCode,
			AreaCode,
			ExChangeType,
			ProductCode,
			Num,
			BatchNumber,
			costprice,
			SalePrice,
			examineUserCode,
			At,
			Note)
	select IdKey+''-IN'',
			billnumber,
			ShipperCode,
			InAreaCode,
			OutAreaCode,
			AccountBookCode,
			InAreaCode as AreaCode,
			-1 as ExChangeType,
			ProductCode,
			Num,
			BatchNumber,
			costprice,
			SalePrice,
			examineUserCode,
			At,
			Note
	From L_Bill_AreaExChanges_Tabs where billnumber = @BillNumber
			
	--将库存表中没的商品存入
	Insert into l_stock_tab (mchCode,AccountBookCode,AreaCode,ShipperCode,ProductCode,Num,CostPrice,BatchNumber)
		Select @mchCode,AccountBookCode,AreaCode,0,a.ProductCode,0,CostPrice,'''' from 
			(
				Select AccountBookCode,
					AreaCode,
					ProductCode,
					Num,
					CostPrice
				from L_Bill_AreaExChanges_Tabs 
				where BillNumber=@billnumber
			) a
		Where not EXISTS (
					Select 1 from l_stock_tab 
						where AccountBookCode	=	a.AccountBookCode and 
							AreaCode	=	a.AreaCode		and 
							ProductCode	=	a.ProductCode
				) 

	 --更新成本单价
	update a set a.CostPrice =b.CostPrice--基本商品
	from L_Bill_StoreExChanges_Tab a,
		   (Select 
				billnumber,
				ProductCode,
				sum(Num*CostPrice)/sum(Num) as CostPrice 
			from L_Bill_AreaExChanges_Tabs 
			where billnumber=@billnumber Group by billnumber,ProductCode
	) b where a.billnumber=b.billnumber and a.ProductCode=b.ProductCode

end;



  --更新库存量
 update a 
	set a.Num= isnull(a.Num,0)-b.Num*(ExChangeType*-1)*@updatetype,
		a.LastOutNum	= b.Num,
		a.LastOutAt	= GETDATE()
 from L_Stock_Tab a,
	(
		Select AccountBookCode,
			AreaCode,
			ProductCode,
			ExChangeType,
			sum(Num) as Num 
		from L_Bill_AreaExChanges_Tabs 
		where BillNumber=@BillNumber
		Group by AccountBookCode,AreaCode,ProductCode,ExChangeType
	) b 
 where  
	a.AccountBookCode		=	b.AccountBookCode and 
	a.AreaCode		=	b.AreaCode and 
	a.ProductCode	=	b.ProductCode

if @updatetype=-1
begin
	 if (Select ExamineUserCode from L_Bill_AreaExChange_Tab where billnumber=@billnumber)=0 
	 begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	 end
	 
	if (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_AreaExChange_Tab where billnumber=@billnumber)<>0 
	 begin
		Raiserror(''只能反签当天的当据，操作失败'',16,1)
		return 
	 end 
	 
	update L_Bill_AreaExChange_Tab set examineUserCode=0,ExamineAt=GETDATE(),Status=0 where billnumber=@billnumber
	
	update L_Bill_AreaExChanges_Tab set examineUserCode=0,At=GETDATE() where billnumber=@billnumber	
	
	delete L_Bill_AreaExChanges_Tabs where BillNumber = @billnumber	 
end


set nocount off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_DisTribution]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_DisTribution]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Upd_DisTribution] 
	@idkey varchar(100),
	@InputNum decimal(18, 2),
	@InputNumEx decimal(18, 2),
	@Price decimal(18, 4),
	@UserCode int,
	@Rest bit,
	@ForceOver bit
as
/* 
***************************************************
	功能：配货审核						
	参数：	
			@idkey: 销售单中的idkey
			@Num    :数量 
			@Price ：单价,
			@UserCode:配货员
			@@Rest  重配
			@ForceOver 强制完成
	结果：
		
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	declare @productCode varchar(20),
			@SaleOrderKey varchar(100), -- 销售订单IdKey
			@DiscardWeight decimal(18, 2),--参数中舍去的重量
			@SaleNum decimal(18, 2),--结算数量
			@decimal decimal(18,2), --小数部分
			@AllowedExceedStock bit,		--允许负库存
			@OrderNumber decimal(18, 2), --订单量
			@DisTributionNum decimal(18, 2), --已配量
			@ReplaceNumEx decimal(18, 2) --已配量
		
	select @DiscardWeight = DiscardWeight,@AllowedExceedStock=AllowedExceedStock from L_Sys_Parmars_Tab
	select @productCode = ProductCode,@SaleOrderKey=OrderIdKey,@OrderNumber= NumEx,@DisTributionNum=DisTributionNum,@ReplaceNumEx=replaceNumEx from L_Bill_Sales_Tab where Idkey = @idkey
	IF @ForceOver = 1
	BEGIN
		update L_Bill_PurchaseOrders_Tab# 
		set 
				DisStatus = 2
		where SaleOrderIdkey = @SaleOrderKey 

		Update L_Bill_Sales_Tab set numEx = DisTributionNum ,
			DisTributionStatus = 2,Status = 2 where Idkey = @idkey
		return;
	END;
	IF @Rest = 1 
	BEGIN
		update L_Bill_SaleOrders_Tab 
			set DisTributionNum = 0,
				DisTributionUserCode = 0
		where Idkey = @SaleOrderKey

		update L_Bill_PurchaseOrders_Tab# 
		set 
				DisTributionNum = 0,
				DisStatus = 0
		where SaleOrderIdkey = @SaleOrderKey 

		Update L_Bill_Sales_Tab set numEx = OrderNum, DisTributionNum = 0, 
			DisTributionStatus = 0,Status = 1 ,DisTributionUserCode = 0 where Idkey = @idkey
	END;
	if (select [Status] from L_Bill_Sales_Tab where Idkey = @idkey)>=2
	begin
		Raiserror( ''商品已配货完毕，无法再配'',16,1)
		return 
	end;

	/*if (select SaleType from L_Bill_Sales_Tab where Idkey = @idkey)=2
	begin
		if (select num from L_Bill_Sales_Tab where Idkey = @idkey)<@InputNum or (select numex from L_Bill_Sales_Tab where Idkey = @idkey)<@InputNumEx
		begin
			Raiserror( ''配货数量不能大于订货数量'',16,1)
			return 
		end;
	end;
	*/
	
	set @SaleNum = @InputNumEx;
	set @decimal = @InputNumEx - cast(@InputNumEx as Int)--取小数部分
	/*如果小数部分小于等于指定舍去的重量*/
	if @decimal <= @DiscardWeight 
	begin
		set @SaleNum = cast(@InputNumEx as Int)
	end;

	if (@AllowedExceedStock=0)
	begin
		if (Select isNull(ROUND(sum(num+WaitInNum),2),0) from V_Stock where ProductCode=@productCode)<@SaleNum 
		begin
			Raiserror(''库存不足，不能配货'',16,1)
			return 
		end
	end;

	/*更新销售订单中的配货量，配货人，配货时间*/
	update L_Bill_SaleOrders_Tab 
		set DisTributionNum = IsNull(DisTributionNum,0)+@InputNumEx / PackBase / DoubleNumExBase,
			DisTributionUserCode = @UserCode,
			DisTributionAt = GETDATE()
	where Idkey = @SaleOrderKey
	/*******************************/
	/*更新L_Bill_PurchaseOrders_Tab#表中的配货状态*/
	update L_Bill_PurchaseOrders_Tab# 
		set 
			DisTributionNum = IsNull(DisTributionNum,0)+ @InputNumEx ,
			DisStatus = 1
	where SaleOrderIdkey = @SaleOrderKey 
	update L_Bill_PurchaseOrders_Tab# 
		set 
			DisStatus = 2
	where SaleOrderIdkey = @SaleOrderKey and DisTributionNum* CASE WHEN SaleType = 3 THEN DownWg ELSE 1 END >= NumEx

	update L_Bill_Sales_Tab 
			set 
				DisTributionNum = IsNull(DisTributionNum,0)+ @InputNumEx / PackBase / DoubleNumExBase,
				DisTributionUserCode = @UserCode,
				DisTributionStatus = 1,
				DisTributionAt = GETDATE(),
				salePrice = @Price
		where Idkey = @idkey
	
	update L_Bill_Sales_Tab 
			set Status = 2,
				DisTributionStatus = 2,
				NumEx = IsNull(DisTributionNum,0)
		where Idkey = @idkey and DisTributionNum >= NumEx
	/*******/
/*	IF @InputNumEx + @DisTributionNum >= @OrderNumber - @ReplaceNumEx
	BEGIN
		update L_Bill_Sales_Tab 
			set Status = 2,
				DisTributionStatus = 2,
				--Num= Num + @Num,
				NumEx = IsNull(DisTributionNum,0)+ @InputNumEx+@ReplaceNumEx,
				DisTributionNum = IsNull(DisTributionNum,0)+ @InputNumEx,
				DisTributionUserCode = @UserCode,
				DisTributionAt = GETDATE(),
				salePrice = @Price
		where Idkey = @idkey
	END ELSE BEGIN
		update L_Bill_Sales_Tab 
			set 
				DisTributionStatus = 1,
				DisTributionNum = IsNull(DisTributionNum,0)+ @InputNumEx,
				DisTributionUserCode = @UserCode,
				DisTributionAt = GETDATE()
		where Idkey = @idkey
	END;
*/	
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_PriceChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_PriceChange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create Proc [dbo].[sp_Upd_PriceChange] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核调价						
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on
 
  if dbo.is_Rhz(Getdate())=1
 begin
    Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
    return 
 end
 
declare	@AccountBookCode int,
		@AreaCode int,
		@mchCode varchar(20)
		
select 
	@mchCode = mchCode,
	@AccountBookCode = AccountBookCode
from L_Bill_PriceChange_Tab where billNumber = @billNumber

if @updatetype=1 
begin
	if (Select ExamineUserCode from L_Bill_PriceChange_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能重复审核'',16,1)
		return 
	end
	if (Select AccountBookCode from L_Bill_PriceChange_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''请指定分店'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_PriceChanges_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能审核'',16,1)
		return 
	end

	Update L_Bill_PriceChange_Tab 
		set examineUserCode=@updateuserid,
			examineAt=GETDATE(),
			Status=1 
	where billnumber=@billnumber;

	update L_Bill_PriceChanges_Tab 
		set examineUserCode=@updateuserid,
			At=GETDATE()
	where billnumber=@billnumber

	update a set a.AccountBookCode=b.AccountBookCode
	from L_Bill_PriceChanges_Tab a,
		(Select billnumber,AccountBookCode from L_Bill_PriceChange_Tab where billnumber=@billnumber) b 
	where a.billnumber=b.billnumber
end;

if @updatetype=-1
begin
	 if (Select ExamineUserCode from L_Bill_PriceChange_Tab where billnumber=@billnumber)=0 
	 begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	 end
	 
	if (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_PriceChange_Tab where billnumber=@billnumber)<>0 
	 begin
		Raiserror(''只能反签当天的当据，操作失败'',16,1)
		return 
	 end 
	 
	update L_Bill_PriceChange_Tab 
			set examineUserCode=0,
			ExamineAt=GETDATE(),
			Status=0 
	where billnumber=@billnumber
	
	update L_Bill_PriceChanges_Tab 
			set examineUserCode=0,
			At=GETDATE()
	where billnumber=@billnumber	

end


set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_Upd_Purchase]
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT,
    @updateShipper BIT
AS
/*
***************************************************
    功能：审核入帐单
    参数：
        @billnumber VARCHAR(20)  - 单号
        @updateuserid INT         - 操作员
        @updatetype INT           - 类型：1审核，-1反签
        @updateShipper BIT        - 是否更新报价单的默认供货商
    结果：更新库存
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @orderBillNumber VARCHAR(20)
DECLARE @mchCode VARCHAR(20)
DECLARE @ShipperCode INT
DECLARE @BillType INT
DECLARE @Type INT
DECLARE @UpdatePurchaseToDefaultShipper BIT
DECLARE @DeliveryAt DATE
DECLARE @CompanyCode BIGINT
DECLARE @AreaCode INT

-- 获取系统参数
SELECT @UpdatePurchaseToDefaultShipper = UpdatePurchaseToDefaultShipper
FROM L_Sys_Parmars_Tab

-- 获取采购订单信息
SELECT @orderBillNumber = OrderBillNumber,
       @mchCode = mchCode,
       @ShipperCode = ShipperCode,
       @Type = [Type],
       @BillType = billType,
       @DeliveryAt = DeliveryAt
FROM V_Bill_Purchase_Tab
WHERE BillNumber = @billnumber

-- 检查日期是否已汇总
IF dbo.is_Rhz(@DeliveryAt) = 1
BEGIN
    RAISERROR(''操作日期已汇总，不能继续操作'', 16, 1)
    RETURN
END

-- 审核流程
IF @updatetype = 1
BEGIN
    -- 检查是否已审核
    IF (SELECT ExamineUserCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) > 0
    BEGIN
        RAISERROR(''此单已入帐审核，不能重复审核'', 16, 1)
        RETURN
    END
    
    -- 检查是否有指定供货商
    IF (SELECT ShipperCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) = ''0''
    BEGIN
        RAISERROR(''此单无指定供货商，不能审核'', 16, 1)
        RETURN
    END
    
    -- 检查是否有数据
    IF (SELECT COUNT(BillNumber) FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber) = 0
    BEGIN
        RAISERROR(''此单无数据，不能审核'', 16, 1)
        RETURN
    END
    
    -- 检查是否存在数量为0的商品
    IF (SELECT COUNT(BillNumber) FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber AND numex = 0) > 0
    BEGIN
        RAISERROR(''此单存在数量为0的商品，不能审核'', 16, 1)
        RETURN
    END
    
    -- 获取公司代码和区域代码
    SELECT @CompanyCode = ShipperCode,
           @AreaCode = AreaCode
    FROM V_Bill_Purchase_Tab
    WHERE BillNumber = @billnumber
    
    -- 更新采购入库单的供货商、门店、实际成本价、批次号
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.AccountBookCode = b.AccountBookCode,
        a.ActualCostPrice = CASE WHEN @BillType IN (0, 2) THEN a.CostPrice ELSE a.ActualCostPrice END,
        a.BatchNumber = CASE WHEN a.BatchNumber IS NULL THEN CONVERT(VARCHAR(10), GETDATE(), 112) + ''-'' + a.idkey ELSE a.BatchNumber END
    FROM L_Bill_Purchases_Tab a,
    (
        SELECT billnumber, ShipperCode, AccountBookCode
        FROM V_Bill_Purchase_Tab
        WHERE billnumber = @billnumber
    ) b
    WHERE a.billnumber = b.billnumber
    
    -- 更新采购入库单明细的供货商、门店、实际成本价、批次号
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.AccountBookCode = b.AccountBookCode,
        a.ActualCostPrice = CASE WHEN @BillType IN (0, 2) THEN a.CostPrice ELSE a.ActualCostPrice END,
        a.BatchNumber = CASE WHEN a.BatchNumber IS NULL THEN CONVERT(VARCHAR(10), GETDATE(), 112) + ''-'' + a.idkey ELSE a.BatchNumber END
    FROM L_Bill_Purchases_Tab# a,
    (
        SELECT billnumber, ShipperCode, AccountBookCode
        FROM V_Bill_Purchase_Tab
        WHERE billnumber = @billnumber
    ) b
    WHERE a.billnumber = b.billnumber
    
    -- 更新区域代码
    IF @AreaCode <> 0
    BEGIN
        UPDATE L_Bill_Purchases_Tab
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab#
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
    END
    ELSE
    BEGIN
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab a,
        (
            SELECT IdCode, AreaCode
            FROM L_Basic_Product_Tab
            WHERE IdCode IN (SELECT ProductCode FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber)
        ) b
        WHERE a.billnumber = @billnumber AND a.ProductCode = b.IdCode
        
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab# a,
        (
            SELECT IdCode, AreaCode
            FROM L_Basic_Product_Tab
            WHERE IdCode IN (SELECT ProductCode FROM V_Bill_Purchases_Tab WHERE billnumber = @billnumber)
        ) b
        WHERE a.billnumber = @billnumber AND a.ProductCode = b.IdCode
    END
    
    -- 更新审核信息
    UPDATE L_Bill_Purchase_Tab
    SET examineUserCode = @updateuserid,
        examineAt = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab
    SET examineUserCode = @updateuserid,
        ShipperCode = @CompanyCode,
        At = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab#
    SET examineUserCode = @updateuserid,
        ShipperCode = @CompanyCode,
        At = GETDATE(),
        Status = 4
    WHERE billnumber = @billnumber
    
    -- 更新订单的更新触发标志
    UPDATE a
    SET a.JumpUpdateTrigger = 1,
        a.costprice = b.costprice
    FROM L_Bill_PurchaseOrders_Tab# a,
    (
        SELECT OrderBillNumber, ProductCode, SaleType, DownWg, costprice, BatchNumber
        FROM V_Bill_Purchases_Tab
        WHERE billnumber = @billnumber AND shipperCode <> 1
    ) b
    WHERE a.billnumber = b.OrderBillNumber
      AND a.ProductCode = b.ProductCode
      AND a.saleType = b.saleType
      AND a.DownWg = b.DownWg
      AND a.BatchNumber = b.BatchNumber
    
    -- 更新报价单的默认供货商
    IF @UpdatePurchaseToDefaultShipper = 1 AND @updateShipper = 1
    BEGIN
        -- 更新客户报价单
        UPDATE a
        SET a.defaultShipperCode = b.ShipperCode
        FROM L_Basic_Customer_Price_Tab a,
        (
            SELECT *
            FROM V_Bill_Purchases_Tab
            WHERE billnumber = @billnumber AND shipperCode <> 1
        ) b
        WHERE a.ProductCode = b.ProductCode
        
        -- 更新商品报价单
        UPDATE a
        SET a.defaultShipperCode = b.ShipperCode
        FROM L_Bill_QuotedPrices_Tab a,
        (
            SELECT *
            FROM V_Bill_Purchases_Tab
            WHERE billnumber = @billnumber AND shipperCode <> 1
        ) b
        WHERE a.ProductCode = b.ProductCode
    END
    
    -- 只有采购收货单才更新商品资料价格
    IF @BillType IN (0, 2)
    BEGIN
        UPDATE a
        SET a.InPrice = b.CostPrice
        FROM L_Basic_Product_Tab a,
        (
            SELECT ProductCode, CostPrice
            FROM V_Bill_Purchases_Tab
            WHERE BillNumber = @BillNumber AND numEx > 0
        ) b
        WHERE a.Idcode = b.ProductCode AND b.CostPrice > 0
    END
END
ELSE
BEGIN
    -- 反签流程
    IF @updatetype = -1
    BEGIN
        -- 检查是否已审核
        IF (SELECT ExamineUserCode FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) = 0
        BEGIN
            RAISERROR(''此单还末入帐审核，不能反签'', 16, 1)
            RETURN
        END
        
        -- 检查是否已付款
        IF (SELECT AlreadyMoney FROM V_Bill_Purchase_Tab WHERE billnumber = @billnumber) <> 0
        BEGIN
            RAISERROR(''单据已存在付款，不能反签'', 16, 1)
            RETURN
        END
        
        -- 反签审核信息
        UPDATE L_Bill_Purchase_Tab
        SET examineUserCode = 0,
            ExamineAt = GETDATE(),
            Status = 3
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab
        SET examineUserCode = 0,
            At = GETDATE(),
            Status = 3
        WHERE billnumber = @billnumber
        
        -- 更新对应订单为等收货状态
        UPDATE L_Bill_PurchaseOrder_Tab
        SET Status = 3
        WHERE BillNumber = @orderBillNumber
        
        UPDATE L_Bill_PurchaseOrders_Tab
        SET Status = 3
        WHERE BillNumber = @orderBillNumber
    END
END

-- 计算销售单的成本
EXEC Sp_CalcCostPrice_FromPurchase @billNumber,@updatetype
--更新库存
EXEC SP_UpdateStock ''Purchase'',@billnumber,@updatetype

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_ExChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_ExChange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[sp_Upd_Purchase_ExChange] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核采购冲红单						
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on
 if dbo.is_Rhz(Getdate())=1
 begin
    Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
    return 
 end
 
declare @orderBillNumber varchar(20),
		@ShipperCode int,
		@CompanyCode bigint,
		@AccountBookCode int,
		@AreaCode int,
		@ProductCode varChar(20),
		@AllowedExceedStock bit,
		@errstr Varchar(100),
		@goodsinfo Varchar(200),
		@DeliveryAt date

select @AllowedExceedStock=AllowedExceedStock from L_Sys_Parmars_Tab		
select @orderBillNumber= OrderBillNumber,@ShipperCode = ShipperCode,
	@AccountBookCode=AccountBookCode,@AreaCode=AreaCode,@DeliveryAt=DeliveryAt From L_Bill_Purchase_Tab where BillNumber=@billnumber
if @updatetype=1 
begin
	EXEC Sp_CheckSumit ''冲红'',@BillNumber,@updatetype;
	EXEC Sp_CheckStock ''冲红'',@Billnumber

	select @CompanyCode=ShipperCode,
		@AreaCode = AreaCode
	from L_Bill_Purchase_Tab where BillNumber=@billnumber
	
	update a set a.ShipperCode=b.ShipperCode,a.AccountBookCode=b.AccountBookCode,a.BatchNumber='''' 
	from L_Bill_Purchases_Tab a,L_Bill_Purchase_Tab b 
	where b.billnumber=@billnumber and a.billnumber=b.billnumber
	
	if @AreaCode<>0
	begin
		update L_Bill_Purchases_Tab set AreaCode=@AreaCode where billnumber=@billnumber
	end else 
	begin
		update a set a.AreaCode=b.AreaCode from L_Bill_Purchases_Tab a,L_Basic_Product_Tab b where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	
	Update L_Bill_Purchase_Tab set MrUserCode=@updateuserid,MrAt=GETDATE(),Status=3 where billnumber=@billnumber;

	update L_Bill_Purchases_Tab set MrUserCode=@updateuserid,ShipperCode=@CompanyCode,mrAt=GETDATE(),DeliveryAt = @DeliveryAt,Status=3 
	where billnumber=@billnumber;
	

	/*如果设置自动入帐，则运行入帐逻辑*/
	if (select AutoEntry from L_Sys_Parmars_Tab)=1
	begin
		exec sp_Upd_Purchase @billnumber,@updateuserid,@updatetype,0
	end;
end;

if @updatetype=-1
begin
	if (Select MrUserCode from L_Bill_Purchase_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	end
	/*如果设置自动入帐，则先返签入帐单*/
	if (select AutoEntry from L_Sys_Parmars_Tab)=1
	begin
		exec sp_Upd_Purchase @billnumber,@updateuserid,@updatetype,0
	end;
	EXEC Sp_CheckSumit ''冲红'',@BillNumber,@updatetype;
	
	update L_Bill_Purchase_Tab set MrUserCode=0,ExamineAt=GETDATE(),Status=2 where billnumber=@billnumber
	update L_Bill_Purchases_Tab set MrUserCode=0,At=GETDATE() ,Status=2 where billnumber=@billnumber
	
end


set nocount off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Mr]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Mr]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[sp_Upd_Purchase_Mr]
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT,
    @updateShipper BIT
AS
/*
***************************************************
    功能：采购单收货（注意不可以用组合货号）
    参数：
        @billnumber VARCHAR(20)  - 单号
        @updateuserid INT         - 操作员
        @updatetype INT           - 类型：1收货，-1反签
        @updateShipper BIT        - 是否更新报价单的默认供货商
    结果：更新库存
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 声明变量
DECLARE @orderBillNumber VARCHAR(20)
DECLARE @ShipperCode INT
DECLARE @AreaCode INT
DECLARE @Type INT
DECLARE @DeliveryAt DATE
DECLARE @settlementAt DATETIME

-- 获取采购订单信息
SELECT @orderBillNumber = OrderBillNumber,
       @ShipperCode = ShipperCode,
       @AreaCode = AreaCode,
       @Type = [Type],
       @DeliveryAt = DeliveryAt
FROM V_Bill_Purchase_Tab
WHERE BillNumber = @billnumber

-- 检查日期是否已汇总
IF dbo.is_Rhz(@DeliveryAt) = 1
BEGIN
    RAISERROR(''操作日期已汇总，不能继续操作'', 16, 1)
    RETURN
END

-- 收货流程
IF @updatetype = 1
BEGIN
    -- 检查汇总和库存
    EXEC Sp_CheckSumit ''收货'', @BillNumber, @updatetype
    EXEC Sp_CheckStock ''收货'', @BillNumber
    
    -- 更新采购入库单的供货商、门店、实际成本价
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.AccountBookCode = b.AccountBookCode,
        a.ActualCostPrice = a.CostPrice
    FROM L_Bill_Purchases_Tab a,
         L_Bill_Purchase_Tab b
    WHERE b.billnumber = @billNumber
      AND a.billnumber = b.billnumber
    
    UPDATE a
    SET a.ShipperCode = b.ShipperCode,
        a.AccountBookCode = b.AccountBookCode,
        a.ActualCostPrice = a.CostPrice
    FROM L_Bill_Purchases_Tab# a,
         L_Bill_Purchase_Tab# b
    WHERE b.billnumber = @billNumber
      AND a.billnumber = b.billnumber
    
    -- 更新区域代码
    IF @AreaCode <> 0
    BEGIN
        UPDATE L_Bill_Purchases_Tab
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab#
        SET AreaCode = @AreaCode
        WHERE billnumber = @billnumber
    END
    ELSE
    BEGIN
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab a,
             L_Basic_Product_Tab b
        WHERE a.billnumber = @billnumber
          AND a.ProductCode = b.IdCode
        
        UPDATE a
        SET a.AreaCode = b.AreaCode
        FROM L_Bill_Purchases_Tab# a,
             L_Basic_Product_Tab b
        WHERE a.billnumber = @billnumber
          AND a.ProductCode = b.IdCode
    END
    
    -- 计算报帐时间
    IF DATEPART(HOUR, GETDATE()) > 12
    BEGIN
        SET @settlementAt = DATEADD(DAY, 1, GETDATE())
    END
    ELSE
    BEGIN
        SET @settlementAt = GETDATE()
    END
    
    -- 更新收货信息
    UPDATE L_Bill_Purchase_Tab
    SET mrUserCode = @updateuserid,
        mrAt = GETDATE(),
        settlementAt = @settlementAt,
        Status = 3
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_Purchases_Tab
    SET mrUserCode = @updateuserid,
        ShipperCode = @ShipperCode,
        mrAt = GETDATE(),
        DeliveryAt = @DeliveryAt,
        settlementAt = @settlementAt,
        Status = 3
    WHERE billnumber = @billnumber
    
    -- 更新对应订单为完成状态
    UPDATE L_Bill_PurchaseOrder_Tab
    SET Status = 3,
        PurchaseBillNumber = @billnumber
    WHERE BillNumber = @orderBillNumber
    
    UPDATE L_Bill_PurchaseOrders_Tab
    SET Status = 3
    WHERE BillNumber = @orderBillNumber
    
    -- 如果设置自动入帐，则运行入帐逻辑
    IF (SELECT AutoEntry FROM L_Sys_Parmars_Tab) = 1
    BEGIN
        EXEC sp_Upd_Purchase @billnumber, @updateuserid, @updatetype, @updateShipper
    END
END
ELSE
BEGIN
    -- 反签流程
    IF @updatetype = -1
    BEGIN
        -- 检查是否已收货
        IF (SELECT mrUserCode FROM L_Bill_Purchase_Tab WHERE billnumber = @billnumber) = 0
        BEGIN
            RAISERROR(''此单还末收货，不能反签'', 16, 1)
            RETURN
        END
        
        -- 如果设置自动入帐，则先反签入帐单
        IF (SELECT AutoEntry FROM L_Sys_Parmars_Tab) = 1
           AND (SELECT COUNT(*) FROM L_Bill_Purchase_Tab WHERE BillNumber = @billnumber AND ExamineUserCode <> 0) > 0
        BEGIN
            EXEC sp_Upd_Purchase @billnumber, @updateuserid, @updatetype, @updateShipper
        END
        
        -- 检查汇总
        EXEC Sp_CheckSumit ''收货'', @BillNumber, @updatetype
        
        -- 反签收货信息
        UPDATE L_Bill_Purchase_Tab
        SET mrUserCode = 0,
            ExamineAt = GETDATE(),
            Status = 2
        WHERE billnumber = @billnumber
        
        UPDATE L_Bill_Purchases_Tab
        SET mrUserCode = 0,
            At = GETDATE(),
            Status = 2
        WHERE billnumber = @billnumber
        
        -- 更新对应订单为等收货状态
        UPDATE L_Bill_PurchaseOrder_Tab
        SET Status = 2
        WHERE BillNumber = @orderBillNumber
        
        UPDATE L_Bill_PurchaseOrders_Tab
        SET Status = 2
        WHERE BillNumber = @orderBillNumber
    END
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Pc(作废)]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Pc(作废)]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_Upd_Purchase_Pc(作废)] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int
as
 set nocount on
	if (select MrUserCode from L_Bill_Purchase_Tab where BillNumber=@billnumber)=0
	begin
		exec sp_Upd_Purchase_mr @billnumber,@updateuserid,@updatetype
	end
	exec sp_Upd_Purchase @billnumber,@updateuserid,@updatetype
  set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Purchase_Return]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Purchase_Return]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[sp_Upd_Purchase_Return] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核采购退货单						
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on


declare @orderBillNumber varchar(20),
		@ShipperCode int,
		@CompanyCode bigint,
		@AccountBookCode int,
		@AreaCode int,
		@ProductCode varChar(20),
		@AllowedExceedStock bit,
		@errstr Varchar(100),
		@goodsinfo Varchar(200),
		@DeliveryAt date
		
select @AllowedExceedStock=AllowedExceedStock from L_Sys_Parmars_Tab		
select @orderBillNumber= OrderBillNumber,@ShipperCode = ShipperCode,@AccountBookCode=AccountBookCode,@AreaCode=AreaCode,@DeliveryAt=DeliveryAt From L_Bill_Purchase_Tab where BillNumber=@billnumber

 if dbo.is_Rhz(@DeliveryAt)=1 begin
    Raiserror( ''退货日期已汇总，不能继续操作'',16,1)
    return 
 end
if @updatetype=1 
begin
	Exec Sp_CheckSumit ''采购退货'',@billnumber,@updatetype 
	IF @AllowedExceedStock = 0 EXEC Sp_CheckStock ''采购退货'',@Billnumber

	select @CompanyCode=ShipperCode,@AreaCode = AreaCode from L_Bill_Purchase_Tab where BillNumber=@billnumber
	
	update a set a.ShipperCode=b.ShipperCode,a.AccountBookCode=b.AccountBookCode,a.BatchNumber='''' from L_Bill_Purchases_Tab a,L_Bill_Purchase_Tab b where a.billNumber = @billnumber and a.billnumber=b.billnumber
	
	if @AreaCode<>0 begin
		update L_Bill_Purchases_Tab set AreaCode=@AreaCode where billnumber=@billnumber
	end else begin
		update a set a.AreaCode=b.AreaCode from L_Bill_Purchases_Tab a,L_Basic_Product_Tab b where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	
	Update L_Bill_Purchase_Tab set MrUserCode=@updateuserid,MrAt=GETDATE(),Status=3 where billnumber=@billnumber;

	update L_Bill_Purchases_Tab set MrUserCode=@updateuserid,ShipperCode=@CompanyCode,mrAt=GETDATE(),DeliveryAt = @DeliveryAt,Status=3 where billnumber=@billnumber;

	--更新对应订单为完成状态Status = 2
	update L_Bill_PurchaseOrder_Tab set Status = 3,PurchaseBillNumber = @billnumber where BillNumber = @orderBillNumber
	
	/*退货时取实际的商品成本*/
	update a set ActualCostPrice=b.CostPrice From L_Bill_Purchases_Tab a,V_Stock_Tab b where a.billnumber=@billnumber and a.AccountBookCode = b.AccountBookCode and a.AreaCode = b.AreaCode and a.ProductCode=b.ProductCode
	

	/*如果设置自动入帐，则运行入帐逻辑*/
	if (select AutoEntry from L_Sys_Parmars_Tab)=1
	begin
		exec sp_Upd_Purchase @billnumber,@updateuserid,@updatetype,0
	end;	
end;

if @updatetype=-1
begin
	if (Select MrUserCode from L_Bill_Purchase_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	end
	/*如果设置自动入帐，则先返签入帐单*/
	if (select AutoEntry from L_Sys_Parmars_Tab)=1
	begin
		exec sp_Upd_Purchase @billnumber,@updateuserid,@updatetype,0
	end;
	Exec Sp_CheckSumit ''采购退货'',@billnumber,@updatetype

	update L_Bill_Purchase_Tab set MrUserCode=0,ExamineAt=GETDATE(),Status=2 where billnumber=@billnumber
	update L_Bill_Purchases_Tab set MrUserCode=0,At=GETDATE() ,Status=2 where billnumber=@billnumber
	--更新对应订单为等收货状态Status = 1
	update L_Bill_PurchaseOrder_Tab set Status = 2 where BillNumber = @orderBillNumber
end


set nocount off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_PurchaseOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_PurchaseOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[sp_Upd_PurchaseOrder] 
	@billnumber Varchar(20),
	@deliveryat date,
	@updateuserid int,
	@updatetype int as
/* ****************************************************/
/* *********复核线下采购订单						 ************/
/* ******** 参数：@billnumber :单号            ***********/
/* ********       @@updateuserid :工号             **********/
/* ********       @updatetype    :复核类型（1,-1)  **********/
/* ********  2019-02-05  张建明             **********/  
/*   审核后不影响其它数据*/ 
/****************************************************/
 set nocount on

if @updatetype=1 
begin
	if (Select ExamineUserCode from L_Bill_PurchaseOrder_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能重复审核'',16,1)
		return 
	end
	if (Select ShipperCode from L_Bill_PurchaseOrder_Tab where billnumber=@billnumber)=''0'' 
	begin
		Raiserror(''此单无指定客户，不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_PurchaseOrders_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_PurchaseOrders_Tab where billnumber=@billnumber and num=0)>0 
	begin
		Raiserror(''此单存在数量为0的商品,不能审核'',16,1)
		return 
	end
	declare @ShipperCode bigint,@WithInShipperCode bigInt,@MainSendToSub bit
	select @ShipperCode=ShipperCode from L_Bill_PurchaseOrder_Tab where BillNumber=@billnumber
	select @WithInShipperCode = WithInShipperCode,@MainSendToSub=MainSendToSub From L_Sys_Parmars_Tab


	update a set a.AreaCode=b.AreaCode
			from L_Bill_PurchaseOrders_Tab a,
				(Select IdCode,AreaCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_PurchaseOrders_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode

	update L_Bill_PurchaseOrder_Tab 
		set examineUserCode=@updateuserid,
			examineAt=GETDATE(),
			deliveryat=@deliveryat,
			Status=1 
	where billnumber=@billnumber
	update L_Bill_PurchaseOrders_Tab 
		set examineUserCode=@updateuserid,
			ShipperCode=@ShipperCode,
			At=GETDATE(),
			deliveryat=@deliveryat 
	where billnumber=@billnumber

	if @WithInShipperCode <> @ShipperCode
	begin 
		exec sp_PurchaseOrderToPurchase @billnumber,@updateuserid
	end else if @MainSendToSub=1 begin
		exec sp_PurchaseOrderToPurchase @billnumber,@updateuserid
		exec sp_PurchaseToSaleOrder @billnumber,@updateuserid
	end;
end
else
begin
	declare @PurchaseBillNumber varchar(20)
	select @PurchaseBillNumber=PurchaseBillNumber from L_Bill_PurchaseOrder_Tab where BillNumber=@billnumber 
	if (Select ExamineUserCode from L_Bill_PurchaseOrder_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	end
	/*if (Select Status from L_Bill_Purchase_Tab where billnumber=@PurchaseBillNumber)>=2 and (select ShipperCode From L_Bill_Purchase_Tab where billnumber=@PurchaseBillNumber)<>1
	begin
		Raiserror(''供应商已接单，不能反签'',16,1)
		return 
	end*/
	if (Select ExamineUserCode from L_Bill_Purchase_Tab where billnumber=@PurchaseBillNumber)>0 
	begin
		Raiserror(''对应的采购单已生效，不能反签'',16,1)
		return 
	end
	delete L_Bill_Purchases_Tab where BillNumber=@PurchaseBillNumber
	delete L_Bill_Purchase_Tab where BillNumber=@PurchaseBillNumber
	
	update L_Bill_PurchaseOrder_Tab set examineUserCode=0,ExamineAt=GETDATE(),Status=0 where billnumber=@billnumber
	update L_Bill_PurchaseOrders_Tab set examineUserCode=0,At=GETDATE() where billnumber=@billnumber	
end


set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_QuotedPrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_QuotedPrice]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[sp_Upd_QuotedPrice] 
    @billnumber VARCHAR(20),
    @UPDATEuserid INT,
    @UPDATEtype INT AS

/*
***************************************************
    功能：审核报价单						
    参数：	
            @billnumber:单号
            @UPDATEuserid :操作员
            @UPDATEtype :类型1，-1 
    结果：
        更新 客户报价
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON

DECLARE @CustomerCode BIGINT
DECLARE @startAt DATE
DECLARE @ENDAt DATE
DECLARE @UPDATESaleAllowedChangePrice BIT
DECLARE @Pcode INT
DECLARE @dr FLOAT
DECLARE @QuotedTemp TABLE (
    ProductCode VARCHAR(20),
    SaleType INT,
    SalePrice FLOAT
)

SELECT @CustomerCode = CustomerCode,
       @startAt = StartAt,
       @ENDAt = ENDAt 
FROM L_Bill_QuotedPrice_Tab 
WHERE BillNumber = @billnumber

SELECT @UPDATESaleAllowedChangePrice = ISNULL(UPDATESaleAllowedChangePrice, 0) 
FROM L_Sys_Parmars_Tab

SELECT @Pcode = ISNULL(Pcode, 0),
       @dr = ISNULL(Dr, 1) 
FROM L_Basic_Company_Tab 
WHERE IdCode = @CustomerCode

IF NOT EXISTS (
    SELECT 1 
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billnumber = @billnumber
) 
BEGIN
    RAISERROR(''此单无数据,不能审核'', 16, 1)
    RETURN 
END

IF @CustomerCode IS NULL OR @CustomerCode = 0 
BEGIN
    RAISERROR(''请指定客户,不能审核'', 16, 1)
    RETURN 
END

IF @UPDATEtype = 1
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE billnumber = @billnumber 
          AND ISNULL(examineUserCode, 0) > 0
    ) 
    BEGIN
        RAISERROR(''此单已审核,不能审核'', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber = @billnumber 
          AND ENDAt < CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR(''结束日期不能小于当前日期'', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber <> @billnumber 
          AND CustomerCode = @CustomerCode 
          AND ENDAt = @ENDAt
    )
    BEGIN
        RAISERROR(''已存在相同结束日期的报价单'', 16, 1)
        RETURN 
    END

    UPDATE L_Bill_QuotedPrice_Tab 
    SET examineUserCode = @UPDATEuserid,
        examineAt = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber

    UPDATE L_Bill_QuotedPrices_Tab 
    SET examineUserCode = @UPDATEuserid,
        At = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber

    UPDATE L_Basic_Company_Tab 
    SET startAt = @startAt,
        ENDAt = @ENDAt 
    WHERE IdCode = @CustomerCode

    DELETE L_Basic_Customer_Price_Tab 
    WHERE Pcode = @CustomerCode

    INSERT L_Basic_Customer_Price_Tab (
        IdKey,
        SerialNumber,
        CustomerProcudeCode,
        PCode,
        ProductCode,
        SaleType,
        AliasName,
        Price,
        defaultShipperCode,
		QualityGrade,
        note
    )
    SELECT IdKey,
           SerialNumber,
           CustomerProcudeCode,
           @CustomerCode,
           ProductCode,
           SaleType,
           AliasName,
           salePrice,
           defaultShipperCode,
		   QualityGrade,
           note 
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billNumber = @billnumber 
    ORDER BY SerialNumber

    INSERT @QuotedTemp (
        ProductCode,
        SaleType,
        SalePrice
    )
    SELECT ProductCode,
           SaleType,
           salePrice 
    FROM V_Bill_QuotedPrices_Tab 
    WHERE billnumber = @billnumber 
      AND salePrice <> 0

    IF @UPDATESaleAllowedChangePrice = 1
    BEGIN 
        IF @Pcode = 0 
        BEGIN
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab# a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_SaleOrders_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        END

        IF @Pcode > 0 
        BEGIN
            DECLARE @ChildCode BIGINT
            DECLARE @ChildDr FLOAT
            DECLARE _Cursor CURSOR FOR 
                SELECT IdCode,
                       Dr 
                FROM V_Basic_Customer_Tab 
                WHERE PCode = @Pcode
            OPEN _Cursor
            FETCH NEXT FROM _Cursor INTO @ChildCode, @ChildDr
            WHILE @@FETCH_STATUS = 0
            BEGIN
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_Sales_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
            
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_Sales_Tab# a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt
        
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr, 1)  
                FROM L_Bill_SaleOrders_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt

                FETCH NEXT FROM _Cursor INTO @ChildCode, @ChildDr
            END
            CLOSE _Cursor
            DEALLOCATE _Cursor
        END
    END 
    ELSE 
    BEGIN
        IF @Pcode = 0
        BEGIN
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_Sales_Tab# a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        
            UPDATE a 
            SET a.basePrice = b.SalePrice,
                a.salePrice = b.SalePrice * @dr  
            FROM L_Bill_SaleOrders_Tab a 
            INNER JOIN @QuotedTemp b 
                ON a.ProductCode = b.ProductCode 
               AND a.SaleType = b.SaleType
            WHERE a.CustomerCode = @CustomerCode 
              AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
              AND a.ExamineUserCode = 0
        END

        IF @Pcode > 0
        BEGIN
            DECLARE @ChildCode2 BIGINT
            DECLARE @ChildDr2 FLOAT
            DECLARE _Cursor2 CURSOR FOR 
                SELECT IdCode,
                       Dr 
                FROM V_Basic_Customer_Tab 
                WHERE PCode = @Pcode
            OPEN _Cursor2
            FETCH NEXT FROM _Cursor2 INTO @ChildCode2, @ChildDr2
            WHILE @@FETCH_STATUS = 0
            BEGIN
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_Sales_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0
            
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_Sales_Tab# a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0
        
                UPDATE a 
                SET a.basePrice = b.SalePrice,
                    a.salePrice = b.SalePrice * ISNULL(@ChildDr2, 1)  
                FROM L_Bill_SaleOrders_Tab a 
                INNER JOIN @QuotedTemp b 
                    ON a.ProductCode = b.ProductCode 
                   AND a.SaleType = b.SaleType
                WHERE a.CustomerCode = @ChildCode2 
                  AND a.DeliveryAt BETWEEN @startAt AND @ENDAt 
                  AND a.ExamineUserCode = 0

                FETCH NEXT FROM _Cursor2 INTO @ChildCode2, @ChildDr2
            END
            CLOSE _Cursor2
            DEALLOCATE _Cursor2
        END
    END
END

IF @UPDATEtype = -1
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE billnumber = @billnumber 
          AND ISNULL(examineUserCode, 0) > 0
    )
    BEGIN
        RAISERROR(''此单未审核,不能反签'', 16, 1)
        RETURN 
    END

    IF EXISTS (
        SELECT 1 
        FROM L_Bill_QuotedPrice_Tab 
        WHERE BillNumber = @billnumber 
          AND ENDAt < CAST(GETDATE() AS DATE)
    )
    BEGIN
        RAISERROR(''过期的报价单不能反签'', 16, 1)
        RETURN 
    END

    UPDATE L_Bill_QuotedPrice_Tab 
    SET examineUserCode = 0,
        examineAt = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber

    UPDATE L_Bill_QuotedPrices_Tab 
    SET examineUserCode = 0,
        At = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber

    DELETE L_Basic_Customer_Price_Tab 
    WHERE Pcode = @CustomerCode

    INSERT L_Basic_Customer_Price_Tab (
        IdKey,
        SerialNumber,
        CustomerProcudeCode,
        PCode,
        ProductCode,
        SaleType,
        AliasName,
        Price,
        defaultShipperCode,
		QualityGrade
    )
    SELECT IdKey,
           SerialNumber,
           CustomerProcudeCode,
           @CustomerCode,
           ProductCode,
           SaleType,
           AliasName,
           CurSalePrice,
           defaultShipperCode,
		   QualityGrade
    FROM L_Bill_QuotedPrices_Tab 
    WHERE billNumber = @billnumber 
    ORDER BY SerialNumber
END

SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- EXEC sp_Upd_Sale ''XS2009160002'',1,-1

CREATE Proc [dbo].[sp_Upd_Sale] 
	@billnumber Varchar(20),
	@UPDATEuserid int,
	@UPDATEtype int as
/* 
***************************************************
	功能：审核送货单						
	参数：	
			@billnumber:单号
			@UPDATEuserid :操作员
			@UPDATEtype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 SET NOCOUNT ON
 
DECLARE @OrderBillNumList VARCHAR(200), --原单列表
		@CompanyCode BIGINT,			--客户编码
		@AccountBookCode INT,					--分店编码
		@AreaCode INT,					--仓位编码
		@AllowedExceedStock BIT,		--允许负库存
		@OutNotCalclStock BIT,			--不计算库存
		@SaleAutoEntry	BIT,--销售自动入帐
		@OutMustDis BIT,				--出货要先配货
		@errstr VARCHAR(800),			--出错信息
		@goodsinfo VARCHAR(800),		--商品信息
		@DeliveryAt DATETIME			--送货日期
		
SELECT  
	@AllowedExceedStock =	AllowedExceedStock,	
	@OutNotCalclStock	=	OutNotCalclStock,	
	@OutMustDis			=	OutMustDis,
	@SaleAutoEntry      =	SaleAutoEntry			
FROM L_Sys_Parmars_Tab	


SELECT 
	@OrderBillNumList	=	orderBillnumber,
	@CompanyCode		=	CustomerCode,
	@AccountBookCode			=	AccountBookCode,
	@AreaCode			=	AreaCode,
	@DeliveryAt			=	DeliveryAt
FROM V_bill_Sale_Tab WHERE billNumber = @billNumber

IF dbo.is_Rhz(@DeliveryAt)=1
BEGIN
	Raiserror( ''送货日期已汇总，不能继续操作'',16,1)
	return 
END;
EXEC Sp_CheckSumit ''销售'',@billnumber,@UPDATEtype 
IF @UPDATEtype=1 
BEGIN
	--计算库存且不允许负库存 -->检查库存是否够 
	IF @OutNotCalclStock = 0 and @AllowedExceedStock = 0 EXEC Sp_CheckStock ''销售'',@BillNumber;

	UPDATE L_Bill_Sales_Tab SET examineUserCode=@UPDATEuserid,CustomerCode=@CompanyCode,At=GETDATE(),DeliveryAt=@DeliveryAt WHERE billnumber=@billnumber;
	UPDATE L_Bill_Sales_Tab# SET examineUserCode=@UPDATEuserid,CustomerCode=@CompanyCode,At=GETDATE(),DeliveryAt=@DeliveryAt WHERE billnumber=@billnumber;

	--订单更新成完成状态(出货了）
	UPDATE L_Bill_SaleOrder_Tab SET Status = 2 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
	UPDATE L_Bill_SaleOrders_Tab SET Status = 2 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 

	UPDATE a 
		SET a.CustomerCode		=	b.CustomerCode,
			a.AccountBookCode			=	b.AccountBookCode,
			a.driverCode		=	b.driverCode,
			a.salesPersonCode	=	b.deliveryCode,
			a.SalesManCode		=	b.salesMan,
			a.BatchNumber		=	CASE WHEN ISNULL(a.BatchNumber,'''')='''' THEN convert(varchar(10),getdate(),112)+''-''+a.idkey ELSE a.BatchNumber END
	FROM l_bill_Sales_Tab a,
		(SELECT billnumber,CustomerCode,AccountBookCode,driverCode,DeliveryCode,SalesMan FROM l_bill_Sale_Tab WHERE billnumber=@billnumber) b 
	WHERE a.billnumber=b.billnumber
	UPDATE a 
		SET a.CustomerCode		=	b.CustomerCode,
			a.AccountBookCode			=	b.AccountBookCode,
			a.driverCode		=	b.driverCode,
			a.salesPersonCode	=	b.deliveryCode,
			a.SalesManCode		=	b.salesMan,
			a.BatchNumber		=	CASE WHEN ISNULL(a.BatchNumber,'''')='''' THEN convert(varchar(10),getdate(),112)+''-''+a.idkey ELSE a.BatchNumber END
	FROM l_bill_Sales_Tab# a,
		(SELECT billnumber,CustomerCode,AccountBookCode,driverCode,DeliveryCode,SalesMan FROM l_bill_Sale_Tab WHERE billnumber=@billnumber) b 
	WHERE a.billnumber=b.billnumber
	
	IF @AreaCode<>0
	BEGIN
		UPDATE l_bill_Sales_Tab SET AreaCode=@AreaCode WHERE billnumber=@billnumber
		UPDATE l_bill_Sales_Tab# SET AreaCode=@AreaCode WHERE billnumber=@billnumber
	END else 
	BEGIN
		UPDATE a SET a.AreaCode=b.AreaCode FROM L_Bill_Sales_Tab a,L_Basic_Product_Tab b WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
		UPDATE a SET a.AreaCode=b.AreaCode FROM L_Bill_Sales_Tab# a,L_Basic_Product_Tab b WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	END
	
	UPDATE a SET a.ShipperCode=b.ShipperCode FROM L_Bill_sales_Tab a,L_Basic_Product_Tab b WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	UPDATE a SET a.ShipperCode=b.ShipperCode FROM L_Bill_sales_Tab# a,L_Basic_Product_Tab b WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	
	/*UPDATE a SET a.costprice = case when b.costprice is null then a.costprice else b.CostPrice END  FROM L_Bill_Sales_Tab a,v_Stock_Tab b WHERE a.billnumber = @billnumber and a.AccountBookCode = b.AccountBookCode and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode
	UPDATE a SET a.costprice = case when b.costprice is null then a.costprice else b.CostPrice END  FROM L_Bill_Sales_Tab# a,v_Stock_Tab b WHERE a.billnumber = @billnumber and a.AccountBookCode = b.AccountBookCode and a.AreaCode=b.AreaCode and a.ProductCode = b.ProductCode

	*/


	 --以下代码将新商品加入报价表
	 EXEC Sp_OrderToQuotePrice @CompanyCode,@billnumber,''SALES''

	UPDATE L_Bill_Sale_Tab SET examineUserCode=@UPDATEuserid,examineAt=GETDATE(),Status=1 WHERE billnumber=@billnumber;
	UPDATE L_Bill_Sale_Tab# SET examineUserCode=@UPDATEuserid,examineAt=GETDATE(),Status=1 WHERE billnumber=@billnumber;
	IF @SaleAutoEntry = 1
		EXEC sp_Upd_Sale_Entry @billNumber,@UPDATEuserid,1
END;


IF @UPDATEtype=-1
BEGIN
	IF @SaleAutoEntry = 1 AND (SELECT COUNT(*) FROM L_Bill_Sale_Tab WHERE BillNumber = @billnumber AND EntryUserCode <>0) >0
	BEGIN --如果未有入帐的单据不执行
		EXEC sp_Upd_Sale_Entry @billNumber,@UPDATEuserid,-1 
	END;
	UPDATE L_Bill_Sale_Tab SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 WHERE billnumber=@billnumber
	UPDATE L_Bill_Sale_Tab# SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 WHERE billnumber=@billnumber
	UPDATE L_Bill_Sales_Tab SET examineUserCode=0,At=GETDATE() WHERE billnumber=@billnumber	
	UPDATE L_Bill_Sales_Tab# SET examineUserCode=0,At=GETDATE() WHERE billnumber=@billnumber	
	UPDATE L_Bill_SaleOrder_Tab SET Status = 1 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
	UPDATE L_Bill_SaleOrders_Tab SET Status = 1 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
END


SET NOCOUNT OFF





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale_Entry]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale_Entry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- exec sp_Upd_Sale ''XS2009160002'',1,-1

CREATE Proc [dbo].[sp_Upd_Sale_Entry] 
	@billnumber VARCHAR(20),
	@UPDATEuserid INT,
	@UPDATEtype INT 
AS
/* 
***************************************************
	功能：审核送货单入帐单						
	参数：	
			@billnumber:单号
			@UPDATEuserid :操作员
			@UPDATEtype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 SET NOCOUNT ON
 

DECLARE @OrderBillNumList VARCHAR(200), --原单列表
		@CompanyCode BIGINT,			--客户编码
		@AccountBookCode INT,					--分店编码
		@AreaCode INT,					--仓位编码
		@AllowedExceedStock BIT,		--允许负库存
		@OutNotCalclStock BIT,			--不计算库存
		@OutMustDis BIT,				--出货要先配货
		@errstr VARCHAR(800),			--出错信息
		@goodsinfo VARCHAR(800),		--商品信息
		@DeliveryAt DATETIME			--送货日期
		
SELECT  
	@AllowedExceedStock =	AllowedExceedStock,	
	@OutNotCalclStock	=	OutNotCalclStock,	
	@OutMustDis			=	OutMustDis			
FROM L_Sys_Parmars_Tab	

SELECT 
	@OrderBillNumList	=	orderBillnumber,
	@CompanyCode		=	CustomerCode,
	@AccountBookCode			=	AccountBookCode,
	@AreaCode			=	AreaCode,
	@DeliveryAt			=	DeliveryAt
FROM l_bill_Sale_Tab WHERE billNumber = @billNumber

IF dbo.is_Rhz(@DeliveryAt)=1
BEGIN
    RAISERROR( ''送货日期已汇总，不能继续操作'',16,1)
    RETURN 
END
 

IF @UPDATEtype=1 
BEGIN
	IF (SELECT EntryUserCode FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)>0 
	BEGIN
		RAISERROR( ''此单已入帐,不能重复入帐'',16,1)
		RETURN 
	END
	UPDATE L_Bill_Sale_Tab set EntryUserCode = @UPDATEuserid,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sale_Tab# set EntryUserCode = @UPDATEuserid,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sales_Tab set EntryUserCode = @UPDATEuserid,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sales_Tab# set EntryUserCode = @UPDATEuserid,EntryAt = GETDATE() WHERE billnumber = @billnumber

	update a Set a.CostMoney = b.CostMoney,a.SaleMoney=b.SaleMoney
        from L_Bill_Sale_Tab a,
        (Select BillNumber,SUM(NumEx*ActualCostPrice) as CostMoney,
				SUM(ROUND(NumEx*ROUND(SalePrice,2),2)) as SaleMoney from L_Bill_Sales_Tab
				where BillNumber =@billnumber group by BillNumber) b  
	where a.BillNumber=b.BillNumber
	
END;
IF @UPDATEtype=-1
BEGIN
	 IF (SELECT EntryUserCode FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)=0 
	 BEGIN
		RAISERROR(''此单还末入帐，不能反签'',16,1)
		RETURN 
	 END
	IF (SELECT AlreadyMoney FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)<>0 
	BEGIN
		RAISERROR(''单据已存在收款，不能反签'',16,1)
		RETURN 
	END
	UPDATE L_Bill_Sale_Tab set EntryUserCode = 0,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sale_Tab# set EntryUserCode = 0,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sales_Tab set EntryUserCode = 0,EntryAt = GETDATE() WHERE billnumber = @billnumber
	UPDATE L_Bill_Sales_Tab# set EntryUserCode = 0,EntryAt = GETDATE() WHERE billnumber = @billnumber

END

SET NOCOUNT OFF






' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_Sale_Return]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_Sale_Return]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[sp_Upd_Sale_Return] 
	@billnumber VARCHAR(20),
	@UPDATEuserid INT,
	@UPDATEtype INT
AS
/* 
***************************************************
	功能：审核销售退货单						
	参数：	
			@billnumber:单号
			@UPDATEuserid :操作员
			@UPDATEtype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/


SET NOCOUNT ON

DECLARE @OrderBillNumList VARCHAR(200), --原单列表
		@CompanyCode BIGINT,
		@AccountBookCode INT,
		@AreaCode INT,
		@mchCode VARCHAR(20),
		@AllowedExceedStock BIT,
		@OutNotCalclStock BIT,--不计算库存
		@OutMustDis BIT,--出货要先配货
		@SaleAutoEntry	BIT,--销售自动入帐
		@DeliveryAt DATETIME			--送货日期
		
SELECT  @AllowedExceedStock = AllowedExceedStock,@OutNotCalclStock=OutNotCalclStock,@OutMustDis=OutMustDis,@SaleAutoEntry=SaleAutoEntry FROM L_Sys_Parmars_Tab	

SELECT @OrderBillNumList=orderBillnumber,
	@mchCode = mchCode,
	@CompanyCode=CustomerCode,
	@AccountBookCode = AccountBookCode,
	@AreaCode	= AreaCode,
	@DeliveryAt	=	DeliveryAt
FROM V_bill_Sale_Tab WHERE billNumber = @billNumber

 IF dbo.is_Rhz(@DeliveryAt)=1
 BEGIN
    RAISERROR( ''送货日期已汇总，不能继续操作'',16,1)
    RETURN 
 END
IF @UPDATEtype=1 
BEGIN
	IF (SELECT ExamineUserCode FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)>0 
	BEGIN
		RAISERROR( ''此单已审核,不能重复审核'',16,1)
		RETURN 
	END
	IF (SELECT CustomerCode FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)=''0'' 
	BEGIN
		RAISERROR(''此单无指定客户，不能审核'',16,1)
		RETURN 
	END
	IF (SELECT COUNT(BillNumber) FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber)=0 
	BEGIN
		RAISERROR( ''此单无数据,不能审核'',16,1)
		RETURN 
	END
	IF (SELECT COUNT(BillNumber) FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber and numex=0)>0 
	BEGIN
		RAISERROR(''此单存在数量为0的商品,不能审核'',16,1)
		RETURN 
	END

	UPDATE L_Bill_Sale_Tab SET examineUserCode=@UPDATEuserid,examineAt=GETDATE(),Status=1 WHERE billnumber=@billnumber;
	UPDATE L_Bill_Sale_Tab# SET examineUserCode=@UPDATEuserid,examineAt=GETDATE(),Status=1 WHERE billnumber=@billnumber;

	UPDATE L_Bill_Sales_Tab SET examineUserCode=@UPDATEuserid,CustomerCode=@CompanyCode,At=GETDATE() WHERE billnumber=@billnumber
	UPDATE L_Bill_Sales_Tab# SET examineUserCode=@UPDATEuserid,CustomerCode=@CompanyCode,At=GETDATE() WHERE billnumber=@billnumber

	--订单更新成完成状态
	UPDATE L_Bill_SaleOrder_Tab SET Status = 2 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
	UPDATE L_Bill_SaleOrders_Tab SET Status = 2 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 

	UPDATE a 
		SET a.CustomerCode		=	b.CustomerCode,
			a.ActualCostPrice	=	a.CostPrice,
			a.AccountBookCode			=	b.AccountBookCode,
			a.driverCode		=	b.driverCode,
			a.salesPersonCode	=	b.deliveryCode,
			a.SalesManCode		=	b.salesMan,
			a.BatchNumber		=	CONVERT(varchar(10),GETDATE(),112)+''-''+a.idkey 
	FROM l_bill_Sales_Tab a,
		(SELECT billnumber,CustomerCode,AccountBookCode,driverCode,DeliveryCode,SalesMan FROM V_bill_Sale_Tab WHERE billnumber=@billnumber) b 
	WHERE a.billnumber=b.billnumber

	UPDATE a 
		SET a.CustomerCode		=	b.CustomerCode,
			a.ActualCostPrice	=	a.CostPrice,
			a.AccountBookCode			=	b.AccountBookCode,
			a.driverCode		=	b.driverCode,
			a.salesPersonCode	=	b.deliveryCode,
			a.SalesManCode		=	b.salesMan,
			a.BatchNumber		=	CONVERT(varchar(10),GETDATE(),112)+''-''+a.idkey 
	FROM l_bill_Sales_Tab# a,
		(SELECT billnumber,CustomerCode,AccountBookCode,driverCode,DeliveryCode,SalesMan FROM V_bill_Sale_Tab WHERE billnumber=@billnumber) b 
	WHERE a.billnumber=b.billnumber
	
	IF @AreaCode<>0
	BEGIN
		UPDATE l_bill_Sales_Tab SET AreaCode=@AreaCode 	WHERE billnumber=@billnumber
		UPDATE l_bill_Sales_Tab# SET AreaCode=@AreaCode 	WHERE billnumber=@billnumber
	END else 
	BEGIN
		UPDATE a SET a.AreaCode=b.AreaCode
			FROM L_Bill_Purchases_Tab a,
				(SELECT IdCode,AreaCode FROM L_Basic_Product_Tab 
					WHERE IdCode in (SELECT ProductCode FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber)
				) b 
		WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
		UPDATE a SET a.AreaCode=b.AreaCode
			FROM L_Bill_Purchases_Tab# a,
				(SELECT IdCode,AreaCode FROM L_Basic_Product_Tab 
					WHERE IdCode in (SELECT ProductCode FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber)
				) b 
		WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	END
	
	UPDATE a SET a.ShipperCode=b.ShipperCode
			FROM L_Bill_sales_Tab a,
				(SELECT IdCode,ShipperCode FROM L_Basic_Product_Tab 
					WHERE IdCode in (SELECT ProductCode FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber)
				) b 
		WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	UPDATE a SET a.ShipperCode=b.ShipperCode
			FROM L_Bill_sales_Tab# a,
				(SELECT IdCode,ShipperCode FROM L_Basic_Product_Tab 
					WHERE IdCode in (SELECT ProductCode FROM V_Bill_Sales_Tab WHERE billnumber=@billnumber)
				) b 
		WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode

	IF @SaleAutoEntry = 1
		exec sp_Upd_Sale_Entry @billNumber,@UPDATEuserid,1
END;


IF @UPDATEtype=-1
BEGIN
	IF @SaleAutoEntry = 1 BEGIN	exec sp_Upd_Sale_Entry @billNumber,@UPDATEuserid,-1 END;
	 IF (SELECT ExamineUserCode FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)=0 
	 BEGIN
		RAISERROR(''此单还末审核，不能反签'',16,1)
		RETURN 
	 END
	 
	 IF (SELECT AlreadyMoney FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)<>0 
	BEGIN
		RAISERROR(''单据已存在付款，不能反签'',16,1)
		RETURN 
	END
	IF (SELECT DATEDIFF(day,examineAt,GETDATE()) FROM V_Bill_Sale_Tab WHERE billnumber=@billnumber)<>0 
	 BEGIN
		RAISERROR(''只能反签当天的当据，操作失败'',16,1)
		RETURN 
	 END 
	/*IF dbo.BatchNumber_IsUsesEx(@billnumber)>0
	BEGIN
		RAISERROR(''本单的商品批号已存在出库，不能反签'',16,1)
		RETURN 
	END;  */
	UPDATE L_Bill_Sale_Tab SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 WHERE billnumber=@billnumber
	UPDATE L_Bill_Sale_Tab# SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 WHERE billnumber=@billnumber
	UPDATE L_Bill_Sales_Tab SET examineUserCode=0,At=GETDATE()WHERE billnumber=@billnumber	
	UPDATE L_Bill_Sales_Tab# SET examineUserCode=0,At=GETDATE()WHERE billnumber=@billnumber	
	
	UPDATE L_Bill_SaleOrder_Tab SET Status = 1 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
	UPDATE L_Bill_SaleOrders_Tab SET Status = 1 WHERE BillNumber in (SELECT * FROM dbo.f_splitSTR(@OrderBillNumList,'','')) 
END


SET NOCOUNT off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleBatchCheckReports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleBatchCheckReports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_Upd_SaleBatchCheckReports] 
	@PCateCode Int,
	@DeliveryAt smalldatetime,
	@checkedNameFiles VarChar(400)
	
as
/**批量上传报告**/
set nocount on
	update l_bill_sales_tab set CheckReportsFileNames = @checkedNameFiles where DeliveryAt = @DeliveryAt
	update l_bill_sales_tab# set CheckReportsFileNames = @checkedNameFiles where DeliveryAt = @DeliveryAt 
	
set nocount off


' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleCheckReports]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleCheckReports]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[sp_Upd_SaleCheckReports] 
	@BillNumber VarChar(20),
	@productcode VarChar(20),
	@checkedNameFiles VarChar(400),
	@isCheckCate bit 
as

set nocount on
	declare @CateCode int,@PCateCode Int
	select @CateCode = CateCode from L_Basic_Product_Tab where IdCode = @productcode
	set @PCateCode = @CateCode /100
	IF @isCheckCate=1 BEGIN
		update l_bill_sales_tab set CheckReportsFileNames = @checkedNameFiles where billnumber = @BillNumber and ProductCode In
			(select ProductCode from V_bill_sales_tab where billnumber= @BillNumber and CateCode/100=@PCateCode)
	END ELSE BEGIN
		update l_bill_sales_tab set CheckReportsFileNames = @checkedNameFiles where billnumber = @BillNumber and ProductCode = @productcode
	END;
set nocount off' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE Proc [dbo].[sp_Upd_SaleOrder] 
	@BillNumber Varchar(20),
	@Deliveryat date,
	@UpdateUserid int,
	@UpdateType int as
/* 
***************************************************
	功能：复核销售订单						
	参数：	
			@billnumber :单号 
			@deliveryat	:送货日期      
			@UPDATEuserid :工号  
			@UPDATEtype   :复核类型（1,-1)
	结果：审核将单据转到销售单（详情看sp_SaleOrderToSale过程)
		  反签将对应销售单清除（详情看sp_SaleOrderUnToSale过程)
		
	作者：2019-02-05  张建明
**************************************************
*/
 SET nocount on
	DECLARE @CustomerCode bigint,--客户编码
			@PriceCustomerCode bigInt,--报价表客户编码
			@PCode Int,
			@DeliveryBillNumber varchar(20),--送货单号
			@ShAreaCode Bigint, --购买地区编码 商户购买时有效
			@Type int,  --0 后台下单 1 手机下单 2商号购买
			@ConponCode varchar(20), --优惠券号
			@SysConponCode varchar(20), --发送的优惠券号
			@RepeatProdcutCode varchar(20), --重复的货号
			@ENDOrderTime int,--结束下单时间
			@StartOrderTime int,--结束下单时间
			@UpdateSaleOrderToPurchaseOrder BIT,--自动分流
			@Enablemanyshipper bit,--是否启用多货商分流
			@ERRMSG VARCHAR(300),
			@dr Float, --折扣
			@decimalBit Int --小数位

	SELECT @CustomerCode=CustomerCode,
			@DeliveryBillNumber=DeliveryBillNumber,
			@ShAreaCode = ShAreaCode,
			@Type = Type,
			@ConponCode = Conpon_Code
	FROM L_Bill_SaleOrder_Tab WHERE BillNumber=@billnumber
	
	SELECT @Pcode=Pcode,@dr = Dr,@decimalBit = decimalBit FROM L_Basic_Company_Tab WHERE IdCode = @customerCode
	
    IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @PriceCustomerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END
	SELECT @UpdateSaleOrderToPurchaseOrder = UpdateSaleOrderToPurchaseOrder,@Enablemanyshipper = Enablemanyshipper,@StartOrderTime = StartOrderTime,@ENDOrderTime=ENDOrderTime FROM L_Sys_Parmars_Tab
	--SELECT @SysConponCode = Pcode FROM L_Sys_Wx_User_Coupon_Tab WHERE id = @ConponCode
	DECLARE @THISh INT 
	SET @THISh = DATEPART(hour, GETDATE())
	IF @UPDATEuserid in (-1,1) AND (@StartOrderTime-@ENDOrderTime)<>0 AND (@THISh <@StartOrderTime OR @THISh > @ENDOrderTime) 
	BEGIN
		RAISERROR( ''超出下单时间段'',16,1)
		RETURN 
	END 
IF dbo.is_Rhz(@DeliveryAt)=1
BEGIN
    RAISERROR( ''送货日期已汇总，不能继续操作'',16,1)
    RETURN 
END

IF @UpdateType=1 
BEGIN
	/*IF (SELECT datedIFf(day,DeliveryAt,getdate()) FROM L_Bill_SaleOrder_Tab WHERE billnumber=@billnumber)>0 
	BEGIN
		RAISERROR( ''送货日期不能小于当前日期'',16,1)
		RETURN 
	END*/
	IF (SELECT ExamineUserCode FROM L_Bill_SaleOrder_Tab WHERE billnumber=@billnumber)>0 
	BEGIN
		RAISERROR( ''此单已审核,不能重复审核'',16,1)
		RETURN 
	END
	IF (SELECT CustomerCode FROM L_Bill_SaleOrder_Tab WHERE billnumber=@billnumber)=''0'' 
	BEGIN
		RAISERROR(''此单无指定客户，不能审核'',16,1)
		RETURN 
	END
	IF (SELECT Count(BillNumber) FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber)=0 
	BEGIN
		RAISERROR( ''此单无数据,不能审核'',16,1)
		RETURN 
	END
	IF (SELECT Count(BillNumber) FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber and num=0)>0 
	BEGIN
		RAISERROR(''此单存在数量为0的商品,不能审核'',16,1)
		RETURN 
	END

	
	/**判断 称重+按量商品是否同时存在**/
	SELECT TOP 1 @RepeatProdcutCode = productCode
		FROM (SELECT ProductCode,Case when SaleType=2 then 0 else SaleType END as saleType FROM L_Bill_SaleOrders_Tab WHERE billNumber=@billnumber and SaleType in (0,2) group by ProductCode,SaleType) x
		GROUP BY productCode, saleType
	HAVING COUNT(*) > 1
	IF  @RepeatProdcutCode is Not NULL
	BEGIN
		SET @ERRMSG = ''货号：''+ @RepeatProdcutCode+'' 是“称重+按量”商品类型，并同时存在两种方式''
		RAISERROR(@ERRMSG,16,1)
		RETURN 
	END;

	

	/**判断 散+件商品是否同时存在**/
	SELECT TOP 1 @RepeatProdcutCode = productCode
		FROM (SELECT ProductCode,Case when SaleType=3 then 1 else SaleType END as saleType FROM L_Bill_SaleOrders_Tab WHERE billNumber=@billnumber and SaleType in (1,3) group by ProductCode,SaleType) x
		GROUP BY productCode, saleType
	HAVING COUNT(*) > 1
	IF  @RepeatProdcutCode is Not NULL
	BEGIN
		SET @ERRMSG = ''货号：''+ @RepeatProdcutCode+'' 是“散+件”商品类型，并同时存在两种方式''
		RAISERROR(@ERRMSG,16,1)
		RETURN 
	END;
	--没有基价的商品用销售价
	UPDATE L_Bill_SaleOrders_Tab SET basePrice = salePrice,salePrice = ROUND(salePrice*@dr,@decimalBit) Where billnumber = @BillNumber AND basePrice IS NULL

	/**更改柜组*/
	UPDATE a SET a.AreaCode=b.AreaCode
		FROM L_Bill_SaleOrders_Tab a,
			(SELECT IdCode,AreaCode FROM L_Basic_Product_Tab 
				WHERE IdCode in (SELECT ProductCode FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber)
			) b 
	WHERE a.billnumber=@billnumber and a.ProductCode=b.IdCode
	/**更改默认供货商*/
	UPDATE a SET a.defaultShipperCode = b.ShipperCode FROM  L_Bill_SaleOrders_Tab a,
		L_Basic_Product_Tab b
	WHERE a.billnumber = @billnumber /*and IsNull(a.defaultShipperCode,0)<=1*/ and a.ProductCode = b.IdCode /*and 
		a.SaleType = b.saleType */
	IF @Enablemanyshipper = 1
	BEGIN
		UPDATE a SET a.defaultShipperCode = b.defaultShipperCode
			FROM L_Bill_SaleOrders_Tab a,
			(SELECT ProductCode,defaultShipperCode,SaleType FROM L_Basic_Customer_Price_Tab WHERE PCode = @PriceCustomerCode and defaultShipperCode>1) b
		WHERE a.billnumber = @billnumber and a.ProductCode = b.ProductCode/* and a.SaleType = b.saleType */

	END
	
	
	UPDATE L_Bill_SaleOrder_Tab 
		SET examineUserCode=@UPDATEuserid,
			examineAt=GETDATE(),
			deliveryat=@deliveryat,
			Status=1 
	WHERE billnumber=@billnumber
	
	UPDATE L_Bill_SaleOrders_Tab 
		SET examineUserCode=@UPDATEuserid,
			CustomerCode=@CustomerCode,
			At=GETDATE(),
			Status=0, 
			deliveryat=@deliveryat
	WHERE billnumber=@billnumber
	
	
	EXEC sp_SaleOrderToSale @BillNumber,@UPDATEuserid  
	--报价
	EXEC Sp_OrderToQuotePrice @CustomerCode,@billnumber,''SALEORDERS''

	IF @UpdateSaleOrderToPurchaseOrder = 1
	BEGIN--自动分流生成采购订单
		EXEC sp_SaleOrderToPurchasOrder  @BillNumber,@UpdateUserid,''''
	END;

END ELSE BEGIN
	 IF (SELECT ExamineUserCode FROM L_Bill_SaleOrder_Tab WHERE billnumber=@billnumber)=0 
	 BEGIN
		RAISERROR(''此单还末审核，不能反签'',16,1)
		RETURN 
	 END
	
	 IF (SELECT count(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber and AcceptStatus>0)>0 
	 BEGIN
		RAISERROR(''订单已存在接单，不能反签'',16,1)
		RETURN 
	 END 

	 IF (SELECT count(*) FROM L_Bill_SaleOrders_Tab WHERE billnumber=@billnumber and ISNULL(DisTributionNum,0)>0)>0 
	 BEGIN
		RAISERROR(''订单已存在配货，不能反签'',16,1)
		RETURN 
	 END 

	 IF (SELECT ExamineUserCode FROM L_Bill_Sale_Tab WHERE billnumber=@DeliveryBillNumber)>1 
	 BEGIN
		RAISERROR(''对应的送货单已完成，不能反签'',16,1)
		RETURN 
	 END
	UPDATE L_Bill_SaleOrder_Tab SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 WHERE billnumber=@billnumber
	UPDATE L_Bill_SaleOrders_Tab SET examineUserCode=0,At=GETDATE(),Status=0 WHERE billnumber=@billnumber
	
	--EXEC sp_SaleOrderUnToSale @BillNumber,@UPDATEuserid	

	--删除对应送货单
	delete L_Bill_Sales_Tab WHERE BillNumber=@DeliveryBillNumber
	delete L_Bill_Sale_Tab WHERE BillNumber=@DeliveryBillNumber
END


SET nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleOrder_Add]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleOrder_Add]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
--  exec sp_Upd_SaleOrder_Add ''XD202401100004'',90002,''2024-01-11'',1,0
CREATE Proc [dbo].[sp_Upd_SaleOrder_Add]
	@CurBillNumber varchar(20),
	@CustomerCode Bigint,
	@DeliveryAt date,
	@UserCode int,
	@UpdateType int as
/* 
***************************************************
	功能：复核销售加单						
	参数：	
			@CurBillNumber :原客户订单号 ,updatetype==1时为空
			@CustomerCode 客户编码
			@deliveryat	:送货日期      
			@UserCode :操作员  
			@updatetype   :复核类型 0 加入原客户订单,1,产生新客户订单
	结果：		
	作者：2020-10-15  张建明
**************************************************
*/

 set nocount on
	DECLARE @AfterDisAllowedAddProduct bit,
			@PriceCustomerCode bigInt,--报价表客户编码
			@PCode Int,
			@dr Float, --折扣
			@decimalBit Int --小数位

	SELECT @AfterDisAllowedAddProduct = AfterDisAllowedAddProduct FROM L_Sys_Parmars_Tab
	IF (Select datediff(day,@DeliveryAt,getdate()))>0 
	BEGIN 
		IF @updatetype = 1 or (SELECT COUNT(*) FROM L_Bill_SaleOrders_Add_Tab where UserCode=@UserCode AND Numex<>replaceNumex)>0
		BEGIN
			RAISERROR( ''超过日期的加单只能以代打的方式处理（并且要合并到对应日期的单据）'',16,1)
			RETURN 
		END;
	END ELSE BEGIN
		IF dbo.is_Rhz(@DeliveryAt)=1
		BEGIN
			RAISERROR( ''加单日期已汇总，不能继续操作'',16,1)
			RETURN 
		 END
	END;

	SELECT @Pcode=Pcode,@dr = Dr,@decimalBit = decimalBit FROM L_Basic_Company_Tab WHERE IdCode = @customerCode
	
    IF @Pcode>0
	BEGIN --如果项目编码不为0，将取价客户设成本项目第一个客户
		SELECT TOP 1 @PriceCustomerCode = IdCode FROM V_Basic_Customer_Tab WHERE PCode = @Pcode Order by IdCode
	END

	 if @AfterDisAllowedAddProduct = 0 --有配货不可以加单，时要检查单据是否有配过货
	 begin
		if (select count(*) from L_Bill_SaleOrders_Tab 	where billnumber = @CurBillNumber and DisTributionUserCode <>0)>0
		begin
			Raiserror( ''合并单号已存在配货，不能合并'',16,1)
			return 
		end;
	end;
	
	if @CustomerCode = 0 
	begin
		Raiserror( ''请指定客户'',16,1)
		return 
	end
	--没有基价的商品用销售价
	UPDATE L_Bill_SaleOrders_Add_Tab SET basePrice = salePrice,salePrice = ROUND(salePrice*@dr,@decimalBit) Where UserCode=@UserCode AND basePrice IS NULL

/*	if (Select datediff(day,@DeliveryAt,getdate()))>0 
	begin
		Raiserror( ''送货日期不能小于当前日期'',16,1)
		return 
	end*/
	if (Select Count(Idkey) from L_Bill_SaleOrders_Add_Tab where UserCode=@UserCode)=0 
	begin
		Raiserror(''没有商品,不能转单'',16,1)
		return 
	end
	if (Select Count(Idkey) from L_Bill_SaleOrders_Add_Tab where UserCode=@UserCode and num=0)>0 
	begin
		Raiserror(''存在数量为0的商品,不能转单'',16,1)
		return 
	end
if @updatetype=0 
begin

	declare @maxKey int --当前最多Ikey的后四位值
			,@Identifying varchar(100) --加单标识
			, @DeliveryBillNumber varchar(20)--送货单号
	set @Identifying = ''加单''+convert(varchar(50),getdate(),120)
	select @DeliveryBillNumber=DeliveryBillNumber from L_Bill_SaleOrder_Tab where BillNumber=@CurBillNumber and ExamineUserCode<>0 and IsNull(DeliveryBillNumber,'''')<>''''
	if (Select datediff(day,@DeliveryAt,getdate()))<=0 AND (Select ExamineUserCode from L_Bill_Sale_Tab where BillNumber = @DeliveryBillNumber)>0 
	begin
		Raiserror(''对应送货单已审核，不能转单'',16,1)
		return 
	end
	Declare @TEMP_ADDTab Table(
		RowId int,
		OrderIdKey Varchar(100),
		AreaCode Int,
		ProductCode VarChar(20),
		Pack Float,
		num Float,
		NumEx Float,
		replaceNumEx Float,
		Costprice Float,
		curSalePrice Float,
		basePrice Float,
		salePrice Float,
		SaleType Int,
		DownUnitType Int,
		DownUnit VarChar(20),
		DownWg VarChar(20),
		Note VarChar(100)
	)
	Declare  @TEMP_TAB Table(
		RowId Int,
		AreaCode int,
		ProductCode varchar(20),
		Pack Float,
		DownUnitType Int,
		Num float,numEx float,replaceNumEx Float,
		Costprice float,
		curSalePrice float,
		basePrice Float,
		salePrice float,SaleType int ,DownUnit varChar(20),DownWg varChar(20),Note varChar(100),defaultShipperCode int
	) 
	--①将加单商品存入临时表
	Insert Into @TEMP_TAB
	select 
			ROW_NUMBER() OVER(Order by IdKey) AS RowId,
			case when isNull(AreaCode,0)=0 then (select areacode from L_Basic_Product_Tab where IdCode = x.ProductCode) else AreaCode end AreaCode,
			ProductCode,Pack,DownUnitType,
			num,NumEx,replaceNumEx,Costprice,curSalePrice,basePrice,salePrice,SaleType,DownUnit,DownWg,Note,defaultShipperCode
		From L_Bill_SaleOrders_Add_Tab x where UserCode=@UserCode

		

	--②根据报价表更改对应默认仓位与供货商
	update a set a.AreaCode=b.AreaCode
			from L_Bill_SaleOrders_Add_Tab a, L_Basic_Product_Tab  b 
		where  a.UserCode=@UserCode and a.ProductCode=b.IdCode

	update a set a.defaultShipperCode = b.defaultShipperCode
		from L_Bill_SaleOrders_Add_Tab a,
		(select ProductCode,defaultShipperCode,SaleType from L_Basic_Customer_Price_Tab where PCode = @PriceCustomerCode and defaultShipperCode>1) b
	where  a.UserCode=@UserCode and a.ProductCode = b.ProductCode and a.SaleType = b.saleType 

	--③更新存在销售订单的商品数量
	update a set a.num = a.num+b.num,a.NumEx=a.NumEx+b.NumEx,a.replaceNumEx = a.replaceNumEx+b.replaceNumEx, a.AcceptStatus=0,DetailNote=@Identifying
	from L_Bill_SaleOrders_Tab a,(
		select * from  @TEMP_TAB x where  Exists (
			select 1 from L_Bill_SaleOrders_Tab where BillNumber = @CurBillNumber and ProductCode=x.ProductCode and SaleType=x.SaleType and Note = x.Note
			)
	) b where a.billnumber=@CurBillNumber and  b.ProductCode=a.ProductCode and b.SaleType=a.SaleType

	--④增加不存在销售订单的商品到到销售订单
	select @maxKey=isnull(max(RIGHT(idkey,4)),0) from L_Bill_SaleOrders_Tab where billnumber = @CurBillNumber
	Insert Into L_Bill_SaleOrders_Tab
	(
		IdKey,BillNumber,AreaCode,CustomerCode,ProductCode,DownUnit,DownWg,SaleType,DownUnitType,defaultShipperCode,Pack,
		Num,NumEx,replaceNumEx,CostPrice,cursaleprice,basePrice, salePrice,ExamineUserCode,At,DeliveryAt,Status,DetailNote,Note
	) 
	Select 
		@CurBillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		@CurBillNumber,areaCode,@CustomerCode,ProductCode,DownUnit,DownWg,SaleType,DownUnitType,defaultShipperCode,Pack,
		Num,NumEx,replaceNumEx,Costprice,curSalePrice,basePrice,salePrice,@UserCode,getdate(),@DeliveryAt,0, @Identifying,Note
	from @TEMP_TAB a where Not Exists (select 1 from L_Bill_SaleOrders_Tab where BillNumber = @CurBillNumber and ProductCode=a.ProductCode and SaleType=a.SaleType  and Note = a.Note)
	
	--⑤操作对应送货单
	if @DeliveryBillNumber<>'''' 
	begin
		--①将加单商品存入临时表以@Identifying为标识
		Insert Into @TEMP_ADDTab select 
				ROW_NUMBER() OVER(Order by IdKey) AS RowId,
				Idkey as OrderIdKey,
				AreaCode,
				ProductCode,
				pack,
				num,
				NumEx,
				replaceNumEx,
				Costprice,
				curSalePrice,
				basePrice,
				salePrice,
				SaleType,
				DownUnitType,
				DownUnit,
				DownWg,
				Note
			From L_Bill_SaleOrders_Tab x
			where Billnumber=@CurBillNumber and DetailNote = @Identifying
		--③更新存在送货单的商品数量
		update a set a.num = b.num,a.NumEx=b.NumEx,a.replaceNumEx=b.replaceNumEx ,DetailNote=@Identifying,a.status = 1, a.DisTributionStatus = CASE WHEN a.DisTributionStatus =0 THEN 0 ELSE 1 END
		from L_Bill_Sales_Tab a,(
			select * from  @TEMP_AddTAB x where  Exists (select 1 from L_Bill_Sales_Tab where BillNumber = @DeliveryBillNumber and  OrderIdKey = x.OrderIdKey)
		) b where a.billnumber=@DeliveryBillNumber and   a.OrderIdKey = b.OrderIdKey
		--④增加不存在送货单的商品到到送货单
		select @maxKey=isnull(max(RIGHT(idkey,4)),0) from L_Bill_Sales_Tab where billnumber = @DeliveryBillNumber     
		Insert Into L_Bill_Sales_Tab
		(
			IdKey,
			OrderIdKey,
			BillNumber,
			AreaCode,
			CustomerCode,
			ProductCode,
			DownUnit,
			DownWg,
			SaleType,
			pack,
			DownUnitType,
			OrderNum,
			Num,
			NumEx,
			replaceNumEx,
			CostPrice,
			cursaleprice,
			basePrice,
			salePrice,
			ExamineUserCode,
			At,
			DeliveryAt,
			Status,
			Note
		) 
		
		Select 
			@DeliveryBillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
			OrderIdKey,
			@DeliveryBillNumber,
			areaCode,
			@CustomerCode,
			ProductCode,
			DownUnit,
			DownWg,
			SaleType,
			pack,
			DownUnitType,
			num as OrderNum,
			Num,
			NumEx,
			replaceNumEx,
			Costprice,
			curSalePrice,
			basePrice,
			salePrice,0,getdate(),
			@DeliveryAt,
			1, --1待配货，--2配送完成
			Note
		from @TEMP_ADDTab x Where Not Exists (select 1 from L_Bill_Sales_Tab where billnumber = @DeliveryBillNumber and OrderIdKey = x.OrderIdKey)
	end;
	--⑥自动分流
	if (select UpdateSaleOrderToPurchaseOrder from L_Sys_Parmars_Tab) = 1
	begin--自动生成采购订单
		exec sp_SaleOrderToPurchasOrder  @CurBillNumber,@UserCode,@Identifying
	end;
end else begin
	declare @tempBillNumber varchar(20),@SaleOrderBillNumber varchar(20)
	select @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_SaleOrder_Tab 
		where convert(char(10),makingAt,120)=convert(char(10),getdate(),120)
	set @SaleOrderBillNumber = ''XD''+RIGHT(convert(varchar(20),getdate(),112),8)+dbo.SetNBit(@tempBillNumber,''0'',4);
	/**临时数据转销售订单*/
	exec sp_SaleOrderAddToSaleOrder @SaleOrderBillNumber,@CustomerCode,@DeliveryAt,@UserCode;
	/**审核销订单*/
    exec sp_Upd_SaleOrder @SaleOrderBillNumber,@DeliveryAt,@UserCode,1
	
end;

delete L_Bill_SaleOrders_Add_Tab where UserCode = @UserCode
set nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_SaleSplit]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_SaleSplit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[sp_Upd_SaleSplit] 
	@BillNumber varchar(20),
	@UserCode int,
	@Note varchar(50)
as 
/* 
***************************************************
	功能：拆分数据转送货单						
	参数：	
			@BillNumber :原送货单号 
			@UserCode :操作员
	结果：
	作者：2019-02-05  张建明
**************************************************
*/
set nocount on
	IF (SELECT COUNT(IDKEY) FROM V_Bill_Sales_Split_Tab WHERE UserCode = @UserCode)=0
	BEGIN
		RAISERROR(''没有拆分数据'',16,1)
		RETURN
	END
	declare @tempBillNumber varchar(20),
			@thisBillNumber varchar(20),
			@OrderBillNumber varchar(20),
			@mchCode varchar(20),
			@CustomerCode bigint,
			@DeliveryAt date,
			@EntryAt date,
			@type int,
			@DisType int,--配送方式
			@Money Float --金额
	SET @DisType = 0 
	SET @type = 2 --为拆分模式
	SET @Money = 0
	Select @CustomerCode=CustomerCode,
		@DeliveryAt=DeliveryAt,
		@EntryAt = EntryAt,
		@OrderBillNumber = OrderBillNumber
	from L_Bill_Sale_Tab 
	where BillNumber=@BillNumber
	
		select @tempBillNumber = isnull(max(RIGHT(billnumber,4)),0)+1 from L_Bill_Sale_Tab 
			where convert(char(10),MakingAt,120)=convert(char(10),@DeliveryAt,120)
		set @thisBillNumber = ''XS''+RIGHT(convert(varchar(20),@DeliveryAt,112),8)+dbo.SetNBit(@tempBillNumber,''0'',4)

		Insert Into L_Bill_Sale_Tab 
		(
			BillNumber,
			OrderBillNumber,
			DeliveryAt,
			CustomerCode,
			MakingUserCode,
			MakingAt,
			ExamineuserCode,
			ExamineAt,
			EntryUserCode,
			EntryAt,
			BillType,
			AlreadyMoney,
			Type,
			DisType,
			Status,
			Note
		) values
		(
			@thisBillNumber,
			@OrderBillNumber,
			@DeliveryAt,
			@CustomerCode,
			@UserCode,
			@DeliveryAt,
			@UserCode,
			@DeliveryAt,
			@UserCode,
			@EntryAt,
			3,
			@Money,
			@type,
			@DisType,
			2,--完成
			@Note
		)
	
	declare @maxKey int --当前最多Ikey的后四位值
	select @maxKey=isnull(max(RIGHT(idkey,4)),0) from L_Bill_Sales_Tab where billnumber = @thisBillNumber
             
	Insert Into L_Bill_Sales_Tab
	(
		IdKey,
		OrderIdKey,
		BillNumber,
		AreaCode,
		CustomerCode,
		ProductCode,
		Pack,
		DownUnit,
		DownWg,
		DownUnitType,
		SaleType,
		OrderNum,
		Num,
		NumEx,
		replaceNumEx,
		ActualCostPrice,
		CostPrice,
		cursaleprice,
		salePrice,
		ExamineUserCode,
		At,
		DeliveryAt,
		EntryAt,
		EntryUserCode,
		Status,
		Note
	) 
	Select 
		@thisBillNumber+''-''+dbo.SetNBit(CAST(@maxKey+RowId as varchar(10)),''0'',4),
		OrderIdKey,
		@thisBillNumber,
		areaCode,
		@CustomerCode,
		ProductCode,
		Pack,
		DownUnit,
		DownWg,
		DownUnitType,
		SaleType,
		numEx as OrderNum,
		Num,
		NumEx,
		replaceNumEx,
		CostPrice,
		Costprice,
		curSalePrice,
		salePrice,@UserCode,getdate(),
		@DeliveryAt,
		@EntryAt,
		@UserCode as EntryUserCode, 
		2, --1待配货，--2配送完成
		Note
	from (
		select 
			ROW_NUMBER() OVER(Order by IdKey) AS RowId,
			Idkey as OrderIdKey,
			AreaCode,
			ProductCode,
			Pack,
			DownUnitType,
			num,
			NumEx,
			0 as replaceNumEx,
			Costprice,
			curSalePrice,
			salePrice,
			SaleType,
			DownUnit,
			DownWg,
			Note
		From V_Bill_Sales_Split_Tab x
		where UserCode=@UserCode
	) a 
	Where not EXISTS (Select 1 from L_Bill_Sales_Tab where billnumber=@thisBillNumber and ProductCode=a.ProductCode) 
	
	Update a SET a.numEx = a.numEx - b.NumEx FROM  L_Bill_Sales_Tab a,(SELECT Idkey,numEx FROM V_Bill_Sales_Split_Tab WHERE UserCode = @UserCode) b where a.billnumber = @BillNumber AND a.Idkey = b.IdKey
	Update a SET a.numEx = a.numEx - b.NumEx FROM  L_Bill_Sales_Tab# a,(SELECT Idkey,numEx FROM V_Bill_Sales_Split_Tab WHERE UserCode = @UserCode) b where a.billnumber = @BillNumber AND a.Idkey = b.IdKey
	
	DELETE  L_Bill_Sales_Tab WHERE billnumber = @BillNumber and numEx = 0
	DELETE  L_Bill_Sales_Tab# WHERE billnumber = @BillNumber and numEx = 0
set nocount off


/****** Object:  StoredProcedure [dbo].[sp_SaleOrderAddToSaleOrder]    Script Date: 2023-11-09 02:06:22 ******/
SET ANSI_NULLS ON
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockChange]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- exec sp_Upd_StockChange ''SC202302230001'',10,1
CREATE PROCEDURE [dbo].[sp_Upd_StockChange] 
    @billnumber VARCHAR(20),
    @updateuserid INT,
    @updatetype INT
AS
/* 
***************************************************
    功能：审核库存变单						
    参数：	
            @billnumber: 单号
            @updateuserid: 操作员
            @updatetype: 类型 1，-1 
    结果：
    更新库存
    作者：2019-02-05  张建明
**************************************************
*/
SET NOCOUNT ON

DECLARE @AccountBookCode INT,
        @AreaCode INT,
        @ChangeAt DATE

SELECT @AccountBookCode = AccountBookCode,
       @AreaCode = AreaCode,
       @ChangeAt = changeAt 
FROM L_Bill_StockChange_Tab 
WHERE billNumber = @billNumber

IF dbo.is_Rhz(@ChangeAt) = 1
BEGIN
    RAISERROR(''损溢日期已汇总，不能继续操作'', 16, 1)
    RETURN 
END

EXEC Sp_CheckSumit ''库存变更'', @BillNumber, @updateType

IF @updatetype = 1
BEGIN
    EXEC Sp_CheckStock ''库存变更'', @BillNumber
    
	DECLARE @StockTemp TABLE (
		AccountBookCode INT, 
		AreaCode INT, 
		ProductCode INT,
		BatchNumber VARCHAR(100),
		AllowedNum DECIMAL(18, 2),
		Money DECIMAL(18, 2),
		avgPrice DECIMAL(18, 8)
	)
            
	INSERT INTO @StockTemp (
		AccountBookCode, 
		AreaCode, 
		ProductCode,
		BatchNumber,
		AllowedNum,
		Money,
		avgPrice
	)
	EXEC Sp_GetDatStock @ChangeAt

    UPDATE L_Bill_StockChange_Tab 
    SET examineUserCode = @updateuserid,
        examineAt = GETDATE(),
        Status = 1 
    WHERE billnumber = @billnumber
    
    UPDATE a
    SET a.AccountBookCode = b.AccountBookCode,
        a.BatchNumber = CONVERT(VARCHAR(10), GETDATE(), 112) + ''-'' + a.idkey 
    FROM L_Bill_StockChanges_Tab a
    INNER JOIN (
        SELECT billnumber, AccountBookCode 
        FROM L_Bill_StockChange_Tab 
        WHERE billnumber = @billnumber
    ) b ON a.billnumber = b.billnumber
    
    
    DELETE L_Bill_StockChanges_Tabs 
    WHERE BillNumber = @billnumber
    
    DECLARE @Idkey VARCHAR(100),
            @MchCode VARCHAR(50),
            @ShipperCode INT,
            @ProductCode VARCHAR(20),
            @ChangeNum DECIMAL(18, 2),
            @BatchNumber VARCHAR(100),
            @costprice DECIMAL(18, 8),
            @examineUserCode INT,
            @At DATETIME,
            @Note VARCHAR(50),
            @RemainingChangeNum DECIMAL(18, 2),
            @StockBatchNumber VARCHAR(100),
            @StockAllowedNum DECIMAL(18, 2),
            @StockAvgPrice DECIMAL(18, 8),
            @AllocatedNum DECIMAL(18, 2)
    
    DECLARE change_cursor CURSOR FOR
    SELECT Idkey, MchCode, AccountBookCode, AreaCode, ShipperCode, ProductCode, ChangeNum, BatchNumber, costprice, examineUserCode, At, Note
    FROM L_Bill_StockChanges_Tab
    WHERE billnumber = @billnumber
    
    OPEN change_cursor
    FETCH NEXT FROM change_cursor INTO @Idkey, @MchCode, @AccountBookCode, @AreaCode, @ShipperCode, @ProductCode, @ChangeNum, @BatchNumber, @costprice, @examineUserCode, @At, @Note
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @RemainingChangeNum = @ChangeNum
        
        IF @ChangeNum > 0
        BEGIN
            INSERT INTO L_Bill_StockChanges_Tabs (
                Idkey,
                MchCode,
                AccountBookCode,
                AreaCode,
                ShipperCode,
                billnumber,
                ProductCode,
                ChangeNum,
                BatchNumber,
                costprice,
                examineUserCode,
                At,
                ChangeAt,
                Note
            )
            VALUES (
                @Idkey,
                @MchCode,
                @AccountBookCode,
                @AreaCode,
                @ShipperCode,
                @billnumber,
                @ProductCode,
                @ChangeNum,
                @BatchNumber,
                @costprice,
                @examineUserCode,
                @At,
                @ChangeAt,
                @Note
            )
        END
        ELSE
        BEGIN
            DECLARE stock_cursor CURSOR FOR
            SELECT BatchNumber, AllowedNum, avgPrice
            FROM @StockTemp
            WHERE AccountBookCode = @AccountBookCode
              AND AreaCode = @AreaCode
              AND ProductCode = @ProductCode
              AND AllowedNum <> 0
            ORDER BY BatchNumber ASC
            
            OPEN stock_cursor
            FETCH NEXT FROM stock_cursor INTO @StockBatchNumber, @StockAllowedNum, @StockAvgPrice
            
            WHILE @@FETCH_STATUS = 0 AND @RemainingChangeNum <> 0
            BEGIN
                IF ABS(@RemainingChangeNum) >= @StockAllowedNum
                BEGIN
                    SET @AllocatedNum = @StockAllowedNum * SIGN(@RemainingChangeNum)
                END
                ELSE
                BEGIN
                    SET @AllocatedNum = @RemainingChangeNum
                END
                
                INSERT INTO L_Bill_StockChanges_Tabs (
                    Idkey,
                    MchCode,
                    AccountBookCode,
                    AreaCode,
                    ShipperCode,
                    billnumber,
                    ProductCode,
                    ChangeNum,
                    BatchNumber,
                    costprice,
                    examineUserCode,
                    At,
                    ChangeAt,
                    Note
                )
                VALUES (
                    @Idkey,
                    @MchCode,
                    @AccountBookCode,
                    @AreaCode,
                    @ShipperCode,
                    @billnumber,
                    @ProductCode,
                    @AllocatedNum,
                    @StockBatchNumber,
                    @StockAvgPrice,
                    @examineUserCode,
                    @At,
                    @ChangeAt,
                    @Note
                )
                
                SET @RemainingChangeNum = @RemainingChangeNum - @AllocatedNum
                
                FETCH NEXT FROM stock_cursor INTO @StockBatchNumber, @StockAllowedNum, @StockAvgPrice
            END
            
            CLOSE stock_cursor
            DEALLOCATE stock_cursor
        END
        
        FETCH NEXT FROM change_cursor INTO @Idkey, @MchCode, @AccountBookCode, @AreaCode, @ShipperCode, @ProductCode, @ChangeNum, @BatchNumber, @costprice, @examineUserCode, @At, @Note
    END
    
    CLOSE change_cursor
    DEALLOCATE change_cursor

    UPDATE L_Bill_StockChanges_Tab 
    SET examineUserCode = @updateuserid,
        At = GETDATE(),
        changeAt = @ChangeAt 
    WHERE billnumber = @billnumber

	EXEC sp_Calculate_Loss @ChangeAt,@updatetype
END

IF @updatetype = -1
BEGIN
    UPDATE L_Bill_StockChange_Tab 
    SET examineUserCode = 0,
        ExamineAt = GETDATE(),
        Status = 0 
    WHERE billnumber = @billnumber
    
    UPDATE L_Bill_StockChanges_Tab 
    SET examineUserCode = 0,
        At = GETDATE()
    WHERE billnumber = @billnumber
    
	EXEC sp_Calculate_Loss @ChangeAt,@updatetype

    DELETE L_Bill_StockChanges_Tabs 
    WHERE BillNumber = @billnumber
END



SET NOCOUNT OFF
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockReceive]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockReceive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[sp_Upd_StockReceive] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核领用						
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on
 
  if dbo.is_Rhz(Getdate())=1
 begin
    Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
    return 
 end
 exec Sp_CheckSumit ''领用'',@BillNumber,@UpdateType
declare	@AccountBookCode int,
		@AreaCode int
select 
	@AccountBookCode = AccountBookCode,
	@AreaCode	= AreaCode
from L_Bill_StockReceive_Tab where billNumber = @billNumber

if @updatetype=1 
begin
	exec Sp_CheckStock ''领用'',@BillNumber

	Update L_Bill_StockReceive_Tab set examineUserCode=@updateuserid,examineAt=GETDATE(),Status=1 where billnumber=@billnumber;

	update L_Bill_StockReceives_Tab set examineUserCode=@updateuserid,At=GETDATE() where billnumber=@billnumber

	update a set a.AccountBookCode=b.AccountBookCode from L_Bill_StockReceives_Tab a,
		(Select billnumber,AccountBookCode from L_Bill_StockReceive_Tab where billnumber=@billnumber) b 
	where a.billnumber=b.billnumber

	if @AreaCode<>0
	begin
		update L_Bill_StockReceives_Tab set AreaCode=@AreaCode where billnumber=@billnumber
	end else 
	begin
		update a set a.AreaCode=b.AreaCode from L_Bill_StockReceives_Tab a,L_Basic_Product_Tab b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	
end;


if @updatetype=-1
begin
	update L_Bill_StockReceive_Tab set examineUserCode=0,ExamineAt=GETDATE(),Status=0 where billnumber=@billnumber
	update L_Bill_StockReceives_Tab set examineUserCode=0,At=GETDATE() where billnumber=@billnumber	
end


set nocount off





' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockSplit]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockSplit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--exec sp_Upd_StockChange ''SC202302230001'',10,1

CREATE Proc [dbo].[sp_Upd_StockSplit] 
	@billnumber Varchar(20),
	@UPDATEuserid int,
	@UPDATEtype int as
/* 
***************************************************
	功能：审核商品加工单						
	参数：	
			@billnumber:单号
			@UPDATEuserid :操作员
			@UPDATEtype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 SET nocount on
 


declare	@AccountBookCode int,@AreaCode int,@ChangeAt date
		
SELECT @AccountBookCode = AccountBookCode,@AreaCode	= AreaCode,@ChangeAt  = changeAt FROM L_Bill_StockSplit_Tab where billNumber = @billNumber
IF dbo.is_Rhz(@ChangeAt)=1
BEGIN
Raiserror( ''加工日期已汇总，不能继续操作'',16,1)
return 
END;

IF @UPDATEtype=1 
BEGIN
	UPDATE L_Bill_StockSplit_Tab SET examineUserCode=@UPDATEuserid,examineAt=GETDATE(),Status=1 where billnumber=@billnumber;
	UPDATE L_Bill_StockSplits_Tab SET examineUserCode=@UPDATEuserid,At=GETDATE(),changeAt = @ChangeAt where billnumber=@billnumber
	UPDATE L_Bill_StockSplits_TabS SET examineUserCode=@UPDATEuserid,At=GETDATE(),changeAt = @ChangeAt where billnumber=@billnumber
	IF @AreaCode<>0
	BEGIN
		UPDATE L_Bill_StockSplits_Tab SET AreaCode=@AreaCode where billnumber=@billnumber
		UPDATE L_Bill_StockSplits_Tabs SET AreaCode=@AreaCode where billnumber=@billnumber
	END else 
	BEGIN
		UPDATE a SET a.AreaCode=b.AreaCode FROM L_Bill_StockSplits_Tab a,L_Basic_Product_Tab b where a.billnumber=@billnumber and a.ProductCode=b.IdCode
		UPDATE a SET a.AreaCode=b.AreaCode FROM L_Bill_StockSplits_Tabs a,L_Basic_Product_Tab b where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	END
END;

IF @UPDATEtype=-1
BEGIN
	UPDATE L_Bill_StockSplit_Tab SET examineUserCode=0,ExamineAt=GETDATE(),Status=0 where billnumber=@billnumber
	UPDATE L_Bill_StockSplitS_Tab SET examineUserCode=0,At=GETDATE()where billnumber=@billnumber	
	UPDATE L_Bill_StockSplitS_TabS SET examineUserCode=0,At=GETDATE()where billnumber=@billnumber	
END

/*计算平均成本*/
exec sp_CalcSalePirce @ChangeAt
SET nocount off
' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Upd_StockSwap]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Upd_StockSwap]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE Proc [dbo].[sp_Upd_StockSwap] 
	@billnumber Varchar(20),
	@updateuserid int,
	@updatetype int as
/* 
***************************************************
	功能：审核商品拆零					
	参数：	
			@billnumber:单号
			@updateuserid :操作员
			@updatetype :类型1，-1 
	结果：
		更新 库存
	作者：2019-02-05  张建明
**************************************************
*/
 set nocount on
 
  if dbo.is_Rhz(Getdate())=1
 begin
    Raiserror( ''操作日期已汇总，不能继续操作'',16,1)
    return 
 end
 
declare	@AccountBookCode int,			--分店
		@AreaCode int,			--仓位
		@AllowedExceedStock bit,--允许负库存
		@OutNotCalclStock bit,	--不计算库存
		@errstr Varchar(100),	--出错信息
		@goodsinfo Varchar(100), --商品信息
		@goodsCount int			--行数
		
select @AccountBookCode = AccountBookCode,@AreaCode	= AreaCode from L_Bill_StockSwap_Tab where billNumber = @billNumber
select @AllowedExceedStock =AllowedExceedStock,	@OutNotCalclStock=OutNotCalclStock from L_Sys_Parmars_Tab	

if @updatetype=1 
begin
	if (Select ExamineUserCode from L_Bill_StockSwap_Tab where billnumber=@billnumber)>0 
	begin
		Raiserror( ''此单已审核,不能重复审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_StockSwaps_Tab where billnumber=@billnumber)=0 
	begin
		Raiserror( ''此单无数据,不能审核'',16,1)
		return 
	end
	if (Select Count(BillNumber) from L_Bill_StockSwaps_Tab where billnumber=@billnumber and Num=0)>0 
	begin
		Raiserror(''此单存在数量为0的商品,不能审核'',16,1)
		return 
	end

	if (Select count(*) From L_Bill_StockSwaps_Tab where  billnumber=@billnumber Group By ProductCode Having Count(ProductCode)>1)>1
	begin
		Raiserror(''商品名重复,不能审核'',16,1)
		return 
	end;
	
	declare @TotalMoney float
	select @TotalMoney=Sum(num*costprice) from L_Bill_StockSwaps_Tab where billnumber=@billnumber

	Update L_Bill_StockSwap_Tab set examineUserCode=@updateuserid,examineAt=GETDATE(),Status=1,costMoney=@TotalMoney where billnumber=@billnumber;

	update L_Bill_StockSwaps_Tab set examineUserCode=@updateuserid,At=GETDATE()where billnumber=@billnumber

	/*更改明细中的仓位，如果无指定仓位自动取商品资料设定的*/
	if @AreaCode<>0
	begin
		update L_Bill_StockSwaps_Tab set AreaCode=@AreaCode where billnumber=@billnumber
	end else 
	begin
		update a set a.AreaCode=b.AreaCode
			from L_Bill_StockSwaps_Tab a,
				(Select IdCode,AreaCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_StockSwaps_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	end
	/*更新供货商，自动取商品资料设定的*/
	update a set a.ShipperCode=b.ShipperCode
			from L_Bill_StockSwaps_Tab a,
				(Select IdCode,ShipperCode from L_Basic_Product_Tab 
					where IdCode in (select ProductCode from L_Bill_StockSwaps_Tab where billnumber=@billnumber)
				) b 
		where a.billnumber=@billnumber and a.ProductCode=b.IdCode
	
	declare @TempStockList Table(
		[Idkey] [varchar](50) NOT NULL,
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL,
		[outnum] [float] NOT NULL,
		[stocknum] [float] NOT NULL
	)
	declare @TempTabs Table (
		[Idkey] [varchar](50) NOT NULL,
		[billnumber] [varchar](20) NOT NULL,
		[AccountBookCode] [int] NOT NULL,
		[areaCode] [int] NOT NULL,
		[ShipperCode] [bigint] NULL,
		[ProductCode] [varchar](20) NOT NULL,
		[num] [float] NOT NULL,
		[costprice] [float] NOT NULL,
		[Money] [float] NOT NULL,
		[examineUserCode] [int] NOT NULL,
		[At] [datetime] NOT NULL,
		[BatchNumber] [varchar](100) NULL,
		[note] [varchar](50) NOT NULL
	)

	Insert into @TempTabs	
		select Idkey,
			billNumber,
			AccountBookCode,
			AreaCode,
			ShipperCode,
			productCode,
			Num,
			CostPrice,
			Num*costprice,
			examineUserCode,
			At,
			'''' as BatchNumber,
			isNull(Note,'''')
		From L_Bill_StockSwaps_Tab where BillNumber=@BillNumber
	
	/**判断是否可拆零**/
	select	@goodsCount = count(idkey),
			@goodsinfo=
				''品名：''+min(name)+char(10)+
				''规格：''+min(IsNull(spec,''''))+char(10)+char(10)
	from V_Bill_StockSwaps_Tab a where a.billnumber = @billnumber and Not Exists(
		select 1 from L_Basic_Product_Comb_Tab where PCode = a.ProductCode
	) group by productCode
	if @goodsCount >0 
	begin
		Set  @Errstr = @goodsinfo+''无设置拆零参数，不能拆零''
		Raiserror(@Errstr,16,1)
		return 
	end;

		insert into @TempStockList (Idkey,ProductCode,num,outnum,stocknum)
		select a.Idkey,a.ProductCode,isnull(b.num,0)-a.num as num,a.num,isnull(b.num,0) from 
		(
			select Idkey,AccountBookCode,areaCode,ProductCode,abs(Num) as num from @TempTabs 
		) a left join (
			select AccountBookCode,areaCode,ProductCode,SUM(num) as num from v_Stock_Tab a
			Where EXISTS (
				Select 1 from @TempTabs 
				where AccountBookCode	=	a.AccountBookCode and 
					AreaCode	=	a.AreaCode	and 
					ProductCode	=	a.ProductCode
			)  group by AccountBookCode,areaCode,ProductCode
		) b on  a.AccountBookCode=b.AccountBookCode and a.areaCode=b.areaCode and a.ProductCode=b.ProductCode 

		if /*@AllowedExceedStock = 0 and */(Select Count(ProductCode) from @TempStockList where num<0)>0 --不允许负库存
		begin
			Select @goodsinfo=
				''品名：''+name+char(10)+
				''规格：''+spec+char(10)+
				''可用数量：''+CAST(stocknum as varchar(10))+char(10)+
				''拆零数量：''+CAST(outnum as varchar(10))+char(10)+char(10) 
			from (select * from @TempStockList where num<0) a,L_Basic_Product_Tab b where a.ProductCode = b.IdCode
			Set  @Errstr = @goodsinfo+''商品库存不足，不能拆零''
			Raiserror(@Errstr,16,1)
			return 
		end
	/**将拆出商品成本价设成此商品的最后平均成本**/
	update a set a.costprice = b.AvgCostPrice  from L_Bill_StockSwaps_Tab a,L_Basic_Product_Tab b where a.billnumber = @billnumber and a.ProductCode = b.IdCode
	--拆出数据
    insert into L_Bill_StockSwaps_Tabs (
			IdKey,
			billnumber,
			ShipperCode,
			AccountBookCode,
			AreaCode,
			Type,
			ProductCode,
			Num,
			BatchNumber,
			costprice,
			examineUserCode,
			At,
			Note)
		select idkey,billnumber,ShipperCode,AccountBookCode,AreaCode,-1 as type,ProductCode,num,'''',costprice,examineUserCode,at,Note from L_Bill_StockSwaps_Tab where billnumber=@billnumber
	--拆入数据
	 insert into L_Bill_StockSwaps_Tabs (
			IdKey,
			billnumber,
			ShipperCode,
			AccountBookCode,
			AreaCode,
			Type,
			ProductCode,
			Num,
			BatchNumber,
			costprice,
			examineUserCode,
			At,
			Note)
	select a.IdKey+''-0001'',
			billnumber,
			ShipperCode,
			a.AccountBookCode,
			AreaCode,
			1,
			b.ProductCode,
			a.Num*b.Num as Num,
			BatchNumber,
			a.Money/(a.Num*b.Num) as CostPrice,
			examineUserCode,
			At,
			a.Note
	From @TempTabs a,L_Basic_Product_Comb_Tab b where billnumber = @BillNumber and a.ProductCode = b.PCode
	
	update a  set a.AvgCostPrice =b.costprice from   L_Basic_Product_Tab a,L_Bill_StockSwaps_Tabs b where b.billnumber=@billnumber and Type=1 and a.idcode = b.ProductCode	
	 --更新成本单价
	/*update a set a.CostPrice =b.CostPrice
	from L_Bill_StockSwaps_Tab a,
		   (Select 
				billnumber,
				ProductCode,
				sum(Num*CostPrice)/sum(Num) as CostPrice 
			from L_Bill_StockSwaps_Tabs 
			where billnumber=@billnumber and type = -1 Group by billnumber,ProductCode
	) b where a.billnumber=b.billnumber and a.ProductCode=b.ProductCode
	*/
end;

if @updatetype=-1
begin
	 if (Select ExamineUserCode from L_Bill_StockSwap_Tab where billnumber=@billnumber)=0 
	 begin
		Raiserror(''此单还末审核，不能反签'',16,1)
		return 
	 end
	 
	if (Select DATEDIFF(day,examineAt,Getdate()) from L_Bill_StockSwap_Tab where billnumber=@billnumber)<>0 
	 begin
		Raiserror(''只能反签当天的当据，操作失败'',16,1)
		return 
	 end 
	 
	update L_Bill_StockSwap_Tab 
			set examineUserCode=0,
			ExamineAt=GETDATE(),
			Status=0 
	where billnumber=@billnumber
	
	update L_Bill_StockSwaps_Tab 
			set examineUserCode=0,
			At=GETDATE()
	where billnumber=@billnumber	
	
	delete L_Bill_StockSwaps_Tabs where BillNumber = @billnumber	 
end

/*计算平均成本*/
declare @DeliveryAt smalldatetime
select @DeliveryAt = convert(char(10),at,120) from L_Bill_StockSwaps_Tabs where BillNumber = @BillNumber
exec sp_CalcSalePirce @DeliveryAt
set nocount off

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdatePower]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sp_UpdatePower]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[Sp_UpdatePower]
	@LevelADetailJson varchar(max),
	@LevelBDetailJson varchar(max),
	@LevelCDetailJson varchar(max),
	@LevelDDetailJson varchar(max)
as 
/*
更新权限
	@LevelADetailJson varchar(max),
	@LevelADetailJson varchar(max),
	@LevelADetailJson varchar(max),
	@LevelADetailJson varchar(max)
*/		declare @CommandSql varchar(max)
		exec Hr_Sp_parseJSON @LevelADetailJson,@CommandSql output
		set @CommandSql = ''select * into ##LevelaA from ( ''+ @CommandSql +'') a''
		exec (@CommandSql)

		update a set a.vis = b.checked from L_Nav_Func_Header_Tab a,##LevelaA b where a.idkey = b.idkey

		if OBJECT_ID(N''##LevelaA'',N''U'') is not null
		begin
			drop table ##LevelaA
		end;

		exec Hr_Sp_parseJSON @LevelBDetailJson,@CommandSql output
		set @CommandSql = ''select * into ##LevelaB from ( ''+ @CommandSql +'') a''
		exec (@CommandSql)

		update a set a.vis = b.checked from L_Nav_Func_Detail_Tab a,##LevelaB b where a.idkey = b.idkey

		if OBJECT_ID(N''##LevelaB'',N''U'') is not null
		begin
			drop table ##LevelaB
		end;

		exec Hr_Sp_parseJSON @LevelCDetailJson,@CommandSql output
		set @CommandSql = ''select * into ##LevelaC from ( ''+ @CommandSql +'') a''
		exec (@CommandSql)

		update a set a.vis = b.checked from L_Nav_Func_Detail_children_Tab a,##LevelaC b where a.idkey = b.idkey

		if OBJECT_ID(N''##LevelaC'',N''U'') is not null
		begin
			drop table ##LevelaC
		end;

		exec Hr_Sp_parseJSON @LevelDDetailJson,@CommandSql output
		set @CommandSql = ''select * into ##LevelaD from ( ''+ @CommandSql +'') a''
		exec (@CommandSql)

		update a set a.vis = b.checked from L_Nav_Func_Power_Tab a,##LevelaD b where a.idkey = b.idkey

		if OBJECT_ID(N''##LevelaD'',N''U'') is not null
		begin
			drop table ##LevelaD
		end;

set noCount off



' 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_UpdateStock]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SP_UpdateStock]
    @UpdateType VARCHAR(20),
    @BillNumber VARCHAR(20),
    @UpdateAction INT
AS
/*
***************************************************
    功能：更新库存表
    参数：
        @UpdateType VARCHAR(20) - 更新类型：''Purchase'' 采购入库，''Sale'' 销售出库，''StockChange'' 库存变更
        @BillNumber VARCHAR(20) - 单据号
        @UpdateAction INT        - 操作类型：1 审核（正向操作），-1 返审核（反向操作）
    结果：
    作者：2019-02-05  张建明
**************************************************
*/

SET NOCOUNT ON
SET ANSI_WARNINGS OFF

-- 采购入库更新库存
IF @UpdateType = ''Purchase''
BEGIN
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        AccountBookCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        AccountBookCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_Purchases_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.AccountBookCode = b.AccountBookCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num + b.numEx * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            AccountBookCode,
            numEx,
            BatchNumber,
            costprice
        FROM L_Bill_Purchases_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.AccountBookCode = b.AccountBookCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE IF @UpdateType = ''Sale''
BEGIN
    -- 销售出库/退库更新库存
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        AccountBookCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        AccountBookCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_Sales_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.AccountBookCode = b.AccountBookCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num - b.numEx * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            AccountBookCode,
            numEx,
            BatchNumber,
            costprice
        FROM L_Bill_Sales_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.AccountBookCode = b.AccountBookCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE IF @UpdateType = ''StockChange''
BEGIN
    -- 库存变更单更新库存
    -- 插入不存在的库存记录
    INSERT INTO L_Stock_Tab (
        ProductCode,
        AreaCode,
        AccountBookCode,
        Num,
        BatchNumber,
        CostPrice
    )
    SELECT 
        ProductCode,
        AreaCode,
        AccountBookCode,
        0,
        BatchNumber,
        costprice
    FROM L_Bill_StockChanges_Tab a
    WHERE BillNumber = @BillNumber
      AND NOT EXISTS (
          SELECT 1 
          FROM L_Stock_Tab b 
          WHERE a.ProductCode = b.ProductCode
            AND a.AccountBookCode = b.AccountBookCode
            AND a.AreaCode = b.AreaCode
            AND a.BatchNumber = b.BatchNumber
      )
    
    -- 更新所有库存记录（包括刚插入的）
    UPDATE a
    SET a.Num = a.Num + b.num * @UpdateAction,
        a.CostPrice = b.costprice
    FROM L_Stock_Tab a
    INNER JOIN (
        SELECT 
            ProductCode,
            AreaCode,
            AccountBookCode,
            num,
            BatchNumber,
            costprice
        FROM L_Bill_StockChanges_Tab a
        WHERE BillNumber = @BillNumber
    ) b ON a.ProductCode = b.ProductCode
       AND a.AccountBookCode = b.AccountBookCode
       AND a.AreaCode = b.AreaCode
       AND a.BatchNumber = b.BatchNumber
END
ELSE
BEGIN
    -- 其他类型的库存更新（可根据需要扩展）
    RAISERROR(''不支持的更新类型: %s'', 16, 1, @UpdateType)
    RETURN
END

SET NOCOUNT OFF
SET ANSI_WARNINGS ON
' 
END
GO
/****** Object:  View [dbo].[V_Basic_Customer_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Customer_Tab]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Basic_Customer_Tab]
AS
SELECT     IdCode,PCode, 
	(select name from L_Basic_Project_Tab where idcode = Pcode) as ProjectName,
	selfCode, Addr, Tel, Note, Person, RelationCode, picSrc,QualityGrade,LossAllocation, 
		Name,ShortName, PymCode, CateCode, SettlementType, AccountDay,Dr,decimalBit,SaleFromQuotePrice,
		 SalesMan, InsUserCode, InsAt, EditUserCode, EditAt, PriceLevel,DownUnitType,
		CASE WHEN DownUnitType = 1 THEN ''公斤'' ELSE ''斤'' END as  DownUnit, Status, 
                     DeliveryAt, wxCode, AreaCode,startAt,endAt,watchOrder,
					 0 as ExamineUserCode,subscribemessagenum,lineName,notAddPrice,ChangeAblePrice,LookProductType,
		(select name from L_Sys_LtdList_Tab where IdCode = x.RelationCode) as RelationName
FROM         dbo.L_Basic_Company_Tab x
WHERE     (IdCode = 0 OR IdCode > 90000)























' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_TabEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_TabEx]'))
EXEC dbo.sp_executesql @statement = N'









Create VIEW [dbo].[V_Bill_Sales_TabEx]
AS
/**
	销售明细表（外帐）
**/
	SELECT  a.Idkey, 
			a.billnumber, 
			a.OrderIdKey,
			(select OrderBillNumber From L_Bill_Sale_Tab Where BillNumber = a.BillNumber) as OrderBillNumber,
			a.CustomerCode, 
			a.ProductCode, 
			a.DoubleNumBase, --如果为SaleType=4有效公斤计算，基数为2
			a.DoubleNumExBase, --如果为公斤计算，基数为2
			a.PackBase, --件转散基数
			a.DownUnit,
			a.DownWg,
			a.SaleType,
			a.DownUnitType,
			a.num, 
			a.numEx,
			((a.numEx-a.replaceNumEx) * CASE WHEN b.SaleType = 3 THEN b.Pack ELSE CASE WHEN b.SaleType = 4 THEN 2 ELSE 1 END END ) as ExChangeNumEx,
			a.curSalePrice,
			a.costprice, 
			a.salePrice, 
			ROUND(a.salePrice/c.Dr,2) as CurDrSalePrice,
			a.examineUserCode, 
			a.At, 
			a.EntryUserCode,
			a.EntryAt,
			a.DeliveryAt, 
			a.Status, 
			a.Note, 
			a.detailNote,
			a.lossNote,
			b.BarCode, 
			b.SelfCode, 
			b.IdCode, 
			b.PymCode, 
			--b.Name, 
			case when (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType)=0 then
				b.Name 
			else 
				(select top 1 AliasName from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType) 
			end name,
			case when (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode)=0 then
				b.IdCode 
			else 
				(select top 1 CustomerProcudeCode from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode) 
			end CustomerProcudeCode,
			b.Spec,
			b.Name+b.Spec as ng, 
			Case When a.SaleType =3 then b.PUnit Else  Case When a.SaleType = 4  or a.SaleType = 2 then c.DownUnit else b.Unit end end Unit,
			b.PUnit,
			b.inPrice, 
			b.PicSrc, 
			a.OrderNum, 
			a.MchCode, 
			a.AccountBookCode, 
			a.AreaCode, 
			b.Brand, 
			b.Origin, 
			a.Pack, 
			a.StockNum, 
			b.Price2, 
			b.price3, 
			b.Price4, 
			b.price5, 
			a.BillType, 
			a.Profit, 
			a.ActualCostPrice, 
			a.ShipperCode, 
			a.BatchNumber, 
			a.BoxNum, 
			a.DispNum,
			a.DisTributionNum,
			a.DisTributionAt,
			a.DisTributionChecked, 
			a.DisTributionUserCode,
			a.BoxPrice, 
			a.CheckReportsFileNames,
			a.CheckReportsAsCode,
			b.CateCode,
			a.replaceNumEx,
			a.DisTributionStatus,
			(select Name From L_Basic_Cate_Tab Where IdCode = b.CateCode) as CateName,
			a.PlaceholderNote
	FROM L_Bill_Sales_TabEx a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
	 Left Join V_Basic_Customer_Tab c on a.CustomerCode = c.idcode

' 
GO
/****** Object:  View [dbo].[V_Customer_Favorite_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Favorite_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [dbo].[V_Customer_Favorite_Tab] as 

	SELECT a.IdKey,a.PCode,a.ProductCode,a.SaleType,b.IdCode,b.AreaCode,b.CateCode,b.BarCode,b.Name,b.AliasName,b.Spec,b.Unit,b.PUnit,b.DownWgSpec,
	b.doMethod,b.Pack,b.PicSrc,b.inPrice,b.Price1,b.Status,b.Note FROM L_Customer_Favorite_Tab a,L_Basic_Product_Tab b WHERE	a.ProductCode = b.IdCode



' 
GO
/****** Object:  View [dbo].[V_Prodcut_From_Favorite]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Prodcut_From_Favorite]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[V_Prodcut_From_Favorite] as
/**收藏的商品 */

select IdKey, PCode,AreaCode,CateCode,IdCode,BarCode,Name,AliasName,Spec,
	Case When SaleType=3 THEN PUnit Else Unit End Unit,
	Case When SaleType=3 THEN PUnit Else Unit End DownUnit,
	PUnit,SaleType,DownWgSpec,doMethod,Pack,PicSrc, 
	Case When SaleType=3 THEN inPrice*Pack Else inPrice END AS InPrice,
	Price1,Status,Note, case when saleType =2 then ''0/2'' else '''' end SaleTypeList,
	case when saleType =2 then Unit+''/''+PUnit else '''' end DownUnitList 
from  V_Customer_Favorite_Tab where Status<2 
Union All
select  IdKey,PCode,AreaCode,CateCode,IdCode,BarCode,Name,AliasName,Spec,Unit,Unit As DownUnit,PUnit,1 as SaleType,
DownWgSpec,doMethod,Pack,PicSrc,inPrice,Price1,Status,Note,'''' as SaleTypeList,'''' as DownUnitList 
from V_Customer_Favorite_Tab where SaleType = 3 and  Status<2 



' 
GO
/****** Object:  View [dbo].[V_Shipper_DisDetail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_DisDetail_Tab]'))
EXEC dbo.sp_executesql @statement = N'





/*供货商配货明细*/

CREATE VIEW [dbo].[V_Shipper_DisDetail_Tab]
AS
SELECT  a.Idkey, 
		a.BillNumber, 
		a.SaleOrderBillNumber,
		a.CustomerCode,
		(select ''[''+SelfCode+''-''+ShortName+'']'' from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		case when a.CustomerCode = 0 then ''备用存货'' else  
		(select ShortName from V_Basic_Customer_Tab where IdCode = a.CustomerCode) end as CustomerName, 
		(select DeliveryAt from V_Basic_Customer_Tab where IdCode = a.CustomerCode)  as DisAt,
		(select ShipperCode From L_Bill_PurchaseOrder_Tab where BillNumber = a.BillNumber) as ShipperCode,
		a.ProductCode,
		a.DeliveryAt,
		a.num, 
		a.NumEx,
		b.Name, 
		b.Spec,
		b.Unit, 
		b.PUnit,
		a.SaleType,
		CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
		a.DownWg,
		b.PicSrc, 
		a.costPrice,
		b.CateCode,
		a.qualityGrade,
		a.Note
FROM  dbo.L_Bill_PurchaseOrders_Tab# a INNER JOIN
                      dbo.L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
































' 
GO
/****** Object:  View [dbo].[V_Bill_Purchases_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchases_Tab]'))
EXEC dbo.sp_executesql @statement = N'

--视图

CREATE VIEW [dbo].[V_Bill_Purchases_Tab]
	AS
	SELECT  b.IdCode, 
			b.BarCode, 
			b.SelfCode, 
			b.PymCode, 
			b.Name, 
			b.Spec, 
			b.Name + b.Spec AS ng, 
			b.Unit, 
			b.PUnit,
			a.DownUnit,
			a.DownWg,
			a.SaleType,
			b.PicSrc, 
			a.Idkey, 
			a.MchCode, 
			a.billnumber, 
			(select OrderBillNumber from L_Bill_Purchase_Tab where BillNumber = a.billnumber) as OrderBillNumber,
			a.ShipperCode, 
			a.ProductCode, 
			a.num, 
			a.numEx,
			a.qualitygrade,
			a.OpenNum,
			a.OpenCostPrice,
			a.PackLose,
			a.Expense,
			a.costprice, 
			a.salePrice, 
			a.mrUserCode,
			a.MrAt,
			a.examineUserCode, 
			a.At, 
			a.DeliveryAt,
			a.settlementAt, 
			a.Status, 
			a.Note, a.OrderNum, a.AccountBookCode, a.AreaCode, b.Price1, b.Price2, b.price3, b.Price4, b.price5, b.Brand, b.Origin, 
						  a.StockNum, a.VipPrice, a.BillType, b.Pack, a.BatchNumber, a.ActualCostPrice, a.boxNum, a.DispNum, a.BoxPrice, b.CateCode,
			Case When a.SaleType = 2 THEN
				Cast((SELECT STUFF(/*列数据转成行字符串*/
				( SELECT   '','' + cast(num as varchar(10))+''/''+cast(numex as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
					WHERE BillNumber = (select OrderBillNumber From L_Bill_Purchase_Tab where BillNumber=a.BillNumber) and SaleType=a.SaleType and ProductCode = a.ProductCode
				  FOR XML PATH('''')
				 ), 1, 1, '''')) as varchar(500))
			ELSE 
				Cast((SELECT STUFF(/*列数据转成行字符串*/
				( SELECT   '','' + cast(num as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
					WHERE BillNumber = (select OrderBillNumber From L_Bill_Purchase_Tab where BillNumber=a.BillNumber)  and SaleType=a.SaleType and ProductCode = a.ProductCode
				  FOR XML PATH('''')
				 ), 1, 1, ''''))  as varchar(500))
			END as NumList 
	FROM    (    
		select * from L_Bill_Purchases_Tab Union All
		select * from L_Bill_Purchases_Tab# 

	) a left JOIN dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode



' 
GO
/****** Object:  View [dbo].[V_Stock_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Tab]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[V_Stock_Tab] 
AS
/***
    计算得到库存表数量
    最后一日汇总数 + 采购 - 销售 + 损溢 - 仓位调拨 + 拆零 - 领用
***/
WITH BaseDate AS (
    SELECT TOP 1 CONVERT(VARCHAR(10), dat - 1, 120) AS At
    FROM l_sys_GroupInf_Tab
)
SELECT AccountBookCode, 
       AreaCode, 
       ProductCode,
       BatchNumber,
       CAST(SUM(Num) AS DECIMAL(18, 2)) AS Num,
       SUM(Money) AS Money,
       CASE WHEN CAST(SUM(Num) AS DECIMAL(18, 2)) = 0 
            THEN 0 
            ELSE SUM(Money) / SUM(Num) 
       END AS CostPrice  
FROM (
    -- 最后一日汇总数
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, EndNum AS Num, EndMoney AS Money
    FROM L_Group_InOut_tab
    WHERE at = (SELECT At FROM BaseDate)

    UNION ALL
    
    -- 采购(包括冲红)
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, numEx AS Num, numEx * CostPrice AS Money
    FROM V_Bill_Purchases_Tab
    WHERE DeliveryAt > (SELECT At FROM BaseDate)
      AND MrUserCode > 0
    
    UNION ALL
    
    -- 销售
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber,
           numEx * -1 * DoubleNumExBase * PackBase AS Num,
           numEx * CostPrice * -1 AS Money 
    FROM L_Bill_Sales_Tabs
    WHERE DeliveryAt > (SELECT At FROM BaseDate)
		AND examineUserCode >0

    UNION ALL
    
    -- 变更
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, ChangeNum AS Num, ChangeNum * CostPrice AS Money
    FROM L_Bill_StockChanges_Tabs
    WHERE changeAt > (SELECT At FROM BaseDate)
    
    UNION ALL
    
    -- 仓位调拨
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * (ExChangeType * -1) AS Num, num * (ExChangeType * -1) * CostPrice AS Money
    FROM L_Bill_AreaExChanges_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 拆零
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * Type AS Num, num * Type * CostPrice AS Money
    FROM L_Bill_StockSwaps_Tabs
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 领用
    SELECT AccountBookCode, AreaCode, ProductCode, '''' as BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockReceives_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 加工出
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num * -1 AS Num, num * -1 * CostPrice AS Money
    FROM L_Bill_StockSplits_Tab
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
    
    UNION ALL
    
    -- 加工入
    SELECT AccountBookCode, AreaCode, ProductCode, BatchNumber, num AS Num, num * CostPrice AS Money
    FROM L_Bill_StockSplits_TabS
    WHERE CONVERT(VARCHAR(10), At, 120) > (SELECT At FROM BaseDate)
      AND examineUserCode > 0
) x
GROUP BY AccountBookCode, AreaCode, ProductCode, BatchNumber






' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tab]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Bill_Sales_Tab]
AS
/**
    销售明细表（包括扩展表）
**/
WITH OrderInfo AS (
    SELECT BillNumber, OrderBillNumber, Note AS OrderNote
    FROM L_Bill_Sale_Tab
)
SELECT a.Idkey, 
       a.billnumber,
       a.customerOrderId, 
       a.OrderIdKey,
       o.OrderBillNumber,
       o.OrderNote,
       a.CustomerCode, 
       c.Pcode,
       a.ProductCode, 
       a.DoubleNumBase,
       a.DoubleNumExBase,
       a.PackBase,
       a.DownUnit,
       a.DownWg,
       a.SaleType,
       a.DownUnitType,
       a.num, 
       a.numEx,
       (a.numEx - a.replaceNumEx) * CASE WHEN a.SaleType = 3 THEN p.Pack ELSE CASE WHEN a.SaleType = 4 THEN 2 ELSE 1 END END AS ExChangeNumEx,
       p.Weight,
       a.NumEx * p.Weight AS TotalWeight,
       a.basePrice,
       a.curSalePrice,
       a.costprice, 
       ROUND(a.salePrice, 2) AS SalePrice, 
       c.Dr * 100 AS dr,
       ROUND(a.salePrice / c.Dr, 2) AS CurDrSalePrice,
       a.examineUserCode, 
       a.At, 
       a.EntryUserCode,
       a.EntryAt,
       a.DeliveryAt, 
       a.Status, 
       a.Note, 
       a.detailNote,
	   a.LossMoney,
       a.lossNote,
       p.BarCode, 
       p.SelfCode, 
       p.IdCode, 
       p.PymCode, 
       CASE WHEN d.AliasName IS NULL THEN p.Name ELSE d.AliasName END AS Name,
       CASE WHEN d.AliasName IS NULL THEN p.IdCode ELSE d.CustomerProcudeCode END AS CustomerProcudeCode,
       p.Spec,
       p.Name + p.Spec AS ng, 
       CASE WHEN a.SaleType = 3 THEN p.PUnit ELSE CASE WHEN a.SaleType = 4 OR a.SaleType = 2 THEN c.DownUnit ELSE p.Unit END END AS Unit,
       p.PUnit,
       p.inPrice, 
       p.PicSrc, 
       a.OrderNum, 
       a.MchCode, 
       a.AccountBookCode, 
       a.AreaCode, 
       p.Brand, 
       p.Origin, 
       a.Pack, 
       a.StockNum, 
       p.Price2, 
       p.price3, 
       p.Price4, 
       p.price5, 
       a.BillType, 
       a.Profit, 
       a.ActualCostPrice, 
       a.ShipperCode, 
       a.BatchNumber, 
       a.BoxNum, 
       a.DispNum,
       a.DisTributionNum,
       a.DisTributionAt,
       a.DisTributionChecked, 
       a.DisTributionUserCode,
       a.BoxPrice, 
       a.CheckReportsFileNames,
       a.CheckReportsAsCode,
       p.CateCode,
       a.replaceNumEx,
       a.DisTributionStatus,
       e.name AS CateName,
       a.PlaceholderNote,
       p.CheckNote,
	   c.LossAllocation -- 是否分损耗
FROM (
    SELECT * FROM L_Bill_Sales_Tab#
    UNION ALL
    SELECT * FROM L_Bill_Sales_Tab
) a 
LEFT JOIN OrderInfo o ON a.BillNumber = o.BillNumber
LEFT JOIN L_Basic_Product_Tab p ON a.ProductCode = p.IdCode
LEFT JOIN V_Basic_Customer_Tab c ON a.CustomerCode = c.idcode
LEFT JOIN L_Basic_Customer_Price_Tab d ON d.PCode = dbo.[F_GetPriceCode](a.CustomerCode) 
                                      AND d.ProductCode = a.ProductCode 
                                      AND d.SaleType = a.SaleType
LEFT JOIN L_Basic_Cate_Tab e ON e.idCode = p.CateCode


' 
GO
/****** Object:  View [dbo].[V_Stock_WaitOut]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitOut]'))
EXEC dbo.sp_executesql @statement = N'






/*销售*/
CREATE VIEW [dbo].[V_Stock_WaitOut]
AS
SELECT    
			a.billnumber,
			a.DeliveryAt, 
			a.CustomerCode, 
			a.AccountBookCode, 
			a.AreaCode, 
            a.ProductCode, 
            a.Num as OrderNum, 
			a.replaceNumEx,
			(a.DisTributionNum - replaceNumEx)*Case When a.SaleType=3 then pack else 1 end as Num,/*有配货时取配出数量，其它取开单数*/
            a.costprice,
			a.Note, 
            b.BarCode, 
            b.SelfCode, 
            b.PymCode,
            b.Name, 
            b.Spec, 
            b.Pack, 
            b.Unit, 
            b.Brand, 
            b.Origin, 
            b.ShipperCode AS MainShipperCode, 
            a.BillType, 
            a.At,
			a.BatchNumber
            
			
FROM   (
			select MchCode,billnumber,DeliveryAt,CustomerCode,AccountBookCode,AreaCode,
				ProductCode,
				SaleType,
				NumEx * DoubleNumBase AS Num,
				ReplaceNumEx  * DoubleNumEXBase AS ReplaceNumEx,
				costPrice,
				CASE WHEN (select OutMustDis from L_Sys_Parmars_Tab)=0 then numEx else isNull(DisTributionNum,0) end *DoubleNumEXBase AS DisTributionNum,/*有配货时取配出数量，其它取开单数量*/
				BillType,At,Note,BatchNumber from V_Bill_Sales_Tab 
				where examineUserCode = 0 
		) as a LEFT JOIN dbo.L_Basic_Product_Tab as b ON a.ProductCode = b.IdCode


















' 
GO
/****** Object:  View [dbo].[V_Stock_WaitIn]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitIn]'))
EXEC dbo.sp_executesql @statement = N'







/*入库，退货*/
CREATE VIEW [dbo].[V_Stock_WaitIn]
AS
SELECT     a.MchCode, a.billnumber,a.DeliveryAt, a.ShipperCode, a.AccountBookCode, 
                      a.AreaCode, a.ProductCode, a.numEx as Num,a.CostPrice, a.numEx * a.CostPrice AS Money, a.Note, 
                      b.BarCode, b.SelfCode, b.PymCode, b.Name, 
                      b.Spec, b.Pack, b.Unit, b.Brand, b.Origin, 
                      b.ShipperCode AS MianShipprCode, b.CateCode,a.BatchNumber
FROM         dbo.L_Bill_Purchases_Tab a INNER JOIN
                      dbo.L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
WHERE     (a.MrUserCode = 0)








' 
GO
/****** Object:  View [dbo].[V_Stock_WaitOuts]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_WaitOuts]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [dbo].[V_Stock_WaitOuts] AS
select billnumber,DeliveryAt,AccountBookCode,AreaCode,
	ProductCode,
	SaleType,
	NumEx * DoubleNumEXBase AS Num,
	costPrice,
	BatchNumber from L_Bill_Sales_Tabs 
	where examineUserCode = 0 



' 
GO
/****** Object:  View [dbo].[V_Stock]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dbo].[V_Stock]
AS
WITH StockSummary AS (
    SELECT AccountBookCode, 
           AreaCode,
           ProductCode, 
           SUM(StockNum) AS Num,
           SUM(WaitIn) AS WaitInNum,
           SUM(WaitOut) AS WaitOutNum,
           SUM(Money) AS SumMoney,
           CAST(SUM(StockNum) + SUM(WaitIn) - SUM(WaitOut) AS DECIMAL(18, 2)) AS AllowedNum
    FROM (
        SELECT AccountBookCode, AreaCode, ProductCode, Num AS StockNum, 0 AS WaitIn, 0 AS WaitOut, CostPrice, Money
        FROM V_Stock_tab
        UNION ALL
        SELECT AccountBookCode, AreaCode, ProductCode, 0 AS StockNum, num AS WaitIn, 0 AS WaitOut, CostPrice AS CostPrice, Money AS Money
        FROM V_Stock_WaitIn 
        UNION ALL
        SELECT AccountBookCode, AreaCode, ProductCode, 0 AS StockNum, 0 AS WaitIn, num AS WaitOut,  CostPrice, Num * CostPrice * -1 AS Money
		FROM (
				SELECT AccountBookCode,AreaCode,ProductCode,Num,costprice FROM V_Stock_WaitOut a
				WHERE NOT EXISTS (SELECT 1 FROM V_Stock_WaitOuts b  WHERE a.ProductCode = b.ProductCode)
				UNION ALL
				SELECT AccountBookCode,AreaCode,ProductCode,Num,costprice FROM V_Stock_WaitOuts
			) y
    ) x
    GROUP BY AccountBookCode, AreaCode, ProductCode
)
SELECT a.AccountBookCode, 
       a.AreaCode,
       a.ProductCode, 
       b.BarCode, 
       b.SelfCode, 
       b.PymCode, 
       b.Name,
       b.Spec,
       b.Pack,
       b.Unit, 
       b.Origin,
       b.Brand,  
       b.CateCode, 
       b.ShipperCode,
       b.LowerLimit,
       b.UpperLimit, 
       a.Num, 
	   0 AS RuningNum,
       a.WaitInNum, 
       a.WaitOutNum,
       a.AllowedNum,
       a.SumMoney,
       CASE WHEN a.AllowedNum = 0 THEN b.inPrice ELSE a.SumMoney / a.AllowedNum END avgPrice, 
       b.Note
FROM (SELECT AccountBookCode, AreaCode, ProductCode,
			SUM(Num) AS Num,
			SUM(WaitInNum) AS WaitInNum,
			SUM(WaitOutNum) AS WaitOutNum,
			SUM(AllowedNum) AS AllowedNum,
			SUM(SumMoney) AS SumMoney FROM StockSummary GROUP BY AccountBookCode, AreaCode, ProductCode ) a
INNER JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
WHERE a.Num <> 0 
   OR a.WaitInNum <> 0 
   OR a.WaitOutNum <> 0
   OR a.AllowedNum <> 0






' 
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Group_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Group_Tab]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dbo].[V_Bill_Distribution_Group_Tab]
AS
/**
	商品配货汇总表
	用于手机端配货
**/
SELECT   a.num,a.numEx,a.DisTributionNum,a.OweNumEx, a.Status,a.SaleType,a.DownWg,a.downUnit, b.IdCode, b.Name, 
	b.Spec, b.PicSrc, b.Unit,b.PUnit, b.CateCode, b.Price1, b.inPrice, a.DeliveryAt, a.ProductCode,
	CASE WHEN (SELECT importStock FROM L_Sys_Parmars_Tab) =0 THEN 0 ELSE 
		ISNULL((SELECT    Cast(sum(Num  + WaitInNum) as decimal(10,2)) FROM   dbo.V_Stock WHERE a.ProductCode = ProductCode), 0) 
	END Stock
FROM   (
	SELECT 
		ProductCode, SUM(num) AS num, SUM(numEx) AS numEx,Sum(DisTributionNum) As DisTributionNum,Sum(OweNumEx) as OweNumEx, DeliveryAt, Status,SaleType,DownWg,max(DownUnit) as DownUnit
    FROM (
		SELECT 
			ProductCode, 
			num *DoubleNumBase AS Num,
			numEx*DoubleNumExBase AS NumEx, 
			(NumEx - ISNULL(DisTributionNum,0))*DoubleNumExBase AS OweNumEx,
			DisTributionNum * DoubleNumExBase As DisTributionNum,
			DeliveryAt,Status,Case when SaleType=4 Then 0 ELSE SaleType END SaleTYpe,DownWg,DownUnit
		FROM  dbo.L_Bill_Sales_Tab
		WHERE num > 0 or numEx>0
	) x
    GROUP BY DeliveryAt, ProductCode, Status,SaleType,DownWg
) AS a INNER JOIN dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode






















' 
GO
/****** Object:  View [dbo].[V_Report_Stock_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Stock_Tab]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[V_Report_Stock_Tab]
AS
SELECT    a.ProductCode, a.Num,a.AllowedNum, a.CostPrice, b.IdCode, b.BarCode, 
                      b.PymCode, b.Name + isNull(b.Spec,'''') AS name, b.Unit, b.CateCode, 
                      b.Price1, b.Price2, b.PicSrc, b.Note, a.AccountBookCode
FROM         (select 
					AccountBookCode, 
					ProductCode, 
					Num+WaitInNum-WaitOutNum as AllowedNum,
					Num, 
					avgPrice AS CostPrice
					from V_Stock where Num+WaitInNum-WaitOutNum<>0 
			) a INNER JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode





' 
GO
/****** Object:  View [dbo].[V_Purchase_Group_DetailEx_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_DetailEx_Tab]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Purchase_Group_DetailEx_Tab]
AS
/**
	采购汇总商品列表
	用于PC端
**/
SELECT   a.Idkey,
		a.mchCode, 
		a.AccountBookCode,
		a.billnumber, 
		a.customerCode,
		 /*''【''+c.SelfCode+''】''+*/c.shortName as CustomershortName,
		c.Name as CustomerName,
		c.shortName as PrintCustomerName,
		a.ProductCode, 
		b.Name,
		b.Unit, 
		b.PUnit,
		/*(
			(SELECT Isnull(SUM( AllowedNum),0)	FROM V_Stock_Get WHERE a.AreaCode =AreaCode and a.ProductCode = ProductCode) +
			(select IsNull(sum(NumEx-replaceNumEx),0) from L_Bill_Sales_Tab where DeliveryAt >= a.DeliveryAt and a.AreaCode =AreaCode and  a.ProductCode = ProductCode) -
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt  and  a.ProductCode = ProductCode and BillNumber=''free'' and DisStatus <>1)+
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt  and  a.ProductCode = ProductCode and CustomerCode=0)
		 ) AS StockNum,*/
		(a.num-replaceNumEx) * DoubleNumBase as num, 
		(a.NumEx-replaceNumEx) * DoubleNumExBase as NumEx,
		a.AcceptNum * DoubleNumBase as AcceptNum,
		a.AcceptNumEx * DoubleNumExBase as AcceptNumEx,
		a.FreeNum * DoubleNumBase as FreeNum,
		a.FreeNumEx * DoubleNumExBase as FreeNumEx,
		a.OweNum * DoubleNumBase as OweNum,
		a.OweNumEx * DoubleNumExBase as OweNumEx,
		a.costPrice,
		a.salePrice,
		a.DeliveryAt,
		a.status,
		a.Note, 
		b.PicSrc, 
		b.IdCode,
		b.BarCode,
		b.spec,
		CASE WHEN a.SaleType = 4 THEN 0 ELSE a.SaleType END SaleType,
		CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
		a.DownWg,
		b.CateCode,
		a.defaultShipperCode,
		a.QualityGrade,
		(select ShortName from L_Basic_Company_Tab where IdCode = a.defaultShipperCode) as ShipperName
FROM         (select * from dbo.L_Bill_SaleOrders_Tab where examineUserCode>0) as a left JOIN
             dbo.L_Basic_Product_Tab as b 
			 ON  a.ProductCode = b.IdCode LEFT JOIN
			 V_Basic_Customer_Tab C 
			 ON a.CustomerCode = C.IdCode























' 
GO
/****** Object:  View [dbo].[V_Stock_Get]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Get]'))
EXEC dbo.sp_executesql @statement = N'













CREATE view [dbo].[V_Stock_Get] as
/*用于商品选择的视图
	商品库存表，
*/
select *,Num+WaitInNum-WaitOutNum as AllowedNum from (
	SELECT  AccountBookCode, 
			AreaCode,
			ProductCode, 
			MAX(pack) AS pack,
			SUM(Num) AS Num, 
			Max(CostPrice) as CostPrice,
			(select isnull(SUM(Num),0) from V_Stock_WaitIn 
						where  (ProductCode = a.ProductCode) AND (AccountBookCode = a.AccountBookCode) AND (AreaCode = a.AreaCode)
			) as WaitInNum,
			(select isnull(SUM(Num),0) from V_Stock_WaitOut 
						where  (ProductCode = a.ProductCode) AND (AccountBookCode = a.AccountBookCode) AND (AreaCode = a.AreaCode)
			) as WaitOutNum,
			0 as QNum --赚容以前版本
	FROM   (
		select a.IdCode as ProductCode,
			a.pack,
			Case when b.costprice=0 then a.inPrice else b.costprice end costprice, 
			Case when b.AccountBookCode IS NULL then 1 else b.AccountBookCode end AccountBookCode,
			Case when b.AreaCode IS NULL  then a.areaCode else b.AreaCode end AreaCode,
			IsNull(b.Num,0) as Num from L_Basic_Product_Tab a 
			Left Join V_Stock_Tab b 
			on a.AreaCode =b.AreaCode and a.IdCode=b.ProductCode
	) a
	  GROUP BY AccountBookCode,AreaCode,ProductCode
) x where Num+WaitInNum-WaitOutNum<>0














' 
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Tab]'))
EXEC dbo.sp_executesql @statement = N'











CREATE VIEW [dbo].[V_Bill_SaleOrders_Tab]
AS
SELECT  a.Idkey, 
		a.billnumber,
		a.customerOrderId,
		a.MchCode,
		a.CustomerCode, 
		c.name as CustomerName,
		a.DoubleNumBase, --如果为SaleType=4有效公斤计算，基数为2
		a.DoubleNumExBase, --如果为公斤计算，基数为2
		a.PackBase, --件转散基数
		a.AccountBookCode, 
		a.AreaCode, 
		a.ProductCode,
		b.IdCode,
		b.BarCode,  
		--b.Name, 
		b.Name + isNull(b.Spec,'''') AS ng, 
		CASE WHEN d.AliasName is Null then b.Name ELSE d.AliasName END Name,
		b.Spec, 
		Case When a.SaleType =3 then b.PUnit Else Case When a.SaleType = 4 or a.SaleType = 2 then c.DownUnit else b.Unit end end Unit,
		b.Unit as MinUnit,
		b.PUnit,
		a.DownUnit,
		a.DownWG,
		a.Pack,
		b.DownWgSpec,
		b.domethod,
		a.SaleType,
		b.PicSrc,
		b.CateCode, 
		b.inPrice,  
		a.num, 
		a.NumEx,
		a.replaceNumEx,
		b.Weight,
		a.NumEx * b.Weight as TotalWeight,
		c.Dr*100 as dr,
		a.costprice, 
		a.basePrice,
		a.curSalePrice,
		a.salePrice, 
		a.examineUserCode, 
		a.At, 
		a.DeliveryAt, 
		a.DisTributionNum, 
		a.StockNum, 
		a.BillType, 
		a.Status,
		a.Note,
		a.DetailNote,
		OweNum,OweNumEx,FreeNum,FreeNumEx,AcceptNumEx,AcceptNum,AcceptStatus,
		a.defaultShipperCode,
		a.QualityGrade
FROM         L_Bill_SaleOrders_Tab a LEFT JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode 
			 Left Join 
			 V_Basic_Customer_Tab c on a.CustomerCode = c.idcode
			 LEFT JOIN
			 L_Basic_Customer_Price_Tab D on d.PCode = dbo.[F_GetPriceCode](a.CustomerCode) and d.ProductCode = a.ProductCode and d.SaleType=a.SaleType












































' 
GO
/****** Object:  View [dbo].[V_Purchase_Group_Detail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_Detail_Tab]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[V_Purchase_Group_Detail_Tab]
AS
/**
	采购汇总明细
	用时手机端
**/
SELECT  a.Idkey,
		a.mchCode, 
		a.billnumber, 
		a.customerCode,
		(select Name from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerName,
		(select shortName from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerShortName,
		a.ProductCode, 
		b.Name,
		b.Unit, 
		b.PUnit,
		CASE WHEN (SELECT importStock FROM L_Sys_Parmars_Tab) =0 THEN 0 ELSE
		(
			(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock_get WHERE a.AreaCode =AreaCode and a.ProductCode = ProductCode)+
			(select IsNull(sum((NumEx-replaceNumEx)*DoubleNumExBase*PackBase),0) from L_Bill_Sales_Tab where DeliveryAt >= a.DeliveryAt and a.AreaCode =AreaCode and  a.ProductCode = ProductCode) -
			(select isNull(Sum(NumEx*Case When SaleType=3 then DownWg else Case When SaleType=4 then 2 else 1 end end),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt and  a.ProductCode = ProductCode and BillNumber=''free''  and DisStatus <>1)+
			(select isNull(Sum(NumEx*Case When SaleType=3 then DownWg else Case When SaleType=4 then 2 else 1 end end),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt  and  a.ProductCode = ProductCode and CustomerCode=0)
		 ) END StockNum,
		(a.num - a.replaceNumEx)  * DoubleNumBase as Num, 
		(a.NumEx - a.replaceNumEx)  * DoubleNumExBase  as NumEx,
		a.AcceptNum * DoubleNumBase as AcceptNum,
		a.AcceptNumEx * DoubleNumExBase as AcceptNumEx,
		a.OweNum * DoubleNumBase as OweNum,
		a.OweNumEx * DoubleNumExBase as OweNumEx,
		a.replaceNumEx * DoubleNumExBase as replaceNumEx,
		dbo.xb_trim(a.costPrice) as costPrice,
		a.salePrice,
		a.DeliveryAt,
		a.status,
		a.Note, 
		b.PicSrc, 
		b.IdCode,
		b.BarCode,
		b.spec,
		CASE WHEN a.SaleType = 4 THEN 0 ELSE a.SaleType END SaleType,
		CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
		a.DownWg,
		a.defaultShipperCode,
		a.QualityGrade,
		(select ShortName from L_Basic_Company_Tab where IdCode = a.defaultShipperCode) as ShipperName
FROM         (select * from dbo.V_Bill_SaleOrders_Tab where examineUserCode>0  and OweNum>0) as a left JOIN
                      dbo.L_Basic_Product_Tab as b ON  a.ProductCode = b.IdCode

























' 
GO
/****** Object:  View [dbo].[V_Bill_Purchases_Detail_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchases_Detail_Tab]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Bill_Purchases_Detail_Tab]
AS
SELECT  a.Idkey, 
		a.BillNumber, 
		a.SaleOrderBillNumber,
		a.SaleOrderIdkey,
		a.CustomerCode,
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode, 
		(select ExamineUserCode from L_Bill_PurchaseOrder_Tab where BillNumber = a.BillNumber) as ExamineUserCode, 
		(select MrUserCode from L_Bill_Purchase_Tab where BillNumber = a.BillNumber) as MrUserCode, 
		a.ProductCode,
		a.BatchNumber,
		a.QualityGrade,
		a.num, 
		a.NumEx,
		b.IdCode, 
		b.BarCode, 
		b.SelfCode, 
		b.PymCode, 
		b.Name, 
		b.Spec,
		b.Name+ b.Spec as ng,
		b.Unit, 
		b.PUnit,
		a.SaleType,
		a.DownUnit,
		a.DownWg,
		b.PicSrc, 
		a.CostPrice,
		b.Price1, 
		b.CateCode, 
		a.MchCode,
		a.Note
FROM  dbo.L_Bill_PurchaseOrders_Tab# a INNER JOIN
                      dbo.L_Basic_Product_Tab b ON a.ProductCode = b.IdCode















' 
GO
/****** Object:  View [dbo].[V_Bill_PurchaseOrders_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PurchaseOrders_Tab]'))
EXEC dbo.sp_executesql @statement = N'















CREATE VIEW [dbo].[V_Bill_PurchaseOrders_Tab]
AS
SELECT  a.Idkey, 
		a.MchCode,
		a.BillNumber, 
		a.ShipperCode, 
		a.AccountBookCode, 
		a.AreaCode,
		a.ProductCode,
		b.IdCode, 
		b.PicSrc, 
		a.CustomerCode, 
		b.BarCode, 
		b.SelfCode, 
		b.PymCode, 
		b.Name, 
		b.Spec, 
		b.Unit,
		b.Punit,
		b.Pack, 
		b.Brand, 
		b.Origin, 
		b.CateCode, 
		a.DownUnit,
		a.DownWg,
		a.SaleType,
		a.StockNum,  
		/*(
			(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock_Get WHERE  a.ProductCode = ProductCode)+
			(select ISNull(sum(NumEx),0) from L_Bill_Sales_Tab where DeliveryAt >= a.DeliveryAt  and a.ProductCode = ProductCode) -
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt and  a.ProductCode = ProductCode and BillNumber=''free''  and DisStatus <>1)
		 ) AS StockNum,*/
		a.qualitygrade,
		a.batchNumber,
		a.num, 
		a.Numex,
		a.costprice, 
		a.salePrice, 
		a.examineUserCode, 
		a.At, 
		a.DeliveryAt, 
		a.Status, 
		a.Note, 
		a.BillType, 
		Case When a.SaleType = 2 THEN
			Cast((SELECT STUFF(/*列数据转成行字符串*/
					( SELECT   '','' + cast(num as varchar(10))+''/''+cast(numex as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
				WHERE BillNumber = a.BillNumber and SaleType=a.SaleType and ProductCode = a.ProductCode
			  FOR XML PATH('''')
			 ), 1, 1, '''')) as varchar(500))
		ELSE 
			Cast((SELECT STUFF(/*列数据转成行字符串*/
			( SELECT   '','' + cast(num as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
				WHERE BillNumber = a.BillNumber and SaleType=a.SaleType and ProductCode = a.ProductCode
			  FOR XML PATH('''')
			 ), 1, 1, '''')) as varchar(500))
		END as NumList 
FROM    L_Bill_PurchaseOrders_Tab a  
		Left JOIN
		L_Basic_Product_Tab b 
        ON a.ProductCode = b.IdCode
















' 
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Detial_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Detial_Tab]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Bill_Distribution_Detial_Tab]
AS
/**
	商品配货明细
	用于手机端配货
**/

SELECT  a.Idkey, 
		a.billnumber, 
		a.OrderBillNumber,
		a.OrderIdKey as saleOrderIdkey,
		a.CustomerCode,
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		(select Name from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerName,
		(select ShortName from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerShortName,
		(select DeliveryAt from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as DisAt,
		a.ProductCode, 
		b.IdCode, 
		b.BarCode, 
		b.Name, 
		b.Spec, b.Unit, b.Punit,
		Case When a.SaleType=4 Then 0 Else a.SaleType End SaleType,
		a.DownWg,
		Case When a.SaleType=4 Then ''斤'' Else a.DownUnit End DownUnit,
		b.PicSrc, 
		b.CateCode,
		(select SerialNum from L_Basic_Cate_Tab where IdCode = b.CateCode) as SerialNum,
		a.num * DoubleNumBase as  Num, 
		a.numEx * DoubleNumExBase as NumEX,
		(a.numEx - ISNULL(a.DisTributionNum,0)) * DoubleNumExBase as OweNumEX,
		a.DisTributionNum* DoubleNumExBase as DisTributionNum,
		a.DisTributionNum - a.OrderNum as diffNum,
		a.costprice, 
		a.salePrice, 
		a.examineUserCode, 
		a.At, 
		a.DeliveryAt, 
		a.Status, 
		a.Note, 
		a.OrderNum,
		CASE WHEN (SELECT importStock FROM L_Sys_Parmars_Tab) =0 THEN 0 ELSE 
			ISNULL((SELECT  cast(Num + WaitInNum as decimal(10,2))	FROM   dbo.V_Stock	WHERE a.ProductCode = ProductCode and a.areacode=areaCode), 0) 
		END Stock,
		Case When a.SaleType = 2 THEN
			Cast((SELECT STUFF(/*列数据转成行字符串*/
			( SELECT   '','' + cast(num as varchar(10))+''/''+cast(numex as varchar(10)) FOR XML PATH('''')
			 ), 1, 1, '''')) as varchar(500))
		ELSE 
			Cast((SELECT STUFF(/*列数据转成行字符串*/
			( SELECT   '','' + cast(num as varchar(10)) FOR XML PATH('''')
			 ), 1, 1, ''''))  as varchar(500))
		END as NumList 

FROM  (
	Select x.Idkey,x.OrderIdKey,x.billnumber,x.CustomerCode,x.at,x.DeliveryAt,x.OrderNum,x.DisTributionNum,
		x.SaleType,x.DownUnit,x.DownWg, x.num,x.numEx,x.ProductCode,x.AreaCode,
		x.costprice,x.salePrice, x.examineUserCode,x.Status,x.Note,y.OrderBillNumber,x.DoubleNumBase,x.DoubleNumExBase,x.PackBase 
	From L_Bill_Sales_Tab x ,L_Bill_Sale_Tab y where x.billnumber = y.BillNumber
)  AS a INNER JOIN L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode


































' 
GO
/****** Object:  View [dbo].[V_Bill_SaleOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrder_Tab]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Bill_SaleOrder_Tab]
AS
SELECT  a.BillNumber, 
		a.CustomerOrderID,
		a.CustomerCode,
		b.PCode,
		b.selfCode as CustomerSelfCode,
		b.Name as CustomerName, 
		b.DownUnitType,
		b.RelationName,
		b.Person as CustomerPerson,
		b.Tel as CustomerTel,
		b.Addr as CustomerAddr,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		(select name From l_basic_user_tab where idcode = a.MakingUserCode) as MakingUserName,
		a.ExamineAt, 
		a.DeliveryAt, 
		a.billType, 
		a.Status, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		a.Type, 
		a.DeliveryBillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.SalesMan, 
		a.SettlementType, 
		a.AccountDay, 
		a.Contact_Address, 
		a.Contact_Tel, 
		a.Contact_Person, 
		a.Conpon_Code, 
		a.Conpon_Money, 
		a.Freight_Money, 
		a.ShAreaCode, 
		a.DepositMoney, 
		a.DepositBillNumber,
		b.dr,
		b.decimalBit,
		b.QualityGrade,
		b.SaleFromQuotePrice
FROM        L_Bill_SaleOrder_Tab a INNER JOIN
                     V_Basic_Customer_Tab b ON a.CustomerCode = b.IdCode



' 
GO
/****** Object:  View [dbo].[V_Bill_Sale_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_Return_Tab]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[V_Bill_Sale_Return_Tab]
AS
SELECT  a.BillNumber, 
		a.CustomerCode, 
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name as CustomerName, 
		a.OrderBillNumber, 
		a.DeliveryAt, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.InvNumber, 
		a.InvMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.DriverCode, 
		a.AlreadyMoney, 
		a.oweMoney, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.InvOweMoney, 
		a.DeliveryCode, 
		a.Profit, 
		a.FreeMoney,
		CASE WHEN a.ExamineUserCode=0 Or ABS(a.oweMoney)>0.1 THEN 0 ELSE 1 END [OVER],
		case when a.DisType = 2 then ''到店自提'' else ''送货上门'' end DisType
FROM  (select * From L_Bill_Sale_Tab# Where billType=4 Union All select * From L_Bill_Sale_Tab Where billType=4) a INNER JOIN
                      L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode








' 
GO
/****** Object:  View [dbo].[V_Bill_PurchaseOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PurchaseOrder_Tab]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[V_Bill_PurchaseOrder_Tab]
AS
SELECT  a.BillNumber, 
		a.PurchaseBillNumber, 
		a.ShipperCode, 
		a.MakingUserCode,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.DeliveryAt, 
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name as ShipperName, 
		b.ShortName,
		a.MchCode, 
		a.AccountBookCode, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.AreaCode
FROM    dbo.L_Bill_PurchaseOrder_Tab a INNER JOIN
                      dbo.L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode





' 
GO
/****** Object:  View [dbo].[V_StockFrom]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_StockFrom]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[V_StockFrom] as

select 
	a.Idkey,
	a.SaleOrderIdkey, a.ProductCode,a.DeliveryAt,a.billNumber,a.SaleOrderBillNumber,
	a.CustomerCode,
	a.num,
	a.NumEx / CASE WHEN a.SaleType=3 THEN b.Pack ELSE 1 END AS NumEx,
	a.DownWg,CostPrice, 
	a.ShipperCode,a.ShipperName,a.Note,a.DisStatus,a. DisTributionNum,
	a.disStatus as DisTributionStatus,
	CASE WHEN a.SaleType = 4 THEN 0 ELSE a.SaleType END SaleType,
	CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
	(select ShortName from L_Basic_Company_Tab where IdCode = a.CustomerCode) as customerShortName,
	(select selfCode from L_Basic_Company_Tab where IdCode = a.ShipperCode) as selfCode,
	b.Name, 
	b.Name as ProductName,
	IsNull(b.Spec,'''') Spec,
	b.Unit, 
	b.PUnit,
	b.PicSrc
from (
select a.Idkey, a.SaleOrderIdkey, a.ProductCode, a.SaleType, a.DeliveryAt,a.billNumber,a.SaleOrderBillNumber,a.CustomerCode,a.num,a.NumEx,a.DownUnit,a.DownWg,CostPrice, b.ShipperCode,b.ShortName as ShipperName,a.Note,a.DisStatus,a. DisTributionNum from L_Bill_PurchaseOrders_Tab# a,V_Bill_PurchaseOrder_Tab b where a.BillNumber = b.BillNumber and NumEx<>0
union all
 select a.Idkey, a.SaleOrderIdkey,a.ProductCode,a.SaleType,a.DeliveryAt,a.billNumber,a.SaleOrderBillNumber,a.CustomerCode,a.num,a.NumEx,a.DownUnit,a.DownWg,a.CostPrice,0 as ShipperCode,''存货'' as ShipperName,a.note,a.DisStatus,DisTributionNum from L_Bill_PurchaseOrders_Tab# a where a.BillNumber = ''free''  and NumEx<>0
) a,L_Basic_Product_Tab b where a.ProductCode = b.IdCode




' 
GO
/****** Object:  View [dbo].[V_Bill_Distribution_Group_Tab_FromShipper]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_Group_Tab_FromShipper]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[V_Bill_Distribution_Group_Tab_FromShipper]
AS

WITH CTE_DATA AS(
	select a.IdKey,a.ProductCode,b.num,b.numEx,b.DisTributionNum, a.DeliveryAt,a.Status,
		b.SaleType,
		a.DisTributionStatus,
		a.salePrice,
		a.DownWg,b.DownUnit, b.ShipperCode,b.ShipperName,b.CustomerCode,b.customerShortName, 
		OrderIdKey,SaleOrderBillNumber,a.Note
	from dbo.L_Bill_Sales_Tab a,V_StockFrom b where a.OrderIdKey = b.SaleOrderIdkey
)
SELECT   idKey,  a.num,a.numEx,dbo.xb_trim(a.OweNumEx) as OweNumEx,a.DisTributionNum,
a.ShipperCode,a.ShipperName,a.customerShortName, saleOrderList, 
a.Status,a.DisTributionStatus,a.SaleType,a.DownWg,
a.downUnit,
 b.IdCode, b.Name,salePrice, 
b.Spec, b.PicSrc, b.Unit,b.PUnit, b.CateCode, b.Price1, b.inPrice, a.DeliveryAt, a.ProductCode,a.Note,
CASE WHEN (SELECT importStock FROM L_Sys_Parmars_Tab) =0 THEN 0 ELSE 
	ISNULL((SELECT    sum(Num +WaitInNum)
		FROM   dbo.V_Stock
        WHERE     a.ProductCode = ProductCode), 0) 
END Stock
FROM   (
	/*SELECT ProductCode,shipperCode,min(note) as Note,
		Min(ShipperName) as ShipperName, 
		SUM(num) AS num, 
		SUM(numEx) AS numEx, 
		SUM(numEx-IsNull(DisTributionNum,0)) AS OweNumEx, 
		sum(DisTributionNum) as DisTributionNum,
		DeliveryAt, Status,DisTributionStatus,SaleType,DownWg,max(DownUnit) as DownUnit,
		stuff((select '',''+''''''''+SaleOrderBillNumber+'''''''' from CTE_DATA where DeliveryAt = x.DeliveryAt and ProductCode = x.ProductCode and SaleType = x.SaleType and ShipperCode = x.ShipperCode  for xml path('''')),1,1,'''') as saleOrderList
        FROM  CTE_DATA x
        WHERE      (num > 0 or numEx>0)
        GROUP BY DeliveryAt, ProductCode, Status,DisTributionStatus,SaleType,DownWg,ShipperCode*/
	SELECT IdKey,ProductCode,shipperCode,(note) as Note,
		(ShipperName) as ShipperName, 
		customerShortName,
		(num) AS num, 
		(numEx) AS numEx, 
		(numEx-IsNull(DisTributionNum,0)) AS OweNumEx, 
		(DisTributionNum) as DisTributionNum,
		salePrice,
		DeliveryAt, Status,DisTributionStatus,SaleType,DownWg,(DownUnit) as DownUnit,
		stuff((select '',''+''''''''+SaleOrderBillNumber+'''''''' from CTE_DATA where DeliveryAt = x.DeliveryAt and ProductCode = x.ProductCode and SaleType = x.SaleType and ShipperCode = x.ShipperCode  for xml path('''')),1,1,'''') as saleOrderList
     FROM  CTE_DATA x
     WHERE      (num > 0 or numEx>0)
	) AS a INNER JOIN
        dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode


























' 
GO
/****** Object:  View [dbo].[V_Wx_Bill_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Sale_Tab]'))
EXEC dbo.sp_executesql @statement = N'



Create VIEW [dbo].[V_Wx_Bill_Sale_Tab]
AS
SELECT  a.BillNumber, 
		a.CustomerCode, 
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name, 
		a.OrderBillNumber, 
		a.DeliveryAt, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.InvNumber, 
		a.InvMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.DriverCode, 
		a.AlreadyMoney, 
		a.oweMoney, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.InvOweMoney, 
		a.DeliveryCode, 
		a.Profit, 
		a.FreeMoney,
		case when a.DisType = 2 then ''到店自提'' else ''快递'' end DisType
FROM  (select * From L_Bill_Sale_Tab Where billType=3) a INNER JOIN
                      L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode




' 
GO
/****** Object:  View [dbo].[V_Wx_Bill_Sale_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Sale_Return_Tab]'))
EXEC dbo.sp_executesql @statement = N'


Create VIEW [dbo].[V_Wx_Bill_Sale_Return_Tab]
AS
SELECT  a.BillNumber, 
		a.CustomerCode, 
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name, 
		a.OrderBillNumber, 
		a.DeliveryAt, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.InvNumber, 
		a.InvMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.DriverCode, 
		a.AlreadyMoney, 
		a.oweMoney, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.InvOweMoney, 
		a.DeliveryCode, 
		a.Profit, 
		a.FreeMoney,
		case when a.DisType = 2 then ''到店自提'' else ''快递'' end DisType
FROM  (select * From L_Bill_Sale_Tab Where billType=4) a INNER JOIN
                      L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode



' 
GO
/****** Object:  View [dbo].[V_Report_PayList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayList_Tab]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[V_Report_PayList_Tab]
AS
SELECT  top 99999999   a.BillNumber, a.ShipperCode, a.CurBillNumber, a.OrderBillNumber,
	a.mrAt,a.mrUserCode,a.ExamineUserCode,a.ExamineAt,a.DeliveryAt, a.billType, a.costMoney, 
	a.AlreadyMoney, a.OweMoney, a.Note, b.Name as ShipperName, b.IdCode,a.subjectCode,userName,4 as Status
FROM  (
			SELECT     
				BillNumber, CurBillNumber, OrderBillNumber, 
				ShipperCode,mrUserCode,ExamineUserCode,mrAt, ExamineAt,DeliveryAt, billType,
				costMoney, AlreadyMoney, OweMoney, Note,
				201 as subjectCode,--业务类型（科目）采购货款
				(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= x.MakingUserCode) as userName
            FROM (select * From L_Bill_Purchase_Tab Union All select * From L_Bill_Purchase_Tab#) x WHERE      (Status = 4)
            Union All
            SELECT     
				BillNumber, CurBillNumber, '''' as OrderBillNumber,
				CompanyCode,UserCode,UserCode,At, At,'''' as DeliveryAt, billType,
				Money, AlreadyMoney, OweMoney, Note,
				Case When BillType = 503 then 202 else 206 end as subjectCode,
				''未签名'' as userName
			FROM          L_Bill_SubjectChange_Tab
			WHERE      (Billtype in (503,506) and Status = 1)
) AS a INNER JOIN
          dbo.L_Basic_Company_Tab AS b ON a.ShipperCode = b.IdCode

 order by a.ExamineAt










' 
GO
/****** Object:  View [dbo].[V_Report_PayList_Month_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayList_Month_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[V_Report_PayList_Month_Tab] as
	select 
		ShipperCode,
		CONVERT(varchar(7),ExamineAt,120) as MonthText,
		SUM(oweMoney) as oweMoney,
		SUM(costMoney) as costMoney,
		SUM(AlreadyMoney) as AlreadyMoney
		from [V_Report_payList_Tab]  
	Group by ShipperCode,CONVERT(varchar(7),ExamineAt,120)

' 
GO
/****** Object:  View [dbo].[V_Report_RecGroup_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecGroup_Tab]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Report_RecGroup_Tab]
AS
SELECT     a.CustomerCode, 
	(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
	a.CustomerCode AS BillNumber, b.Name as CustomerName, b.IdCode, b.Addr, b.Tel, b.Person, b.RelationCode, b.Note, b.SettlementType, b.AccountDay, a.oweMoney
FROM  (
		SELECT     CustomerCode, SUM(oweMoney) AS oweMoney From (
			SELECT     CustomerCode, oweMoney
			FROM          dbo.L_Bill_Sale_Tab
			WHERE      (Status = 1)
			union all
			SELECT     CustomerCode, oweMoney
			FROM          dbo.L_Bill_Sale_Tab#
			WHERE      (Status = 1)
			union all
			SELECT     CompanyCode,OweMoney
			FROM          L_Bill_SubjectChange_Tab
			WHERE      (Billtype in (504,505) and Status = 1)
		) x GROUP BY CustomerCode
	
) AS a INNER JOIN
                      dbo.L_Basic_Company_Tab AS b ON a.CustomerCode = b.IdCode
union all
SELECT     a.InAccountBookCode,cast(a.InAccountBookCode as varchar(20)) as selfCode, a.InAccountBookCode AS BillNumber, b.Name,  b.IdCode, b.Addr, b.Tel, b.Person, 0 as RelationCode, b.Note, b.SettlementType, b.AccountDay, a.oweMoney
FROM         (SELECT     InAccountBookCode, SUM(oweMoney) AS oweMoney
                       FROM          dbo.L_Bill_StoreExChange_Tab
                       WHERE      (Status = 1)
                       GROUP BY InAccountBookCode) AS a INNER JOIN
                      dbo.L_Basic_Store_Tab AS b ON a.InAccountBookCode = b.IdCode




' 
GO
/****** Object:  View [dbo].[V_Report_RecList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecList_Tab]'))
EXEC dbo.sp_executesql @statement = N'













CREATE VIEW [dbo].[V_Report_RecList_Tab]
AS
	SELECT  a.BillNumber, a.CustomerCode, 
		a.ExamineUserCode,
		a.ExamineAt,a.ExamineAt as DeliveryAt, a.billType, a.saleMoney, a.AlreadyMoney,
		a.oweMoney, a.Note, b.Name, b.Name as CustomerName,
		b.selfCode as CustomerSelfCode,
		b.RelationName,
		b.IdCode, a.CurBillNumber, a.OrderBillNumber,a.type,1 as status,subjectCode
	FROM  (
		SELECT     
			BillNumber, CurBillNumber, OrderBillNumber,ExamineUserCode,
			CustomerCode, DeliveryAt as ExamineAt,type, billType,
			saleMoney, AlreadyMoney, oweMoney, Note,
			101 as subjectCode--业务类型（科目）销售货款
		FROM dbo.L_Bill_Sale_Tab WHERE (Status = 1)
		Union all
		SELECT     
			BillNumber, CurBillNumber, OrderBillNumber,ExamineUserCode,
			CustomerCode, DeliveryAt as ExamineAt,type, billType,
			saleMoney, AlreadyMoney, oweMoney, Note,
			101 as subjectCode--业务类型（科目）销售货款
		FROM dbo.L_Bill_Sale_Tab# WHERE (Status = 1)
		Union all
		SELECT     
			BillNumber, CurBillNumber, '''' as OrderBillNumber,UserCode,
			CompanyCode, At,0 as type, billType, 
			Money, AlreadyMoney, OweMoney, Note,
			Case When BillType = 504 then 102 else 106 end as subjectCode
		FROM          L_Bill_SubjectChange_Tab
		WHERE      Billtype in (504,505) and Status = 1
	) a INNER JOIN  dbo.V_Basic_Customer_Tab AS b ON a.CustomerCode = b.IdCode















' 
GO
/****** Object:  View [dbo].[V_Report_SaleOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_SaleOrder_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Report_SaleOrder_Tab]
AS
SELECT     dbo.V_Bill_SaleOrders_Tab.Idkey, dbo.V_Bill_SaleOrders_Tab.billnumber, dbo.V_Bill_SaleOrders_Tab.ProductCode, dbo.V_Bill_SaleOrders_Tab.Name, 
                      dbo.V_Bill_SaleOrders_Tab.Spec, dbo.V_Bill_SaleOrders_Tab.Unit, dbo.V_Bill_SaleOrders_Tab.BarCode, dbo.V_Bill_SaleOrders_Tab.num, 
                      dbo.V_Bill_SaleOrders_Tab.costprice, dbo.V_Bill_SaleOrders_Tab.salePrice, dbo.V_Bill_SaleOrders_Tab.examineUserCode, dbo.V_Bill_SaleOrders_Tab.At, 
                      dbo.V_Bill_SaleOrders_Tab.Note, dbo.V_Bill_SaleOrders_Tab.PicSrc, dbo.V_Bill_SaleOrders_Tab.IdCode, dbo.V_Bill_SaleOrders_Tab.CustomerCode, 
                      dbo.V_Bill_SaleOrders_Tab.Status, dbo.V_Bill_SaleOrders_Tab.DeliveryAt, dbo.V_Bill_SaleOrders_Tab.DisTributionNum, 
                      dbo.L_Basic_Company_Tab.ShortName AS CustomerName, dbo.V_Bill_SaleOrders_Tab.MchCode
FROM         dbo.V_Bill_SaleOrders_Tab INNER JOIN
                      dbo.L_Basic_Company_Tab ON dbo.V_Bill_SaleOrders_Tab.CustomerCode = dbo.L_Basic_Company_Tab.IdCode
WHERE     (dbo.V_Bill_SaleOrders_Tab.examineUserCode > 0)

' 
GO
/****** Object:  View [dbo].[V_Report_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Sale_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Report_Sale_Tab]
AS
SELECT     a.Idkey, a.billnumber, a.CustomerCode, a.ProductCode,a.numEx as Num, a.numEx,
                       a.costprice, a.salePrice,a.costprice*a.numEx as costMoney,
					   a.salePrice*a.numEx as saleMoney,a.Profit, a.examineUserCode, a.At, 
                      a.DeliveryAt, a.Status, a.Note, a.BarCode, a.SelfCode, 
                      a.IdCode, a.PymCode, a.Name, a.Spec, a.DownUnit as Unit, 
                      a.inPrice, a.PicSrc, b.Name AS CustomerName, a.MchCode, 
                      a.OrderNum
FROM         V_Bill_Sales_Tab as a INNER JOIN
                      L_Basic_Company_Tab as b ON a.CustomerCode = b.IdCode
WHERE     (a.examineUserCode > 0)

' 
GO
/****** Object:  View [dbo].[V_Report_RecList_Month_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_RecList_Month_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [dbo].[V_Report_RecList_Month_Tab] as
	select 
		CustomerCode,
		min(customerName) as CustomerName,
		CONVERT(varchar(7),ExamineAt,120) as MonthText,
		SUM(oweMoney) as oweMoney,
		SUM(salemoney) as saleMoney,
		SUM(AlreadyMoney) as AlreadyMoney
		from [V_Report_RecList_Tab]  
	Group by CustomerCode,CONVERT(varchar(7),ExamineAt,120)


' 
GO
/****** Object:  View [dbo].[V_Bill_StockChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockChanges_Tab]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[V_Bill_StockChanges_Tab]
AS
SELECT  a.Idkey,
		a.MchCode,
		a.AccountBookCode, 
		a.AreaCode, 
		a.billnumber,
		a.ProductCode, 
		a.num,
		a.ChangeNum,
		a.StockNum,
		a.BoxNum,
		a.DispNum ,
		a.costprice,
		a.examineUserCode,
		a.At, 
		CONVERT(char(10),a.at,120) as At#,
		a.Status,
		a.Note,
		b.IdCode,
		b.SelfCode,
		b.BarCode, 
		b.PymCode, 
		b.Name,
		b.Spec, 
		b.Pack,
		b.Name + b.Spec AS ng, 
		b.Unit, 
		b.CateCode, 
		b.inPrice, 
		b.Price1, 
		b.Price2, 
		b.PicSrc,
		b.Brand, b.Origin
FROM        L_Bill_StockChanges_Tab a INNER JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode





' 
GO
/****** Object:  View [dbo].[V_CalcCostPrice]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_CalcCostPrice]'))
EXEC dbo.sp_executesql @statement = N'


CREATE view [dbo].[V_CalcCostPrice] as
select ''报损'' as Title, ProductCode,at# as At,SUM(ChangeNum) as num,SUM(ChangeNum*CostPrice) as CostMoney from v_Bill_StockChanges_Tab where ChangeNum<0 group by ProductCode,at#
union all
select ''销售'' as Title,ProductCode,DeliveryAt,SUM(numex) as num,SUM(numex*CostPrice) as CostMoney from V_Bill_Sales_Tab group by ProductCode,DeliveryAt







' 
GO
/****** Object:  View [dbo].[V_Shipper_AcceptList_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_AcceptList_Tabs]'))
EXEC dbo.sp_executesql @statement = N'









/*供应商接单对应单据明细*/

CREATE VIEW [dbo].[V_Shipper_AcceptList_Tabs]
AS
SELECT  a.Idkey, 
		a.BillNumber, 
		a.ShipperCode,
		(select Name From L_Basic_Company_Tab where IdCode = a.ShipperCode) as shipperName, 
		a.ProductCode,
		b.IdCode, 
		b.PicSrc, 
		a.CustomerCode, 
		b.BarCode, 
		b.Name, 
		b.Spec, 
		b.Unit,
		b.Punit,
		b.CateCode,
		a.SaleType,
		a.DownUnit,
		a.DownWg,
		a.StockNum,  
		a.num, 
		a.Numex,
		a.costprice, 
		a.salePrice, 
		a.examineUserCode, 
		a.At, 
		a.DeliveryAt, 
		a.Status, 
		a.Note, 
		a.BillType, 
		Case When a.SaleType = 2 THEN
			(SELECT STUFF(/*列数据转成行字符串*/
			( SELECT   '','' + cast(num as varchar(10))+''/''+cast(numex as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
				WHERE BillNumber = a.BillNumber and ProductCode = a.ProductCode and SaleType = a.SaleType
			  FOR XML PATH('''')
			 ), 1, 1, '''') AS jzhw)
		ELSE 
			(SELECT STUFF(/*列数据转成行字符串*/
			( SELECT   '','' + cast(num as varchar(10)) FROM V_Shipper_DisDetail_Tab WITH ( NOLOCK )
				WHERE BillNumber = a.BillNumber and ProductCode = a.ProductCode and SaleType = a.SaleType
			  FOR XML PATH('''')
			 ), 1, 1, '''') AS jzhw)
		END as NumList 
FROM    L_Bill_PurchaseOrders_Tab a  
		Left JOIN
		L_Basic_Product_Tab b 
        ON a.ProductCode = b.IdCode












' 
GO
/****** Object:  View [dbo].[V_Report_PurchaseOrder_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PurchaseOrder_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Report_PurchaseOrder_Tab]
AS
SELECT     dbo.L_Basic_Company_Tab.Name AS ShipperName, dbo.V_Bill_PurchaseOrders_Tab.Idkey, dbo.V_Bill_PurchaseOrders_Tab.BillNumber, 
                      dbo.V_Bill_PurchaseOrders_Tab.ShipperCode, dbo.V_Bill_PurchaseOrders_Tab.ProductCode, dbo.V_Bill_PurchaseOrders_Tab.num, 
                      dbo.V_Bill_PurchaseOrders_Tab.costprice, dbo.V_Bill_PurchaseOrders_Tab.salePrice, dbo.V_Bill_PurchaseOrders_Tab.examineUserCode, 
                      dbo.V_Bill_PurchaseOrders_Tab.At, dbo.V_Bill_PurchaseOrders_Tab.DeliveryAt, dbo.V_Bill_PurchaseOrders_Tab.Status, dbo.V_Bill_PurchaseOrders_Tab.Note, 
                      dbo.V_Bill_PurchaseOrders_Tab.Name, dbo.V_Bill_PurchaseOrders_Tab.Spec, dbo.V_Bill_PurchaseOrders_Tab.Unit, dbo.V_Bill_PurchaseOrders_Tab.CateCode, 
                      dbo.V_Bill_PurchaseOrders_Tab.IdCode, dbo.V_Bill_PurchaseOrders_Tab.PicSrc, 
                      dbo.V_Bill_PurchaseOrders_Tab.CustomerCode, dbo.V_Bill_PurchaseOrders_Tab.BarCode, dbo.V_Bill_PurchaseOrders_Tab.SelfCode, 
                      dbo.V_Bill_PurchaseOrders_Tab.PymCode, dbo.V_Bill_PurchaseOrders_Tab.MchCode
FROM         dbo.V_Bill_PurchaseOrders_Tab  INNER JOIN
                      dbo.L_Basic_Company_Tab ON dbo.V_Bill_PurchaseOrders_Tab.ShipperCode = dbo.L_Basic_Company_Tab.IdCode
WHERE     (dbo.V_Bill_PurchaseOrders_Tab.examineUserCode > 0)

' 
GO
/****** Object:  View [dbo].[V_Report_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_Purchase_Tab]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Report_Purchase_Tab]
AS
SELECT     b.Name AS ShipperName, a.Idkey, a.billnumber, 
                      a.ShipperCode, a.ProductCode, a.num, a.costprice, 
                      a.salePrice, a.examineUserCode, a.At, a.DeliveryAt, 
                      a.settlementAt,a.MrAt,
                      a.Status, a.Note, a.Name, a.Spec, 
                      a.Unit, a.IdCode, a.PicSrc, 
                      a.BarCode, a.SelfCode, a.PymCode, a.MchCode,
					  a.SaleType
FROM         dbo.V_Bill_Purchases_Tab a INNER JOIN
                      dbo.L_Basic_Company_Tab b ON a.ShipperCode = a.IdCode
WHERE     (a.mrUserCode > 0)



' 
GO
/****** Object:  View [dbo].[V_Purchase_Group_List_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Purchase_Group_List_Tab]'))
EXEC dbo.sp_executesql @statement = N'









CREATE VIEW [dbo].[V_Purchase_Group_List_Tab]
AS
/**
	采购汇总商品列表
	用于手机端
**/
SELECT 
		b.IdCode, 
		a.ProductCode,
		b.Name, 
		b.Name + isnull(b.Spec,'''') AS ng,
		b.BarCode, 
		b.PicSrc, 
		b.Unit, 
		b.PUnit,
		b.CateCode,
		(select name From L_Basic_Cate_Tab where idCode = b.CateCode) as cateName,
		(select SerialNum From L_Basic_Cate_Tab where idCode = b.CateCode) as SerialNum,
		b.spec,
		(select sum(num) * CASE WHEN a.SaleType = 4 THEN 2 ELSE 1 END from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg) as num,
		(select sum(numex) * CASE WHEN a.SaleType = 4 THEN 2 ELSE 1 END from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg) as numex,
		(select stuff((select '';''+CustomerName from V_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode and SaleType=a.saleType and DownWg=a.DownWg for xml path('''')),1,1,'''')) as CustomerList,
		a.AcceptNum,
		a.AcceptNumEx,
		a.FreeNum ,
		a.FreeNumEx,
		a.OweNum, 
		a.OweNumEx,
		a.AcceptStatus as Status,  
		b.Price1, 
		b.inPrice as costPrice, 
		a.DeliveryAt,
		a.SaleType,
		a.DownWg ,
		DownUnit,
		CASE WHEN (SELECT importStock FROM L_Sys_Parmars_Tab) =0 THEN 0 ELSE
		(
			(SELECT Isnull(SUM(AllowedNum),0)	FROM V_Stock WHERE a.ProductCode = ProductCode) -
			(select isNull(Sum(NumEx),0) from L_Bill_PurchaseOrders_Tab# where DeliveryAt = a.DeliveryAt and  a.ProductCode = ProductCode and BillNumber=''free'' and disStatus <> 1)
		 ) END Stock
FROM  (SELECT  ProductCode, 
				SUM(OweNum) AS OweNum,
				SUM(FreeNum) as FreeNum,
				SUM(AcceptNum) as AcceptNum,
				SUM(OweNumEx) AS OweNumEx,
				SUM(FreeNumEx) as FreeNumEx,
				SUM(AcceptNumEx) as AcceptNumEx,
				DeliveryAt, 
				min(AcceptStatus) as AcceptStatus,
				saleType,
				max(DownWg) as DownWg,
				max(DownUnit) as DownUnit
        FROM  (
			select ProductCode,
				OweNum * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END OweNum,
				OweNumEx * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END OweNumEx,
				FreeNum * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END FreeNum,
				FreeNumEx * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END FreeNumEx,
				AcceptNum * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END AcceptNum,
				AcceptNumEx * CASE WHEN SaleType = 4 THEN 2 ELSE 1 END AcceptNumEx,
				DeliveryAt,AcceptStatus,
				Case WHEN SaleType=4 THEN 0 ELSE SaleType END SaleType,
				CASE WHEN SaleType = 4 THEN Unit ELSE DownUnit END DownUnit,DownWg 
			from dbo.V_Bill_SaleOrders_Tab where examineUserCode<>0 and (AcceptStatus <2 or OweNum>0)
		) x
		GROUP BY DeliveryAt, ProductCode,/*AcceptStatus,*/SaleType/*,DownWg*/
       ) AS a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode





































' 
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Group_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Group_Tab]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[V_Bill_SaleOrders_Group_Tab]
AS
SELECT 
		b.IdCode, 
		a.ProductCode,
		b.Name, 
		b.Name + isnull(b.Spec,'''') AS ng,
		b.BarCode, 
		b.PicSrc, 
		b.Unit, 
		b.CateCode,
		--a.num,
		(select sum(num) from dbo.L_Bill_SaleOrders_Tab where DeliveryAt = a.DeliveryAt and ProductCode = a.ProductCode) as num,
		a.AcceptNum,
		a.FreeNum,
		a.OweNum, 
		a.AcceptStatus as Status,  
		b.Price1, 
		b.inPrice, 
		a.DeliveryAt, 
		ISNULL((SELECT SUM( Num-WaitOutNum)	FROM V_Stock WHERE a.ProductCode = ProductCode), 0) AS Stock
FROM  (SELECT  ProductCode, 
				SUM(OweNum) AS OweNum,
				SUM(FreeNum) as FreeNum,
				SUM(AcceptNum) as AcceptNum,
				--SUM(Num) as Num, 
				DeliveryAt, 
				AcceptStatus
        FROM  (select * from dbo.L_Bill_SaleOrders_Tab where AcceptStatus <2 or OweNum>0) x
		GROUP BY DeliveryAt, ProductCode, AcceptStatus
       ) AS a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode






' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_Split_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Split_Tab]'))
EXEC dbo.sp_executesql @statement = N'













CREATE VIEW [dbo].[V_Bill_Sales_Split_Tab]
AS
/**
拆分临时表
**/
	SELECT  a.Idkey, 
			a.billnumber, 
			a.UserCode,
			a.CustomerCode, 
			a.AccountBookCode,
			a.AreaCode,
			a.ProductCode, 
			a.DownUnit,
			a.DownWg,
			a.SaleType,
			a.DownUnitType,
			a.num, 
			a.numEx,
			a.curSalePrice,
			a.costprice, 
			a.salePrice, 
			a.Note, 
			b.BarCode, 
			b.SelfCode, 
			b.IdCode, 
			b.PymCode, 
			case when (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType)=0 then
				b.Name 
			else 
				(select top 1 AliasName from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType) 
			end name,
			b.Spec,
			b.Name+b.Spec as ng, 
			Case When a.SaleType =3 then b.PUnit Else  Case When a.SaleType = 4  or a.SaleType = 2 then c.DownUnit else b.Unit end end Unit,
			b.PUnit,
			b.inPrice, 
			b.PicSrc, 
			
			a.Pack
	FROM	(
		select * from L_Bill_Sales_Split_Tab 
	) a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
	 Left Join V_Basic_Customer_Tab c on a.CustomerCode = c.idcode

























































' 
GO
/****** Object:  View [dbo].[V_Stock_Q]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Q]'))
EXEC dbo.sp_executesql @statement = N'
CREATE View [dbo].[V_Stock_Q] as
select * from (
select a.IdCode as ProductCode,a.BarCode,a.Name,a.Spec,a.unit,a.CateCode,isNull(b.AllowedNum,0) as num,a.LowerLimit,(a.LowerLimit-ISNULL(b.AllowedNum,0)) as qNum  from 
	(select * from L_Basic_Product_Tab where LowerLimit>0 ) a left join V_Stock b 
	on a.idcode = b.productcode 
) x where ISNULL(num,0)<LowerLimit


' 
GO
/****** Object:  View [dbo].[V_Stock_m]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_m]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Stock_m] as
select * from (
select a.IdCode as ProductCode,a.BarCode,a.Name,a.Spec,a.unit,a.CateCode,isNull(b.AllowedNum,0) as num,a.UpperLimit,(a.UpperLimit-ISNULL(b.AllowedNum,0)) as mNum  from 
	(select * from L_Basic_Product_Tab where UpperLimit>0) a left join V_Stock b 
	on a.idcode = b.productcode 
) x where ISNULL(num,0)>UpperLimit 

' 
GO
/****** Object:  View [dbo].[V_Bill_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_Tab]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Bill_Sale_Tab]
AS
SELECT  a.BillNumber, 
		a.customerOrderId,
		a.CustomerCode, 
		b.Pcode,
		b.SelfCode as CustomerSelfCode,
		b.relationcode,
		b.DownUnitType,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.EntryUserCode,
		a.EntryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name as CustomerName, 
		a.OrderBillNumber, 
		a.DeliveryAt, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.InvNumber, 
		a.InvMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.DriverCode, 
		a.AlreadyMoney, 
		a.oweMoney, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.InvOweMoney, 
		a.DeliveryCode, 
		a.Profit, 
		a.FreeMoney,
		b.dr,
		b.decimalBit,
		b.SaleFromQuotePrice,
		b.QualityGrade,
		b.lineName,
		CASE WHEN a.ExamineUserCode=0 Or ABS(a.oweMoney)>0.1 THEN 0 ELSE 1 END [OVER],
		CASE WHEN a.DisType = 2 THEN ''到店自提'' ELSE ''送货上门'' end DisType
FROM  (
	select * From L_Bill_Sale_Tab#  Union All
	select * From L_Bill_Sale_Tab 
) a INNER JOIN
                      L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode





' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tabs]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Bill_Sales_Tabs] 
AS
/**销售批次匹配表**/
SELECT a.*,b.CustomerCode FROM L_Bill_Sales_Tabs a,V_Bill_Sale_Tab b WHERE a.BillNumber = b.BillNumber' 
GO
/****** Object:  View [dbo].[V_BatchNumberSale_From]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_BatchNumberSale_From]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_BatchNumberSale_From] 

AS
/**销售批次来源**/
SELECT a.SaleIdkey, a.DeliveryAt,b.DeliveryAt AS PurchaseAt,a.BatchNumber,a.num,a.numEx,b.costprice,a.numEx*b.costprice as CostMoney,
b.ShipperCode,b.billnumber AS PurchaseBillNumber 
FROM l_bill_sales_Tabs a,V_Bill_Purchases_Tab b 
WHERE  a.ProductCode = b.ProductCode AND a.SaleType = b.SaleType AND a.BatchNumber = b.BatchNumber 

' 
GO
/****** Object:  View [dbo].[V_BatchNumberPurchase_To]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_BatchNumberPurchase_To]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_BatchNumberPurchase_To]

AS
/**采购批次去向**/
SELECT a.DeliveryAt,b.DeliveryAt AS PurchaseAt,a.BatchNumber,a.num,a.numEx,b.costprice,a.numEx*b.costprice as CostMoney,b.CustomerCode,b.billnumber AS PurchaseBillNumber 
FROM V_Bill_Purchases_Tab a,V_Bill_Sales_Tabs b WHERE a.ProductCode = b.ProductCode AND a.SaleType = b.SaleType AND a.BatchNumber = b.BatchNumber 


' 
GO
/****** Object:  View [dbo].[V_Bill_QuotedPrice_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_QuotedPrice_Tab]'))
EXEC dbo.sp_executesql @statement = N'






CREATE view [dbo].[V_Bill_QuotedPrice_Tab] as 
select *,
(select name from L_Basic_Company_Tab where IdCode=a.customerCode) as name, 
(select relationcode from L_Basic_Company_Tab where IdCode=a.customerCode) as relationcode,
(select DownUnit from V_Basic_Customer_Tab where IdCode=a.customerCode) as DownUnit,
(select DownUnitType from V_Basic_Customer_Tab where IdCode=a.customerCode) as DownUnitType,
(select QualityGrade from V_Basic_Customer_Tab where IdCode=a.customerCode) as QualityGrade
from L_Bill_QuotedPrice_Tab a






' 
GO
/****** Object:  View [dbo].[V_Bill_QuotedPrices_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_QuotedPrices_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Bill_QuotedPrices_Tab]
AS
SELECT 
    a.Idkey, 
    a.SerialNumber,
    a.CustomerProcudeCode,
    a.billnumber, 
    a.ProductCode, 
    a.CurSalePrice,
    a.salePrice,
    ABS(a.curSalePrice - a.salePrice) as changePrice,
    ISNULL(CASE WHEN c.Pcode > 0 THEN ten1.TenSaleNum ELSE ten2.TenSaleNum END, 0) as TenSaleNum,
    a.examineUserCode, 
    a.At, 
    a.Status, 
    a.Note, 
    b.BarCode, 
    b.SelfCode, 
    b.IdCode, 
    b.Name,
    b.name + ''/'' + b.AliasName as AliasNameList,
    a.AliasName,
    CASE WHEN c.DownUnitType = 1 AND a.SaleType = 0 THEN 4 ELSE a.SaleType END as SaleType, 
    b.Spec,
    CASE WHEN a.SaleType = 3 THEN b.Punit 
         WHEN a.SaleType = 0 THEN c.DownUnit 
         ELSE b.Unit 
    END Unit,
    CASE WHEN a.SaleType = 3 THEN b.inPrice * b.Pack 
         WHEN a.SaleType = 0 AND c.DownUnit = ''公斤'' THEN b.inPrice * 2 
         ELSE b.inPrice 
    END costprice,
    b.PicSrc, 
    b.Brand, 
    b.Origin, 
    b.Pack,
    b.CateCode,
    a.defaultShipperCode,
	a.QualityGrade,
    CASE WHEN p.GroupByBigCate = 0 THEN cate1.Name ELSE cate2.Name END cateName,
    cate1.SerialNum as cateSerialNum
FROM dbo.L_Bill_QuotedPrices_Tab a 
LEFT JOIN dbo.L_Basic_Product_Tab b ON a.ProductCode = b.IdCode AND b.Status = 0
LEFT JOIN V_Bill_QuotedPrice_Tab c ON a.billnumber = c.BillNumber
CROSS JOIN (SELECT TOP 1 GroupByBigCate FROM l_sys_Parmars_Tab) p
LEFT JOIN (
    SELECT ProductCode, SaleType, Pcode, SUM(numex) as TenSaleNum
    FROM V_Bill_Sales_Tab 
    WHERE DeliveryAt >= DATEADD(day, -30, CAST(GETDATE() AS DATE))
    GROUP BY ProductCode, SaleType, Pcode
) ten1 ON a.ProductCode = ten1.ProductCode AND a.SaleType = ten1.SaleType AND c.Pcode = ten1.Pcode AND c.Pcode > 0
LEFT JOIN (
    SELECT ProductCode, SaleType, CustomerCode, SUM(numex) as TenSaleNum
    FROM V_Bill_Sales_Tab 
    WHERE DeliveryAt >= DATEADD(day, -30, CAST(GETDATE() AS DATE))
    GROUP BY ProductCode, SaleType, CustomerCode
) ten2 ON a.ProductCode = ten2.ProductCode AND a.SaleType = ten2.SaleType AND c.CustomerCode = ten2.CustomerCode
LEFT JOIN L_Basic_Cate_Tab cate1 ON b.CateCode = cate1.idcode
LEFT JOIN L_Basic_Cate_Tab cate2 ON b.CateCode/100 = cate2.idcode



' 
GO
/****** Object:  View [dbo].[V_Bill_Distribution_DetialEx_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Distribution_DetialEx_Tab]'))
EXEC dbo.sp_executesql @statement = N'















-- select * from V_Bill_Distribution_DetialEx_Tab where DeliveryAt = ''2024-04-08'' and ProductCode = 10147



CREATE VIEW [dbo].[V_Bill_Distribution_DetialEx_Tab]
AS
/**PC端用 配货明细，按分类，货商配货时有效**/
SELECT  a.Idkey, 
		a.billnumber, 
		a.OrderBillNumber,
		a.OrderIdKey as saleOrderIdkey,
		a.CustomerCode,
		(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		(select Name from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerName,
		(select ShortName from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerShortName,
		(select DeliveryAt from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as DisAt,
		IsNull((select top 1 a.ShipperCode From L_Bill_PurchaseOrder_Tab x, L_Bill_PurchaseOrders_Tab# b where a.OrderIdKey = b.SaleOrderIdkey and b.billnumber = x.BillNumber),0) as ShipperCode,
		a.ProductCode, 
		b.IdCode, 
		b.BarCode, 
		b.Name ,
		isNull(b.Spec,'''') as Spec, 
		b.Unit, b.Punit,
		CASE WHEN a.SaleType = 4 THEN 0 ELSE a.SaleType END SaleType,
		a.DownWg,
		CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
		b.PicSrc, 
		b.CateCode,
		(select SerialNum from L_Basic_Cate_Tab where IdCode = b.CateCode) as SerialNum,
		a.OrderNum * DoubleNumExBase AS OrderNum,
		a.num*DoubleNumBase AS num,
		[dbo].[xb_trim]((a.numEx - a.replaceNumEx)* DoubleNumExBase) as NumEx,
		[dbo].[xb_trim]((a.numEx - a.replaceNumEx-IsNull(a.DisTributionNum,0))* DoubleNumExBase) as oweNumEx,
		[dbo].[xb_trim]((a.numEx - a.replaceNumEx)* DoubleNumExBase )+b.Unit+case when ISNULL(a.note,'''')='''' then '''' else ''【''+a.Note+''】'' end as DisNumEx,
		a.DisTributionNum  * DoubleNumExBase AS DisTributionNum,
		(a.DisTributionNum - a.OrderNum)  *DoubleNumExBase AS DiffNum,
		a.costprice, 
		a.salePrice, 
		a.examineUserCode, 
		a.At, 
		a.DeliveryAt, 
		a.Status, 
		a.DisTributionStatus,
		a.Note
		
FROM  dbo.V_Bill_Sales_Tab AS a INNER JOIN
                      dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode










































' 
GO
/****** Object:  View [dbo].[V_Stock_Detail]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_Detail]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[V_Stock_Detail]
AS
WITH StockSummary AS (
    SELECT AccountBookCode, 
           AreaCode,
           ProductCode, 
		   BatchNumber,
           SUM(StockNum) AS Num,
           SUM(WaitIn) AS WaitInNum,
           SUM(WaitOut) AS WaitOutNum,
           MAX(costPrice) AS avgPrice,
           SUM(Money) AS SumMoney,
           CAST(SUM(StockNum) + SUM(WaitIn) - SUM(WaitOut) AS DECIMAL(18, 2)) AS AllowedNum
    FROM (
        SELECT AccountBookCode, AreaCode, ProductCode,BatchNumber, Num AS StockNum, 0 AS WaitIn, 0 AS WaitOut, CostPrice, Money
        FROM V_Stock_tab
        UNION ALL
        SELECT AccountBookCode, AreaCode, ProductCode,BatchNumber, 0 AS StockNum, num AS WaitIn, 0 AS WaitOut, CostPrice AS CostPrice, Money AS Money
        FROM V_Stock_WaitIn 
        UNION ALL
        SELECT AccountBookCode, AreaCode, ProductCode,BatchNumber, 0 AS StockNum, 0 AS WaitIn, num AS WaitOut,  CostPrice, Num * CostPrice * -1 AS Money
        FROM (
				SELECT AccountBookCode,AreaCode,ProductCode,BatchNumber,Num,costprice FROM V_Stock_WaitOut a
				WHERE NOT EXISTS (SELECT 1 FROM V_Stock_WaitOuts b  WHERE b.ProductCode = b.ProductCode)
				UNION ALL
				SELECT AccountBookCode,AreaCode,ProductCode,BatchNumber,Num,costprice FROM V_Stock_WaitOuts
			) y
    ) x
    GROUP BY AccountBookCode, AreaCode, ProductCode,BatchNumber
)
SELECT a.AccountBookCode, 
       a.AreaCode,
       a.ProductCode, 
       b.BarCode, 
       b.Name,
       b.Spec,
       b.Pack,
       b.Unit, 
       b.CateCode, 
       b.ShipperCode,
       a.avgPrice,
       a.BatchNumber,
       a.Num, 
       a.WaitInNum, 
       a.WaitOutNum,
       a.AllowedNum,
       a.AllowedNum * a.avgPrice AS SumMoney, 
       b.Note
FROM StockSummary a
INNER JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
WHERE a.Num <> 0 
   OR a.WaitInNum <> 0 
   OR a.WaitOutNum <> 0
   OR a.AllowedNum <> 0





' 
GO
/****** Object:  View [dbo].[V_Customer_Price_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Price_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Customer_Price_Tab]
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
        WHEN a.SaleType = 0 AND c.DownUnit = ''公斤'' THEN b.inPrice * 2 
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
' 
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Tab]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Bill_Purchase_Tab]
AS
/**
	采购明细表（包括扩展表）
**/
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name as ShipperName,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney,
		CASE WHEN ABS(a.oweMoney)>0.1 THEN 0 ELSE 1 END [OVER]
FROM   (
	select * from L_Bill_Purchase_Tab# where billType in (0,1,2) Union All
	select * from L_Bill_Purchase_Tab where billType in (0,1,2)
) a Left JOIN L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode










' 
GO
/****** Object:  View [dbo].[V_Reports_Purchase]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Purchase]'))
EXEC dbo.sp_executesql @statement = N'






CREATE View [dbo].[V_Reports_Purchase] as
/*采购报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.OrderBillNumber,
		a.ShipperCode,
		a.SettlementType,
		a.AccountDay,
		a.AccountBookCode,
		a.AreaCode,
		a.status,
		b.SaleType,
		b.At,
		b.DeliveryAt,
		a.settlementAt,
		a.examineAt,
		a.examineUserCode,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		a.InvNumber,
		a.InvMoney,
		b.idkey,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.num,
		b.numEx,
		b.ActualCostPrice,
		b.costprice,
		b.salePrice,
		b.numEx * b.costprice as SumMoney,
		b.numEx * b.ActualCostPrice as ActualSumMoney,
		b.Note	,
		b.BatchNumber	
from V_Bill_Purchase_Tab a,V_Bill_Purchases_Tab b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode











' 
GO
/****** Object:  View [dbo].[V_Reports_Sale]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Sale]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Reports_Sale]
AS
/*销售报表*/
SELECT a.BillNumber,
       a.CurBillNumber,
       a.OrderBillNumber,
       a.MchCode,
       a.CustomerCode,
       a.pcode,
       a.SettlementType,
       a.AccountDay,
       a.AccountBookCode,
       b.AreaCode,
       a.SalesMan,
       a.DriverCode,
       a.DeliveryCode,
       a.status,
       a.note AS MainNote,
       b.At,
       a.DeliveryAt,
       a.examineUserCode,
       a.InvNumber,
       a.InvMoney,
       b.Idkey,
       b.productCode,
       c.BarCode,
       c.SelfCode,
       c.PymCode,
       c.CateCode,
       b.Name,
       c.AliasName,
       c.Name AS CurName,
       c.Spec,
       b.Unit AS Unit,
       c.Unit AS MinUnit,
       c.Origin,
       c.Brand,
       b.OrderNum,
       (b.numEx - b.replaceNumEx) * b.DoubleNumExBase * b.PackBase AS ExChangeNumEx,
       b.numEx - b.replaceNumEx AS NumEx,
       b.numEx AS SettlementNumEx,
       b.replaceNumEx,
       b.ActualCostPrice,
       b.costprice,
       ROUND(b.salePrice, 2) AS salePrice,
       b.DisTributionAt,
       b.DisTributionNum,
       b.DisTributionUserCode,
       (b.numEx - b.replaceNumEx) * b.ActualCostPrice AS ActualCostMoney,
       (b.numEx - b.replaceNumEx) * b.CostPrice AS CostMoney,
       ROUND((b.numEx - b.replaceNumEx) * ROUND(b.salePrice, 2), 2) AS SaleMoney,
       ROUND(b.numEx * ROUND(b.salePrice, 2), 2) AS SettlementMoney,
      -- (b.numEx - b.replaceNumEx) * (b.CostPrice - b.ActualCostPrice) AS KsMoney,
	  b.lossMoney as KsMoney,
       b.replaceNumEx * b.salePrice AS ReplaceSaleMoney,
       b.Profit,
       CASE WHEN (b.numEx * b.salePrice) = 0 THEN -100 ELSE b.Profit / (b.numEx * b.salePrice) * 100 END AS ProfitRate,
       b.Note,
       b.LossNote,
       b.BatchNumber
FROM v_Bill_sale_Tab a
INNER JOIN v_Bill_sales_Tab b ON a.BillNumber = b.billnumber
INNER JOIN L_Basic_Product_Tab c ON b.ProductCode = c.IdCode
WHERE a.examineUserCode > 0

' 
GO
/****** Object:  View [dbo].[V_Reports_SaleList]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleList]'))
EXEC dbo.sp_executesql @statement = N'
CREATE View [dbo].[V_Reports_SaleList] as
/**每日客户销售表*/
select a.CustomerCode,b.Name,B.Tel,B.Addr,b.Person,a.DeliveryAt,a.costMoney,a.saleMoney,a.Profit From 
	(select CustomerCode,DeliveryAt,Sum(costMoney) as costMoney,Sum(saleMoney) as saleMoney,Sum(Profit) as Profit from V_Bill_Sale_Tab group by  CustomerCode,DeliveryAt) a 
	LEFT JOIN L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode
' 
GO
/****** Object:  View [dbo].[V_Basic_K_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_K_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[V_Basic_K_Tab] as
select a.*,b.BarCode, b.name,b.Spec,b.Unit,b.CateCode,CONVERT(char(10),getdate()+1,120) as DeliveryAt from L_Basic_K_Tab a left Join L_Basic_Product_Tab b on a.ProductCode = b.IdCode
' 
GO
/****** Object:  View [dbo].[v_Bill_SaleOrder_K]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Bill_SaleOrder_K]'))
EXEC dbo.sp_executesql @statement = N'



CREATE view [dbo].[v_Bill_SaleOrder_K] as
/**商品定位与销售订单合并**/
/*select 
	b.Idkey,b.billnumber,b.MchCode,b.CustomerCode,b.DoubleNumBase,b.DoubleNumExBase,
	b.PackBase,b.AccountBookCode,b.AreaCode,case when b.ProductCode is null Then a.ProductCode else b.ProductCode end ProductCode,
	b.DownUnit,b.DownWG,b.Pack,b.SaleType,b.num,b.NumEx,b.replaceNumEx,
	b.costprice,b.curSalePrice,b.salePrice,b.examineUserCode,b.at,
	IsNull(b.DeliveryAt,a.DeliveryAt) as DeliveryAt,b.DisTributionNum,b.StockNum,b.BillType,b.Status,b.Note,
	b.DetailNote,b.OweNum,b.OweNumEx,b.FreeNum,b.FreeNumEx,b.AcceptNumEx,b.AcceptNum,b.AcceptStatus,b.defaultShipperCode,
	IsNull(a.SerialNumber,99999) as SerialNumber

 from V_Basic_K_Tab a full Join L_Bill_SaleOrders_Tab b  on a.ProductCode = b.ProductCode and a.DeliveryAt = b.DeliveryAt

 */
 select 
	b.Idkey,b.billnumber,b.MchCode,b.CustomerCode,b.DoubleNumBase,b.DoubleNumExBase,
	b.PackBase,b.AccountBookCode,b.AreaCode,case when b.ProductCode is null Then a.ProductCode else b.ProductCode end ProductCode,
	b.DownUnit,b.DownWG,b.Pack,b.SaleType,b.num,b.NumEx,b.replaceNumEx,
	b.costprice,b.curSalePrice,b.salePrice,b.examineUserCode,b.at,
	IsNull(b.DeliveryAt,a.DeliveryAt) as DeliveryAt,b.DisTributionNum,b.StockNum,b.BillType,b.Status,b.Note,
	b.DetailNote,b.OweNum,b.OweNumEx,b.FreeNum,b.FreeNumEx,b.AcceptNumEx,b.AcceptNum,b.AcceptStatus,b.defaultShipperCode,
	IsNull(a.SerialNumber,99999) as SerialNumber

 from L_Bill_SaleOrders_Tab b LEFT JOIN V_Basic_K_Tab a  on a.ProductCode = b.ProductCode 


' 
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Tab_K]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Tab_K]'))
EXEC dbo.sp_executesql @statement = N'

-- select * from [V_Bill_SaleOrders_Tab_K]

CREATE VIEW [dbo].[V_Bill_SaleOrders_Tab_K]
AS
SELECT  a.Idkey, 
		a.billnumber,
		a.MchCode,
		a.CustomerCode, 
		c.name as CustomerName,
		a.DoubleNumBase, --如果为SaleType=4有效公斤计算，基数为2
		a.DoubleNumExBase, --如果为公斤计算，基数为2
		a.PackBase, --件转散基数
		a.AccountBookCode, 
		a.AreaCode, 
		a.ProductCode,
		b.IdCode,
		b.BarCode,  
		--b.Name, 
		b.Name + isNull(b.Spec,'''') AS ng, 
		CASE WHEN d.AliasName is Null then b.Name ELSE d.AliasName END Name,
		b.Spec, 
		Case When a.SaleType =3 then b.PUnit Else Case When a.SaleType = 4 or a.SaleType = 2 then c.DownUnit else b.Unit end end Unit,
		b.Unit as MinUnit,
		b.PUnit,
		a.DownUnit,
		a.DownWG,
		a.Pack,
		b.DownWgSpec,
		b.domethod,
		IsNull(a.SaleType,0) as SaleType,
		b.PicSrc,
		b.CateCode, 
		b.inPrice,  
		a.num, 
		a.NumEx,
		a.replaceNumEx,
		a.costprice, 
		a.curSalePrice,
		a.salePrice, 
		IsNull(a.examineUserCode,1) as examineUserCode , 
		a.At, 
		a.DeliveryAt, 
		a.DisTributionNum, 
		a.StockNum, 
		IsNull(a.BillType,999) as BillType, 
		a.Status,
		a.Note,
		a.DetailNote,
		OweNum,OweNumEx,FreeNum,FreeNumEx,AcceptNumEx,AcceptNum,AcceptStatus,
		a.defaultShipperCode,a.SerialNumber
FROM         V_Bill_SaleOrder_K a LEFT JOIN
                      L_Basic_Product_Tab b  ON a.ProductCode = b.IdCode Left Join V_Basic_Customer_Tab c on a.CustomerCode = c.idcode
					   LEFT JOIN
			 L_Basic_Customer_Price_Tab D on d.PCode = a.CustomerCode and d.ProductCode = a.ProductCode and d.SaleType=a.SaleType









































' 
GO
/****** Object:  View [dbo].[V_Basic_Cate_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Cate_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Basic_Cate_Tab]
AS
SELECT     idCode, PCode, MchCode, Name, PicSrc,SerialNum, Note,defaultShipperCode,AddPriceRate
FROM         dbo.L_Basic_Cate_Tab

' 
GO
/****** Object:  View [dbo].[V_Basic_Company_Area_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Company_Area_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Basic_Company_Area_Tab] as
select *,NameC+NameB+NameA+Name as addr from
(
select * , 
(select case when x.IdCode / 1000000 =0 then '''' else Name end from L_Basic_Company_Area_Tab where IdCode = x.IdCode / 1000000) as NameC, 
(select case when x.IdCode / 10000 =0 then '''' else Name end from L_Basic_Company_Area_Tab where IdCode = x.IdCode / 10000) as NameB, 
 (select case when x.IdCode / 100 =0 then '''' else Name end from L_Basic_Company_Area_Tab where IdCode = x.IdCode / 100) as NameA
 from L_Basic_Company_Area_Tab x
) a
' 
GO
/****** Object:  View [dbo].[V_Basic_Company_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Company_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Basic_Company_Tab]
AS
SELECT     IdCode, wxCode, PymCode, Name,ShortName, Addr, Tel, Person, RelationCode, CateCode, SettlementType, AccountDay, SalesMan, InsUserCode, InsAt, EditUserCode, 
                      EditAt, picSrc, PriceLevel, Status, Note
FROM         dbo.L_Basic_Company_Tab


' 
GO
/****** Object:  View [dbo].[V_Basic_CustomerAndStore_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_CustomerAndStore_Tab]'))
EXEC dbo.sp_executesql @statement = N'Create VIEW [dbo].[V_Basic_CustomerAndStore_Tab]
AS
SELECT     IdCode, Addr, Tel, Note, Person, Name, SettlementType, AccountDay
FROM         dbo.L_Basic_Company_Tab
WHERE     (IdCode = 0) OR
                      (IdCode > 90000)
union all

select  IdCode, Addr, Tel, Note, Person, Name, SettlementType, AccountDay
FROM         dbo.L_Basic_Store_Tab
WHERE     (IdCode > 0)
' 
GO
/****** Object:  View [dbo].[V_Basic_Product_Comb_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Product_Comb_Tab]'))
EXEC dbo.sp_executesql @statement = N'
 CREATE View [dbo].[V_Basic_Product_Comb_Tab] as
 /*商品拆零配置*/
   select a.Idkey,a.PCode,a.ProductCode,b.BarCode,b.Name,b.Spec,b.Unit, a.num,b.inPrice,a.Note from L_Basic_Product_Comb_Tab a left join L_Basic_Product_Tab b on a.ProductCode = b.idcode
' 
GO
/****** Object:  View [dbo].[V_Basic_Shipper_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_Shipper_Tab]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[V_Basic_Shipper_Tab]
AS
SELECT     IdCode,selfCode, Name,ShortName, Addr, Tel, Note, Person, picSrc, CateCode, SettlementType, AccountDay, SalesMan, InsUserCode, InsAt, EditUserCode, EditAt, PriceLevel, Status, PymCode, 
                      wxCode, AreaCode,subscribemessagenum,allowedChangeProduct
FROM         dbo.L_Basic_Company_Tab
WHERE     (IdCode < 10000)









' 
GO
/****** Object:  View [dbo].[V_Basic_User_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Basic_User_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Basic_User_Tab]
AS
SELECT     a.IdCode, a.Name, a.Post, b.Name AS PostName, a.Store, a.RelationCode, a.TEL
FROM         dbo.L_Basic_User_Tab AS a INNER JOIN
                      dbo.L_Basic_Post_Tab AS b ON a.Post = b.IdCode
' 
GO
/****** Object:  View [dbo].[V_Bill_AreaExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_AreaExChange_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_AreaExChange_Tab]
AS
SELECT     dbo.L_Bill_AreaExChange_Tab.*
FROM         dbo.L_Bill_AreaExChange_Tab
' 
GO
/****** Object:  View [dbo].[V_Bill_AreaExChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_AreaExChanges_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_AreaExChanges_Tab]
AS
SELECT     dbo.L_Bill_AreaExChanges_Tab.Idkey, dbo.L_Bill_AreaExChanges_Tab.MchCode, dbo.L_Bill_AreaExChanges_Tab.ShipperCode, dbo.L_Bill_AreaExChanges_Tab.AccountBookCode, 
                      dbo.L_Bill_AreaExChanges_Tab.OutAreaCode, dbo.L_Bill_AreaExChanges_Tab.InAreaCode, dbo.L_Bill_AreaExChanges_Tab.billnumber, dbo.L_Bill_AreaExChanges_Tab.ProductCode, 
                      dbo.L_Bill_AreaExChanges_Tab.StockNum, dbo.L_Bill_AreaExChanges_Tab.num, dbo.L_Bill_AreaExChanges_Tab.CostPrice, dbo.L_Bill_AreaExChanges_Tab.SalePrice, 
                      dbo.L_Bill_AreaExChanges_Tab.examineUserCode, dbo.L_Bill_AreaExChanges_Tab.At, dbo.L_Bill_AreaExChanges_Tab.Status, dbo.L_Bill_AreaExChanges_Tab.Note, 
                      dbo.L_Basic_Product_Tab.BarCode, dbo.L_Basic_Product_Tab.SelfCode, dbo.L_Basic_Product_Tab.PymCode, dbo.L_Basic_Product_Tab.Name, dbo.L_Basic_Product_Tab.Spec, 
                      dbo.L_Basic_Product_Tab.Pack, dbo.L_Basic_Product_Tab.Unit, dbo.L_Basic_Product_Tab.Brand, dbo.L_Basic_Product_Tab.Origin, dbo.L_Basic_Product_Tab.CateCode, 
                      dbo.L_Basic_Product_Tab.inPrice, dbo.L_Basic_Product_Tab.Price1, dbo.L_Basic_Product_Tab.Price2, dbo.L_Basic_Product_Tab.price3, dbo.L_Basic_Product_Tab.PicSrc, 
                      dbo.L_Bill_AreaExChanges_Tab.AreaCode, dbo.L_Bill_AreaExChanges_Tab.BoxNum, dbo.L_Bill_AreaExChanges_Tab.DispNum
FROM         dbo.L_Bill_AreaExChanges_Tab INNER JOIN
                      dbo.L_Basic_Product_Tab ON dbo.L_Bill_AreaExChanges_Tab.ProductCode = dbo.L_Basic_Product_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_Bill_PriceChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PriceChange_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_PriceChange_Tab]
AS
SELECT     dbo.L_Bill_PriceChange_Tab.*
FROM         dbo.L_Bill_PriceChange_Tab
' 
GO
/****** Object:  View [dbo].[V_Bill_PriceChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_PriceChanges_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_PriceChanges_Tab]
AS
SELECT     dbo.L_Bill_PriceChanges_Tab.Idkey, dbo.L_Bill_PriceChanges_Tab.MchCode, dbo.L_Bill_PriceChanges_Tab.AccountBookCode, 
                      dbo.L_Bill_PriceChanges_Tab.CompanyCode, dbo.L_Bill_PriceChanges_Tab.billnumber, dbo.L_Bill_PriceChanges_Tab.ProductCode, 
                      dbo.L_Bill_PriceChanges_Tab.StockNum, dbo.L_Bill_PriceChanges_Tab.num, dbo.L_Bill_PriceChanges_Tab.CurCostPrice, dbo.L_Bill_PriceChanges_Tab.CostPrice, 
                      dbo.L_Bill_PriceChanges_Tab.CurSalePrice, dbo.L_Bill_PriceChanges_Tab.SalePrice, dbo.L_Bill_PriceChanges_Tab.CurVipPrice, 
                      dbo.L_Bill_PriceChanges_Tab.VipPrice, dbo.L_Bill_PriceChanges_Tab.examineUserCode, dbo.L_Bill_PriceChanges_Tab.At, dbo.L_Bill_PriceChanges_Tab.Status, 
                      dbo.L_Bill_PriceChanges_Tab.Note, dbo.L_Basic_Product_Tab.BarCode, dbo.L_Basic_Product_Tab.SelfCode, dbo.L_Basic_Product_Tab.PymCode, 
                      dbo.L_Basic_Product_Tab.Spec, dbo.L_Basic_Product_Tab.Name, dbo.L_Basic_Product_Tab.Pack, dbo.L_Basic_Product_Tab.Unit, dbo.L_Basic_Product_Tab.Brand, 
                      dbo.L_Basic_Product_Tab.Origin, dbo.L_Basic_Product_Tab.inPrice, dbo.L_Basic_Product_Tab.Price1, dbo.L_Basic_Product_Tab.Price2, 
                      dbo.L_Basic_Product_Tab.PicSrc
FROM         dbo.L_Bill_PriceChanges_Tab INNER JOIN
                      dbo.L_Basic_Product_Tab ON dbo.L_Bill_PriceChanges_Tab.ProductCode = dbo.L_Basic_Product_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Entry_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Entry_Tab]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[V_Bill_Purchase_Entry_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name as ShipperName,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney
FROM    (select * from L_Bill_Purchase_Tab# where MrUserCode>0 
	Union All
	select * from L_Bill_Purchase_Tab where MrUserCode>0
) a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode







' 
GO
/****** Object:  View [dbo].[V_Bill_Purchase_ExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_ExChange_Tab]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[V_Bill_Purchase_ExChange_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name as ShipperName,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney
FROM    (select * from L_Bill_Purchase_Tab# where billType = 2 Union All select * from L_Bill_Purchase_Tab where billType = 2) a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode






' 
GO
/****** Object:  View [dbo].[V_Bill_Purchase_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Purchase_Return_Tab]'))
EXEC dbo.sp_executesql @statement = N'





CREATE VIEW [dbo].[V_Bill_Purchase_Return_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name as ShipperName,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney,
		CASE WHEN a.ExamineUserCode=0 Or ABS(a.oweMoney)>0.1 THEN 0 ELSE 1 END [OVER]
FROM    (select * from L_Bill_Purchase_Tab where billType = 1 Union All
		select * from L_Bill_Purchase_Tab# where billType = 1
) a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode







' 
GO
/****** Object:  View [dbo].[V_Bill_Sale_TabEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sale_TabEx]'))
EXEC dbo.sp_executesql @statement = N'













create VIEW [dbo].[V_Bill_Sale_TabEx]
AS
SELECT  a.BillNumber, 
		a.CustomerCode, 
		b.SelfCode as CustomerSelfCode,
		b.relationcode,
		b.DownUnitType,
		--(select SelfCode from V_Basic_Customer_Tab where IdCode = a.CustomerCode) as CustomerSelfCode,
		a.MakingUserCode, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.EntryUserCode,
		a.EntryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name as CustomerName, 
		a.OrderBillNumber, 
		a.DeliveryAt, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.InvNumber, 
		a.InvMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.DriverCode, 
		a.AlreadyMoney, 
		a.oweMoney, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.InvOweMoney, 
		a.DeliveryCode, 
		a.Profit, 
		a.FreeMoney,
		case when a.DisType = 2 then ''到店自提'' else ''送货上门'' end DisType
FROM  (
	select * From L_Bill_Sale_TabEx 
) a INNER JOIN
                      L_Basic_Company_Tab b ON a.CustomerCode = b.IdCode














' 
GO
/****** Object:  View [dbo].[V_Bill_SaleOrders_Add_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_SaleOrders_Add_Tab]'))
EXEC dbo.sp_executesql @statement = N'







CREATE VIEW [dbo].[V_Bill_SaleOrders_Add_Tab]
AS
SELECT top 50000  a.Idkey, 
		a.UserCode,
		a.ProductCode,
		b.BarCode,  
		--b.Name, 
		b.Name + b.Spec AS ng, 
		case when (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType)=0 then
				b.Name 
			else 
				(select AliasName from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType=a.SaleType) 
			end name,
		b.Spec, 
		b.Unit,
		b.PUnit,
		a.DownUnit,
		a.DownWG,
		b.DownWgSpec,
		b.domethod,
		a.SaleType,
		b.PicSrc,
		b.CateCode, 
		b.inPrice, 
		a.StockNum, 
		a.num, 
		a.NumEx,
		a.replaceNumEx,
		a.costprice, 
		a.curSalePrice,
		a.basePrice,
		a.salePrice, 
		a.Note,
		a.defaultShipperCode
FROM         L_Bill_SaleOrders_Add_Tab a LEFT JOIN
                      L_Basic_Product_Tab b  ON a.ProductCode = b.IdCode

order by a.Idkey



















' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_Tab_FromNoTUpdate]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_Tab_FromNoTUpdate]'))
EXEC dbo.sp_executesql @statement = N'













CREATE VIEW [dbo].[V_Bill_Sales_Tab_FromNoTUpdate]
AS
/**
	销售明细表（不包括扩展表）
**/
	SELECT  a.Idkey, 
			a.billnumber, 
			a.OrderIdKey,
			a.CustomerCode, 
			(select ShortName From L_Basic_Company_Tab Where IdCode = a.CustomerCode) as customerShortName,
			(select isNull(LineName,'''') From L_Basic_Company_Tab Where IdCode = a.CustomerCode) as LineName,
			(select SerialNum From L_Basic_Cate_Tab Where IdCode = a.CustomerCode) as CateSerialNum,
			a.ProductCode, 
			CASE WHEN a.SaleType = 4 THEN b.Unit ELSE a.DownUnit END DownUnit,
			a.DownWg,
			CASE WHEN a.SaleType = 4 THEN 0 ELSE a.SaleType END AS SaleType,
			a.OrderNum * DoubleNumExBase AS OrderNum,
			a.num * DoubleNumBase AS num, 
			a.numEx * DoubleNumExBase AS numEx,
			a.replaceNumEx * DoubleNumExBase AS replaceNumEx,
			(a.numEx - a.replaceNumEx) *DoubleNumExBase AS RealityNumEx,
			a.DisTributionNum  * DoubleNumExBase AS DisTributionNum ,
			a.DisTributionStatus,
			a.salePrice,
			a.DeliveryAt, 
			a.Note, 
			case when (select Count(Idkey) from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType = a.SaleType)=0 then
				b.Name 
			else 
				(select AliasName from L_Basic_Customer_Price_Tab where PCode = a.CustomerCode and ProductCode = a.ProductCode and SaleType = a.SaleType) 
			end name,
			IsNull(b.Spec,'''') as Spec,
			b.Name+IsNull(b.Spec,'''') as ng, 
			Case When a.SaleType =3 then b.PUnit Else B.Unit end Unit,
			a.AreaCode, 
			a.Pack, 
			b.CateCode,
			b.PicSrc			
	FROM L_Bill_Sales_Tab
	 a left JOIN L_Basic_Product_Tab b ON a.ProductCode = b.IdCode





















































' 
GO
/****** Object:  View [dbo].[V_Bill_Sales_view_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_Sales_view_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Bill_Sales_view_Tab]
AS
SELECT     a.Idkey, a.billnumber, a.CustomerCode, a.ProductCode, a.num, 
                      a.costprice, a.salePrice, a.examineUserCode, a.At, a.DeliveryAt, 
                      a.Status, a.Note, b.BarCode, b.SelfCode, b.IdCode, 
                      b.PymCode, b.Name, b.Spec, b.Unit, b.inPrice, 
                      b.PicSrc, a.OrderNum, a.MchCode, a.AccountBookCode, a.AreaCode, 
                      b.Brand, b.Origin, b.Pack, a.StockNum, b.Price1, 
                      b.Price2, b.price3, b.Price4, b.price5, a.BillType, 
                      a.Profit, a.ActualCostPrice, a.ShipperCode, a.BatchNumber, a.BoxNum, 
                      a.DispNum, b.PUnit, a.BoxPrice, b.CateCode, a.NumList
FROM         dbo.L_Bill_Sales_View_Tab as a INNER JOIN
                      dbo.L_Basic_Product_Tab as b ON a.ProductCode = b.IdCode

' 
GO
/****** Object:  View [dbo].[V_Bill_StockChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockChange_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Bill_StockChange_Tab]
AS
SELECT     dbo.L_Bill_StockChange_Tab.*
FROM         dbo.L_Bill_StockChange_Tab

' 
GO
/****** Object:  View [dbo].[V_Bill_StockReceive_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockReceive_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_StockReceive_Tab]
AS
SELECT     dbo.L_Bill_StockReceive_Tab.*
FROM         dbo.L_Bill_StockReceive_Tab
' 
GO
/****** Object:  View [dbo].[V_Bill_StockReceives_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockReceives_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_StockReceives_Tab]
AS
SELECT     dbo.L_Bill_StockReceives_Tab.Idkey, dbo.L_Bill_StockReceives_Tab.MchCode, dbo.L_Bill_StockReceives_Tab.AccountBookCode, dbo.L_Bill_StockReceives_Tab.AreaCode, 
                      dbo.L_Bill_StockReceives_Tab.ShipperCode, dbo.L_Bill_StockReceives_Tab.billnumber, dbo.L_Bill_StockReceives_Tab.ProductCode, dbo.L_Bill_StockReceives_Tab.StockNum, 
                      dbo.L_Bill_StockReceives_Tab.num, dbo.L_Bill_StockReceives_Tab.costprice, dbo.L_Bill_StockReceives_Tab.SalePrice, dbo.L_Bill_StockReceives_Tab.examineUserCode, 
                      dbo.L_Bill_StockReceives_Tab.At, dbo.L_Bill_StockReceives_Tab.Status, dbo.L_Bill_StockReceives_Tab.Note, dbo.L_Basic_Product_Tab.BarCode, dbo.L_Basic_Product_Tab.SelfCode, 
                      dbo.L_Basic_Product_Tab.PymCode, dbo.L_Basic_Product_Tab.Name, dbo.L_Basic_Product_Tab.Spec, dbo.L_Basic_Product_Tab.Pack, dbo.L_Basic_Product_Tab.Unit, 
                      dbo.L_Basic_Product_Tab.Brand, dbo.L_Basic_Product_Tab.Origin, dbo.L_Basic_Product_Tab.CateCode, dbo.L_Basic_Product_Tab.inPrice, dbo.L_Basic_Product_Tab.Price1, 
                      dbo.L_Basic_Product_Tab.Price2, dbo.L_Basic_Product_Tab.price3, dbo.L_Basic_Product_Tab.PicSrc
FROM         dbo.L_Bill_StockReceives_Tab INNER JOIN
                      dbo.L_Basic_Product_Tab ON dbo.L_Bill_StockReceives_Tab.ProductCode = dbo.L_Basic_Product_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_Bill_StockSplit_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplit_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Bill_StockSplit_Tab]
AS
SELECT  *
FROM         dbo.L_Bill_StockSplit_Tab


' 
GO
/****** Object:  View [dbo].[V_Bill_StockSplits_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplits_Tab]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[V_Bill_StockSplits_Tab]
AS
SELECT  a.Idkey,
		a.AccountBookCode, 
		a.AreaCode, 
		a.billnumber,
		a.ProductCode, 
		a.num,
		a.SplitNum,
		a.lostNum,
		a.costprice,
		a.examineUserCode,
		a.At, 
		CONVERT(char(10),a.at,120) as At#,
		a.Status,
		a.Note,
		b.IdCode,
		b.SelfCode,
		b.BarCode, 
		b.PymCode, 
		b.Name,
		b.Spec, 
		b.Pack,
		b.Name + b.Spec AS ng, 
		b.Unit, 
		b.CateCode, 
		b.PicSrc,
		b.Brand, b.Origin
FROM        L_Bill_StockSplits_Tab a INNER JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode









' 
GO
/****** Object:  View [dbo].[V_Bill_StockSplits_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSplits_Tabs]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[V_Bill_StockSplits_Tabs]
AS
SELECT  a.Idkey,
		a.AccountBookCode, 
		a.AreaCode, 
		a.billnumber,
		a.ProductCode, 
		a.PCode,
		a.num,
		a.costprice,
		a.examineUserCode,
		a.At, 
		CONVERT(char(10),a.at,120) as At#,
		a.Status,
		a.Note,
		b.IdCode,
		b.SelfCode,
		b.BarCode, 
		b.PymCode, 
		b.Name,
		b.Spec, 
		b.Pack,
		b.Name + b.Spec AS ng, 
		b.Unit, 
		b.CateCode, 
		b.PicSrc,
		b.Brand, b.Origin
FROM        L_Bill_StockSplits_Tabs a INNER JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode









' 
GO
/****** Object:  View [dbo].[V_Bill_StockSwap_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSwap_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_StockSwap_Tab]
AS
SELECT     *
FROM         dbo.L_Bill_StockSwap_Tab

' 
GO
/****** Object:  View [dbo].[V_Bill_StockSwaps_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StockSwaps_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Bill_StockSwaps_Tab]
AS
SELECT     a.Idkey, a.AccountBookCode, a.AreaCode, 
                      a.ShipperCode, a.billnumber, a.ProductCode, a.StockNum, 
                      a.num, a.costprice,  a.examineUserCode, 
                      a.At, a.Status, a.Note, b.BarCode, b.SelfCode, 
                      b.PymCode, b.Name, b.Spec, b.Pack, b.Unit, 
                      b.Brand, b.Origin, b.CateCode, b.inPrice, b.Price1, 
                      b.Price2, b.price3, b.PicSrc
FROM         L_Bill_StockSwaps_Tab a Left JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode

' 
GO
/****** Object:  View [dbo].[V_Bill_StoreExChange_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StoreExChange_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_StoreExChange_Tab]
AS
SELECT     dbo.L_Bill_StoreExChange_Tab.BillNumber, dbo.L_Bill_StoreExChange_Tab.CurBillNumber, dbo.L_Bill_StoreExChange_Tab.MchCode, 
                      dbo.L_Bill_StoreExChange_Tab.InAccountBookCode, dbo.L_Bill_StoreExChange_Tab.OutAccountBookCode, dbo.L_Bill_StoreExChange_Tab.SettlementType, 
                      dbo.L_Bill_StoreExChange_Tab.AccountDay, dbo.L_Bill_StoreExChange_Tab.AreaCode, dbo.L_Bill_StoreExChange_Tab.MakingUserCode, 
                      dbo.L_Bill_StoreExChange_Tab.MakingAt, dbo.L_Bill_StoreExChange_Tab.ExamineUserCode, dbo.L_Bill_StoreExChange_Tab.ExamineAt, 
                      dbo.L_Bill_StoreExChange_Tab.billType, dbo.L_Bill_StoreExChange_Tab.Status, dbo.L_Bill_StoreExChange_Tab.costMoney, dbo.L_Bill_StoreExChange_Tab.Note, 
                      dbo.L_Basic_Store_Tab.Addr, dbo.L_Basic_Store_Tab.Tel, dbo.L_Basic_Store_Tab.PerSon, dbo.L_Bill_StoreExChange_Tab.SaleMoney, 
                      dbo.L_Bill_StoreExChange_Tab.AlreadyMoney, dbo.L_Bill_StoreExChange_Tab.oweMoney, dbo.L_Bill_StoreExChange_Tab.Profit
FROM         dbo.L_Bill_StoreExChange_Tab INNER JOIN
                      dbo.L_Basic_Store_Tab ON dbo.L_Bill_StoreExChange_Tab.InAccountBookCode = dbo.L_Basic_Store_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_Bill_StoreExChanges_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Bill_StoreExChanges_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Bill_StoreExChanges_Tab]
AS
SELECT     dbo.L_Bill_StoreExChanges_Tab.Idkey, dbo.L_Bill_StoreExChanges_Tab.MchCode, dbo.L_Bill_StoreExChanges_Tab.InAccountBookCode, dbo.L_Bill_StoreExChanges_Tab.OutAccountBookCode, 
                      dbo.L_Bill_StoreExChanges_Tab.AreaCode, dbo.L_Bill_StoreExChanges_Tab.billnumber, dbo.L_Bill_StoreExChanges_Tab.ProductCode, dbo.L_Bill_StoreExChanges_Tab.StockNum, 
                      dbo.L_Bill_StoreExChanges_Tab.num, dbo.L_Bill_StoreExChanges_Tab.CostPrice, dbo.L_Bill_StoreExChanges_Tab.SalePrice, dbo.L_Bill_StoreExChanges_Tab.examineUserCode, 
                      dbo.L_Bill_StoreExChanges_Tab.At, dbo.L_Bill_StoreExChanges_Tab.Status, dbo.L_Bill_StoreExChanges_Tab.Note, dbo.L_Basic_Product_Tab.BarCode, dbo.L_Basic_Product_Tab.SelfCode, 
                      dbo.L_Basic_Product_Tab.PymCode, dbo.L_Basic_Product_Tab.Name, dbo.L_Basic_Product_Tab.Pack, dbo.L_Basic_Product_Tab.Unit, dbo.L_Basic_Product_Tab.Brand, 
                      dbo.L_Basic_Product_Tab.Origin, dbo.L_Basic_Product_Tab.CateCode, dbo.L_Basic_Product_Tab.inPrice, dbo.L_Basic_Product_Tab.Price1, dbo.L_Basic_Product_Tab.Price2, 
                      dbo.L_Basic_Product_Tab.price3, dbo.L_Basic_Product_Tab.PicSrc, dbo.L_Basic_Product_Tab.Spec, dbo.L_Bill_StoreExChanges_Tab.AccountBookCode, dbo.L_Bill_StoreExChanges_Tab.ShipperCode, 
                      dbo.L_Bill_StoreExChanges_Tab.BoxNum, dbo.L_Bill_StoreExChanges_Tab.DispNum, dbo.L_Basic_Product_Tab.PUnit
FROM         dbo.L_Bill_StoreExChanges_Tab INNER JOIN
                      dbo.L_Basic_Product_Tab ON dbo.L_Bill_StoreExChanges_Tab.ProductCode = dbo.L_Basic_Product_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_Customer_Study_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Customer_Study_Tab]'))
EXEC dbo.sp_executesql @statement = N'Create View  [dbo].[V_Customer_Study_Tab] AS

SELECT a.*,CASE WHEN a.saleType = 2 OR a.saleType = 3 THEN b.PUnit ELSE b.Unit END DownUnit FROM L_Customer_study_Tab a,L_Basic_Product_Tab b where a.sysCode = b.IdCode
' 
GO
/****** Object:  View [dbo].[V_Group_Sale_Customer_Tabs]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Group_Sale_Customer_Tabs]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[V_Group_Sale_Customer_Tabs] as
select a.*,Case When SaleMoney = 0 THEN -100 ELSE a.profit/SaleMoney*100 END as ProFitRate, b.Name,b.BarCode,b.SelfCode,b.Spec,b.Unit,b.CateCode 
from L_Group_Sale_Customer_Tabs a Left Join L_Basic_Product_Tab b On a.ProductCode = b.IdCode

' 
GO
/****** Object:  View [dbo].[V_Group_Sale_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Group_Sale_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Group_Sale_Tab]
AS
SELECT     dbo.L_Group_Sale_Tab.At, dbo.L_Group_Sale_Tab.AccountBookCode, dbo.L_Group_Sale_Tab.AreaCode, dbo.L_Group_Sale_Tab.ProductCode, dbo.L_Group_Sale_Tab.Num, 
                      dbo.L_Group_Sale_Tab.CostMoney, dbo.L_Group_Sale_Tab.SaleMoney, dbo.L_Group_Sale_Tab.Profit, dbo.L_Group_Sale_Tab.Type, dbo.L_Basic_Product_Tab.BarCode, 
                      dbo.L_Basic_Product_Tab.SelfCode, dbo.L_Basic_Product_Tab.PymCode, dbo.L_Basic_Product_Tab.Name, dbo.L_Basic_Product_Tab.Spec, dbo.L_Basic_Product_Tab.Pack, 
                      dbo.L_Basic_Product_Tab.Unit, dbo.L_Basic_Product_Tab.Brand, dbo.L_Basic_Product_Tab.Origin, dbo.L_Basic_Product_Tab.CateCode
FROM         dbo.L_Group_Sale_Tab INNER JOIN
                      dbo.L_Basic_Product_Tab ON dbo.L_Group_Sale_Tab.ProductCode = dbo.L_Basic_Product_Tab.IdCode
' 
GO
/****** Object:  View [dbo].[V_GroupMaxAt]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GroupMaxAt]'))
EXEC dbo.sp_executesql @statement = N'Create view [dbo].[V_GroupMaxAt] as
select max(dat) as At from L_Sys_GroupInf_Tab


' 
GO
/****** Object:  View [dbo].[V_Login_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Login_Tab]'))
EXEC dbo.sp_executesql @statement = N'




CREATE VIEW [dbo].[V_Login_Tab]
AS
select *,(
	select name From L_Sys_Company_Tab) as MchName from (
	select IdCode,Name,name as loginName,Addr,Tel,PicSrc,Post,Note,Pwd,0 as type,0 as allowedChangeProduct,WxCode from L_Basic_User_Tab
	Union all
	select IdCode,Name,Person as loginName, Addr,Tel,PicSrc,0 as Post,Note,Pwd, 
		case when IdCode>1000 then 2 else 1 end as type,
		allowedChangeProduct,wxCode
	 from L_Basic_Company_Tab where IdCode>0
) a








' 
GO
/****** Object:  View [dbo].[V_NotOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_NotOrder]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[V_NotOrder] as
/**未下单列表*/
select IdCode,selfCode,Name,Person,Addr,Tel,relationcode from L_Basic_Company_Tab 
where IdCode>90001 and watchOrder=1 and Status=0 
and  IdCode not in (select CustomerCode from L_Bill_SaleOrder_Tab where DeliveryAt = CONVERT(Char(10),getdate()+1,120) and ExamineUserCode>0)


' 
GO
/****** Object:  View [dbo].[V_Offer]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Offer]'))
EXEC dbo.sp_executesql @statement = N'


CREATE View [dbo].[V_Offer] as
select a.*, b.Name,B.Spec,B.CateCode From L_Basic_Customer_Price_Tab a,L_Basic_Product_Tab b where a.ProductCode = b.IdCode


' 
GO
/****** Object:  View [dbo].[V_Prodcut]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Prodcut]'))
EXEC dbo.sp_executesql @statement = N'









--select * from V_Prodcut where IdCode=10418



CREATE view [dbo].[V_Prodcut] as
/**手机端使用*/
select AreaCode,CateCode,IdCode,BarCode,Name,AliasName,Spec,
	Case When SaleType=3 THEN PUnit Else Unit End Unit,
	Case When SaleType=3 THEN PUnit Else Unit End DownUnit,
	PUnit,SaleType,DownWgSpec,doMethod,Pack,PicSrc, 
	Case When SaleType=3 THEN inPrice*Pack Else inPrice END AS InPrice,
	Price1,Status,Note, case when saleType =2 then ''0/2'' else '''' end SaleTypeList,
	case when saleType =2 then Unit+''/''+PUnit else '''' end DownUnitList 
from L_Basic_Product_Tab where Status<2 
Union All
select AreaCode,CateCode,IdCode,BarCode,Name,AliasName,Spec,Unit,Unit As DownUnit,PUnit,1 as SaleType,
DownWgSpec,doMethod,Pack,PicSrc,inPrice,Price1,Status,Note,'''' as SaleTypeList,'''' as DownUnitList 
from L_Basic_Product_Tab where SaleType = 3 and  Status<2 



' 
GO
/****** Object:  View [dbo].[V_Product_Comb_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Product_Comb_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Product_Comb_Tab]
AS
SELECT     a.IdCode, a.BarCode, a.Name, 
			a.Spec, a.Unit,a.inPrice,
          a.Pack, 
          a.Brand, 
          a.Origin,
          a.Note, 
          b.Num,
          b.Num * a.inPrice as CombInPrice, 
          b.Num * a.Price1 as Price,
          b.IdKey, 
          b.ProductCode
FROM         dbo.L_Basic_Product_Comb_Tab as b INNER JOIN
                      dbo.L_Basic_Product_Tab as a ON b.ProductCode =a.IdCode


' 
GO
/****** Object:  View [dbo].[V_PurchaeBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_PurchaeBatchNotMatch]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_PurchaeBatchNotMatch]
AS
/**采购没有匹配**/
SELECT ProductCode,DownUnit,SaleType,num,numEx,costprice,BatchNumber,billnumber FROM L_Bill_Purchases_Tab a 
WHERE not EXISTS (SELECT 1 FROM L_Bill_Sales_Tabs b WHERE  a.ProductCode = b.ProductCode and a.SaleType = b.SaleType
	and a.BatchNumber = b.BatchNumber
)
' 
GO
/****** Object:  View [dbo].[V_Report_AreaExChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_AreaExChange]'))
EXEC dbo.sp_executesql @statement = N'CREATE View [dbo].[V_Report_AreaExChange] as
/*柜组调拨报表*/
select  a.BillNumber,
		a.AccountBookCode,
		a.InareaCode,
		a.OutAreaCode,
		a.AreaCode,
		a.At,
		a.examineUserCode,
		a.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		a.num,
		a.costprice,
		a.num * a.costprice as SumMoney,
		a.Note		
from (select BillNumber,ProductCode,AccountBookCode,InAreaCode,OutAreaCode,
	AreaCode,max(at) as At,
	max(examineUserCode) as examineUserCode,
	SUM(Num*ExchangeType) as num,
	SUM(Num*CostPrice)/SUM(Num) as CostPrice,MAX(Note) as Note from
	L_Bill_AreaExChanges_Tabs group by BillNumber,AccountBookCode,InAreaCode,OutAreaCode,
	AreaCode,ProductCode) a,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.ProductCode = c.IdCode

' 
GO
/****** Object:  View [dbo].[V_Report_PayGroup_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_PayGroup_Tab]'))
EXEC dbo.sp_executesql @statement = N'








CREATE VIEW [dbo].[V_Report_PayGroup_Tab]
AS
SELECT     a.ShipperCode, a.ShipperCode AS BillNumber, b.Name as ShipperName, b.picSrc, 
b.IdCode, b.Addr, b.Tel, b.Person, b.RelationCode, b.Note, a.OweMoney, b.SettlementType, b.AccountDay,4 as Status
FROM  (
		select shipperCode,sum(OweMoney) as OweMoney from
		(SELECT     ShipperCode, OweMoney
			FROM     L_Bill_Purchase_Tab
			WHERE      (Status = 4)
			union all
			SELECT     ShipperCode, OweMoney
			FROM     L_Bill_Purchase_Tab#
			WHERE      (Status = 4)
			union all
			SELECT     CompanyCode, OweMoney
			FROM          L_Bill_SubjectChange_Tab
			WHERE      Billtype in (503,506) and Status = 1
		) x
		GROUP BY shipperCode
    ) AS a INNER JOIN
                      dbo.L_Basic_Company_Tab AS b ON a.ShipperCode = b.IdCode









' 
GO
/****** Object:  View [dbo].[V_Report_StockChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockChange]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Report_StockChange] as
/*库存变更报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.MchCode,
		a.AccountBookCode,
		a.AreaCode,
		a.status,
		a.changeAt,
		b.At,
		a.examineUserCode,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.StockNum,
		b.num,
		b.ChangeNum,
		b.costprice,
		b.ChangeNum * b.costprice as SumMoney,
		b.Note		
from L_Bill_StockChange_Tab a,L_Bill_StockChanges_Tab b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode


' 
GO
/****** Object:  View [dbo].[V_Report_StockCheck]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockCheck]'))
EXEC dbo.sp_executesql @statement = N'
CREATE View [dbo].[V_Report_StockCheck] as
/*库存盘点报表*/
select  a.BillNumber,
		a.AccountBookCode,
		a.AreaCode,
		a.status,
		b.At,
		a.examineUserCode,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.num,
		b.costprice,
		b.num * b.costprice as SumMoney,
		b.Note		
from L_Bill_StockCheck_Tab a,L_Bill_StockChecks_Tab b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode

' 
GO
/****** Object:  View [dbo].[V_Report_StockReceive]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockReceive]'))
EXEC dbo.sp_executesql @statement = N'Create View [dbo].[V_Report_StockReceive] as
/*领用报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.MchCode,
		a.AccountBookCode,
		a.AreaCode,
		a.status,
		b.At,
		a.examineUserCode,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.num,
		b.costprice,
		b.SalePrice,
		b.num * b.costprice as SumCostMoney,
		b.num * b.SalePrice as SumSaleMoney,
		b.Note		
from L_Bill_StockReceive_Tab a,L_Bill_StockReceives_Tab b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode
' 
GO
/****** Object:  View [dbo].[V_Report_StockSwap]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StockSwap]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Report_StockSwap] as
/*商品拆零报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.AccountBookCode,
		b.AreaCode,
		a.status,
		b.Type,/*-1拆出，1拆入*/
		b.At,
		a.examineUserCode,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.num*b.Type as Num,
		b.costprice,
		b.num*b.Type * b.costprice as SumCostMoney,
		b.Note		
from L_Bill_StockSwap_Tab a,L_Bill_StockSwaps_Tabs b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode


' 
GO
/****** Object:  View [dbo].[V_Report_StoreExChange]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Report_StoreExChange]'))
EXEC dbo.sp_executesql @statement = N'CREATE View [dbo].[V_Report_StoreExChange] as
/*店间调拨报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.MchCode,
		a.InAccountBookCode,
		a.OutAccountBookCode,
		a.AreaCode,
		a.status,
		b.At,
		a.examineUserCode,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.num,
		b.costprice,
		b.SalePrice,
		b.num * b.costprice as SumCostMoney,
		b.num * b.SalePrice as SumSaleMoney,
		b.Note		
from L_Bill_StoreExChange_Tab a,L_Bill_StoreExChanges_Tab b,L_Basic_Product_Tab c 
where a.examineUserCode >0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode
' 
GO
/****** Object:  View [dbo].[V_Reports_AcceptAndDis]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_AcceptAndDis]'))
EXEC dbo.sp_executesql @statement = N'CREATE View [dbo].[V_Reports_AcceptAndDis] as 
	/*
		订单接单与配货情况
	*/
	select a.billnumber,--订单单号
		a.CustomerCode,--客户号
		a.AccountBookCode,--分店
		a.AreaCode,--柜组
		a.at, --下单时间
		a.DeliveryAt,--送货日
		a.num,--下单数量
		a.FreeNum,--免采数量
		a.AcceptNum,--接单数量
		a.OweNum,--欠数
		a.DisTributionNum,--配货数量
		a.DisTributionAt,--配货时间
		a.DisTributionUserCode,--配货人
		a.ProductCode,--商品号
		b.BarCode,--条码
		b.Name,--品名
		b.Spec,b.Name+b.Spec as ng,--品名
		b.Unit--单位
	 from L_Bill_SaleOrders_Tab a,L_Basic_Product_Tab b 
	 where a.ProductCode = b.IdCode' 
GO
/****** Object:  View [dbo].[V_Reports_Dis]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Dis]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Reports_Dis] as
/*配货报表*/
select  a.BillNumber,
		a.CurBillNumber,
		a.OrderBillNumber,
		a.CustomerCode,
		a.status,
		a.DeliveryAt,
		a.examineUserCode,
		b.idkey,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		C.Spec,
		c.Unit,
		c.Origin,
		c.Brand,
		b.OrderNum,
		b.DisTributionAt,
		b.DisTributionNum,
		b.DisTributionUserCode,
		b.Note
from L_Bill_sale_Tab a,L_Bill_sales_Tab b,L_Basic_Product_Tab c 
where isNull(b.DisTributionUserCode,0)>0 and a.BillNumber = b.billnumber and b.ProductCode = c.IdCode









' 
GO
/****** Object:  View [dbo].[V_Reports_Pay]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Pay]'))
EXEC dbo.sp_executesql @statement = N'CREATE View [dbo].[V_Reports_Pay] as
select *,(select toAccounts from l_Basic_PayType_Tab where idCode= a.PayTypeCode) as AccountsCode from L_Bill_PayMent_Tab  a where ExamineUserCode >0
' 
GO
/****** Object:  View [dbo].[V_Reports_PurchaseOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_PurchaseOrder]'))
EXEC dbo.sp_executesql @statement = N'


CREATE VIEW [dbo].[V_Reports_PurchaseOrder]
AS
SELECT     a.BillNumber, a.MchCode, a.ShipperCode, a.AccountBookCode, a.AreaCode, b.CateCode, a.At, a.examineUserCode, a.ProductCode, a.Status, b.BarCode, b.SelfCode, 
                      b.PymCode, b.Name, b.Spec, b.Unit,b.Brand, b.Origin, a.numEx, a.costprice, a.salePrice, a.numEx * a.costprice AS SumMoney, a.Note, a.DeliveryAt
FROM         dbo.L_Bill_PurchaseOrders_Tab AS a INNER JOIN
                      dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode
WHERE     (a.examineUserCode > 0)



' 
GO
/****** Object:  View [dbo].[V_Reports_Rec]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_Rec]'))
EXEC dbo.sp_executesql @statement = N'
CREATE View [dbo].[V_Reports_Rec] as
select *,(select toAccounts from l_Basic_PayType_Tab where idCode= a.PayTypeCode) as AccountsCode from L_Bill_Receivables_Tab a where ExamineUserCode >0

' 
GO
/****** Object:  View [dbo].[V_Reports_ResPay]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_ResPay]'))
EXEC dbo.sp_executesql @statement = N'
CREATE View [dbo].[V_Reports_ResPay] as
Select 
	Case when a.ExamineAt is null then B.ExamineAt Else a.ExamineAt end At,
	InMoney,OutMoney,isNull(InMoney,0)-isnull(OutMoney,0) as CMoney from
(select ExamineAt,SUM(Money) as InMoney from L_Bill_Receivables_Tab where ExamineUserCode > 0 Group by ExamineAt) a
full join
(select ExamineAt,SUM(Money) as OutMoney from L_Bill_PayMent_Tab  where ExamineUserCode > 0 Group by ExamineAt) b on a.ExamineAt = b.ExamineAt

' 
GO
/****** Object:  View [dbo].[V_Reports_SaleEx]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleEx]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Reports_SaleEx] as
/*销售报表 外帐*/
select  a.BillNumber,
		a.CurBillNumber,
		a.OrderBillNumber,
		a.MchCode,
		a.CustomerCode,
		a.SettlementType,
		a.AccountDay,
		a.AccountBookCode,
		b.AreaCode,
		a.SalesMan,
		a.DriverCode,
		a.DeliveryCode,
		a.status,
		a.note as MainNote,
		b.At,
		a.DeliveryAt,
		a.examineUserCode,
		a.InvNumber,
		a.InvMoney,
		b.Idkey,
		b.productCode,
		c.BarCode,
		c.SelfCode,
		c.PymCode,
		c.CateCode,
		c.Name,
		c.AliasName,
		c.Name as CurName,
		C.Spec,
		c.Unit as Unit,
		c.Unit as MinUnit,
		c.Origin,
		c.Brand,
		b.OrderNum,
		((b.numEx-b.replaceNumEx) * DoubleNumExBase * PackBase) as ExChangeNumEx,
		b.numEx-b.replaceNumEx as NumEx,
		b.numEx as SettlementNumEx,
		b.replaceNumEx ,
		b.ActualCostPrice,
		b.costprice,
		b.salePrice,
		b.DisTributionAt,
		b.DisTributionNum,
		b.DisTributionUserCode,
		(b.numEx-b.replaceNumEx) * b.ActualCostPrice as ActualCostMoney,
		(b.numEx-b.replaceNumEx) * b.CostPrice as CostMoney,
		(b.numEx -b.replaceNumEx) * b.salePrice as SaleMoney,
		b.numEx * b.salePrice as SettlementMoney,
		(b.numEx -b.replaceNumEx) * (b.CostPrice - b.ActualCostPrice) as KsMoney,
		b.replaceNumEx * b.salePrice as ReplaceSaleMoney,
		b.Profit,
		case when (b.numEx * b.salePrice)=0 then -100 else b.Profit/(b.numEx * b.salePrice)*100 end ProfitRate,
		b.Note,
		b.LossNote
from L_Bill_sale_TabEx a,L_Bill_sales_TabEx b,L_Basic_Product_Tab c 
where a.BillNumber = b.billnumber and b.ProductCode = c.IdCode


















' 
GO
/****** Object:  View [dbo].[V_Reports_SaleOrder]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Reports_SaleOrder]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_Reports_SaleOrder]
AS
SELECT     a.BillNumber, 
			a.MchCode, 
			a.CustomerCode, 
			a.AccountBookCode, 
			a.AreaCode, 
			b.CateCode, 
			a.At, 
			a.DeliveryAt,
			a.examineUserCode, 
			a.ProductCode, 
			a.Status, 
			b.BarCode, 
			b.SelfCode, 
            b.PymCode,
            b.Name, 
            b.Spec, 
            b.Unit,
            b.Brand, 
            b.Origin, 
            a.numEx, 
            a.costprice, 
            a.salePrice, 
            a.numEx * a.salePrice AS SumMoney, 
			a.DisTributionNum,
			a.DisTributionUserCode,
            a.Note
FROM         dbo.L_Bill_SaleOrders_Tab AS a INNER JOIN
                      dbo.L_Basic_Product_Tab AS b ON a.ProductCode = b.IdCode
WHERE     (a.examineUserCode > 0)


' 
GO
/****** Object:  View [dbo].[V_SaleBatchNotMatch]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_SaleBatchNotMatch]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_SaleBatchNotMatch]
AS
/**销售没有匹配**/
SELECT ProductCode,DownUnit,SaleType,num,numEx,salePrice,BatchNumber,billnumber FROM L_Bill_Sales_Tab a WHERE Not EXISTS (SELECT 1 FROM L_Bill_Sales_Tabs b WHERE  a.ProductCode = b.ProductCode and a.SaleType = b.SaleType)

' 
GO
/****** Object:  View [dbo].[V_SelectProduct]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_SelectProduct]'))
EXEC dbo.sp_executesql @statement = N'




CREATE View [dbo].[V_SelectProduct] as
/**PC端使用*/
select idCode,BarCode,SelfCode,PymCode,name,AliasName,spec,weight,pack,Unit,Punit,
	Brand,Origin,ShipperCode,AreaCode,CateCode,inPrice,Price1,AvgCostPrice,
	price3,price4,price5,IsNull(DownWgSpec,1) as DownWgSpec,Unit As DownUnit,doMethod,Note, Status,
	case When saleType=2 then 0 else Case When SaleType=3 then 1 else saleType End end as SaleType 
from L_Basic_Product_Tab 
union all
select idCode,BarCode,SelfCode,PymCode,name,AliasName,spec,weight,pack,Unit,Punit,
	Brand,Origin,ShipperCode,AreaCode,CateCode,inPrice,Price1,AvgCostPrice,
	price3,price4,price5,DownWgSpec,PUnit As DownUnit,doMethod,Note,Status,2 
from L_Basic_Product_Tab where saleType = 2  
Union All

select idCode,BarCode,SelfCode,PymCode,name,AliasName,spec,weight,pack,Unit,Punit,
	Brand,Origin,ShipperCode,AreaCode,CateCode,inPrice,Price2,AvgCostPrice,
	price3,price4,price5,cast(pack as varchar(10)) as DownWgSpec,PUnit As DownUnit,doMethod,Note,Status,3 
from L_Basic_Product_Tab where saleType = 3  





' 
GO
/****** Object:  View [dbo].[V_Shipper_AcceptList_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_AcceptList_Tab]'))
EXEC dbo.sp_executesql @statement = N'


/*供货商接单列表*/
CREATE VIEW [dbo].[V_Shipper_AcceptList_Tab]
AS
SELECT  a.BillNumber, 
		a.PurchaseBillNumber, 
		a.ShipperCode, 
		a.MakingUserCode,(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName, 
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt, 
		a.DeliveryAt, 
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.Note, 
		b.Name, 
		a.AccountBookCode, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		b.Addr, 
		b.Tel, 
		b.Person, 
		a.AreaCode
FROM    dbo.L_Bill_PurchaseOrder_Tab a INNER JOIN
                      dbo.L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode




' 
GO
/****** Object:  View [dbo].[V_Shipper_Price_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shipper_Price_Tab]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_Shipper_Price_Tab]
AS
SELECT  b.IdCode,b.BarCode, b.PymCode, b.SelfCode, b.Name, 
        b.Spec, b.Unit, b.CateCode, b.inPrice, b.PicSrc, 
        a.Note,a.curPrice, a.Price, a.PCode, a.IdKey,
		a.ProductCode, b.Pack, b.Brand,b.Origin,
		(select SerialNum from L_Basic_Cate_Tab where idcode = b.CateCode) as cateSerialNum,
		(select name from L_Basic_Cate_Tab where idcode = b.CateCode) as cateName
FROM L_Basic_Shipper_Price_Tab as a
	left JOIN
	 (select * from L_Basic_Product_Tab where Status<2) as b ON a.ProductCode = b.IdCode 
' 
GO
/****** Object:  View [dbo].[V_Shop_User_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Shop_User_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE View [dbo].[V_Shop_User_Tab]
As

SELECT IdCode,PCode,Name,Tel,Pwd,Addr,Person,SettlementType From L_Basic_Company_Tab WHERE IdCode>90000

' 
GO
/****** Object:  View [dbo].[V_Stock_RunIng]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Stock_RunIng]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[V_Stock_RunIng]
AS
SELECT     a.AccountBookCode, a.AreaCode, a.ProductCode, 
                      a.numEx as Num, a.BillNumber, a.ShipperCode, 
                      a.MchCode, b.BarCode, b.SelfCode, b.PymCode, 
                      b.Name, b.Spec, b.Unit, b.Pack, b.Brand, 
                      b.Origin, b.ShipperCode AS MainShiperCode
FROM         L_Bill_Purchases_Tab a INNER JOIN
                      L_Basic_Product_Tab b ON a.ProductCode = b.IdCode
WHERE     (a.examineUserCode = 0 )




' 
GO
/****** Object:  View [dbo].[V_StockCheck_Temp_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_StockCheck_Temp_Tab]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [dbo].[V_StockCheck_Temp_Tab]
as
select a.idkey,a.ProductCode,a.stockNum,a.checkNum,a.avgPrice,b.BarCode,b.SelfCode,b.Name,b.Unit,b.Spec,b.CateCode from L_stockCheck_Temp_Tab a,L_Basic_Product_Tab b where a.ProductCode = b.IdCode


' 
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Entry_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Entry_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Wx_Bill_Purchase_Entry_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney
FROM    L_Bill_Purchase_Tab a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode


' 
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Return_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Return_Tab]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_Wx_Bill_Purchase_Return_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney
FROM    (select * from L_Bill_Purchase_Tab where billType = 1) a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode


' 
GO
/****** Object:  View [dbo].[V_Wx_Bill_Purchase_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Bill_Purchase_Tab]'))
EXEC dbo.sp_executesql @statement = N'

Create VIEW [dbo].[V_Wx_Bill_Purchase_Tab]
AS
SELECT     
		a.BillNumber, 
		a.MchCode, 
		a.AccountBookCode, 
		a.AreaCode, 
		a.CurBillNumber, 
		a.OrderBillNumber, 
		a.ShipperCode,  
		b.Name,
		b.Person,  
		b.Addr, 
		b.Tel,
		a.MakingUserCode,
		a.MrUserCode,
		a.MrAt,
		(select ''【''+Name+''】'' from L_Basic_User_Tab where IdCode= a.MakingUserCode) as userName,
		a.MakingAt, 
		a.ExamineUserCode, 
		a.ExamineAt,
		a.settlementAt ,
		a.DeliveryAt,
		a.billType, 
		a.Status, 
		a.Type, 
		a.costMoney, 
		a.saleMoney, 
		a.AlreadyMoney, 
		a.OweMoney, 
		a.Note, 
		a.InvNumber, 
		a.InvMoney, 
		a.InvOweMoney, 
		a.SettlementType, 
		a.AccountDay, 
		a.SalesMan, 
		a.ActualCostMoney, 
		a.FreeMoney
FROM    (select * From L_Bill_Purchase_Tab where billType = 0) a Left JOIN
                      L_Basic_Company_Tab b ON a.ShipperCode = b.IdCode



' 
GO
/****** Object:  View [dbo].[V_Wx_Templated_Num_Tab]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_Wx_Templated_Num_Tab]'))
EXEC dbo.sp_executesql @statement = N'Create View [dbo].[V_Wx_Templated_Num_Tab] as 
select Vipcode,Templated_Code,Num,b.Note from l_Wx_Templated_Num_Tab a,L_Wx_Templated_Tab b where a.Templated_Code = b.IdCode
' 
GO
/****** Object:  View [dbo].[V_WxPower]    Script Date: 2026-04-16 17:22:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_WxPower]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[V_WxPower] as 
select IdCode,Pcode,PostCode,Title,Vis from L_Nav_Func_Header_Tab where SysVis=1 and Title<>''-''
union all
select IdCode,Pcode,PostCode,Title,Vis from L_Nav_Func_Detail_children_Tab  where SysVis=1 and Title<>''-''
union all
select IdCode,Pcode,PostCode,Title,Vis from L_Nav_Func_Detail_Tab  where SysVis=1 and Title<>''-''
' 
GO
