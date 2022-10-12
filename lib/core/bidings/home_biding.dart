import 'package:get/get.dart';
import 'package:tchombe/app/clothes/controller/fetch_display_delete_clothes_controller.dart';
import 'package:tchombe/app/dashboard/blocs/dashboard_controller.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';

class HomeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => FetchDisplayAndDeleteClothesController());
    Get.lazyPut(() => FetchDisplayAndDeleteLookController());
    Get.lazyPut(()=>PlanningController());
  }
}
