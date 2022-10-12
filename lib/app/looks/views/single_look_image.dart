import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:tchombe/app/looks/controller/single_look_image_controller.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class SingleLookImage extends StatelessWidget {
  SingleLookImage(this.imageList);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SingleLookImageController _singleLookImageController =
        Get.put(SingleLookImageController());

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth30,
        title: Text('Images'),
      ),
      body: Container(
          height: size.height,
          child: Stack(
            children: [
              Container(child: GetBuilder<SingleLookImageController>(
                builder: (_singleLookImageController) {
                  return PageView.builder(
                      controller: _singleLookImageController.pageController,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: imageList.length,
                      onPageChanged: _singleLookImageController.onPageChange,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: ()=>Get.back(),
                          child: Container(
                            height: size.height * .7,
                            child: PhotoView(
                              imageProvider:
                                  FileImage(File(imageList[index])),
                              filterQuality: FilterQuality.high,
                              basePosition: Alignment.center,
                              enablePanAlways: true,
                              enableRotation: true,
                            ),
                          ),
                        );
                      });
                },
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      imageList.length,
                      (index) => Padding(
                          padding: const EdgeInsets.all(padding5),
                          child: Obx(
                            () => Container(
                              height: height10,
                              width: height10,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(borderRadius50),
                                  color: _singleLookImageController
                                              .currentIndex.value ==
                                          index
                                      ? Colors.white
                                      : Colors.green),
                            ),
                          ))),
                ),
              )
            ],
          )),
    );
  }
}
