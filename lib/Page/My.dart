import 'package:bookmanager/component/OrderShow.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController
{
  // late BookService control;
  final orderItem = <LogisticsCard>[].obs;

  void getOrderItems() async {
    // orderItem.value.clear();
    final control = Get.find<BookService>();

    var temp = <LogisticsCard>[];

    for(final item in await control.getOrder()) {
      temp.add(
          LogisticsCard(od: item,)
      );
    }
    orderItem.value = temp;
    print('getOrderOver');
  }
}


class MyPage extends StatelessWidget
{
  MyPage({super.key});

  final control = Get.put(MyController());

  @override
  Widget build(BuildContext context) {

    control.getOrderItems();

    return Obx(() => ListView(
      children: control.orderItem.value,
    ));
  }

}