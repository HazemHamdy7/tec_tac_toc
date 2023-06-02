import 'package:flutter/material.dart';
import 'package:tec_tac/widgets/custom_button.dart';

import '../responsive/resopnsive.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () {}, text: 'Create Room'),
          const SizedBox(height: 20),
          CustomButton(onTap: () {}, text: 'Join Room'),
        ],
      ),
    ));
  }
}
