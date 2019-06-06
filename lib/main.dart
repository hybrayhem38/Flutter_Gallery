import 'package:flutter/material.dart';
import './arayuz/flutter_demo.dart';
import './arayuz/hello.dart';
import './arayuz/scaffold.dart';
import './arayuz/degisenwidget.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => ScaffoldOgesi(),
      "/flutter_demo": (context) => MyHomePage(title: "Flutter Demo",),
      "/hello": (context) => Hello(),
      "/degisenwidget": (context) => Anasayfa(),
    }
//    title: "Scaffold",
//    debugShowCheckedModeBanner: false,
//    theme: new ThemeData(primarySwatch: Colors.blue),
  ));
}
