import 'package:flutter/material.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';
import 'package:tchombe/utils/tchombe_asset.dart';
import 'package:get/get.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height200,
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image:
                    DecorationImage(image: AssetImage(TchombeAsset.IMG_LOGO))),
          ),
          SizedBox(height: height5),
          Text('K_TITLE'.tr,style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: height10),
          Text('idrisfeudjio@gmail.com',style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}
