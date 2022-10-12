import 'package:get/get.dart';
import 'package:tchombe/app/clothes/views/clothes_page.dart';
import 'package:tchombe/app/clothes/views/detail_clothes_view.dart';
import 'package:tchombe/app/clothes/views/single_image_page.dart';
import 'package:tchombe/app/dashboard/views/dashboard_page.dart';
import 'package:tchombe/app/dashboard/views/dashboard_view.dart';
import 'package:tchombe/app/home/views/home_page.dart';
import 'package:tchombe/app/looks/views/detail_look_view.dart';
import 'package:tchombe/app/looks/views/looks_page.dart';
import 'package:tchombe/app/planification/views/planning_detail.dart';
import 'package:tchombe/app/planification/views/planning_view.dart';
import 'package:tchombe/app/splash_screen/views/splash_creen.dart';
import 'package:tchombe/core/bidings/home_biding.dart';

final List<GetPage<dynamic>> getPageRoot = [
  GetPage(name: "/", page: () => SplashScreen()),
  GetPage(
    name: HomePage.rootName,
    page: () => DashboardPage(page: bottomNavigationBarEnum.HomePage),
    binding: HomeViewBinding(),
  ),
  GetPage(
      name: LooksPage.routeName,
      page: () => DashboardPage(page: bottomNavigationBarEnum.LookPage),
      binding: HomeViewBinding()),
  GetPage(
    name: ClothesPage.routeName,
    page: () => DashboardPage(page: bottomNavigationBarEnum.ClothesPage),
    binding: HomeViewBinding(),
  ),
  GetPage(
    name: DetailClothesView.routeName,
    page: () => DetailClothesView(),
  ),
  GetPage(name: DetailLookView.routeName, page: () => DetailLookView()),
  GetPage(
    name: SingleImagePage.routeName,
    page: () => SingleImagePage(),
  ),
  GetPage(
    name: PlanningView.routeName,
    page: () => DashboardPage(page: bottomNavigationBarEnum.PlanningPage),
  ),
  GetPage(
    name: PlanningDetail.routeName,
    page: () => PlanningDetail(),
  ),
];
