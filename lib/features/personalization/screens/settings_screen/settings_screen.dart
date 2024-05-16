import 'package:e_commerce/common/widget/clip_path_container_widget.dart';
import 'package:e_commerce/features/personalization/screens/settings_screen/widget/settings_screen_body_widget.dart';
import 'package:e_commerce/features/personalization/screens/settings_screen/widget/settings_screen_header_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPathContainerWidget(child: SettingsScreenHeaderWidget()),
            SettingsScreenBodyWidget()
          ],
        ),
      ),
    );
  }
}
