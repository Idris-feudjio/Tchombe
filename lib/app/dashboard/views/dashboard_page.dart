import 'package:flutter/material.dart';
import 'package:tchombe/app/dashboard/views/dashboard_view.dart';

class DashboardPage extends StatelessWidget {
  final bottomNavigationBarEnum page;
  static final String routeName = '/DashboardPage';
  const DashboardPage({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardView(
      page: page,
    );
  }
}
