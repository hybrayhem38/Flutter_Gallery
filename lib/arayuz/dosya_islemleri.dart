import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class KayitIslemleri {
  //Uygulamanın dosya kayıt yolunu alıyoruz.
  Future<String> get dosyaYolu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

//Dosyamızı oluşturuyoruz
  Future<File> get yerelDosya async {
    final yol = await dosyaYolu;
    return File("$yol/yenidosya.txt");
  }

// Dosya okuma işlemleri
  Future<String> dosyaOku() async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (h) {
      return "Dosya okumada hata oluştu: $h";
    }
  }

  //Dosyaya yazma işlemleri
  Future<File> dosyaYaz(String gelenIcerik) async {
    final dosya = await yerelDosya;
    return dosya.writeAsString("$gelenIcerik");
  }
}

class DosyaIslemleri extends StatefulWidget {
  final KayitIslemleri kayit_islemi;

  const DosyaIslemleri({Key key, this.kayit_islemi}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DosyaState();
}

class DosyaState extends State<DosyaIslemleri> {
  final yaziController = TextEditingController();
  String veri = "";

  Future<File> veriKaydet() async {
    setState(() {
      veri = yaziController.text;
    });
    return widget.kayit_islemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    super.initState();
    // Bu kısım aktif olduğunda sayfa yeni açıldığında veri otomatik okunuyor(?) ve ekrana yazılıyor.
//    widget.kayit_islemi.dosyaOku().then((String deger) {
//      setState(() {
//        veri = deger;
//      });
//    });
  }

  void veriOku() {
    widget.kayit_islemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dosya İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Dosyaya yazılacak veriyi giriniz.",
            ),
            controller: yaziController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () => veriKaydet(),
                    child: Text(
                      "Kaydet",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () => veriOku(),
                    child: Text(
                      "Oku",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Veri: $veri"),
            ),
          ),
        ],
      ),
    );
  }
}
