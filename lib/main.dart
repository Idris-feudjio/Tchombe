import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tchombe/core/bidings/home_biding.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/theme_data.dart';
import 'package:tchombe/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'core/controller/translations.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: TchombeColor.statusBarColor, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeViewBinding(),
      translations: TchombeMessage(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Tchombe',
      debugShowCheckedModeBanner: false,
      theme: getTchombeTheme(),
      initialRoute: '/',
      getPages: getPageRoot,
    );
  }
}
