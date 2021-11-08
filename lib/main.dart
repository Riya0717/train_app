import 'package:flutter/material.dart';

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
      initialRoute: Routes.loginRoute,
      routes:{
        "/": (context) => Login(),
        Routes.loginRoute:(context)=> Login(),
        Routes.allowSound:(context)=> Login(),
      }
    );
  }
}
