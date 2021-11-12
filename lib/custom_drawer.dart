import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishara_modules/constants.dart';

///my custom drawer
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assetName,
                    semanticsLabel: "Ishara",
                    height: 100,
                    color: Colors.blue[400],
                  ),
                  const Text(
                    "ishara",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(),
              ListTile(
                leading: const Icon(FontAwesomeIcons.cameraRetro),
                title: const Text("Camera"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.camera_roll),
                title: const Text("Gallery"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.toolbox),
                title: const Text("Settings"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.newspaper),
                title: const Text("User guide"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.shareSquare),
                title: const Text("Share"),
                onTap: () {},
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.wb_sunny),
          ),
        ),
      ),
    );
  }
}
