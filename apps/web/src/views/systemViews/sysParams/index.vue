<template>
<div  class="form-container">
    <div class="but-container">
        <LkxButton class="lkx-col-but" type="primary" radius=6 height="30" width="100" caption="保存" iconCls="iconfont iconSave" @click="handleSave"></LkxButton>
    </div>
    <div class="container">
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">时间点</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elexceedtimetoday" type="text" draggable v-model="RowData.exceedtimetoday" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>超过此时间送货日期加1</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">下单时段</span>
            </lkx-col>
            <lkx-col class="col-caption" span=1>
               <span class="caption">开始</span>
            </lkx-col>
            <lkx-col class="col-val" span=2>
               <input name="Elexceedtimetoday" type="text" draggable v-model="RowData.startordertime" />
            </lkx-col>
            <lkx-col class="col-caption" span=1>
               <span class="caption">结束</span>
            </lkx-col>
            <lkx-col class="col-val" span=3>
               <input name="Elexceedtimetoday" type="text" draggable v-model="RowData.endordertime" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>客户可自助下单时段(不可跨日) 差额为0代表无限制</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">订单信息接收人</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <textarea name="Elmsgacceptwxcode" type="text" style="height:100px;" draggable v-model="RowData.msgacceptwxcode" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>客户下单后订单接收人员OpenCode，一行代表一个</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">GoEasyAppkey</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elgoeasyappkey" type="text" draggable v-model="RowData.goeasyappkey" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以发送通知的第三方账号</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">扩展日</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elgrouptoexpandday" type="text" draggable v-model="RowData.grouptoexpandday" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>汇总日向前推X日前的数据移到扩展表</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">成本格式</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elinpricestyle" type="text" draggable v-model="RowData.inpricestyle" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制成本价的小数位</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">售价格式</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Eloutpricestyle" type="text" draggable v-model="RowData.outpricestyle" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制销售价的小数位</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">页行数</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elpagerecord" type="text" draggable v-model="RowData.pagerecord" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>每一页的行数，0代表不分页</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">最小保留</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ELminretainday" type="text" draggable v-model="RowData.minretainday" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>删除数据时系统最小保留数据的天数</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">舍去重量</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Eldiscardweight" type="text" draggable v-model="RowData.discardweight" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>小于设定的重量时小数位舍去</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">损耗权重</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Ellossratestyle" type="text" draggable v-model="RowData.lossrate" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制损耗不分摊客户的损耗权重</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">采购汇总栏数</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elpurchasegridprintcol" type="text" draggable v-model="RowData.purchasegridprintcol" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制采购汇总打印的分栏数只能用2，3</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elimportstock" type="checkbox" draggable v-model="RowData.multilineout" :checked="RowData.multilineout==1" />
                多行显示</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>下单汇总中是明细数据多行显示</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">下单汇总栏数</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ElDisPrintColumns" type="text" draggable v-model="RowData.downgroupprintcolumns" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制下单汇总打印的分栏数只能用1，2</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">下单汇总字体</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ElDisPrintColumns" type="text" draggable v-model="RowData.downgroupprintfontsize" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制下单汇总打印打印字体大小</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">配货表栏数</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ElDisPrintColumns" type="text" draggable v-model="RowData.disprintcolumns" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制配货表打印的分栏数只能用1，2</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">配货表字体</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ElDisPrintColumns" type="text" draggable v-model="RowData.disprintfontsize" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用以控制配货表打印字体大小</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">内部货商</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ELwithinshippercode" type="text" draggable v-model="RowData.withinshippercode" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用于控制内部供应商，对应的供货编码无启用“账套间传送数据”时不会生成采购收货单</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">默认下单用户</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elacceptusercode" type="text" draggable v-model="RowData.acceptusercode" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>用于设置采购下单时的用户号，0为操作员编号</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">标签机名称</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Ellableprintname" type="text" draggable v-model="RowData.lableprintname" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>设置系统打标签时使用的打印机名称</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">主账套</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="Elmainbookname" type="text" draggable v-model="RowData.mainbookname" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>系统的基本账套</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">子账套</span>
            </lkx-col>
            <lkx-col class="col-val" span=7>
               <input name="ELsubbookname" type="text" draggable v-model="RowData.subbookname" />
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>系统的子账套</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elmainsendtosub" type="checkbox" draggable v-model="RowData.mainsendtosub" :checked="RowData.mainsendtosub==1" />账套间传送数据</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>主账套审核”采购下单“时子账套自动生成”客户订单“</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="ELlastprice" type="checkbox" draggable v-model="RowData.lastprice" :checked="RowData.lastprice==1" />取最后销售单价</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>审核送货单后，以销售单价更新报价(请小心使用，对时段定价客户中的时价商品可能造成价格影响)</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elimportstock" type="checkbox" draggable v-model="RowData.purchasestoplustype" :checked="RowData.purchasestoplustype==1" />
                采购收货祥细模式</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>收货单中使用祥细模式，包括框损，费用等</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elimportstock" type="checkbox" draggable v-model="RowData.importstock" :checked="RowData.importstock==1" />
                导入可用量</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>开“客户订单”或“客户送货单”时是否带入可用量(注意如果启用可能会造成加载商品时速度相对变慢)</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elcostpriceinpurchare" type="checkbox" draggable v-model="RowData.costpriceinpurchare" :checked="RowData.costpriceinpurchare==1" />
                成本计算以当日进货为准</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>销售成本以当日进货平均（不计算前一天余下存货,允许负库时建议使用）</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elnotavglose" type="checkbox" draggable v-model="RowData.notavglose" :checked="RowData.notavglose==1" />
                每日损耗不平摊</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>库存清点不平摊到对应日期销售成本</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elallowedexceedstock" type="checkbox" draggable v-model="RowData.allowedexceedstock" :checked="RowData.allowedexceedstock==1" />允许负库存</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>送货单审核可以超过库存</span>
            </lkx-col>
        </lkx-row>
        <!-- <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Eloutnotcalclstock" type="checkbox" draggable v-model="RowData.outnotcalclstock" :checked="RowData.outnotcalclstock==1" />出库不减库存</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>送货单审核不减库存</span>
            </lkx-col>
        </lkx-row>-->
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Eloutmustdis" type="checkbox" draggable v-model="RowData.outmustdis" :checked="RowData.outmustdis==1" />
                出库要配货</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>送货单审核前一定要经过配货,如果选中待出量取配货数量否则取打单数量</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elafterdisallowedaddproduct" type="checkbox" draggable v-model="RowData.afterdisallowedaddproduct" :checked="RowData.afterdisallowedaddproduct==1" />
                配货后允许加单</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>送货单经过配货后可以加单</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="ELdisshowfrom" type="checkbox" draggable v-model="RowData.disshowfrom" :checked="RowData.disshowfrom==1" />
                配货表显示来源</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>打印配货表或配货时显示商品来源</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elallowedoutordernum" type="checkbox" draggable v-model="RowData.allowedoutordernum" :checked="RowData.allowedoutordernum==1" />下单量可超订量</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>采购汇总下单到供货商时可以超过客户订量(供货商端同时生效)</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="ElshipperaddNumnottransferstock" type="checkbox" draggable v-model="RowData.shipperaddNumnottransferstock" :checked="RowData.shipperaddNumnottransferstock==1" />货商加量不转存</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>供货商加大数量时超出部分不转存货（同时会更新送货单的结算量）</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elenabledweighing" type="checkbox" draggable v-model="RowData.enabledweighing" :checked="RowData.enabledweighing==1" />
                启用电子称</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>配货时启用电子称连接(要另外安装配货服务)</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elcustomerfromquotedprice" type="checkbox" draggable v-model="RowData.customerfromquotedprice" :checked="RowData.customerfromquotedprice==1" />
                取报价商品</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>客户自助下单时只能取对应的报价商品</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elupdatesaleallowedchangeprice" type="checkbox" draggable v-model="RowData.updatesaleallowedchangeprice" :checked="RowData.updatesaleallowedchangeprice==1" />
                报价时更新未审送货价格</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>审核报价单时会更新对应时段送货单的价格(不选中时审核后的送货单价格不同步)</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="elautoentry" type="checkbox" draggable v-model="RowData.autoentry" :checked="RowData.autoentry==1" />
                收货自动入帐</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>审核收货单自动审核采购入帐单</span>
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="ELsaleautoentry" type="checkbox" draggable v-model="RowData.saleautoentry" :checked="RowData.saleautoentry==1" />
                销售自动入帐</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>审核客户送货单自动审核销售入帐单</span>
            </lkx-col>
        </lkx-row>
        <!--<lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elautoswap" type="checkbox" draggable v-model="RowData.autoswap" :checked="RowData.autoswap==1" />
                自动拆零</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>库存以最小销售单位为基准，组合商品不会有库存</span>
            </lkx-col>
        </lkx-row>-->
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elnumiszeronotallowprint" type="checkbox" draggable v-model="RowData.numiszeronotallowprint" :checked="RowData.numiszeronotallowprint==1" />
                数量或单价为0不可打印</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>送货单数量或单价为0时不可以打印</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elupdatesaleordertopurchaseorder" type="checkbox" draggable v-model="RowData.updatesaleordertopurchaseorder" :checked="RowData.updatesaleordertopurchaseorder==1" />
                自动分流</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>客户订单审核后自动生成采购订单(相当于自动接单，会导至客户订单不能反签)</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="enableManyShipper" type="checkbox" draggable v-model="RowData.enablemanyshipper" :checked="RowData.enablemanyshipper==1" />
                启用多货商分流</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>自动分流时优先使用报价表中指定的货商，如不设置直接使用商品资料里面设置的货商</span> 
            </lkx-col>
        </lkx-row>
        <!--<lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elupdatepurchasetodefaultshipper" type="checkbox" draggable v-model="RowData.updatepurchasetodefaultshipper" :checked="RowData.updatepurchasetodefaultshipper==1" />
                更新默认货商</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>收货入帐时更新报价商品对应的默认供货商(请小心使用，手机端不起作用)</span> 
            </lkx-col>
        </lkx-row>-->
        
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Elpushbackcheckstock" type="checkbox" draggable v-model="RowData.pushbackcheckstock" :checked="RowData.pushbackcheckstock==1" />
                回推清点存货</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>汇总时使用库存数量更新对应日期的清点单数据(设置后同一天不能有相同仓库两张清点单)</span> 
            </lkx-col>
        </lkx-row>
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="ElpushGroupByBigCate" type="checkbox" draggable v-model="RowData.groupbybigcate" :checked="RowData.groupbybigcate==1" />
                分类汇总输出以大类为准</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>分类汇总输出以大类为准</span> 
            </lkx-col>
        </lkx-row>
        <!--<lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
            </lkx-col>
            <lkx-col class="col-check-val" span=7>
               <span class="caption"><input name="Eltipnotquotedprice" type="checkbox" draggable v-model="RowData.tipnotquotedprice" :checked="RowData.tipnotquotedprice==1" />
                没报价提示</span>
            </lkx-col>
            <lkx-col class="col-note" span=10>
               <span>客户订单和送货无报价时进行提示（可以直接报价）</span> 
            </lkx-col>
        </lkx-row>-->
        <lkx-row gutter=10>
            <lkx-col class="col-caption" span=3>
               <span class="caption">单位</span>
            </lkx-col>
            <lkx-col class="col-val" span=17>
               <input name="Elgrouptoexpandday" type="text" draggable v-model="RowData.units" />
            </lkx-col>
            <lkx-col class="col-note" span=4>
               <span>用于智能匹配使用的单位</span>
            </lkx-col>
        </lkx-row>
    </div>
</div> 
</template>

<script setup lang="ts">
import { reactive, ref, onMounted } from "vue"
import { LkxRow, LkxCol, LkxButton, MessageBox } from '@v4x/ui'
import $api from '@/request/api'
import { TWinForm } from "@/usehook/win"
import useAppStore from '@/stores';
defineOptions({
    name: "sysParams"
})

const props = withDefaults(defineProps<{
    rowData?: object
    config?: object
}>(), {
    rowData: () => ({}),
    config: () => ({})
})

const $AipPath = '/masterApi/disApi/Sys/SysParams/'
const RowData = ref<any>({})
const Win = reactive(new TWinForm({}))

const getDefaultParam = reactive({
    fieldName: '*',
    sortFields: 'idcode',
    keyFieldName: 'idCode'
})

const getData = async (api: string, param: any) => {
    const defaultParam = {
        fieldName: '*',
        condition: `idCode=${useAppStore().accountBookCode}`,
        returnTotal: false,
        totalFieldSql: '',
        page: 1,
        pageSize: 0
    }
    const res = await $api.getData($AipPath, Object.assign(defaultParam, param))
    if (res && res.errCode == 0) {
        res.datas[0].msgacceptwxcode = res.datas[0].msgacceptwxcode.replace(/;/g, "\n")
        RowData.value = res.datas[0]
    }
}

const editData = async (api: string, parmas: any) => {
    const res = await $api.editData(api, parmas)
    if (res && res.errCode == 0) {
        MessageBox.information({
            title: '提示',
            content: '参数保存成功',
            showCancel: false
        })
    }
}

const handleSave = async (e: MouseEvent) => {
   (RowData.value as any).msgacceptwxcode = (RowData.value as any).msgacceptwxcode.replace(/\n/g, ";")
   const param = {
      keyFieldName: 'idCode',
      keyFieldValue: (RowData.value as any).idcode,
      datas: [RowData.value]
   }
   editData($AipPath, param)
}

onMounted(() => {
    getData($AipPath, getDefaultParam)
})
</script>

<style lang="scss" scoped>
.col-caption {
    text-align: right;
}
.col-val {
    input, textarea {
        width: 100%;
        border-radius: 4px;
        outline: 0;
        border: 1px solid #dcdcdc;
        &:focus {
            border: 1px solid blue;
        }
    }
}
.col-note {
    color: red;
}
.form-container {
    flex: 1;
    display: flex;
    flex-direction: column;
}
.but-container {
    height: 25px;
    padding: 8px 20px;
    border-bottom: 1px solid #eee;
    .lkx-col-but {
        width: 100px;
        background: rgb(104, 104, 206);
        color: white;
    }
}
.container {
    flex: 1;
    position: absolute;
    margin-top: 10px;
    width: 100%;
    top: 40px;
    bottom: 0;
    overflow-y: auto;
    overflow-x: hidden;
}
</style>
