import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palace_amusement/platform_widget.dart';

import 'styleguide/text_styles.dart';
import 'styleguide/colors.dart';

class PlatformButton extends PlatformWidget<CupertinoButton, IconButton> {

  final VoidCallback callback;
  final CircleButton child;
  PlatformButton({this.child, this.callback});

  @override
  IconButton androidWidget(BuildContext context) {
    // TODO: implement androidWidget
    return  IconButton(
        padding: new EdgeInsets.all(0.0),
        icon: child,
        onPressed: callback,
    );
  }

  @override
  CupertinoButton iosWidget(BuildContext context) {
    // TODO: implement iosWidget
    return CupertinoButton(
        child: child,
        pressedOpacity: 0.3,
        onPressed: callback
    );
  }
}

class CircleButton extends StatelessWidget {

  final Color color;
  final double shadowOpacity;
  final Icon icon;

  CircleButton({this.icon, this.color, this.shadowOpacity});

  @override
  Widget build(BuildContext context) {

    return Container(
        width: 44,
        height: 44,
        decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [

          BoxShadow(
              color: Colors.black87.withOpacity(shadowOpacity),
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                0.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
          )
        ]
      ),
      child: icon,
    );
  }
}

class NotificationButton extends CircleButton {
  final Icon icon;

  NotificationButton({this.icon});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          
          children: <Widget>[
              icon,
              Positioned(bottom: 6, right: 3,
                  child: Container (
                    width: 20,
                    height: 20,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text('2', style: badgeTextStyle,)
                    ),
                  ),
              ),
          ],
        ),
    );
  }
}