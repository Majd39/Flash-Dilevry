import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/routes/routes.dart';
import 'package:prl_app/model/data/SavingUserData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = await TokenManager.isTokenAvailable();

  runApp(MyApp(initialRoute: isLoggedIn ? AppRoutes.main_home_screen : AppRoutes.onbrding));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: initialRoute,
    );
  }
}
