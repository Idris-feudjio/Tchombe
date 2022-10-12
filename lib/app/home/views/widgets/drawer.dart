import 'package:flutter/material.dart';
import 'package:tchombe/app/home/views/widgets/drawer_header.dart';
import 'package:tchombe/app/home/views/widgets/drawer_list.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyDrawerHeader(),
            DrawerList(),
          ],
        ),
      ),
    );
  }
}
