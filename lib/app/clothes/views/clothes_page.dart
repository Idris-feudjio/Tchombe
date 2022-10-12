import 'package:flutter/material.dart';
import 'package:tchombe/app/clothes/views/clothes_view.dart';

class ClothesPage extends StatelessWidget {

  static final String routeName = '/clothesPage';
  const ClothesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClothesView();
  }
}
