export const data = {
    nodes: [{
        id: 'quotedPrice',
        x: 100,
        y: 50,
        label: '客户预报价单',
        // 当前节点的多状态样式
        anchorPoints: [
            [1, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconSale_Reports",
            idcode: "302",
            pcode: "3",
            title: "客户预报价单",
            viewpath: "quotedPrice"
        }
    }, {
        id: 'saleOrder',
        x: 350,
        y: 50,
        label: '客户订货单',
        anchorPoints: [
            [0.5, 1],
            [0, 0.5],
            [1, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconSale_Order",
            idcode: "30401",
            pcode: "304",
            title: "客户订货单",
            viewpath: "saleOrder"
        }
    }, {
        id: 'saleOrderAdd',
        x: 600,
        y: 50,
        label: '客户加单',
        anchorPoints: [
            [0, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconSale_Order",
            idcode: "30402",
            pcode: "304",
            title: "客户加单单",
            viewpath: "saleOrderAdd"
        }
    }, {
        id: 'purchaseGroup',
        x: 100,
        y: 150,
        label: '采购汇总表',
        anchorPoints: [
            [0.5, 0],
            [0.5, 1]
        ],
        parmar: {
            iconcls: "iconfont iconPurchase_Reports",
            idcode: "204",
            pcode: "2",
            title: "采购汇总表",
            viewpath: "purchaseOrderGroup"
        }
    }, {
        id: 'purchaseOrder',
        x: 100,
        y: 250,
        label: '采购下货单',
        anchorPoints: [
            [0.5, 0],
            [0.5, 1]
        ],
        parmar: {
            iconcls: "iconfont iconPurchase_Order",
            idcode: "205",
            pcode: "2",
            title: "采购下货单",
            viewpath: "purchaseOrder"
        }
    }, {
        id: 'purchase',
        x: 100,
        y: 350,
        label: '采购收货单',
        anchorPoints: [
            [0.5, 0],
            [1, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconPurchase_In",
            idcode: "208",
            pcode: "2",
            title: "采购收货单",
            viewpath: "purchase"
        }
    }, {
        id: 'disGroup',
        x: 350,
        y: 300,
        label: '商品配货',
        anchorPoints: [
            [0.5, 0],
            [0, 0.5],
            [1, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconSale",
            idcode: "701",
            pcode: "7",
            title: "商品配货",
            viewpath: "disAction"
        }
    }, {
        id: 'purchaseEntry',
        x: 350,
        y: 400,
        label: '采购入帐',
        anchorPoints: [
            [0.5, 0],
            [0, 0.5],
            [1, 0.5],
            [0.5, 1]
        ],
        parmar: {
            iconcls: "iconfont iconAccount",
            idcode: "211",
            pcode: "2",
            title: "采购入帐单",
            viewpath: "purchaseEntry"
        }
    }, {
        id: 'sale',
        x: 600,
        y: 150,
        label: '客户送货单',
        anchorPoints: [
            [0.5, 0],
            [0, 0.5],
            [0.5, 1]
        ],
        parmar: {
            iconcls: "iconfont iconSale_Out",
            idcode: "306",
            pcode: "3",
            title: "客户送货单",
            viewpath: "sale"
        }
    }, {
        id: 'stockClear',
        x: 600,
        y: 350,
        label: '库存清点',
        anchorPoints: [
            [0, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconStock_Change",
            idcode: "403",
            pcode: "4",
            title: "库存清点单",
            viewpath: "stockChange"
        }
    }, {
        id: 'saleCheck',
        x: 540,
        y: 250,
        size: [100, 50],
        label: '销售对帐',
        anchorPoints: [
            [0.5, 0]
        ],
        parmar: {
            iconcls: "",
            idcode: "31004",
            pcode: "310",
            title: "销售对帐",
            viewpath: "reports/saleCheck"
        }
    }, {
        id: 'receivable',
        x: 660,
        y: 250,
        size: [100, 50],
        label: '应收货款',
        anchorPoints: [
            [0.5, 0]
        ],
        parmar: {
            iconcls: "iconfont iconFinance_Res",
            idcode: "501",
            pcode: "5",
            title: "应收货款",
            viewpath: "receivable"
        }
    }, {
        id: 'purchaseCheck',
        x: 100,
        y: 450,
        label: '采购对帐',
        anchorPoints: [
            [1, 0.5]
        ],
        parmar: {
            concls: "",
            idcode: "21304",
            pcode: "213",
            title: "采购对帐",
            viewpath: "reports/purchaseCheck"
        }
    }, {
        id: 'payable',
        x: 600,
        y: 450,
        label: '应付货款',
        anchorPoints: [
            [0, 0.5]
        ],
        parmar: {
            iconcls: "iconfont iconFinance_Pay",
            idcode: "502",
            pcode: "5",
            title: "应付货款",
            viewpath: "payable"
        }
    }],
    edges: [{
        source: 'quotedPrice',
        target: 'saleOrder',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 0,
        targetAnchor: 1
    }, {
        source: 'saleOrderAdd',
        target: 'saleOrder',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 0,
        targetAnchor: 2
    }, {
        source: 'saleOrder',
        target: 'purchaseGroup',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 0,
        targetAnchor: 0
    }, {
        source: 'saleOrder',
        target: 'sale',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 0,
        targetAnchor: 0
    }, {
        source: 'saleOrder',
        target: 'disGroup',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 0,
        targetAnchor: 0
    }, {
        source: 'purchaseGroup',
        target: 'purchaseOrder',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 0
    }, {
        source: 'purchaseOrder',
        target: 'purchase',
        //type: 'line',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 0
    }, {
        source: 'purchase',
        target: 'disGroup',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 1
    }, {
        source: 'purchase',
        target: 'purchaseEntry',
        style: {
            offset: 15,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 1
    }, {
        source: 'stockClear',
        target: 'purchaseEntry',
        style: {
            offset: 15,
            startArrow: true,
            endArrow: false,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 2
    }, {
        source: 'stockClear',
        target: 'disGroup',
        style: {
            offset: 15,
            startArrow: true,
            endArrow: false,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 2
    }, {
        source: 'sale',
        target: 'disGroup',
        style: {
            offset: 15,
            startArrow: true,
            endArrow: false,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 1,
        targetAnchor: 2
    }, {
        source: 'purchaseEntry',
        target: 'purchaseCheck',
        style: {
            offset: 15,
            startArrow: false,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 3,
        targetAnchor: 0
    }, {
        source: 'purchaseEntry',
        target: 'payable',
        style: {
            offset: 15,
            startArrow: false,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 3,
        targetAnchor: 0
    }, {
        source: 'sale',
        target: 'saleCheck',
        style: {
            offset: 15,
            startArrow: false,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 2,
        targetAnchor: 0
    }, {
        source: 'sale',
        target: 'receivable',
        style: {
            offset: 15,
            startArrow: false,
            endArrow: true,
            lineDash: [2, 2, 2],
            lineWidth: 2,
            stroke: '#333'
        },
        sourceAnchor: 2,
        targetAnchor: 0
    }]
};