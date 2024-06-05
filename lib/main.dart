import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'View/splash/splash_screen.dart';
import 'controller/bottombar_controller.dart';

void main() {

  Get.put(BottomBarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, child) {
          return GetMaterialApp(
            theme: ThemeData( fontFamily: 'Pretendard'),

            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );

        });
  }
}
