import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/main/main_screen.dart';

import 'constants.dart';

/**
 * 主入口函数，启动 Flutter 应用程序。
 * 
 * 此函数调用 `runApp` 方法，并传入 `MyApp` 小部件作为根小部件，
 * 从而启动整个 Flutter 应用程序。
 *
 * @author 坚果派(NutPi)
 * @email nutpi@example.com
 * @website https://www.nutpi.com
 * @version 1.0.0
 * @date 2023-01-01
 * @copyright Copyright © 2023 坚果派(NutPi). All rights reserved.
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //取消debug图标
      title: '坚果 Blog',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: kBodyTextColor),
          bodyMedium: TextStyle(color: kBodyTextColor),
          headlineMedium: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}
