import 'package:flutter/material.dart';
import 'package:train_app/widgets/permission_ui.dart';
import 'package:train_app/utils/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class AllowSound extends StatelessWidget {
  const AllowSound({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

  onAllowing() async{
    var microphoneStatus = await Permission.microphone.status;
      if (!microphoneStatus.isGranted) {
        await Permission.microphone.request();
      }
    Navigator.pushNamed(context, AppRoutes.allowCamera);
  }

  onCancel() {
    Navigator.pushNamed(context, AppRoutes.allowCamera);
  }
    return PermissionUI(
        name: "Microphone",
        description: "Get Access to your mike",
        imageSrc: "assets/images/speaker.png",
        onAllowing: onAllowing,
        onCancel: onCancel
      );
  }
}
