import 'package:flutter/material.dart';

class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() => new _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  String _text = "initial";

  final textController = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  _saveForm() {
    if (GeneralController.currentState.validate()) {
      setState(() {
        this._text = textController.text;
      });
      Navigator.pop(context);
    }
  }

  _showDialog() {
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
                        controller: textController,
                        decoration: InputDecoration(
                            hintText: "İsim",
                            hintStyle: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          child: Text(
                            "Selamla",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          onPressed: _saveForm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
//                      new TextField(
//                        decoration: new InputDecoration(hintText: "Update Info"),
//                        controller: _c,
//
//                      ),
//                      new FlatButton(
//                        child: new Text("Save"),
//                        onPressed: (){
//                          setState((){
//                            this._text = _c.text;
//                          });
//                          Navigator.pop(context);
//                        },
//                      )
            ],
          ),
        ),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Form dialog"),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(_text),
          new RaisedButton(
            onPressed: _showDialog,
            child: new Text("Show Dialog"),
          )
        ],
      )),
    );
  }
}
/**
    import 'package:flutter/material.dart';

    class TextFieldAlertDialog extends StatelessWidget {
    TextEditingController _textFieldController = TextEditingController();

    _displayDialog(BuildContext context) async {
    return showDialog(
    context: context,
    builder: (context) {
    return AlertDialog(
    title: Text('TextField in Dialog'),
    content: TextField(
    controller: _textFieldController,
    decoration: InputDecoration(hintText: "TextField in Dialog"),
    ),
    actions: <Widget>[
    new FlatButton(
    child: new Text('CANCEL'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    )
    ],
    );
    });
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text('TextField in AlertDialog'),
    ),
    body: Center(
    child: RaisedButton(
    child: Text('Show Alert Dialog'),
    color: Colors.red,
    onPressed: () => _displayDialog(context),
    ),
    ),
    );
    }
    }
 */
