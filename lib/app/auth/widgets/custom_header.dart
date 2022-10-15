import 'package:flutter/material.dart';

class CustomHeaderLogo extends StatelessWidget {
  const CustomHeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .3,
      padding: const EdgeInsets.only(top: 40, left: 70, right: 70, bottom: 10),
     /* child: Center(
        widthFactor: .5,
        child: Image.asset(
          TchombeAsset.IMG_LOGO,
        ),
      ),*/
    );
  }
}
