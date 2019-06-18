import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class jsonDosyaIslemleri {
  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> dosyaOku() async {
    try {
      String data = await getFileData("assets/data/sinif.json");
      return data;
    } catch (h) {
      return "Dosya okumada hata oluştu: $h";
    }
  }
}

class eokul extends StatefulWidget {
  final jsonDosyaIslemleri json_islemi;

  const eokul({Key key, this.json_islemi}) : super(key: key);

  @override
  State<StatefulWidget> createState() => eokulState();
}

class eokulState extends State<eokul> {
  List ogrenci;
  String _text = "initial";
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  Student abdullah = new Student(4654, "Abdullah", "ÖNKOL", "Erkek", true);

  _saveForm() {
    if (GeneralController.currentState.validate()) {
      setState(() {
        this._text = isimController.text + soyisimController.text;
      });
      Navigator.pop(context);
    }
  }

  __showDialog() {
    showDialog(
        child: new Dialog(
          child: new Column(
            children: <Widget>[
              Form(
                key: GeneralController,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        validator: (yazi) {
                          if (yazi.isEmpty) {
                            return "Lütfen bu kısmı boş bırakmayın!";
                          }
                        },
                        controller: isimController,
                        decoration: InputDecoration(
                            hintText: "İsim",
                            hintStyle: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          child: Text(
                            "Ekle",
                          ),
                          onPressed: _saveForm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        context: context);
  }

  _showDialog() {
    showDialog(
      context: context,
      child: new Dialog(
        child: new Column(
          children: <Widget>[
            Form(
              key: GeneralController,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      validator: (yazi) {
                        if (yazi.isEmpty) {
                          return "Lütfen bu kısmı boş bırakmayın!";
                        }
                      },
                      controller: isimController,
                      decoration: InputDecoration(
                          hintText: "İsim", hintStyle: TextStyle(fontSize: 18)),
                    ),
                    TextFormField(
                      validator: (yazi) {
                        if (yazi.isEmpty) {
                          return "Lütfen bu kısmı boş bırakmayın!";
                        }
                      },
                      controller: soyisimController,
                      decoration: InputDecoration(
                          hintText: "Soyisim",
                          hintStyle: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        child: Text(
                          "Ekle",
                        ),
                        onPressed: _saveForm,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    veriOku(abdullah);
    super.initState();
  }

  void veriOku(Student student) {
    widget.json_islemi.dosyaOku().then((String deger) {
      String trimDeger = deger.substring(0,deger.length-1);
      String result = trimDeger + "," +student.toJson().toString() + "]";
      deger = result;
      ogrenci = jsonDecode(deger.toString());
      debugPrint("${ogrenci[6]["isim"]}");
    });
  }

//  var userJson = jsonDecode(deger).toString();
//  String trimmedUserJson = userJson.substring(0,userJson.length-1);
//  var result =trimmedUserJson + abdullah.toJson().toString() + "]";
//  deger = jsonEncode(result);
//  deger = deger[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Okul"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.person_add), onPressed: _showDialog)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/data/sinif.json"),
            builder: (context, cevap) {
              ogrenci = jsonDecode(cevap.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_text),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.0, bottom: 20, top: 15),
                            child: Image.asset(
                              ogrenci[index]["cinsiyet"] == "Erkek"
                                  ? "assets/images/boy.png"
                                  : "assets/images/girl.png",
//                              scale: 3,
                            ),
                            width: 50.0,
                            height: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Öğrencinin adı: ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: "${ogrenci[index]["isim"]}"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Öğrencinin soyadı: ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "${ogrenci[index]["soyisim"]}"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Öğrenci No: ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: "${ogrenci[index]["numara"]}"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Cinsiyeti: ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "${ogrenci[index]["cinsiyet"]}"),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Başarı Durumu: ",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text:
                                          "${ogrenci[index]["basarili"] ? "Başarılı" : "Tembel"}"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: ogrenci == null ? 0 : ogrenci.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Student {
  int numara;
  String isim;
  String soyisim;
  String cinsiyet;
  bool basarili;

  Student(this.numara, this.isim, this.soyisim, this.cinsiyet, this.basarili);

  toJson() {
    return {
      '\"numara\"': '\"$numara\"',
      '\"isim\"': '\"$isim\"',
      '\"soyisim\"' : '\"$soyisim\"',
      '\"cinsiyet\"': '\"$cinsiyet\"',
      '\"basarili\"': '\"$basarili\"'
    };
  }
}
