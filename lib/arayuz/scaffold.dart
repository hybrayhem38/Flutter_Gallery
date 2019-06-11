import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class ScaffoldOgesi extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // snackbar ile eklendi
  _showSnackBar(String content) {
    debugPrint("Showing snackbar...");
    final snackBar = SnackBar(
      content: new Text(content),
//    duration: Duration(seconds: 3),
//      backgroundColor: Colors.green,
      action: SnackBarAction(
          label: "Tamam",
          onPressed: () {
            debugPrint("Snackbar Tamam butonu");
          }),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _showSnackBar("İnternet bağlantısı var.");
      }
    } on SocketException catch (_) {
      _showSnackBar("İnternet bağlantısı yok.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
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
            IconButton(
              icon: Icon(Icons.network_check),
              tooltip: 'Network Check',
              onPressed: () => checkInternetConnection(),
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
          crossAxisSpacing: 5.0,
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/flutter_demo"),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/326311/pexels-photo-326311.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=1&w=500"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
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
            ),
            Card(
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "Bu ögeye bir kez tıkladınız.",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.black87,
                    textColor: Colors.white,
                  );
                },
                onDoubleTap: () {
                  Fluttertoast.showToast(
                    msg: "Bu ögeye iki kez tıkladınız.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.white70,
                    textColor: Colors.black,
                  );
                },
                onLongPress: () {
                  Fluttertoast.showToast(
                    msg: "Bu ögeye uzun tıkladınız.",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.TOP,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdncontribute.geeksforgeeks.org/wp-content/uploads/Toast.jpg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
//                color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Color(0xCDFFFFFF),
                      child: Text(
                        "Toast Mesajı \nGöster",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/imageviews"),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/lake.jpg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
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
                        "Tek Tıklama \nİmage View \nSayfasına Git",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/alertview"),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://material-design.storage.googleapis.com/publish/material_v_9/0Bzhp5Z4wHba3TzFHYVlrbWF2bnM/components_alerts_1.png"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
//                color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0),
                    child: Container(
//                    width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black54,
                      child: Text(
                        "Tek Tıklama \nAlert View \nSayfasına Git",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, "/shared_preferences"),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjIxxkDI4rx4TGurHV1lPwDBXfO6GSuFvLfWjCJTsOM5VgknkOQg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
//                color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0),
                    child: Container(
//                    width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black54,
                      child: Text(
                        "Tek Tıklama \nShared Preferences \nSayfasına Git",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, "/dosya_islemleri"),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPF7x3QiywfswwxSNXeQe4nT3sO48p-JeV39-dtLLXPFuEDA35"),
                        fit: BoxFit.cover),
                    shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
                  ),
//                color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.skewY(0.0)..rotateZ(0),
                    child: Container(
//                    width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black54,
                      child: Text(
                        "Tek Tıklama \nDosya İşlemleri\nSayfasına Git",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onDoubleTap: () => Navigator.pushNamed(context, "/hello"),
                child: Container(
                  color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Çift Tıklama \nHello \nSayfasına Git",
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            Card(
              child: GestureDetector(
                onLongPress: () =>
                    Navigator.pushNamed(context, "/degisenwidget"),
                child: Container(
                  color: Colors.blue.shade100,
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text(
                      "Uzun Tıklama \nDegisen Widget \nSayfasına Git",
                      textAlign: TextAlign.center),
                ),
              ),
            ),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
            GridElemani(),
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
            child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account"),
            onTap: () {
              Navigator.pop(context);
              debugPrint("Yan menü: Account");
            },
          ),
        )));
  }
}

class GridElemani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.blue.shade100,
        margin: EdgeInsets.all(5.0),
        alignment: Alignment.center,
        child: new Text("Grid elemanı", textAlign: TextAlign.center),
      ),
    );
  }
}
