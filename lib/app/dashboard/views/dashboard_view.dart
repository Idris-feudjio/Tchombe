import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/clothes/views/clothes_view.dart';
import 'package:tchombe/app/dashboard/blocs/dashboard_controller.dart';
import 'package:tchombe/app/home/views/home_page.dart';
import 'package:tchombe/app/looks/views/looks_view.dart';
import 'package:tchombe/app/planification/views/planning_view.dart';

enum bottomNavigationBarEnum { HomePage, LookPage, ClothesPage, PlanningPage }

class DashboardView extends StatelessWidget {
  DashboardView({Key? key, required this.page}) : super(key: key);

  final bottomNavigationBarEnum page;
  DashboardController _dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        initState: (_) {
          _dashboardController.currentIndex.value = _getCurrentIndex(page);
        },
        builder: (controller) {
          return Scaffold(
            body: pages.elementAt(controller.currentIndex.value),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: controller.changeTabIndex,
              currentIndex: controller.currentIndex.value,
              selectedLabelStyle:
                  Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
              unselectedLabelStyle: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedLabelStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'K_HOME'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.looks_rounded),
                  label: 'K_GENERALLOOK'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.checkroom_rounded),
                  label: 'K_CLOTHES'.tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.date_range_rounded),
                  label: 'K_PLANNING'.tr,
                ),
              ],
            ),
          );
        });
  }

  Set<Widget> pages = {
    HomePage(),
    LooksView(),
    ClothesView(),
    PlanningView(),
  };

  _getCurrentIndex(page) {
    switch (page) {
      case bottomNavigationBarEnum.LookPage:
        return 1;
      case bottomNavigationBarEnum.ClothesPage:
        return 2;
      case bottomNavigationBarEnum.PlanningPage:
        return 3;

      default:
        return 0;
    }
  }
}
