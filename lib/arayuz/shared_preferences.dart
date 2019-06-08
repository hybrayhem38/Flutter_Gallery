import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Shared_State();
}

class Shared_State extends State<Shared_Preferences> {
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  String isimStr = "";
  String soyisimStr = "";
  bool kayitDurumu = false;
  String kayitDurumuStr = "";
  int kayitNumarasi = 0;

  @override
  void dispose() {
    isimController.dispose();
    soyisimController.dispose();
    super.dispose();
  }

  void kaydet(String gelenIsim, String gelenSoyisim) async {
    final kayitAraci = await SharedPreferences.getInstance();
    if (GeneralController.currentState.validate()) {
      kayitAraci.setBool("durum", true);
      kayitAraci.setInt("kayit_numarasi", 1);
      kayitAraci.setString("isim", gelenIsim);
      kayitAraci.setString("soyisim", gelenSoyisim);
      Fluttertoast.showToast(
          msg: "Kayıt başarılı bir şekilde gerçekleşti",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM);
    }
  }

  void kayitlari_listele() async {
    final kayitAraci = await SharedPreferences.getInstance();

    bool kayitlininDurumu = kayitAraci.getBool("durum");
    int kayitlininNumarasi = kayitAraci.getInt("kayit_numarasi");
    String kayitliIsim = kayitAraci.getString("isim");
    String kayitliSoyisim = kayitAraci.getString("soyisim");

    setState(() {
      isimStr = kayitliIsim ?? "Yok";
      soyisimStr = kayitliSoyisim ?? "Yok";
      kayitDurumu = kayitlininDurumu ?? false;
      kayitNumarasi = kayitlininNumarasi ?? 0;
    });
    Fluttertoast.showToast(
        msg: "Kayıt başarılı bir şekilde listelendi",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  void kaydi_sil() async {
    final kayitAraci = await SharedPreferences.getInstance();
//    kayitAraci.clear();
    kayitAraci.remove("durum");
    kayitAraci.remove("kayit_numarasi");
    kayitAraci.remove("isim");
    kayitAraci.remove("soyisim");

//    setState(() {
//      kayitDurumu = kayitAraci.getBool("durum");
//      kayitNumarasi = kayitAraci.getInt("kayit_numarasi");
//      isimStr = kayitAraci.getString("isim");
//      soyisimStr = kayitAraci.getString("soyisim");
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Form(
        key: GeneralController,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Lütfen isminizi yazın!";
                  }
                },
                controller: isimController,
                decoration: InputDecoration(
                  hintText: "İsim",
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Lütfen Soyisminizi yazın!";
                  }
                },
                controller: soyisimController,
                decoration: InputDecoration(
                  hintText: "Soyisim",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Kayıt",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => kaydet(
                              isimController.text, soyisimController.text)),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Kayıtları Listele",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => kayitlari_listele(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.red,
                        child: Text(
                          "Sil",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => kaydi_sil(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("İsim: $isimStr"),
                      Text("Soyisim: $soyisimStr"),
                      Text("Kayıt Durumu: ${kayitDurumu ? "Kayıtlı": "Kayıtlı Değil"}"),
                      Text("Kayıt Numarası: $kayitNumarasi"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
