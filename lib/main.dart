import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/splash/splash_screen_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/navigation_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RxBool isConnected = true.obs;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          getPages: NavigationConfig.availableNavigation
              .map(
                (e) => GetPage(
                  name: e.route,
                  page: () => e.screen,
                  binding: e.bindings,
                ),
              )
              .toList(),
          initialBinding: SplashScreenBinding(),
          initialRoute: NavigationConstant.splashScreenRoute,
        );
      },
    );
  }
}
