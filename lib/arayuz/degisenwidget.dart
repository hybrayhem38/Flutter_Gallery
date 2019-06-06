import 'package:flutter/material.dart';
/*
class DegisenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateful Widget Alıştırma",
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Anasayfa(),
    );
  }
}
*/
class Anasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => State_Anasayfa();
}

class State_Anasayfa extends State<Anasayfa> {
  int i = 0;

  void sayiyiArtir() {
    setState(() {
      i++;
    });
  }

  void sayiyiAzalt() {
    setState(() {
      i--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Değişen Widget")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                /*child: Text("Artır"),*/
                icon: Icon(Icons.keyboard_arrow_up),
                iconSize: 50,
                onPressed: sayiyiArtir),
            Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "Sayı: $i",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontSize: 20,
                      color: i >= 0 ? Colors.green : Colors.red
                  ),
                )),
            IconButton(
                /*child: Text("Artır"),*/
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 50,
                onPressed: sayiyiAzalt),
          ],
        ),
      ),
    );
  }
}
