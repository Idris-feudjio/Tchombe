import 'package:flutter/material.dart';
import 'package:tchombe/app/looks/views/looks_view.dart';

class LooksPage extends StatelessWidget {
  static final String routeName = '/LooksPage';
  const LooksPage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return LooksView();
  }
}
