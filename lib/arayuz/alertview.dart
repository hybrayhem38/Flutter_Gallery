import 'package:flutter/material.dart';

class AlertViewOgesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlertState();
}

class AlertState extends State {
  final textController = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void selamla() {
    if (GeneralController.currentState.validate()) {
      showDialog(context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: Text("Selamlama Metni"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Merhaba ${textController.text}"),
                    Text("Bu bir AlertDialog")
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("Tamam"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertView ve TextField"),
      ),
      body: Form(
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
                controller: textController,
                decoration: InputDecoration(
                    hintText: "İsim", hintStyle: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text(
                    "Selamla",
                    style: TextStyle(color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    selamla();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
