import 'package:tchombe/app/splash_screen/views/widgets/custom_splash_screen.dart';
import 'package:tchombe/utils/tchombe_asset.dart';
import 'package:get/get.dart';

class SplashScreenModel {
  static List<CustomSplashScreen> list = [
    CustomSplashScreen(
      descriptionScreen: 'K_SPLASHSCREENFIRSTTEXT'.tr,
      imageScreen: TchombeAsset.IMG_FIRST_SPLASH_SCREEN,
    ),
    CustomSplashScreen(
      descriptionScreen: 'K_SPLASHSCREENSECONDTEXT'.tr,
      imageScreen: TchombeAsset.IMG_SECOND_SPLASH_SCREEN,
    ),
    CustomSplashScreen(
      descriptionScreen: 'K_SPLASHSCREENTHIRDTEXT'.tr,
      imageScreen: TchombeAsset.IMG_THIRD_SPLASH_SCREEN,
    ),
  ];
}
