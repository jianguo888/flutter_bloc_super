/**
 * 自定义菜单控制器
 * 
 * 此控制器负责管理应用程序的导航菜单状态，包括选中的菜单项和抽屉的打开/关闭状态。
 * 
 * @author 坚果派(NutPi)
 * @email jianguo@nutpi.net
 * @website https://www.nutpi.com
 * @version 1.0.0
 * @date 2023-01-01
 * @copyright Copyright © 2023 坚果派(NutPi). All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CustomMenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems =>
      ["Cases", "Services", "About Us", "Careers", "Blog", "Contact"];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
  }
}
