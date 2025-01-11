import 'package:get/get.dart';
import 'package:prl_app/model/routes/routes.dart';

abstract class AbsCheckContrller extends GetxController {
  goToLogin();
  goToSingup();
}

class CheckContrller extends AbsCheckContrller {
  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  goToSingup() {
    Get.toNamed(AppRoutes.singup);
  }
}
