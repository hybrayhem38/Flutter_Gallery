import 'package:flutter/material.dart';
import 'package:flutter_app/model/student.dart';
import 'package:flutter_app/widgets/select_avatar.dart';

class eSchool extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => eSchoolState();
}

class eSchoolState extends State<eSchool> {
  final List<Student> students = Student.students;
  final ctrlName = TextEditingController();
  final ctrlNumber = TextEditingController();
  final GeneralController = GlobalKey<FormState>();

  String cinsiyet;

  _saveForm() {
    if (GeneralController.currentState.validate()) {
      setState(() {
        debugPrint("kaydediliyor: $cinsiyet");
        Student.students.add(Student(
            name: ctrlName.text, number: ctrlNumber.text, cinsiyet: cinsiyet));
        ctrlName.clear();
        ctrlNumber.clear();
      });
      Navigator.pop(context);
    }
  }

  _showDialog() {
    showDialog(
      context: context,
      child: new Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Form(
              key: GeneralController,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Cinsiyet seçiniz:",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    selectAvatar(cinsiyet),
                    TextFormField(
                      validator: (yazi) {
                        if (yazi.isEmpty) {
                          return "Lütfen bu kısmı boş bırakmayın!";
                        }
                      },
                      controller: ctrlName,
                      decoration: InputDecoration(
                          hintText: "İsim", hintStyle: TextStyle(fontSize: 18)),
                    ),
                    TextFormField(
                      validator: (yazi) {
                        if (yazi.isEmpty) {
                          return "Lütfen bu kısmı boş bırakmayın!";
                        }
                      },
                      controller: ctrlNumber,
                      decoration: InputDecoration(
                          hintText: "Okul No",
                          hintStyle: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Colors.blueAccent,
                        child: Text(
                          "Ekle",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        onPressed: _saveForm,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-School"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
      body: Card(
        child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              students[index].cinsiyet == "Erkek"
                                  ? "assets/images/boy.png"
                                  : "assets/images/girl.png",
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Öğrencinin adı: ",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: "${students[index].name}"),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Öğrencinin numarası: ",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: "${students[index].number}"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.deepPurple,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
