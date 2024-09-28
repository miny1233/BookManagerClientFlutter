import 'package:bookmanager/Page/My.dart';
import 'package:bookmanager/Page/Recommend.dart';
import 'package:bookmanager/Page/Search.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../component/custom_animated_bottom_bar.dart';

class HomeController extends GetxController {
  var _index = 1.obs;
}

class HomePage extends StatelessWidget
{

  HomePage({super.key});

  final HomeController control = Get.put(HomeController());
  final service = Get.find<BookService>();

  final backgroundColor = Colors.white;
  final _inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Obx((){
        switch (control._index.value)
        {
          case 0: return MyPage();
          case 1: return RecommendPage();
          case 2: return const SearchPage();
        }

        return RecommendPage();
      })),
      bottomNavigationBar: Obx((){
        return _buildBottomBar();
      }),
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 56,
      backgroundColor: backgroundColor,
      selectedIndex: control._index.value,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeInOut,
      onItemSelected: (index) async {
        control._index.value = index;
        // if(index == 0)ImagePicker().pickImage(source: ImageSource.gallery);
        // if(index == 2)ImagePicker().pickImage(source: ImageSource.camera);
      },
      items: <MyBottomNavigationBarItem>[
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: const Text('我的'),
          activeColor: const Color(0xffF4D144),
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon: const Icon(Icons.recommend),
          title: const Text('推荐'),
          activeColor: Colors.greenAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        MyBottomNavigationBarItem(
          icon:  const Icon(Icons.search),
          title: const Text('搜索'),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

}