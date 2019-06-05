import 'package:flutter/material.dart';
import './arayuz/homepage.dart';
import './arayuz/hello.dart';
import './arayuz/scaffold.dart';

void main() {
  runApp(new MaterialApp(
    title: "Scaffold",
    home: ScaffoldOgesi(),
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(primarySwatch: Colors.green),
  ));
}
