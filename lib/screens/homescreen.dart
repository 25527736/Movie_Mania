import 'package:flutter/material.dart';
import 'package:movie_mania/search/searchscreenbody.dart';
import 'homescreenview.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'profile.dart';
import '../../widgets/constant.dart';
import '../../widgets/customwidgets.dart';

class Homescreen extends StatefulWidget {
  Homescreen({Key? key, required this.index}) : super(key: key);
  int index;
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var Screens = [
    const Homescreenbody(),
    const Searchscreenbody(),
    const ProfilePage(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor: oppositecolor),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              Backgroupimage(imageback: selectedbackimg),
              Screens[widget.index],
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            height: 50.0,
            index: widget.index,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: uppermodecolor,
              ),
              Icon(
                Icons.person,
                size: 30,
                color: uppermodecolor,
              ),
            ],
            color: Colors.white10,
            buttonBackgroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: const Duration(milliseconds: 700),
            onTap: (index) => setState(() => widget.index = index),
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
