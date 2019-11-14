import 'package:flutter/material.dart';
import 'package:palace_amusement/platform_widget.dart';
import 'package:mvvm/mvvm.dart';
import 'package:palace_amusement/styleguide/text_styles.dart';

import '../view_models/home_viewmodel.dart';
import '../common/home_movie_list.dart';
import '../common/upcoming_movies_list.dart';
/*
class HomeView extends StatefulWidget {
  @override
  _HomePage createState() {
    // TODO: implement createState
    return  new _HomePage();
  }
}*/

class HomeView extends View<HomeViewModel> {

  HomeView() : super(HomeViewModel());
  int _counter = 0;

  void incrementCounter() {
    $Model.changeName();

    setState(() {
      // This call to setState tells the Flutter framework that something has
      _counter++;
    });
  }

  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {

        return SingleChildScrollView (
          padding:  PlatformWidget.platformScrollOffset(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Playing",
                        style:  titleTextStyle),
                  ],
                ),
              ),

              HomeMoveList (),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Coming Soon",
                        style:  movieTitleTextStyle),
                  ],
                ),
              ),
  
              UpcomingMovies(),

              /*Container(

                // binding
                child: $.watchFor<String> (
                    #name,
                    builder:
                    $.builder1((text) => Text(text, style: simpleTextStyle,))
                ),
              ),*/

            ],
          ),
        );
      },
    );
  }
}


class ItemWidget extends PlatformWidget<Widget, Widget> {
  final Widget child;

  ItemWidget({this.child});

  @override
  Widget androidWidget(BuildContext context) => new Card(
    child: child,
  );
  @override
  Widget iosWidget(BuildContext context) => child;
}