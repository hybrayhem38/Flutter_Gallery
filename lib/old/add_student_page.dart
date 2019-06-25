import 'package:flutter/material.dart';
import 'package:flutter_app/model/student.dart';

class AddStudentPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Student.students.add(Student(name: "New",number: "000",cinsiyet: "Erkek"));
    return Scaffold(
      appBar: AppBar(title: Text("Add new Student"),),
    );
  }

}