import 'dart:ffi';
import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookmanager/component/BookShow.dart';
import 'package:bookmanager/protobuf/test.pb.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showBookInfoDialog(BuildContext context,BookInfo info) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {

      // make image
      final Uint8List memoryImage = Uint8List.fromList(info.image);

      var BookImage = Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.memory(memoryImage).image, // 替换为你的图片URL
            fit: BoxFit.cover, // 图片填充方式
          ),
          borderRadius: BorderRadius.circular(15), // 圆角
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)), // 阴影
          ],
        ),
      );

      final bookWedget = Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          height: Get.height / 3,
          child: BookImage
      );

      final describe =  Container(
        height: Get.height / 3,
        padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Align(alignment: Alignment.centerLeft,child: Text(info.bookName,style: TextStyle(fontSize: 30))),
              const SizedBox(height: 30,),
              Text(info.description),],
      ));

      return Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          //mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            // Describer
            Row(children: [
              Expanded(child: bookWedget),
              Expanded(child: describe),
            ],),

            // Payment
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\¥${info.price}',
                  style: const TextStyle(fontSize: 20),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // 处理支付逻辑
                    final textControl = TextEditingController();
                    const snackBarOK = AwesomeSnackbarContent(title: '支付成功', message: '购买已完成', contentType: ContentType.success);
                    const snackBarFailure = AwesomeSnackbarContent(title: '购买失败', message: '购买已取消或者发生错误', contentType: ContentType.failure);

                    Get.back();
                    showDialog(context: context, builder: (context) =>
                      AlertDialog(
                        title: const Text('确认收货地址'),
                        content: TextField(controller: textControl,),
                        actions: [
                          TextButton(onPressed: () {
                            Get.back();
                            ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                             const SnackBar(content: snackBarFailure,backgroundColor: Colors.transparent,),
                            );
                            }, child: const Text('取消')),
                          TextButton(child: const Text('确认'), onPressed: () async {
                            Get.back();
                            final control = Get.find<BookService>();
                            bool isOK = await control.buyBook(info.bookId.toInt(), textControl.text);

                            if (isOK) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(content: snackBarOK,
                                    backgroundColor: Colors.transparent,),
                                );
                            } else {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(content: snackBarFailure,
                                    backgroundColor: Colors.transparent,),
                                );
                            }
                          }),
                        ],
                      )
                    );
                    //ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                  },
                  icon: const Icon(Icons.payment), // 支付图标
                  label: const Text('购买'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // 圆角
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
