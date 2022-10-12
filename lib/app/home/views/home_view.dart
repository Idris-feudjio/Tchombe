import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/home/views/widgets/drawer.dart';
import 'package:tchombe/app/home/views/widgets/home_page_clothes_list.dart';
import 'package:tchombe/app/home/views/widgets/home_page_look_list.dart';
import 'package:tchombe/app/home/views/widgets/home_page_planning.dart';
import 'package:tchombe/app/home/views/widgets/summary_number_of_clothes.dart';
import 'package:tchombe/core/widgets/background/custom_background_image.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: leadingWidth30,
          title: Text(
            'K_HOME'.tr,
            style: Theme
                .of(context)
                .appBarTheme
                .titleTextStyle,
          ),
        ),
        body: CustomBackgroundImage(
            child: CustomScrollView(
                slivers: [

                SummaryNumberOfClothesByType(),
            // HomePageHeader(),
            HomePagePlanning(),
            HomePageLookList(),
            HomepageClothesList(),

      ],
    )),
    drawer: MainDrawer(),
    );
    }
}
