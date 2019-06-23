import 'dart:convert';

import 'package:flutter/material.dart';

class localJsonIslemleri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => localJsonState();
}

class localJsonState extends State<localJsonIslemleri> {
  List ogrenci;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lokal Json İşlemleri"),
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
