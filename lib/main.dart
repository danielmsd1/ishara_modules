import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishara_modules/app_cubits/theme_toggle_cubit.dart';
import 'package:ishara_modules/camera_home.dart';
import 'package:ishara_modules/homepage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  //Bloc for the homepage theme.
  final themeToggle = ThemeCubit();
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
