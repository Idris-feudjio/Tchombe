import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleLookImageController extends GetxController {
  var currentIndex = 0.obs;
  PageController? pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    pageController?.dispose();
  }

  onPageChange(int index) {
    currentIndex.value = index;
  }
}
