import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';
import 'dart:async';

import '../view_models/some_viewmodel.dart';
import '../styleguide/text_styles.dart';
// View
class SecondView extends View<PageViewModel> {

  SecondView() : super(PageViewModel());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      color: Colors.white,
      child: Center(
          child: Text(
                'Second Page',
                style: simpleTextStyle,
          )
      ),
    );
  }

}