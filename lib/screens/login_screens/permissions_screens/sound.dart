import 'package:flutter/material.dart';
import 'package:train_app/widgets/permission.dart';
import 'package:train_app/utils/routes.dart';


class AllowSound extends StatelessWidget {
  const AllowSound({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

  onAllowing() {
    Navigator.pushNamed(context, AppRoutes.allowCamera);
  }

  onCancel() {
    Navigator.pushNamed(context, AppRoutes.allowCamera);
  }
    return Permission(
        name: "Music",
        description: "Get Access for play sound",
        imageSrc: "assets/images/speaker.png",
        onAllowing: onAllowing,
        onCancel: onCancel
      );
  }
}
