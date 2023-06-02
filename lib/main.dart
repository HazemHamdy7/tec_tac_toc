import 'package:flutter/material.dart';
import 'package:tec_tac/screens/create_room_screen.dart';
import 'package:tec_tac/screens/game_screen.dart';
import 'package:tec_tac/screens/join_room_screen.dart';
import 'package:tec_tac/utils/colors_app.dart';

import 'screens/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
              //  useMaterial3: true,
              )
          .copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        MainMenuScreen.routeName: (context) => const MainMenuScreen(),
        JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
        CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
        GameScreen.routeName: (context) => const GameScreen(),
      },
      initialRoute: MainMenuScreen.routeName,
    );
  }
}
