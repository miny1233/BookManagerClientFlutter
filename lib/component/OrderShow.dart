import 'dart:ffi';

import 'package:bookmanager/Page/Home.dart';
import 'package:bookmanager/Page/My.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookmanager/service/BookService.dart';

class LogisticsCard extends StatelessWidget {
  late String status;
  late String productName;
  late String orderDate;
  late String address;

  final OrderInfo od;

  LogisticsCard({
    Key? key,
    required this.od,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final control = Get.find<BookService>();

    status = od.status;
    productName = od.bookName;
    orderDate = od.orderDatatime;
    address = od.shoppingAddress;

    var statusColor = Colors.red;
    if (status == '待签收') statusColor = Colors.yellow;
    if (status == '已签收') statusColor = Colors.green;

    return Card(
      //color: status == '待发货' ? Colors.redAccent : (status == '待签收' ? Colors.yellow[300] : Colors.green[400]),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Row(
        children: [
          Container(
            width: Get.width / 3, // 左侧颜色宽度
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
            child: SizedBox(
              height: Get.height / 4.9,width:  1,
              child: Icon(status == '待发货' ? Icons.watch_later_outlined : (status == '待签收' ? Icons.flight : Icons.check)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "下单日期: $orderDate",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  //const SizedBox(height: 8),
                  Text(
                    address,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(
                    status,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  //const SizedBox(height: 16),
                  if (status != '已签收')
                  ElevatedButton(
                    onPressed: () {
                      if (status == '待发货') {
                        control.cancelOrder(od.orderID);
                      } else {
                        control.confirmOrder(od.orderID);
                      }
                      Get.find<MyController>().getOrderItems();
                    },
                    child: Text(status == '待发货' ? '取消订单' : '确认收货'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}