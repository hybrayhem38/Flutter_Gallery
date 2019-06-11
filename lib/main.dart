import 'package:flutter/material.dart';
import './arayuz/flutter_demo.dart';
import './arayuz/hello.dart';
import './arayuz/scaffold.dart';
import './arayuz/degisenwidget.dart';
import './arayuz/imageviews.dart';
import './arayuz/alertview.dart';
import 'arayuz/dosya_islemleri.dart';
import 'arayuz/shared_preferences.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => ScaffoldOgesi(),
      "/flutter_demo": (context) => MyHomePage(title: "Flutter Demo",),
      "/hello": (context) => Hello(),
      "/degisenwidget": (context) => Anasayfa(),
      "/imageviews": (context) => ImageViews(),
      "/alertview": (context) => AlertViewOgesi(),
      "/shared_preferences": (context) => Shared_Preferences(),
      "/dosya_islemleri": (context) => DosyaIslemleri(kayit_islemi: KayitIslemleri(),),
    }
//    title: "Scaffold",
//    debugShowCheckedModeBanner: false,
//    theme: new ThemeData(primarySwatch: Colors.blue),
  ));
}
