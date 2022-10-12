import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tchombe/themes/tchombe_colors.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class CoreFunction {
  /// CUSTOM OPEN SNACKBAR
  static void openSnackBar(String title, message,
      {Color colorText = Colors.white}) {
    Get.snackbar(title, message,
        borderRadius: 0,
        margin: EdgeInsets.all(0),
        backgroundColor: Colors.black,
        colorText: colorText,
        padding: EdgeInsets.all(padding10),
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.BOTTOM);
  }

  /// PICK IMAGE
  static pickImageAt(ImageSource imageSource) async {
    final  pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      return pickedFile.path;
    }
  }
}
