import 'package:bookmanager/component/BookShow.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendController extends GetxController
{
    //var children = ([Text('')] as List<Widget>).obs;
    var typeView = ([Text('加载中')] as List<Widget>).obs;
    var service = Get.find<BookService>();

    Future<void> flushRecommend()
    async {
      final result = await service.GetAllBook();
      //children.value = [];
      typeView.value = [];
      var classify = <String,List<BookShow>>{};

      for (final row in result){
        classify[row.title] = classify[row.title] ?? List<BookShow>.empty(growable: true);
        classify[row.title]?.add(BookShow(row));
      }

      classify.forEach((key,list) {
        typeView.add(_pageView(list, key));
      });

    }
}

class RecommendPage extends StatelessWidget
{
  RecommendPage({super.key});

  final control = Get.put(RecommendController());

  @override
  Widget build(BuildContext context) {

    control.flushRecommend();

    return SingleChildScrollView(
      child: Obx(() => Column(
        children: control.typeView.value,
      ))
    );
  }

}

Widget _pageView(List<Widget> com,String typeName)
{
  return Container(
      height: Get.height / 2.7,
      child: Column(children:
      [
        Expanded(child: Align(alignment: const Alignment(-0.8,-1),child: Text(typeName,style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),)),
        Expanded(flex:5,child: ListView(
          scrollDirection: Axis.horizontal,
          children: com,
        )),
      ]
      ));
}

