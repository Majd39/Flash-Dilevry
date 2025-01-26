import 'package:get/get.dart';
import 'package:prl_app/view/screens/Auth_screen/check.dart';
import 'package:prl_app/view/screens/Auth_screen/log_in_screen.dart';
import 'package:prl_app/view/screens/Auth_screen/sing_up_screen.dart';
import 'package:prl_app/view/screens/Home/home_products_screen.dart';
import 'package:prl_app/view/screens/Home/intro_app/store_screen.dart';
import 'package:prl_app/view/screens/Home/main_home_screen.dart';
import 'package:prl_app/view/screens/Home/profile.dart';
import 'package:prl_app/view/screens/onbording/onbording_screen.dart';
import 'package:prl_app/view/screens/splash/splash.dart';

//import 'package:prl_app/view/widgets/Home/stors.dart';
class AppRoutes {
  static const String onbrding = Routes.onbrding;
  static const String check = Routes.check;
  static const String login = Routes.login;
  static const String singup = Routes.sinup;
  static const String homeProduct = Routes.homeProduct;
  static const String storeScreen = Routes.storeScreen;
  static const String itemScreen = Routes.itemScreen;
  // ignore: constant_identifier_names
  static const String main_home_screen = Routes.main_home_screen;
  static const String profilePage = Routes.profilePage;
  static final routes = [
    GetPage(name: Routes.splash, page: () => const Splash()),
    GetPage(name: Routes.onbrding, page: () => const OnbordingScreen()),
    GetPage(name: Routes.check, page: () => const Check()),
    GetPage(name: Routes.login, page: () => const LogIn()),
    GetPage(name: Routes.sinup, page: () => SingUp()),
    GetPage(name: Routes.homeProduct, page: () => const HomeProductsScreen()),
    GetPage(name: Routes.storeScreen, page: () => const StoreScreen()),
    //  GetPage(
    // name: Routes.itemScreen,
    //  page: () {
    //final String? productIndex = Get.parameters['productIndex'];
    //return ItemScreen(productIndex: int.parse(productIndex ?? '0')); // Default to 0 if not passed
    //  },
    // ),
    GetPage(name: Routes.main_home_screen, page: () => const MainHomeScreen()),
    GetPage(name: Routes.profilePage, page: () => ProfilePage()),
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
  // ignore: constant_identifier_names
  static const String main_home_screen = '/main_home_screen';
  static const String profilePage = "/ProfilePage";
  //static const String store_screen="/store_screen";
}
