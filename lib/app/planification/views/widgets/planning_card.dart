import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchombe/app/planification/controller/planning_card_controller.dart';
import 'package:tchombe/app/planification/models/planning.dart';
import 'package:tchombe/app/planification/views/widgets/planning_card_item.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class ContentTimelinePlanning extends StatelessWidget {
  PlanningCardItemController get _planningCardItemController =>
      Get.put(PlanningCardItemController());

  ContentTimelinePlanning({
    required this.date,
    required this.imageList,
    required this.planningSummary,
    required this.planningDateHasPassed,
  });

  final String date;
  final List<String> imageList;
  final List<PlanningSummary> planningSummary;
  final bool planningDateHasPassed;

  @override
  Widget build(BuildContext context) {
    double shiftSet = 0;
    return Padding(
      padding: const EdgeInsets.all(padding8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageList.length > 1
                  ? Container(
                      width: 35* double.parse(imageList.length.toString()),
                      height: height43,
                      child: Stack(
                        children: imageList.map((String currentImage) {
                          if (imageList[0] == currentImage) {
                            shiftSet = 0;
                          } else {
                            shiftSet += 20;
                          }
                          return Positioned(
                              left: shiftSet,
                              child: planningDateHasPassed
                                  ? buildCircleAvatarWithBorder(
                                      currentImage, TchombeColor.K_green)
                                  : buildCircleAvatarWithBorder(
                                      currentImage, TchombeColor.K_red));
                        }).toList(),
                      ))
                  : planningDateHasPassed
                      ? buildCircleAvatarWithBorder(
                          imageList[0], TchombeColor.K_green)
                      : buildCircleAvatarWithBorder(
                          imageList[0], TchombeColor.K_red),
              SizedBox(width: width10),
              Text(
                date,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: !planningDateHasPassed
                        ? TextDecoration.lineThrough
                        : null),
              ),
              Expanded(child: Container())
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: padding20),
            child: Row(
              children: [
                CustomHeightTimeline(),
                SizedBox(width: width10),
                Expanded(
                  child: Container(
                    height: height200,
                    child: ListView.builder(
                        itemCount: planningSummary.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          PlanningSummary planning = planningSummary[index];
                          return Padding(
                            padding: const EdgeInsets.all(padding8),
                            child: PlanningCardItem(
                              onLongPress: () => _planningCardItemController
                                  .getListOfLook(planning),
                              planningSummary: planning,
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  CircleAvatar buildCircleAvatarWithBorder(String currentImage, Color color) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: color,
      child: CircleAvatar(backgroundImage: FileImage(File(currentImage))),
    );
  }

  CircleAvatar buildCircleAvatar(String currentImage) {
    return CircleAvatar(backgroundImage: FileImage(File(currentImage)));
  }
}

class CustomHeightTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width2,
      height: height200,
      color: Colors.grey,
    );
  }
}
