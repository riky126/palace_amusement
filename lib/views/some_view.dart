import 'package:flutter/material.dart';
import 'package:mvvm/mvvm.dart';
import 'dart:async';

import '../view_models/some_viewmodel.dart';
import '../styleguide/text_styles.dart';
// View
class SomeView extends View<PageViewModel> {

  final int page;

  SomeView({this.page}) : super(PageViewModel());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
        child: $.watchFor<int> (
            #count,
            builder:
            $.builder1((text) => Text(
                'Page $page count: $text',
                style: simpleTextStyle,
              )
            )
        )
    );
  }

}