import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palace_amusement/platform_widget.dart';
import 'package:palace_amusement/main.dart';

import 'styleguide/colors.dart';
import 'styleguide/text_styles.dart';
import 'icons_assets.dart';

class PlatformTabBar extends PlatformWidget<CupertinoTabBar, BottomNavigationBar> {
  final MainWrapperState appState;
  final double iconSize = 26;
  final double fontSize = 11;

  PlatformTabBar(this.appState);
 @override
 BottomNavigationBar androidWidget(BuildContext context) {

    return new BottomNavigationBar(
      currentIndex: appState.selectedIndex,
      onTap: appState.onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: fontSize,
      unselectedFontSize: fontSize,

      backgroundColor: appState.selectedIndex == 0 ? darkTabBarColor : lightBackgroundColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: appState.selectedIndex == 0 ? tabIconDarkColor : tabIconColor,

      items: tabBarItems(),
    );
  }

  @override
  CupertinoTabBar iosWidget(BuildContext context) {

    return  new CupertinoTabBar(
      onTap: appState.onItemTapped,
      activeColor: primaryColor,
      inactiveColor: appState.selectedIndex == 0 ? tabIconDarkColor : tabIconColor,
      backgroundColor: (appState.selectedIndex == 0 ? darkTabBarColor : lightBackgroundColor).withOpacity(0.95),
      
      items: tabBarItems(),
    );
  }

  List<BottomNavigationBarItem> tabBarItems() {

    return [
        BottomNavigationBarItem (
          icon: ImageIcon(
              AssetImage(homeIcon),
              size: iconSize,
            ),
          title: Text('Overview', style: tabItemTextStyle),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage(moviesIcon),
              size: iconSize,
          ),
          title: Text('Movies', style: tabItemTextStyle,),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage(calendarIcon),
              size: iconSize,
          ),
          title: Text('Schedule', style: tabItemTextStyle,),
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
              AssetImage(ticketsIcon),
              size: iconSize,
            ),
          title: Text('Tickets', style: tabItemTextStyle,),
        ),
    ];
  }
}