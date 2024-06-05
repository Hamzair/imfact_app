

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomBarController extends GetxController{


  late PersistentTabController controller;
  RxInt navbarIndex =0.obs;

  @override
  void onInit() {
    super.onInit();
    controller = PersistentTabController(initialIndex: 0);
  }
}