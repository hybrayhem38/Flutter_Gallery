import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class FlashLight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FlashLightState();
}

class FlashLightState extends State<StatefulWidget> {
  bool lightOn = false;
  bool deviceHasLight = false;
  bool isSliderDivided = true;

  double lightIntensity = 1.0;

  @override
  void initState() {
    super.initState();
    setupLight();
  }
  @override
  void dispose() {
    Lamp.turnOff();
    super.dispose();
  }


  requestPermission() async {
    debugPrint("Kamera izni isteniyor...");
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
  }

  setupLight() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(
            PermissionGroup.camera); // camera permission checking
    permission == PermissionStatus.granted
        ? debugPrint("Kamera izni verilmiş.")
        : requestPermission();

    bool _deviceHasLight = await Lamp.hasLamp;
    setState(() {
      _deviceHasLight = deviceHasLight;
    });
    debugPrint("setupLight");
  }

  Future switchLight() async {
    lightOn ? Lamp.turnOff() : Lamp.turnOn(intensity: lightIntensity);
    var v = await Lamp.hasLamp;
    setState(() {
      deviceHasLight = v;
      lightOn = !lightOn;
    });
    debugPrint(lightOn ? "Işık açıldı" : "Işık kapandı.");
  }

  switchSlider() {
    setState(() {
      isSliderDivided = !isSliderDivided;
    });
    debugPrint("Slider style değiştirildi.");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey.withAlpha(60),
        appBar: AppBar(
          title: Text("El Feneri"),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Opacity(
                  opacity: lightIntensity,
                  child: AnimatedCrossFade(
                      firstChild: Image.asset("assets/images/fire.gif"),
                      secondChild: Image.asset("assets/images/transparent.png"),
                      crossFadeState: lightOn
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 800)),
                ),
                GestureDetector(
                  onTap: switchLight,
                  child: Container(
                      child: Image.asset(
                    "assets/images/torch.png",
                    scale: 1.7,
                  )),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                ),
                Slider(
                  value: lightIntensity,
                  onChanged: lightOn ? _changeIntensity : null,
                  //TODO: when function is _changeIntensity(lightIntensity), slider goes inactive
                  inactiveColor: Colors.red.withOpacity(0.5),
                  activeColor: Colors.amber,
                  min: 0,
                  max: 1.0,
                  divisions: isSliderDivided ? 5 : 100,
                  label: "%${(lightIntensity * 100).toInt()}",
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: isSliderDivided,
                  onChanged: (isSliderDivided) => switchSlider(),
                  activeColor: Colors.deepPurple.withAlpha(150),
                  checkColor: Colors.white70,
                ),
                Text(
                  "${isSliderDivided ? "Slider style: Divided" : "Slider style: Continuous"}",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ],
            ),
          ],
        ));
  }

  _changeIntensity(
    double intensity,
  ) {
//    Lamp.turnOn(intensity: intensity);    // Hata: flutter W/CameraInjector( 8171): setParametersEx: Lost camera info android.hardware.Camera@354990b
    debugPrint("Işık parlaklığı değiştirildi: $intensity.");
    setState(() {
      lightIntensity = intensity;
    });
  }
}
