import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

import 'package:mvvm/mvvm.dart';
import 'package:palace_amusement/platform_widget.dart';
import 'package:palace_amusement/platform_tabbar.dart';
import 'package:palace_amusement/platform_button.dart';

import 'icons_assets.dart';
import 'styleguide/colors.dart';

import 'views/some_view.dart';
import 'views/home_view.dart';
import 'views/second_view.dart';

void main() => runApp(PalaceAmusementApp());

class PalaceAmusementApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        primarySwatch: Colors.blue,
      ),
      home: MainWrapper (title: 'Flutter Demo Home Page'),
    );
  }
}

class MainWrapper extends StatefulWidget {
  MainWrapper({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect

  final String title;
  final MainWrapperState _state = MainWrapperState();
  @override
  MainWrapperState createState() => _state;
}

class MainWrapperState extends State<MainWrapper> {

  final List<View> _children = [
      HomeView(),
      SomeView(page: 2),
      SomeView(page: 3),
      SomeView(page: 4),
  ];

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        //statusBarColor: Colors.white, // Color for Android
        statusBarBrightness: selectedIndex == 0 ? Brightness.dark : Brightness.light // Dark == white status bar -- for IOS.
    ));

    return PlatformScaffold(
      //appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      //title: Text(widget.title),
      //),
      appState: this,
      body: Stack(
        children: <Widget>[
          //  View Content
          _children[selectedIndex],
          //  TopBar
          Padding (
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 30.0, bottom: 8.0
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    PlatformButton(
                      child: NotificationButton (
                        icon: Icon(
                            CupertinoIcons.bell,
                            size: 32,
                            color: selectedIndex == 0 ? Colors.grey: darkButton,
                          ),
                      ),
                      callback: () {}
                    ),

                    Container(
                        height: 50,
                        width: 120,
                        child: SvgPicture.asset(
                          logo,
                          height: 50,
                          color: primaryColor,
                        ),
                    ),

                    PlatformButton(
                      child: CircleButton(
                          icon: Icon(
                            CupertinoIcons.profile_circled,
                            color: selectedIndex == 0 ? Colors.grey: darkButton,
                          ),
                          color: selectedIndex == 0 ? darkButton : Colors.white,
                          shadowOpacity:  selectedIndex == 0 ? 0.8 : 0.1,
                      ),

                      callback: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondView()));
                      },
                    ),
                ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlatformScaffold extends PlatformWidget<CupertinoTabScaffold, Scaffold> {

  final String title;
  final Widget body;
  final MainWrapperState appState;

  PlatformScaffold({this.appState, this.title, this.body});

  @override
  Scaffold androidWidget(BuildContext context) {
    // TODO: implement androidWidget
    return  Scaffold (
        body: body,
        //backgroundColor: Colors.transparent,
        backgroundColor: appState.selectedIndex == 0 ? darkBackgroundColor : lightBackgroundColor,

        /*floatingActionButton: FloatingActionButton (
            onPressed: (appState._children[0] as HomeView).incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
        */
        bottomNavigationBar: PlatformTabBar(appState)
    );
  }

  @override
  CupertinoTabScaffold iosWidget(BuildContext context) {
    // TODO: implement iosWidget
    return  CupertinoTabScaffold( // 4
        backgroundColor: appState.selectedIndex == 0 ? darkBackgroundColor : lightBackgroundColor,
        tabBar: PlatformTabBar(appState).iosWidget(context),
        tabBuilder: (BuildContext context, int index) {

        return body;
      },
    );
  }
}
