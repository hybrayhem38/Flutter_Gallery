import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Sayfası"),
      ),
      body: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: new Container(
            color: Colors.blue,
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            child: new Container(
              color: Colors.brown,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                verticalDirection: VerticalDirection.down,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  row_Merhaba(),
                  row_Merhaba(),
                  row_Merhaba(),
                  row_Merhaba()
                ],
              ),
            ),
          )),
    );
  }
}

class txt_Merhaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green.shade400,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      child: new Text(
        "Merhaba",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    );
  }
}

class row_Merhaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.down,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[txt_Merhaba(), txt_Merhaba()],
    );
  }
}
