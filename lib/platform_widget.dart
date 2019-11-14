import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformWidget<I extends Widget, A extends Widget> extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    // TODO: implement build

     if (Platform.isAndroid ) {
        return androidWidget(context);
     }else if (Platform.isIOS) {
        return iosWidget(context);
     }
     return new Container();
  }

  //Create IOS Specific UI
  I iosWidget(BuildContext context);

   //Create Android Specific UI
  A androidWidget(BuildContext context);

  static EdgeInsets platformScrollOffset() {
      return Platform.isAndroid ? EdgeInsets.fromLTRB(0, 90, 0, 0) : EdgeInsets.fromLTRB(0, 110, 0, 80);

  }
}