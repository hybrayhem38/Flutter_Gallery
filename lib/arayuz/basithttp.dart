import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class basitHttp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HttpState();
}

class HttpState extends State<basitHttp> {
  var veri = " ";

  getIslemiYap() {
    http.get("https://jsonplaceholder.typicode.com/posts/1").then((cevap) {
      print(cevap.statusCode);
      print(cevap.body.length);
      setState(() {
        veri = cevap.body;
      });
    });
  }

  postIslemiYap() {
    http.post("https://jsonplaceholder.typicode.com/posts", body: {
      "title:": "Posted from Flutter app from Türkiye",
      "body":
          "Flutter is good but its running/coding style very different from native android dev. with java for me.",
      "userId": "38",
      "id":"383838"
    }).then((cevap){
      print(cevap.statusCode);
      print(cevap.body.length);
      setState(() {
        veri = cevap.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Basit Http İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  color: Colors.amber,
                  child: Text(
                    "GET",
                    style: TextStyle(color: Colors.blueGrey.shade700),
                  ),
                  onPressed: getIslemiYap,
                ),
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text(
                    "POST",
                    style: TextStyle(color: Colors.amber.shade300),
                  ),
                  onPressed: postIslemiYap,
                ),
              ),
            ],
          ),
          Expanded(
              child: Center(
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Gelen Veri: \n",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("$veri",style: TextStyle(fontSize: 16),)
                ],
              ),
            )),
          )),
        ],
      ),
    );
  }
}
