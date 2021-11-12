import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ishara_modules/camera_home.dart';
import 'package:ishara_modules/homepage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app.
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(
    HomePage(cameras: cameras),
  );
}
