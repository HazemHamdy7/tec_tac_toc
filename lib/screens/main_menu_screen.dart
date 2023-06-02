import 'package:flutter/material.dart';
import 'package:tec_tac/screens/join_room_screen.dart';
import 'package:tec_tac/widgets/custom_button.dart';

import '../responsive/resopnsive.dart';
import 'create_room_screen.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});
  void creatRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(onTap: () => creatRoom(context), text: 'Create Room'),
          const SizedBox(height: 20),
          CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
        ],
      ),
    ));
  }
}
