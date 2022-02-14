import 'package:flutter/material.dart';
import 'package:uis_project/app_theme.dart';
import 'package:uis_project/screens/instagram_profile_clone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      home: InstagramProfileClone(),
    );
  }
}
