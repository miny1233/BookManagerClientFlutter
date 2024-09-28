import 'dart:math';
import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookmanager/component/BookInfo.dart';
import 'package:bookmanager/main.dart';
import 'package:bookmanager/protobuf/test.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BookShow extends StatelessWidget {
  BookShow(this.info,{super.key});

  final info;

  @override
  Widget build(BuildContext context) {

    final picture = GestureDetector(
      onTap: () {
        // 启动详细页面
        showBookInfoDialog(context,info);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.memory(Uint8List.fromList(info.image)).image, // 替换为你的图片URL
            fit: BoxFit.cover, // 图片填充方式
          ),
          borderRadius: BorderRadius.circular(15), // 圆角
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)), // 阴影
          ],
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
      width: Get.width / 2 - 10,
      child: picture
    );

  }
}