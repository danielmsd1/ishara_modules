import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishara_modules/app_cubits/ishara_toggle_cubit.dart';
import 'package:ishara_modules/app_cubits/theme_toggle_cubit.dart';
import 'package:ishara_modules/app_cubits/voice_toggle_cubit.dart';
import 'package:ishara_modules/constants.dart';

///my custom drawer
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initialization of the cubits and blocs.
    var isharaToggle = IsharaCubit();
    var voiceToggle = VoiceCubit();
    var themeToggle = ThemeCubit();
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
              StreamBuilder<bool>(
                  initialData: true,
                  stream: isharaToggle.stream,
                  builder: (context, snapshot) {
                    return ListTile(
                      leading: Switch(
                        value: snapshot.data!,
                        onChanged: (val) => isharaToggle.changeValue(),
                      ),
                      title: const Text("Gesture Detection"),
                    );
                  }),
              StreamBuilder<bool>(
                  initialData: true,
                  stream: voiceToggle.stream,
                  builder: (context, snapshot) {
                    return ListTile(
                      leading: Switch(
                        value: snapshot.data!,
                        onChanged: (val) => voiceToggle.changeValue(),
                      ),
                      title: const Text("Voice Feedback"),
                    );
                  }),
              StreamBuilder<bool>(
                  initialData: false,
                  stream: themeToggle.stream,
                  builder: (context, snapshot) {
                    return ListTile(
                      leading: Switch(
                        value: snapshot.data!,
                        onChanged: (val) => themeToggle.changeValue(),
                      ),
                      title: const Text("Dark Theme"),
                    );
                  }),
              ListTile(
                leading: const Icon(Icons.camera_roll),
                title: const Text("Gallery"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.questionCircle),
                title: const Text("Help"),
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
