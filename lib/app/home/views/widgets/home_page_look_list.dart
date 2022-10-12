import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/dashboard/views/dashboard_view.dart';
import 'package:tchombe/app/home/views/widgets/custom_card.dart';
import 'package:tchombe/app/looks/controller/look_crud.dart';
import 'package:tchombe/app/looks/views/detail_look_view.dart';
import 'package:tchombe/app/looks/views/looks_page.dart';
import 'package:tchombe/core/bidings/home_biding.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class HomePageLookList extends StatelessWidget {
  final _fetchDisplayAndDeleteLookController =
      Get.find<FetchDisplayAndDeleteLookController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return SliverToBoxAdapter(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text(
                    'K_GENERALLOOK'.tr +
                        ' ' +
                        '(${_fetchDisplayAndDeleteLookController.numberOfLook})',
                    style: TextStyle(
                        fontSize: fontSize20, fontWeight: FontWeight.bold),
                  )),
              IconButton(
                onPressed:
                    () => Get.offNamedUntil(LooksPage.routeName, (_) => true),
                icon: Icon(Icons.queue_play_next_rounded),
              )
            ],
          ),
        ),
        Container(
            height: orientation == Orientation.portrait
                ? size.height * .3
                : size.height * .5,
            child: GetBuilder<FetchDisplayAndDeleteLookController>(
              builder: (lookController) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lookController.listOfLookFetched.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(padding5),
                        child: CustomCard(
                            lookController
                                .listOfLookFetched[index].summary.value!.imageUri,
                            lookController.listOfLookFetched[index].summary.value!
                                .description!, () {
                          Get.toNamed(DetailLookView.routeName,
                              arguments: lookController.listOfLookFetched[index]);
                        }),
                      );
                    });
              },
            )),
      ],
    ));
  }
}
