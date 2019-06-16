import 'dart:convert';

import 'package:flutter/material.dart';

class localJsonIslemleri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => localJsonState();
}

class localJsonState extends State<localJsonIslemleri> {
  List ogrenci;

  String _text = "initial";
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  _saveForm() {
    if (GeneralController.currentState.validate()) {
      setState(() {
        this._text = isimController.text+soyisimController.text;
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
  _showDialog(){
    showDialog(context: context,child: new Dialog(
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
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lokal Json İşlemleri"),
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
                            margin: EdgeInsets.only(left: 20.0, bottom: 20,top: 15),
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
