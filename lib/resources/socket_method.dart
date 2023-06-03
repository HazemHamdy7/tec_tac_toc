import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tec_tac/provider/room_data_provider.dart';
import 'package:tec_tac/resources/socket_client.dart';
import 'package:tec_tac/screens/game_screen.dart';

import '../utils/utils.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickName) {
    if (nickName.isEmpty) {
      _socketClient.emit('cearteRoom', {
        'nickName': nickName,
      });
    }
  }

  void joinRoom(String nickName, String roomId) {
    if (nickName.isEmpty && roomId.isEmpty) {
      _socketClient.emit('joinRoom', {
        'nickName': nickName,
        'roomId': roomId,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context, data);
    });
  }
}
