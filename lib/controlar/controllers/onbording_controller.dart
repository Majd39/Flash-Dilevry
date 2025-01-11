import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prl_app/model/constant/onbording_static.dart';
import 'package:prl_app/model/routes/routes.dart';

abstract class AbsOnbordingController extends GetxController {
  next();
  pre();
  skip();
  onChanged(int onPage);
}

class OnbordingController extends AbsOnbordingController {
  int currentPage = 0;
  late PageController pageController;
  @override
  next() {
    currentPage++;
    if (currentPage > onbordingList.length - 1) {
      Get.offAllNamed(Routes.check);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  onChanged(int onPage) {
    currentPage = onPage;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  pre() {
    currentPage--;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  skip() {
    Get.offAllNamed(Routes.check);
  }
}
