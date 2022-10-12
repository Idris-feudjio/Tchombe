import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
