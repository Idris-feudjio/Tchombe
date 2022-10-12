import 'package:flutter/material.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(TchombeAsset.IMG_BACKGROUND_APP2),
          fit: BoxFit.fill
        ),
      ),
      child: child,
    );
  }
}
