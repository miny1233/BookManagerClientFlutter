import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookmanager/protobuf/test.pb.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/BookInfo.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<BookInfo> _items = [];
  List<BookInfo> _filteredItems = [];

  final service = Get.find<BookService>();

  final TextEditingController _searchController = TextEditingController();

  void _filterItems(String query) {
    setState(() {
      _filteredItems = query.isEmpty
          ? []
          : _items.where((item) => item.bookName.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void _searchBook(BookInfo info)
  {
    showBookInfoDialog(context,info);
  }

  Future<void> _flushBookList() async {
    // 获取所有的图书
    var result = await service.GetAllBook();

    setState(() {
      _items = result;
    });
  }

  @override
  void initState() {
    super.initState();

    _flushBookList().then(( value ){
      _filteredItems = _items.sublist(0, min(5, _items.length)).toList(); // 默认显示所有项
      _searchController.addListener(() async {
        _filterItems(_searchController.text);
      });
    });

    _filteredItems = _items.sublist(0, min(5, _items.length)).toList(); // 默认显示所有项
    _searchController.addListener(() async {
      _filterItems(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const appBarTextStyle = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
            animatedTexts: [
              // TypewriterAnimatedText('sousuo',speed: Duration(milliseconds: 200)),
              TypewriterAnimatedText('搜索',textStyle: appBarTextStyle,speed: const Duration(milliseconds: 200)),
              TypewriterAnimatedText('Search',textStyle: appBarTextStyle,speed: const Duration(milliseconds: 50)),
              TypewriterAnimatedText('けんさく',textStyle: appBarTextStyle,speed: const Duration(milliseconds: 200))
            ],
          repeatForever: true,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                // 可以在这里执行搜索逻辑
                //_searchBook();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredItems[index].bookName),
                  onTap: () {
                    _searchController.text = _filteredItems[index].bookName; // 自动填充
                    _searchBook(_filteredItems[index]);
                    _filterItems(_filteredItems[index].bookName); // 更新列表
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
