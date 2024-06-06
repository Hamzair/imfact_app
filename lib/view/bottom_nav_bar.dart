

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imfact_influencer_marketplace/View/Auth/login_view.dart';
import 'package:imfact_influencer_marketplace/View/Auth/signup_view/authentication_view.dart';
import 'package:imfact_influencer_marketplace/View/Auth/signup_view/signup.dart';
import 'package:imfact_influencer_marketplace/View/bottom_bar/content-screen.dart';
import 'package:imfact_influencer_marketplace/View/bottom_bar/home.dart';
import 'package:imfact_influencer_marketplace/View/bottom_bar/message.dart';
import 'package:imfact_influencer_marketplace/View/bottom_bar/more_screen.dart';
import 'package:imfact_influencer_marketplace/View/bottom_bar/order_screen.dart';
import 'package:imfact_influencer_marketplace/const/color.dart';
import 'package:imfact_influencer_marketplace/const/image_assets.dart';
import 'package:imfact_influencer_marketplace/controller/bottombar_controller.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  static const route = "/home";

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // NavbarController navbarVM = Get.find<NavbarController>();
  BottomBarController navbarVM = Get.find<BottomBarController>();


  @override
  void initState() {
    navbarVM.controller.addListener(() {
      if (navbarVM.controller.index == 0) {
        navbarVM.navbarIndex.value = 0;
      }
    });

    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
    HomeScreen(),
      MessageScreen(),
      OrderScreen(),
      ContentScreen(),
      MoreScreen(),

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        onPressed: (c) {


        },
        icon: Image.asset(
          AppImages.home,
          color: navbarVM.navbarIndex.value == 0 ? primaryColor : null,
        ),
      ),
      PersistentBottomNavBarItem(
        onPressed: (c) {


        },
        icon: Image.asset(
          AppImages.message,
          color: navbarVM.navbarIndex.value == 1 ? primaryColor : null,
        ),
      ),
      PersistentBottomNavBarItem(
        onPressed: (c) {


        },
        icon: Image.asset(
          AppImages.order,
          color: navbarVM.navbarIndex.value == 2 ? primaryColor : null,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AppImages.content,
          color: navbarVM.navbarIndex.value == 3? primaryColor : null,
        ),

      ),
      PersistentBottomNavBarItem(
        onPressed: (c) {

        },
        icon: Image.asset(
          AppImages.more,
          color: navbarVM.navbarIndex.value == 4 ? primaryColor : null,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => PersistentTabView.custom(
      context,
      controller: navbarVM.controller,
      screens: _buildScreens(),
      itemCount: 5,
      onWillPop: (_) async {
        // Your custom back button handling logic here
        // For example, show a confirmation dialog
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      // hideNavigationBar: _hideNavBar,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      customWidget: CustomNavBarWidget(
        _navBarsItems(),
        onItemSelected: (final index) {
          navbarVM.controller.index = index;
          if (index == 2) {

          }
          if (index == 0) {

          }
        },
      ),
    ));
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget(
      this.items, {
        super.key,
        required this.onItemSelected,
      });

  Widget _buildItem(final PersistentBottomNavBarItem item) => Container(
    alignment: Alignment.center,
    height: kBottomNavigationBarHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: IconTheme(
            data: IconThemeData(size: 26),
            child: item.icon,
          ),
        ),
        // Text("Home" , style: lato400(size: 10))
      ],
    ),
  );

  @override
  Widget build(final BuildContext context) {
    BottomBarController navbarVM = Get.find<BottomBarController>();
    return Container(
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((final item) {
            final int itemIndex = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  onItemSelected(itemIndex);
                  navbarVM.navbarIndex.value = itemIndex;
                },
                child: Container(
                  height:  35,
                  color: Colors.transparent,
                  child: _buildItem(item),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
