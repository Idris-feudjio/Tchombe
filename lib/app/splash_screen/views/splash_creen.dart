import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tchombe/app/dashboard/views/dashboard_page.dart';
import 'package:tchombe/app/dashboard/views/dashboard_view.dart';
import 'package:tchombe/app/home/views/home_page.dart';
import 'package:tchombe/app/splash_screen/views/widgets/custom_splash_screen.dart';
import 'package:tchombe/app/splash_screen/views/widgets/splash_screen_model.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  final int items = SplashScreenModel.list.length;

  final storageSplashScreen = GetStorage();

  bool isPlashScreen = false;

  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        if (storageSplashScreen.read('isSplashScreen') != null) {
          isPlashScreen = storageSplashScreen.read('isSplashScreen');
        }
        if (isPlashScreen)
          Get.offAll(
            () => DashboardPage(page: bottomNavigationBarEnum.HomePage),
          );
      },
    );

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
                padding: EdgeInsets.all(padding10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(TchombeAsset.IMG_BACKGROUND),
                  ),
                ),
                child: PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  itemCount: items,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CustomSplashScreen(
                      descriptionScreen:
                          SplashScreenModel.list[index].descriptionScreen,
                      imageScreen: SplashScreenModel.list[index].imageScreen,
                    );
                  },
                ),
              ),
        bottomSheet:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: width10),
                  Row(
                    children: List.generate(
                      items,
                      (index) => Container(
                        height: height5,
                        width: currentIndex == index ? 25 : 10,
                        margin: EdgeInsets.all(marginXXXS),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(borderRadiusD),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  currentIndex == items - 1 //storageSplashScreen
                      ? GestureDetector(
                          onTap: () {
                            storageSplashScreen.write('isSplashScreen', true);
                            Get.offAll(DashboardPage(
                                page: bottomNavigationBarEnum.HomePage));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius:
                                  BorderRadius.circular(borderRadiusA),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(padding20),
                              child: Text(
                                'K_START'.tr,
                                style: TextStyle(
                                  color: Colors
                                      .white, //Theme.of(context).buttonColor,
                                  fontSize: fontSize20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _pageController?.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceIn);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(padding20),
                            child: Text(
                              'K_NEXT'.tr,
                              style: TextStyle(
                                fontSize: fontSize18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              )
            );
  }
}
