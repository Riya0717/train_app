import 'package:flutter/material.dart';
import 'package:train_app/screens/login_screens/account_Info.dart';
import 'package:train_app/screens/login_screens/permissions_screens/camera.dart';
import 'package:train_app/screens/login_screens/permissions_screens/sound.dart';

import 'screens/login_screens/login.dart';
import 'utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRoute,
      routes:{
        "/": (context) => Login(),
        AppRoutes.loginRoute:(context)=> Login(),
        AppRoutes.allowSound:(context)=> AllowSound(),
        AppRoutes.allowCamera:(context)=> AllowCamera(),
        AppRoutes.accountInfo:(context)=> AccountInfo(),
      }
    );
  }
}
