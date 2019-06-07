import 'package:flutter/material.dart';

class ScaffoldOgesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.greenAccent.shade100,
        appBar: new AppBar(
          title: Text('Merhaba appbar'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_play),
              tooltip: 'Air it',
              onPressed: () => Navigator.pushNamed(context, "/flutter_demo"),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add),
              tooltip: 'Restitch it',
              onPressed: () => print("Üst menü: playlist-add"),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add_check),
              tooltip: 'Repair it',
              onPressed: () => print("Üst menü: playlist-add-check"),
            ),
          ],
        ),
        body: Center(
//          child: new Text(
//            "Merhaba Scaffold",
//            textDirection: TextDirection.ltr,
//          ),
            child: GridView.count(
          primary: false,
//          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/flutter_demo"),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/326311/pexels-photo-326311.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=1&w=500"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0)),
//                color: Colors.blue.shade100,
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.skewY(0.0)..rotateZ(0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    color: Color(0xCDFFFFFF),
                    child: Text(
                      "Tek Tıklama \nFluter Demo \nSayfasına Git",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, "/flutter_demo"),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/lake.jpg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0)),
//                color: Colors.blue.shade100,
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.skewY(0.0)..rotateZ(0),
                  child: Container(
//                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    color: Color(0xCDFFFFFF),
                    child: Text(
                      "Tek Tıklama \nFluter Demo \nSayfasına Git",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, "/hello"),
              child: Container(
                color: Colors.blue.shade100,
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: new Text("""Çift Tıklama
              Hello Sayfasına Git""", textAlign: TextAlign.center),
              ),
            ),
            new GestureDetector(
              onLongPress: () => Navigator.pushNamed(context, "/degisenwidget"),
              child: Container(
                color: Colors.blue.shade100,
                margin: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: new Text("""Uzun Tıklama
              Degisen Widget Sayfasına Git""", textAlign: TextAlign.center),
              ),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
            new Container(
              color: Colors.blue.shade100,
              margin: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: new Text("Grid elemanı", textAlign: TextAlign.center),
            ),
          ],
        )),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.account_box),
                title: new Text("Account"),
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.receipt), title: new Text("Receipt")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.settings), title: new Text("Settings"))
            ],
            onTap: (int i) {
              switch (i) {
                case 0:
                  debugPrint("Alt menü: Account");
                  break;
                case 1:
                  debugPrint("Alt menü: Feed");
                  break;
                case 2:
                  debugPrint("Alt menü: Settings");
                  break;
              }
            }),
        drawer: new Drawer(
          child: new ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account"),
            onTap: () {
              Navigator.pop(context);
              debugPrint("Yan menü: Account");
            },
          ),
        ));
  }
}
