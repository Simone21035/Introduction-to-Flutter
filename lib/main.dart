import 'package:flutter/material.dart';
import 'package:flutter_proj1/routes.dart';

import 'package:flutter_proj1/screens/LoginScreen.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: LoginScreen.routeName,
    routes: routes,
    debugShowCheckedModeBanner: false,
  ));
}
