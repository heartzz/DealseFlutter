import 'package:dealse/model/navigation_model.dart';
import 'package:dealse/utils/constants/navigation_constant.dart';
import 'package:dealse/view/dashboard/dashboard_screen_binding.dart';
import 'package:dealse/view/dashboard/dashboard_screen_view.dart';
import 'package:dealse/view/login/login_screen_binding.dart';
import 'package:dealse/view/login/login_screen_view.dart';
import 'package:dealse/view/splash/splash_screen_binding.dart';
import 'package:dealse/view/splash/splash_screen_view.dart';
import 'package:get/get.dart';


const SplashRoutes = "/init";
const LoginPageRoute = "/login";
const String rootRoute = '/';


class NavigationConfig {
  static final NavigationModel splash = NavigationModel(
    route: NavigationConstant.splashScreenRoute,
    screen: const SplashScreenView(),
    bindings: SplashScreenBinding(),
  );
  static final NavigationModel rootRoute = NavigationModel(
    route: NavigationConstant.rootRoute,
    screen: const SplashScreenView(),
    bindings: SplashScreenBinding(),
  );

  static final NavigationModel dashboard = NavigationModel(
    route: NavigationConstant.dashboardScreenRoute,
    screen:  DashboardScreen(),
    bindings: DashboardScreenBinding(),
  );

  static List<GetPage> getPages() {
    return [
     GetPage(name: LoginPageRoute, page: () => LoginScreenView(), binding: LoginScreenBinding()),
    ];
  }

  static final List<NavigationModel> availableNavigation = [
    rootRoute,
    splash,
  ];
}

void backPressToDashboard(){
  Get.offAll(DashboardScreen(),binding: DashboardScreenBinding(),routeName: NavigationConstant.dashboardScreenRoute,);
}

