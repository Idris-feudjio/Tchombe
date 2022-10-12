import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tchombe/app/home/views/widgets/custom_card.dart';
import 'package:tchombe/app/looks/views/detail_look_view.dart';
import 'package:tchombe/app/planification/controller/planning_card_controller.dart';
import 'package:tchombe/app/planification/controller/planning_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/app/planification/views/planning_view.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class HomePagePlanning extends StatelessWidget {
  PlanningController get planningController => Get.put(PlanningController());

  PlanningCardItemController get _planningCardItemController =>
      Get.put(PlanningCardItemController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    DateTime date =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    String dateFormat = DateFormat('d/MM/yyyy').format(date);
    return SliverToBoxAdapter(
        child: Column(
      children: [
        Obx(() => planningController.getLookOfDay(dateFormat).length != 0
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'K_LOOK_OF_THE_DAY'.tr, //+  ' ' +  '(${planningController.planningLength})',
                          style: TextStyle(
                              fontSize: fontSize20,
                              fontWeight: FontWeight.bold),
                        ),
                    IconButton(
                      onPressed: () => Get.offNamedUntil(
                          PlanningView.routeName, (_) => true),
                      icon: Icon(Icons.queue_play_next_rounded),
                    )
                  ],
                ),
              )
            : Container()),
        Obx(() => planningController.getLookOfDay(dateFormat).length != 0
            ? Container(
                height: orientation == Orientation.portrait
                    ? size.height * .3
                    : size.height * .5,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          planningController.getLookOfDay(dateFormat).length,
                      itemBuilder: (context, index) {
                        PlanningSummary planningSummary =
                            planningController.getLookOfDay(dateFormat)[index];
                        return Padding(
                          padding: const EdgeInsets.all(padding5),
                          child: CustomCard(
                              planningSummary
                                  .summary.value!.lookAssociated.imageUri,
                              planningSummary.summary.value!.date, () {
                            Get.toNamed(DetailLookView.routeName,
                                arguments:
                                    _planningCardItemController.getLookSummary(
                                        planningSummary
                                            .summary.value!.lookAssociated,
                                        1),
                                parameters: {
                                  'date': planningSummary.summary.value!.date
                                });
                          }),
                        );
                      }),
                ),
              )
            : Container()),
      ],
    ));
  }
}
