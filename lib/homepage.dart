import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:ishara_modules/app_cubits/theme_toggle_cubit.dart';
import 'package:ishara_modules/camera_home.dart';
import 'package:ishara_modules/constants.dart';
import 'package:ishara_modules/custom_drawer.dart';
import 'package:ishara_modules/main.dart';

///The stack is defined here.
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  void toggle() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  final double maxSlide = animationDuration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double slide = maxSlide * _animationController.value;
            double scale = 1 - (_animationController.value * 0.3);
            return MaterialApp(
              theme: ThemeData.dark(),
              home: Scaffold(
                body: Stack(
                  children: [
                    const CustomDrawer(),
                    Transform(
                      transform: Matrix4.identity()
                        ..translate(slide)
                        ..scale(scale),
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          //todo!: check the container and configure for permissions and waiting.
                          !controller.value.isInitialized
                              ? Container()
                              : CameraHome(
                                  cameras: cameras,
                                ),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
