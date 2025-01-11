import 'package:get/get.dart';
import 'package:prl_app/view/screens/Auth_screen/check.dart';
import 'package:prl_app/view/screens/Auth_screen/log_in_screen.dart';
import 'package:prl_app/view/screens/Auth_screen/sing_up_screen.dart';
import 'package:prl_app/view/screens/Home/home_products_screen.dart';
import 'package:prl_app/view/screens/Home/intro_app/item_screen.dart';
import 'package:prl_app/view/screens/Home/intro_app/store_screen.dart';
import 'package:prl_app/view/screens/Home/main_home_screen.dart';
import 'package:prl_app/view/screens/onbording/onbording_screen.dart';
import 'package:prl_app/view/screens/splash/splash.dart';

class AppRoutes {
  static const String onbrding = Routes.onbrding;
  static const String check = Routes.check;
  static const String login = Routes.login;
  static const String singup = Routes.sinup;
  static const String homeProduct = Routes.homeProduct;
  static const String storeScreen = Routes.storeScreen;
  static const String itemScreen = Routes.itemScreen;
 static const String main_home_screen = Routes.main_home_screen;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const Splash()),
    GetPage(name: Routes.onbrding, page: () => const OnbordingScreen()),
    GetPage(name: Routes.check, page: () => const Check()),
    GetPage(name: Routes.login, page: () => const LogIn()),
    GetPage(name: Routes.sinup, page: () =>  SingUp()),
    GetPage(name: Routes.homeProduct, page: () => const HomeProductsScreen()),
    GetPage(name: Routes.storeScreen, page: () =>  StoreScreen()),
    GetPage(name: Routes.itemScreen, page: () => const ItemScreen()),
    GetPage(name: Routes.main_home_screen, page:() => MainHomeScreen()),
  ];
}

class Routes {
  static const String splash = '/splash';
  static const String onbrding = '/onbrding';
  static const String check = '/check';
  static const String login = '/login';
  static const String sinup = '/singup';
  static const String homeProduct = '/homeProduct';
  static const String storeScreen = '/StoreScreen';
  static const String itemScreen = '/ItemScreen';
  static const String main_home_screen='/main_home_screen';
}

