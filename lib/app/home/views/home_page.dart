import 'package:flutter/material.dart';
import 'package:tchombe/app/home/views/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String rootName = '/homePage';

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
