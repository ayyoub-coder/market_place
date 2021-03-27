import 'package:flutter/material.dart';
import 'package:market_place/helpers/helper.dart';
import 'package:market_place/model/route_argument.dart';
import 'package:market_place/page/food_screan.dart';
import 'package:market_place/page/feed_scren.dart';
import 'package:market_place/page/home.dart';
import 'package:market_place/page/plus.dart';
import 'package:market_place/test/tab_bar.dart';


class Pages extends StatefulWidget {
  @override
  _PagesState createState() {
   return _PagesState();
  }
}


class _PagesState extends State<Pages> {
  dynamic currentTab = 1;

  RouteArgument routeArgument;
  Widget currentPage = NestedTabBar();
  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();


  Pages({Key key ,currentTab}){
    if(currentTab !=null){
      if(currentTab is RouteArgument){
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    }
    else{
      currentTab = 1;
    }
  }


  void _selectTab (int tabItem){
    setState(() {
      currentTab = tabItem;
      switch (currentTab){
        case 0:
          currentPage = Home();
          break;
        case 1:
          currentPage = NestedTabBar();
          break;
        case 2 :
          currentPage = Plus();
          break;
        case 3:
         currentPage = FoodScrean();
          break;
        case 4:
         currentPage = FeedScrean();
          break;
      }
    });
  }

  /*Widget BottomNavigationBar() {
    return _showAppNavBar
        ? CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: 0,
      height: 50.0,
      items: <Widget>[
        Icon(Icons.add, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.compare_arrows, size: 30),
        Icon(Icons.call_split, size: 30),
        Icon(Icons.perm_identity, size: 30),
      ],
      color: Colors.white,
      buttonBackgroundColor: blueColor,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 400),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    )
        : FutureBuilder<double>(
        future: _height,
        initialData: 50.0,
        builder: (context, snapshot) {
          return AnimatedContainer(
            child: Container(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.add, size: 30),
                    Icon(Icons.list, size: 30),
                    Icon(Icons.compare_arrows, size: 30),
                    Icon(Icons.call_split, size: 30),
                    Icon(Icons.perm_identity, size: 30),
                  ],
                )),
            duration: Duration(milliseconds: 300),
            width: 200,
            height: snapshot.data, //voteCountList[0],
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2))),
          );
        });
  }
  /
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF0072ff),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
          currentIndex: currentTab,
          onTap: (int i) {
            this._selectTab(i);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.map_rounded),
                label: ''
            ),
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF0072ff),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(color: Color(0xFF0072ff).withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                      BoxShadow(color: Color(0xFF0072ff).withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
                    ],
                  ),
                  child: new Icon(Icons.add, color: Colors.white),
                )),
            BottomNavigationBarItem(
              icon: new Icon(Icons.fastfood),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.chat),
              label: '',
            ),
          ],
        ),
      );
  }
}
