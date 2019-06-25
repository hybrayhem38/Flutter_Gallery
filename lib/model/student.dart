class Student {
  String name;
  String number;
  String cinsiyet;

  Student({this.name, this.number, this.cinsiyet});

  static List<Student> students = [
    Student(name: "Halil İbrahim", number: "697", cinsiyet: "Erkek"),
    Student(name: "Esmanur", number: "454", cinsiyet: "Kadın"),
    Student(name: "Mehmet", number: "545", cinsiyet: "Erkek"),
    Student(name: "Hatice", number: "254", cinsiyet: "Kadın"),
    Student(name: "Abdullah", number: "325", cinsiyet: "Erkek"),
    Student(name: "Mustafa", number: "679", cinsiyet: "Erkek"),
    Student(name: "Kevser", number: "105", cinsiyet: "Kadın"),
    Student(name: "Betül", number: "104", cinsiyet: "Kadın"),
    Student(name: "Ahmet", number: "654", cinsiyet: "Erkek"),
    Student(name: "Sümeyye", number: "837", cinsiyet: "Kadın"),
    Student(name: "İbrahim", number: "258", cinsiyet: "Erkek"),
    Student(name: "Asiye", number: "426", cinsiyet: "Kadın"),
    Student(name: "Ayşe", number: "432", cinsiyet: "Kadın"),
  ];
}