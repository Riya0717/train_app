import 'package:flutter/material.dart';
import 'package:train_app/widgets/permission_ui.dart';
import 'package:train_app/utils/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class AllowCamera extends StatelessWidget {
  const AllowCamera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onAllowing() async {
      var cameraStatus = await Permission.camera.status;
      if (!cameraStatus.isGranted) {
        await Permission.camera.request();
      }
      Navigator.pushNamed(context, AppRoutes.accountInfo);
    }

    onCancel() {
      Navigator.pushNamed(context, AppRoutes.accountInfo);
    }

    return PermissionUI(
        name: "Camera",
        description: "Get Access for enabling AR scan",
        imageSrc: "assets/images/camera.jpg",
        onAllowing: onAllowing,
        onCancel: onCancel);
  }
}
