import 'package:flutter/material.dart';
import 'package:train_app/widgets/permission.dart';
import 'package:train_app/utils/routes.dart';

class AllowCamera extends StatelessWidget {
  const AllowCamera({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      onAllowing() {
    Navigator.pushNamed(context, AppRoutes.accountInfo);
  }

  onCancel() {
    Navigator.pushNamed(context, AppRoutes.accountInfo);
  }
    return Permission(
        name:"Camera",description:"Get Access for enabling AR scan",imageSrc:"assets/images/camera.jpg",onAllowing:onAllowing,onCancel:onCancel
    );
  }
}