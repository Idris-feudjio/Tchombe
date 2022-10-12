import 'package:flutter/material.dart';
import 'package:tchombe/utils/tchombe_asset.dart';
import 'package:get/get.dart';

class CustomSplashScreen extends StatelessWidget {
  final String imageScreen;
  final String descriptionScreen;
  CustomSplashScreen({
    required this.imageScreen,
    required this.descriptionScreen,
    backgroundImageScreen,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsetsDirectional.only(top: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              TchombeAsset.IMG_LOGO,
              height: size.height*.25,
            ),
            SizedBox(height: 5),
            Text(
              'K_TITLE'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Theme.of(context).accentColor),
            ),
            SizedBox(height: 5),
            Container(
              height: size.height * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imageScreen),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                descriptionScreen,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 19.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
