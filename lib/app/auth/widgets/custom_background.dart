import 'package:flutter/material.dart';
import 'package:tchombe/utils/tchombe_asset.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(TchombeAsset.IMG_BACKGROUND),
              fit: BoxFit.cover),
        ),
        child: child);
  }
}
