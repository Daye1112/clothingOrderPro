$(function () {
    /**
     * 取消订单处理事件
     */
    $("a[name='orderDelete']").click(function () {
        //获取url
        var url = $(this).attr("href");
        layer.confirm("是否确认取消该订单？", {title: "确认删除"}, function (index) {
            layer.close(index);
            $.get(url, function (obj) {
                if(obj.success){
                    layer.msg("取消成功",{time:1000});
                    setTimeout(function () {
                        window.location.reload();
                    }, 1000);
                } else{
                    dealInfo(obj.message);
                }
            });
        });
        return false;
    });
    /**
     * 查看订单内容信息
     */
    $("a[name='detailInfo']").click(function () {
        var url = $(this).attr("href");
        $.get(url, function (obj) {
            if (obj.success) {
                var data = obj.data;
                layDetailInfoContent(data);
            } else {
                dealInfo(obj.message);
            }
        });
        return false;
    });

    function layDetailInfoContent(data) {
        var content = '<div class="cart_total" style="width: 300px;"><ul>';
        var totalOrderPrice = 0;
        for (var i = 0; i < data.length; i++) {
            var item = data[i];
            content += '<div class="cart_details">' +
                '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                '<div class="cart_total_title" style="width: 100%;">' + item.goodsName + '(' + item.goodsSize + ') × ' + item.goodsNum + '</div>' +
                '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">￥' + item.totalPrice + '</div>' +
                '</li>';
            totalOrderPrice += item.totalPrice;
        }
        content += '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
            '<div class="cart_total_title" style="width: 100%;">订单总金额</div>' +
            '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">￥' + totalOrderPrice + '</div>' +
            '</li>' +
            '</ul>' +
            '</div>' +
            '</div>';
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                title: "内容详情",
                type: 1,
                area: 'auto',
                skin: '', //样式类名
                closeBtn: 1, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                content: content
            });
            return false;
        })
    }
    $("a[name='orderInfo']").click(function () {
        var url = $(this).attr("href");
        $.get(url, function (obj) {
            if (obj.success) {
                var data = obj.data;
                layOrderInfoContent(data);
            } else{
                dealInfo(obj.message);
            }
        });
        return false;
    });

    function dealInfo(msg) {
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.msg(msg,{time:1000});
        });
    }

    /**
     * 显示订单信息
     * @param data 订单信息
     */
    function layOrderInfoContent(data) {
        var isInvoice = data.isinvoice === 1;
        var orderStatus = data.orderStatus === 3 || data.orderStatus === 4;
        layui.use('layer', function () {
            var layer = layui.layer;
            layer.open({
                title: "订单详情",
                type: 1,
                skin: '', //样式类名
                closeBtn: 1, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                content: '<div class="cart_details">' +
                    '<div class="cart_total">' +
                    '<ul>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">订单号</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.orderNo + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">商品总额</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.goodsMoney + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">订单状态</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' +
                    (data.orderStatus === 0 ? "未支付" : data.orderStatus === 1 ? "待发货" : data.orderStatus === 2 ? "已取消" : data.orderStatus === 3 ? "配送中" : data.orderStatus === 4 ? "已收货" : "") +
                    '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">运费</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">￥' + data.deliverMoney + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">是否需要发票</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + (isInvoice ? "是" : "否") + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">收货地址</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.orderAddress + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">收件人</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.userRealName + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">订单备注</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.orderRemark + '</div>' +
                    '</li>' +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">下单时间</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.createTime + '</div>' +
                    '</li>' +
                    (orderStatus ?
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">收货时间</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.receiveTime + '</div>' +
                        '</li>' +
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">快递号</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.expressNo + '</div>' +
                        '</li>' +
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">发货时间</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.deliveryTime + '</div>' +
                        '</li>' +
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">快递公司</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">' + data.expressName + '</div>' +
                        '</li>' : "") +
                    (isInvoice ?
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">发票抬头</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">无</div>' +
                        '</li>' +
                        '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                        '<div class="cart_total_title" style="width: 100%;">发票税号</div>' +
                        '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">无</div>' +
                        '</li>' : "") +
                    '<li class="d-flex flex-row align-items-center justify-content-start" style="overflow: auto;">' +
                    '<div class="cart_total_title" style="width: 100%;">订单总金额</div>' +
                    '<div class="cart_total_price ml-auto" style="width: 100%;text-align: right;">￥40.00</div>' +
                    '</li>' +
                    '</ul>' +
                    '</div>' +
                    '</div>'
            });
            return false;
        });
    }
});