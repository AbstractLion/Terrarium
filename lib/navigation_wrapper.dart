import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'page_data.dart';

class NavigationWrapper extends StatefulWidget {
  @override
  _NavigationWrapperState createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: Text(PageData.getPageName(currentPage)),
        backgroundColor: Constants.accentColor,
      ),
      body: PageData.getPage(currentPage),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Constants.accentColor,
        circleColor: Constants.accentColor,
        inactiveIconColor: Constants.textColor,
        activeIconColor: Constants.textColor,
        textColor: Constants.textColor,
        tabs: [
          TabData(iconData: Icons.timer, title: "Timer"),
          TabData(iconData: Icons.local_florist, title: "Garden"),
          TabData(iconData: Icons.person, title: "Profile"),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}