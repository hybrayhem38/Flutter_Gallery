import 'package:flutter/material.dart';

class anasayfaCard extends StatelessWidget {
  final String route;
  final String image;
  final bool isAssetImage;
  final String title;
  final bool blackTheme;

//  final Color titleBackgroundColor;
//  final Color textColor;

  anasayfaCard(
      this.route, this.isAssetImage, this.image, this.blackTheme, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, route),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: isAssetImage ? AssetImage(image) : NetworkImage(image),
                  fit: BoxFit.cover),
              shape: BoxShape.rectangle,
//                      borderRadius: BorderRadius.circular(25.0)
            ),
            margin: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            child: Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.skewY(0.0)..rotateZ(0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8.0),
                color: blackTheme ? Colors.black54 : Color(0xCDFFFFFF),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: blackTheme ? Colors.white70 : Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
