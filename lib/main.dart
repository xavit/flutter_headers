import 'package:flutter/material.dart';
import 'package:headers/src/pages/sliver_list_page.dart';
// import 'package:headers/src/pages/emergency_page.dart';
// import 'package:headers/src/pages/pinteres_page.dart';
// import 'package:headers/src/pages/animaciones_page.dart';
// import 'package:headers/src/pages/headers_page.dart';
// import 'package:headers/src/retos/cuadrado_animado_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SliverListPage(),
    );
  }
}
