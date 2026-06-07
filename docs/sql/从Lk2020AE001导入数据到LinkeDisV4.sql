USE [LinkeDisV4]
GO

DELETE FROM [dbo].[L_AccessTokenTab]
GO
INSERT INTO [dbo].[L_AccessTokenTab] ([access_token], [time])
SELECT [access_token], [time] FROM [Lk2020AE001].[dbo].[L_AccessTokenTab]
GO

DELETE FROM [dbo].[L_Basic_Accounts_Tab]
GO
INSERT INTO [dbo].[L_Basic_Accounts_Tab] ([idCode], [MchCode], [name], [Money], [initMoney], [note])
SELECT [idCode], [MchCode], [name], [Money], [initMoney], [note] FROM [Lk2020AE001].[dbo].[L_Basic_Accounts_Tab]
GO

DELETE FROM [dbo].[L_Basic_Area_Tab]
GO
INSERT INTO [dbo].[L_Basic_Area_Tab] ([IdCode], [PCode], [MchCode], [Name], [xz], [Note])
SELECT [IdCode], [PCode], [MchCode], [Name], [xz], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Area_Tab]
GO

DELETE FROM [dbo].[L_Basic_Cate_Tab]
GO
INSERT INTO [dbo].[L_Basic_Cate_Tab] ([idCode], [PCode], [MchCode], [Name], [PicSrc], [SerialNum], [Note], [defaultShipperCode], [AddPriceRate])
SELECT [idCode], [PCode], [MchCode], [Name], [PicSrc], [SerialNum], [Note], [defaultShipperCode], [AddPriceRate] FROM [Lk2020AE001].[dbo].[L_Basic_Cate_Tab]
GO

DELETE FROM [dbo].[L_Basic_Company_Area_Tab]
GO
INSERT INTO [dbo].[L_Basic_Company_Area_Tab] ([IdCode], [PCode], [Name], [Note])
SELECT [IdCode], [PCode], [Name], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Company_Area_Tab]
GO

DELETE FROM [dbo].[L_Basic_Company_Cate_Tab]
GO
INSERT INTO [dbo].[L_Basic_Company_Cate_Tab] ([IdCode], [PCode], [Name], [Note])
SELECT [IdCode], [PCode], [Name], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Company_Cate_Tab]
GO

DELETE FROM [dbo].[L_Basic_Company_Tab]
GO
INSERT INTO [dbo].[L_Basic_Company_Tab] ([IdCode], [selfCode], [wxCode], [Pcode], [PymCode], [Name], [ShortName], [Addr], [Tel], [Person], [AreaCode], [CateCode], [SettlementType], [AccountDay], [SalesMan], [relationcode], [InsUserCode], [InsAt], [EditUserCode], [EditAt], [picSrc], [LossAllocation], [QualityGrade], [PriceLevel], [Status], [startAt], [endAt], [DeliveryAt], [Pwd], [subscribemessagenum], [LineName], [AllowedChangeProduct], [Note], [watchOrder], [notAddPrice], [ChangeAblePrice], [LookProductType], [DownUnitType], [Dr], [decimalBit], [SaleFromQuotePrice])
SELECT [IdCode], [selfCode], [wxCode], [Pcode], [PymCode], [Name], [ShortName], [Addr], [Tel], [Person], [AreaCode], [CateCode], [SettlementType], [AccountDay], [SalesMan], [relationcode], [InsUserCode], [InsAt], [EditUserCode], [EditAt], [picSrc], [LossAllocation], [QualityGrade], [PriceLevel], [Status], [startAt], [endAt], [DeliveryAt], [Pwd], [subscribemessagenum], [LineName], [AllowedChangeProduct], [Note], [watchOrder], [notAddPrice], [ChangeAblePrice], [LookProductType], [DownUnitType], [Dr], [decimalBit], [SaleFromQuotePrice] FROM [Lk2020AE001].[dbo].[L_Basic_Company_Tab]
GO

DELETE FROM [dbo].[L_Basic_Customer_Price_Tab]
GO
INSERT INTO [dbo].[L_Basic_Customer_Price_Tab] ([IdKey], [MchCode], [PCode], [ProductCode], [SerialNumber], [Price], [defaultShipperCode], [note], [AliasName], [SaleType], [CustomerProcudeCode], [ChangeNote], [QualityGrade])
SELECT [IdKey], [MchCode], [PCode], [ProductCode], [SerialNumber], [Price], [defaultShipperCode], [note], [AliasName], [SaleType], [CustomerProcudeCode], [ChangeNote], [QualityGrade] FROM [Lk2020AE001].[dbo].[L_Basic_Customer_Price_Tab]
GO

DELETE FROM [dbo].[l_Basic_PayType_Tab]
GO
INSERT INTO [dbo].[l_Basic_PayType_Tab] ([idCode], [name], [toAccounts], [rate], [Note])
SELECT [idCode], [name], [toAccounts], [rate], [Note] FROM [Lk2020AE001].[dbo].[l_Basic_PayType_Tab]
GO

DELETE FROM [dbo].[L_Basic_Post_Tab]
GO
INSERT INTO [dbo].[L_Basic_Post_Tab] ([IdCode], [MchCode], [Name], [Note])
SELECT [IdCode], [MchCode], [Name], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Post_Tab]
GO

DELETE FROM [dbo].[L_Basic_Product_Comb_Tab]
GO
INSERT INTO [dbo].[L_Basic_Product_Comb_Tab] ([Idkey], [ProductCode], [PCode], [Num], [Price], [Note])
SELECT [Idkey], [ProductCode], [PCode], [Num], [Price], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Product_Comb_Tab]
GO

DELETE FROM [dbo].[L_Basic_Product_Tab]
GO
INSERT INTO [dbo].[L_Basic_Product_Tab] ([IdCode], [BarCode], [SelfCode], [PymCode], [Name], [AliasName], [Spec], [Pack], [Weight], [Unit], [PUnit], [DownWgSpec], [domethod], [Brand], [Origin], [SaleType], [ShipperCode], [AreaCode], [CateCode], [InsAt], [InsUserCode], [EditAt], [EditUserCode], [inPrice], [AvgCostPrice], [Price1], [Price2], [price3], [Price4], [price5], [UpperLimit], [LowerLimit], [PicSrc], [Status], [CheckNote], [Note])
SELECT [IdCode], [BarCode], [SelfCode], [PymCode], [Name], [AliasName], [Spec], [Pack], [Weight], [Unit], [PUnit], [DownWgSpec], [domethod], [Brand], [Origin], [SaleType], [ShipperCode], [AreaCode], [CateCode], [InsAt], [InsUserCode], [EditAt], [EditUserCode], [inPrice], [AvgCostPrice], [Price1], [Price2], [price3], [Price4], [price5], [UpperLimit], [LowerLimit], [PicSrc], [Status], [CheckNote], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Product_Tab]
GO

DELETE FROM [dbo].[L_Basic_Project_Tab]
GO
INSERT INTO [dbo].[L_Basic_Project_Tab] ([IdCode], [Name], [Addr], [Tel], [Person], [InsUserCode], [InsAt], [EditUserCode], [EditAt], [Status], [Note])
SELECT [IdCode], [Name], [Addr], [Tel], [Person], [InsUserCode], [InsAt], [EditUserCode], [EditAt], [Status], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Project_Tab]
GO

DELETE FROM [dbo].[L_Basic_SettlementType_Tab]
GO
INSERT INTO [dbo].[L_Basic_SettlementType_Tab] ([IdCode], [Name], [Note])
SELECT [IdCode], [Name], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_SettlementType_Tab]
GO

DELETE FROM [dbo].[L_Basic_Shipper_Price_Tab]
GO
INSERT INTO [dbo].[L_Basic_Shipper_Price_Tab] ([IdKey], [PCode], [ProductCode], [curPrice], [Price], [note])
SELECT [IdKey], [PCode], [ProductCode], [curPrice], [Price], [note] FROM [Lk2020AE001].[dbo].[L_Basic_Shipper_Price_Tab]
GO

DELETE FROM [dbo].[L_Basic_Store_Tab]
GO
INSERT INTO [dbo].[L_Basic_Store_Tab] ([IdCode], [MchCode], [Name], [Addr], [Tel], [PerSon], [SettlementType], [AccountDay], [Type], [PriceLevel], [Note])
SELECT [IdCode], [MchCode], [Name], [Addr], [Tel], [PerSon], [SettlementType], [AccountDay], [Type], [PriceLevel], [Note] FROM [Lk2020AE001].[dbo].[L_Basic_Store_Tab]
GO

DELETE FROM [dbo].[L_Basic_Subject_Tab]
GO
INSERT INTO [dbo].[L_Basic_Subject_Tab] ([IdCode], [PCode], [Name])
SELECT [IdCode], [PCode], [Name] FROM [Lk2020AE001].[dbo].[L_Basic_Subject_Tab]
GO

DELETE FROM [dbo].[L_Basic_User_Tab]
GO
INSERT INTO [dbo].[L_Basic_User_Tab] ([IdCode], [MchCode], [WxCode], [Name], [Addr], [TEL], [PicSrc], [Store], [Post], [Pwd], [powerPwd], [RelationCode], [SubscribeMessageNum], [status], [Note], [LastUpdateTime], [LookSelfOrder])
SELECT [IdCode], [MchCode], [WxCode], [Name], [Addr], [TEL], [PicSrc], [Store], [Post], [Pwd], [powerPwd], [RelationCode], [SubscribeMessageNum], [status], [Note], [LastUpdateTime], [LookSelfOrder] FROM [Lk2020AE001].[dbo].[L_Basic_User_Tab]
GO

DELETE FROM [dbo].[L_Basic_UserManageCate_Tab]
GO
INSERT INTO [dbo].[L_Basic_UserManageCate_Tab] ([IdKey], [PCode], [CateCode])
SELECT [IdKey], [PCode], [CateCode] FROM [Lk2020AE001].[dbo].[L_Basic_UserManageCate_Tab]
GO

DELETE FROM [dbo].[L_Bill_QuotedPrice_Tab]
GO
INSERT INTO [dbo].[L_Bill_QuotedPrice_Tab] ([BillNumber], [AccountBookCode], [CustomerCode], [MakingUserCode], [MakingAt], [ExamineUserCode], [ExamineAt], [StartAt], [EndAt], [BillType], [Status], [Note], [PCode])
SELECT [BillNumber], [AccountBookCode], [CustomerCode], [MakingUserCode], [MakingAt], [ExamineUserCode], [ExamineAt], [StartAt], [EndAt], [BillType], [Status], [Note], [PCode] FROM [Lk2020AE001].[dbo].[L_Bill_QuotedPrice_Tab]
GO

DELETE FROM [dbo].[L_Bill_QuotedPrices_Tab]
GO
INSERT INTO [dbo].[L_Bill_QuotedPrices_Tab] ([Idkey], [billnumber], [ProductCode], [SerialNumber], [curSalePrice], [salePrice], [TenSaleNum], [examineUserCode], [At], [StartAt], [EndAt], [BillType], [Status], [Note], [defaultShipperCode], [AliasName], [QualityGrade], [SaleType], [CustomerProcudeCode], [customerSpec], [customerCheckNote])
SELECT [Idkey], [billnumber], [ProductCode], [SerialNumber], [curSalePrice], [salePrice], [TenSaleNum], [examineUserCode], [At], [StartAt], [EndAt], [BillType], [Status], [Note], [defaultShipperCode], [AliasName], [QualityGrade], [SaleType], [CustomerProcudeCode], [customerSpec], [customerCheckNote] FROM [Lk2020AE001].[dbo].[L_Bill_QuotedPrices_Tab]
GO

DELETE FROM [dbo].[L_Nav_Func_Detail_children_Tab]
GO
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Detail_children_Tab] ON
INSERT INTO [dbo].[L_Nav_Func_Detail_children_Tab] ([Idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [IconCls], [viewPath], [showModel], [Type])
SELECT [Idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [IconCls], [viewPath], [showModel], [Type] FROM [Lk2020AE001].[dbo].[L_Nav_Func_Detail_children_Tab]
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Detail_children_Tab] OFF
GO

DELETE FROM [dbo].[L_Nav_Func_Detail_Tab]
GO
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Detail_Tab] ON
INSERT INTO [dbo].[L_Nav_Func_Detail_Tab] ([Idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [IconCls], [viewPath], [showModel], [Type])
SELECT [Idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [IconCls], [viewPath], [showModel], [Type] FROM [Lk2020AE001].[dbo].[L_Nav_Func_Detail_Tab]
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Detail_Tab] OFF
GO

DELETE FROM [dbo].[L_Nav_Func_Header_Tab]
GO
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Header_Tab] ON
INSERT INTO [dbo].[L_Nav_Func_Header_Tab] ([idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [DllName], [ClassName], [IconCls], [orderSerial], [orderStyle], [showModel], [viewPath])
SELECT [idkey], [idCode], [PCode], [PostCode], [Title], [SysVis], [Vis], [DllName], [ClassName], [IconCls], [orderSerial], [orderStyle], [showModel], [viewPath] FROM [Lk2020AE001].[dbo].[L_Nav_Func_Header_Tab]
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Header_Tab] OFF
GO

DELETE FROM [dbo].[L_Nav_Func_Power_Tab]
GO
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Power_Tab] ON
INSERT INTO [dbo].[L_Nav_Func_Power_Tab] ([IdKey], [IdCode], [PCode], [PostCode], [Title], [Vis])
SELECT [IdKey], [IdCode], [PCode], [PostCode], [Title], [Vis] FROM [Lk2020AE001].[dbo].[L_Nav_Func_Power_Tab]
SET IDENTITY_INSERT [dbo].[L_Nav_Func_Power_Tab] OFF
GO

DELETE FROM [dbo].[L_PrintStyle_Tab]
GO
SET IDENTITY_INSERT [dbo].[L_PrintStyle_Tab] ON
INSERT INTO [dbo].[L_PrintStyle_Tab] ([xh], [FuncCode], [x], [styleName], [style], [relationcode])
SELECT [xh], [FuncCode], [x], [styleName], [style], [relationcode] FROM [Lk2020AE001].[dbo].[L_PrintStyle_Tab]
SET IDENTITY_INSERT [dbo].[L_PrintStyle_Tab] OFF
GO

DELETE FROM [dbo].[L_Sys_Parmars_Tab]
GO
INSERT INTO [dbo].[L_Sys_Parmars_Tab] ([MchCode], [IdCode], [ExceedTimeToDay], [GoEasyAppkey], [InPriceStyle], [OutPriceStyle], [PageRecord], [PosToExpandDay], [GroupToExpandDay], [MinRetainDay], [AllowedExceedStock], [LastPrice], [AllowedGroupExceedStock], [AllowedNewProduct], [NewProductFromWin], [PriceCaption], [OutNotCalclStock], [OutMustDis], [DiscardWeight], [MsgAcceptWxCode], [CustomerFromQuotedPrice], [AutoEntry], [AutoSwap], [purchaseGridPrintCol], [NumIsZeroNotAllowPrint], [UpdatePurchaseToDefaultShipper], [UpdateSaleOrderToPurchaseOrder], [WithInShipperCode], [AfterDisAllowedAddProduct], [SaleAutoEntry], [PushBackCheckStock], [TipNotQuotedPrice], [CostPriceInPurchare], [EnabledWeighing], [MainBookName], [SubBookName], [MainSendToSub], [importStock], [AllowedOutOrderNum], [ShipperAddNumNotTransferStock], [UpdateSaleAllowedChangePrice], [LablePrintName], [DisShowFrom], [NotAvgLose], [AcceptUserCode], [DisPrintColumns], [DisPrintFontSize], [DownGroupPrintColumns], [DownGroupPrintFontSize], [EndOrderTime], [StartOrderTime], [GroupByBigCate], [enableManyShipper], [PurchasesTOPlusType], [multiLineOut], [swapShipperToAll], [defaultShipperCode], [WxCateVertical], [Units])
SELECT [MchCode], [IdCode], [ExceedTimeToDay], [GoEasyAppkey], [InPriceStyle], [OutPriceStyle], [PageRecord], [PosToExpandDay], [GroupToExpandDay], [MinRetainDay], [AllowedExceedStock], [LastPrice], [AllowedGroupExceedStock], [AllowedNewProduct], [NewProductFromWin], [PriceCaption], [OutNotCalclStock], [OutMustDis], [DiscardWeight], [MsgAcceptWxCode], [CustomerFromQuotedPrice], [AutoEntry], [AutoSwap], [purchaseGridPrintCol], [NumIsZeroNotAllowPrint], [UpdatePurchaseToDefaultShipper], [UpdateSaleOrderToPurchaseOrder], [WithInShipperCode], [AfterDisAllowedAddProduct], [SaleAutoEntry], [PushBackCheckStock], [TipNotQuotedPrice], [CostPriceInPurchare], [EnabledWeighing], [MainBookName], [SubBookName], [MainSendToSub], [importStock], [AllowedOutOrderNum], [ShipperAddNumNotTransferStock], [UpdateSaleAllowedChangePrice], [LablePrintName], [DisShowFrom], [NotAvgLose], [AcceptUserCode], [DisPrintColumns], [DisPrintFontSize], [DownGroupPrintColumns], [DownGroupPrintFontSize], [EndOrderTime], [StartOrderTime], [GroupByBigCate], [enableManyShipper], [PurchasesTOPlusType], [multiLineOut], [swapShipperToAll], [defaultShipperCode], [WxCateVertical], [Units] FROM [Lk2020AE001].[dbo].[L_Sys_Parmars_Tab]
GO

DELETE FROM [dbo].[L_Sys_Wx_Parmars_Tab]
GO
INSERT INTO [dbo].[L_Sys_Wx_Parmars_Tab] ([idCode], [allowrecharge], [allowswap], [allowprize], [allowPay], [mchname], [mchtel], [mchaddr], [extensiongiveintegral], [extensiontext], [subscribetext], [subscribegiveintegral], [noticetext], [signgiveintegral], [signtext], [prizetext], [rechargetext], [Appid], [APPSECRET], [ServiceQrCodePic], [ServiceWxopenId], [LogoPic], [Vippic], [pay_Notify_Url], [pay_MChID], [pay_Key], [pay_Cert_path], [Msg_Recharge], [Msg_Sale], [Msg_Team_Subscribe], [Msg_Team_Sale], [Msg_Order], [adPicUrl], [certificatePic])
SELECT [idCode], [allowrecharge], [allowswap], [allowprize], [allowPay], [mchname], [mchtel], [mchaddr], [extensiongiveintegral], [extensiontext], [subscribetext], [subscribegiveintegral], [noticetext], [signgiveintegral], [signtext], [prizetext], [rechargetext], [Appid], [APPSECRET], [ServiceQrCodePic], [ServiceWxopenId], [LogoPic], [Vippic], [pay_Notify_Url], [pay_MChID], [pay_Key], [pay_Cert_path], [Msg_Recharge], [Msg_Sale], [Msg_Team_Subscribe], [Msg_Team_Sale], [Msg_Order], [adPicUrl], [certificatePic] FROM [Lk2020AE001].[dbo].[L_Sys_Wx_Parmars_Tab]
GO

DELETE FROM [dbo].[L_Wx_Templated_Num_Tab]
GO
INSERT INTO [dbo].[L_Wx_Templated_Num_Tab] ([VipCode], [Templated_Code], [Num])
SELECT [VipCode], [Templated_Code], [Num] FROM [Lk2020AE001].[dbo].[L_Wx_Templated_Num_Tab]
GO

DELETE FROM [dbo].[L_Wx_Templated_Tab]
GO
INSERT INTO [dbo].[L_Wx_Templated_Tab] ([IdCode], [Templated_Id], [Templated_JSON], [Templated_Text], [Templated_Data], [Note])
SELECT [IdCode], [Templated_Id], [Templated_JSON], [Templated_Text], [Templated_Data], [Note] FROM [Lk2020AE001].[dbo].[L_Wx_Templated_Tab]
GO
