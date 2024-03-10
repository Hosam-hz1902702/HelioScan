// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:image_picker/image_picker.dart';

Future<void> openCamera() async {
  final imagePicker = ImagePicker();
  final PickedFile? pickedFile =
      await imagePicker.getImage(source: ImageSource.camera);

  if (pickedFile != null) {
    // Do something with the picked image file.
    print("Image path: ${pickedFile.path}");
  } else {
    // User canceled the image picking.
    print("User canceled");
  }
}
