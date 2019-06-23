import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/anasayfa_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class ScaffoldOgesi extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // snackbar için eklendi

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
        backgroundColor: Colors.blueGrey,
        appBar: new AppBar(
          backgroundColor: Colors.blue.shade700,
          title: Text(
            'Flutter Galeri',
            textScaleFactor: 1.2,
            style: TextStyle(fontFamily: "Roboto"),
          ),
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
//            IconButton(
//              icon: Icon(Icons.playlist_add_check),
//              tooltip: 'Repair it',
//              onPressed: () => print("Üst menü: playlist-add-check"),
//            ),
            IconButton(
              icon: Icon(Icons.network_check),
              tooltip: 'Network Check',
              onPressed: () => checkInternetConnection(),
            ),
          ],
        ),
        body: Center(
            child: GridView.count(
          primary: false,
          crossAxisSpacing: 5.0,
          crossAxisCount: 2,
          children: <Widget>[
            anasayfaCard(
              "/flutter_demo",
              false,
              "https://images.pexels.com/photos/326311/pexels-photo-326311.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=1&w=500",
              false,
              "Fluter Demo \nSayfasına Git",
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                child: GestureDetector(
                  onTap: () {
                    debugPrint("toast tek tıklama");
                    Fluttertoast.showToast(
                      msg: "Bu ögeye bir kez tıkladınız.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.black87,
                      textColor: Colors.white,
                    );
                  },
                  onDoubleTap: () {
                    debugPrint("toast çift tıklama");
                    Fluttertoast.showToast(
                      msg: "Bu ögeye iki kez tıkladınız.",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.white70,
                      textColor: Colors.black,
                    );
                  },
                  onLongPress: () {
                    debugPrint("toast uzun tıklama");
                    Fluttertoast.showToast(
                      msg: "Bu ögeye uzun tıkladınız.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  },
//                child: anasayfaCard("/", false, "https://cdncontribute.geeksforgeeks.org/wp-content/uploads/Toast.jpg", false, "Toast Mesajı \nGöster"),
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
            ), // Toast Sayfası
            anasayfaCard(
              "",
              true,
              "assets/images/database.png",
              false,
              "Sqlite İşlemleri \nSayfasına Git",
            ),
            anasayfaCard(
              "/imageviews",
              true,
              "assets/images/lake.jpg",
              false,
              "İmage View \nSayfasına Git",
            ),
            anasayfaCard(
              "/form_dialog",
              false,
              "https://flutterawesome.com/content/images/2019/02/flutter_moneytextfieldform.jpg",
              false,
              "Form Dialog \nSayfasına Git",
            ),
            anasayfaCard(
                "/alertview",
                false,
                "https://material-design.storage.googleapis.com/publish/material_v_9/0Bzhp5Z4wHba3TzFHYVlrbWF2bnM/components_alerts_1.png",
                true,
                "Alert View \nSayfasına Git"),
            anasayfaCard(
                "/shared_preferences",
                true,
                "assets/images/ram.png",
                true,
                "Shared Preferences \nSayfasına Git"),
            anasayfaCard(
                "/dosya_islemleri",
                false,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPF7x3QiywfswwxSNXeQe4nT3sO48p-JeV39-dtLLXPFuEDA35",
                true,
                "Dosya İşlemleri\nSayfasına Git"),
            anasayfaCard(
                "/json_islemleri",
                false,
                "https://www.openautomationsoftware.com/wp-content/uploads/2016/07/JSON-icon-2.jpg",
                true,
                "Json İşlemleri\nSayfasına Git"),
            anasayfaCard(
                "/localJson_islemleri",
                true,
                "assets/images/json.png",
                true,
                "Yerel Json İşlemleri\nSayfasına Git"
            ),
            anasayfaCard(
                "/basithttp",
                false,
                "https://previews.123rf.com/images/rastudio/rastudio1708/rastudio170808997/84743505-http-vector-line-icon-isolated-on-white-background-http-line-icon-for-infographic-website-or-app-blu.jpg",
                true,
                "Http İşlemleri\nSayfasına Git"),
            anasayfaCard(
                "/flashlight",
                false,
                "https://img.icons8.com/cotton/2x/flash-light.png",
                true,
                "El Feneri\nSayfasına Git"),
            GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, "/hello"),
              child: anasayfaCard(
                  null,
                  false,
                  "https://flutter.dev/assets/ui/layout/margin-padding-border-9616dd0d7af45b95e6fcface25cd933b6b4a0fda51c1ab1bb9287bc8ed92c356.png",
                  true,
                  "Hello \nSayfasına Git\n(Çift Tıklama)"),
            ),
            GestureDetector(
              onLongPress: () => Navigator.pushNamed(context, "/degisenwidget"),
              child: anasayfaCard(
                  null,
                  false,
                  "https://10clouds.com/wp-content/uploads/2017/12/flutter-feature.png",
                  true,
                  "Degisen Widget \nSayfasına Git\n(Uzun Tıklama)"),
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
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  textScaleFactor: 3,
                  style: TextStyle(fontFamily: "Teko"),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.indigo[800],
                      Colors.indigo[700],
                      Colors.indigo[600],
                      Colors.indigo[400],
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Account"),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint("Yan menü: Account");
                },
              ),
              ListTile(
                leading: Icon(Icons.change_history),
                title: Text("Change History"),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint("Yan menü: Change History");
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  debugPrint("Yan menü: Settings");
                },
              ),
            ],
          ),
        ));
  }
}

class GridElemani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.indigo,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/placeholder.png"),
                fit: BoxFit.cover),
            shape: BoxShape.rectangle,
          ),
          margin: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Text("Resim Yok", textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
