import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_place/helpers/helper.dart';
import 'package:market_place/model/route_argument.dart';
import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/page/feed/feed_scren.dart';

import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/page/home/home.dart';
import 'package:market_place/page/marcket_place/marcket_place.dart';

import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/page/plus/plus.dart';
import 'package:market_place/page/store/food_screan.dart';


import 'package:market_place/widget/search.dart';


class Pages extends StatefulWidget {
  @override
  _PagesState createState() {
   return _PagesState();
  }
}


class _PagesState extends State<Pages> {
  dynamic currentTab = 1;

  RouteArgument routeArgument;
  Widget currentPage  ;
  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController ;

  bool _showAppbar = true;
  bool isScrollingDown = false;


  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
   currentPage = MarcketPlaceScreen(scrollController);
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }


  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(() {});
    super.dispose();

  }

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
          currentPage = MarcketPlaceScreen(scrollController);
          break;
        case 2 :
          currentPage = Plus();
          break;
        case 3:
         currentPage = FoodScrean(scrollController);
          break;
        case 4:
         currentPage =  FeedScrean();
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        key: globalKey,
        body: SafeArea(
          top: false ,
          child: Column(
            children: [

              AnimatedContainer(
                height: _showAppbar ? 80.0 : 0.0,
                duration: Duration(milliseconds: 700),
                child:  AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundImage:
                        NetworkImage('http://51.91.158.179:8069/web/image/res.users/2/image_1920/300x300'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  title:SearchInAppBar(context),
                  actions: [
                    Container(
                      height: 55,
                      width: 35,
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 35,
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 35,
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          FontAwesomeIcons.commentDots,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 35,
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          FontAwesomeIcons.shoppingCart,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: 35,
                      padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          FontAwesomeIcons.ellipsisV,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],

                  backgroundColor: Color(0xFF120078),

                ),
              ),

              Expanded(
                child: currentPage,
              ),
            ],
          ),
        ),

        //
        bottomNavigationBar:   AnimatedContainer(
          height: _showAppbar ?60.0:0.0,
          duration: Duration(milliseconds: 700),
          child:
          ListView(
           children: [
             BottomNavigationBar(
               type: BottomNavigationBarType.fixed,
               selectedItemColor: Color(0xFF120078),
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
                         color: Color(0xFF120078),
                         borderRadius: BorderRadius.all(
                           Radius.circular(50),
                         ),
                         boxShadow: [
                           BoxShadow(color: Color(0xFF120078).withOpacity(0.8), blurRadius: 6, offset: Offset(0, 2)),
                           BoxShadow(color: Color(0xFF120078).withOpacity(0.8), blurRadius: 2, offset: Offset(0, 2))
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
           ],
          ),

          //child: Container(height: 60, color: Colors.red,),
        ),
      );
  }
}
