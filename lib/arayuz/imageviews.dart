import 'package:flutter/material.dart';

class ImageViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Views"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              "Assets Klasöründen Bir Resim ",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Image.asset(
              "assets/images/lake.jpg",
//            alignment: Alignment.topCenter,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              "İnternetten Bir Resim ",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Image.network(
              "https://storage.googleapis.com/material-design/publish/material_v_11/assets/0Bx4BSt6jniD7T0hfM01sSmRyTG8/layout_structure_regions_mobile.png",
//            alignment: Alignment.topCenter,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              "İnternetten Bir Resim (placeholder ile) ",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              placeholderScale: 4,
              image:
                  "https://images.pexels.com/photos/2400547/pexels-photo-2400547.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=650&w=940",
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }
}
