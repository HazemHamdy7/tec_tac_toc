import 'package:flutter/material.dart';
import 'package:tec_tac/responsive/resopnsive.dart';
import 'package:tec_tac/widgets/custom_button.dart';
import 'package:tec_tac/widgets/custom_text_filed.dart';

import '../resources/socket_method.dart';
import '../widgets/custom_text.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';

  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadow: [Shadow(blurRadius: 40, color: Colors.blue)],
                text: 'Create Room',
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                  controller: _nameController, hintText: 'Enter your nickname'),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                        _nameController.text,
                      ),
                  text: 'Create')
            ],
          ),
        ),
      ),
    );
  }
}
