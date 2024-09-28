import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookmanager/Page/Home.dart';
import 'package:bookmanager/service/BookService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final control = Get.put(BookService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: '用户名',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '密码',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // 登录逻辑
                    try {
                      final isOK = await control.login(
                          _usernameController.text, _passwordController.text);
                      if (isOK) {
                        Get.off(HomePage());
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(content:
                          AwesomeSnackbarContent(title: '登录失败',
                              message: '密码错误',
                              contentType: ContentType.failure)
                          ));
                      }
                    }catch (e) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(
                            backgroundColor: Colors.transparent,
                            content:
                            AwesomeSnackbarContent(title: '登录失败',
                              message: '$e',
                              contentType: ContentType.failure)
                        ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: const Text('登录'),
                ),
                OutlinedButton(
                  onPressed: () async {
                    // 注册逻辑
                    var isOk = false;
                    var errno;

                    try {
                      isOk = await control.register(
                          _usernameController.text, _passwordController.text);
                    }catch (e) {
                      errno = e;
                    }

                    var snackerBar;
                    if (isOk) {
                      snackerBar = const AwesomeSnackbarContent(
                          //color: Colors.transparent,
                          title: '成功',
                          message: '注册成功',
                          contentType: ContentType.success);
                    } else {
                      snackerBar = AwesomeSnackbarContent(
                          //color: Colors.transparent,
                          title: '注册失败',
                          message: '$errno',
                          contentType: ContentType.failure);
                    }

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                          content: snackerBar
                      ));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  child: const Text('注册', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}