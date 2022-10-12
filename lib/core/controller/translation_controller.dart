import 'dart:ui';

import 'package:get/get.dart';

class TranslationController extends GetxController{
  changeLocaleLanguage(Locale locale ){
    Get.updateLocale(locale);
  }
}
