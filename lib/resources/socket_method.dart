import 'package:flutter/widgets.dart';
import 'package:tec_tac/resources/socket_client.dart';
import 'package:tec_tac/screens/game_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickName) {
    if (nickName.isEmpty) {
      _socketClient.emit('cearteRoom', {
        'nickName': nickName,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
    
  }
}
