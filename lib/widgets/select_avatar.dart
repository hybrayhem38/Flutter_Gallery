import 'package:flutter/material.dart';

//TODO: add setter and getter to cinsiyet

class selectAvatar extends StatefulWidget {
  String cinsiyet;

  selectAvatar(this.cinsiyet);

  @override
  State<StatefulWidget> createState() => selectAvatarState(cinsiyet);
}

class selectAvatarState extends State<selectAvatar> {
  String cinsiyet;

  selectAvatarState(this.cinsiyet);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              cinsiyet = "Erkek";
              debugPrint("cinsiyet: $cinsiyet");
            });
          },
          child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(2),
              color: cinsiyet == "Erkek" ? Colors.lightGreen : Colors.white,
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(2),
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/boy.png",
                    scale: 4,
                  ),
                ),
              ),
            ),
          ),

        ),
        Padding(padding: EdgeInsets.only(left: 40, right: 40, bottom: 10)),
        GestureDetector(
          onTap: () {
            setState(() {
              cinsiyet = "Kadın";
              debugPrint("cinsiyet: $cinsiyet");
            });
          },
          child: ClipOval(
            child: Container(
              padding: EdgeInsets.all(2),
              color: cinsiyet == "Kadın" ? Colors.lightGreen : Colors.white,
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(2),
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/girl.png",
                    scale: 4.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
