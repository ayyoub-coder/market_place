import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_place/helpers/helper.dart';
import 'package:market_place/model/route_argument.dart';
import 'package:market_place/page/food_screan.dart';
import 'package:market_place/page/feed_scren.dart';
import 'package:market_place/page/home.dart';
import 'package:market_place/page/plus.dart';
import 'package:market_place/test/challenge_list/main_concept_app.dart';
import 'package:market_place/test/provider/state_management.dart';
import 'package:market_place/test/tab_bar.dart';
import 'package:provider/provider.dart';


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
   currentPage = NestedTabBar(scrollController);
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
          currentPage = NestedTabBar(scrollController);
          break;
        case 2 :
          currentPage = Plus();
          break;
        case 3:
         currentPage = FoodScrean(scrollController);
          break;
        case 4:
         currentPage =   MainConcept();
          break;
      }
    });
  }
  Row buildHomeTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(

          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              enableFeedback: false,
              splashColor: Colors.transparent,
              onTap: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
              },
              child: TextField(
                showCursor: false,
                enabled: false,

                decoration: InputDecoration(
                  hintText: 'hint',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Circular',
                  ),
                  //fillColor: Theme.of(context).brightness == Brightness.dark ? Theme.of(context).inputDecorationTheme.fillColor : Colors.white,
                  filled: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                      width: 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Theme.of(context).focusColor,
                      width: 0,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(6),
                  prefixIcon: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
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
                  title:buildHomeTitle(context),
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




class CustomAppBar extends StatelessWidget {


  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF120078),
      height: MediaQuery.of(context).size.height * 0.10,
      padding: EdgeInsets.only(top: 20,left: 15,right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset("assets/profile.jpg")),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 0,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Icon(Icons.menu,color: Color(0xFF120078),size: 14,),
                ),
              )
            ],
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width/1.40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.white70
            ),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,color: Colors.black87,),
                  suffixIcon: Icon(Icons.qr_code,color: Colors.black87)
              ),
            ),
          ),
          Container(
            height: 30,
            width: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.asset("assets/icons/message_icon_1.png",color: Colors.white,)),
          ),
        ],
      ),
    );
  }
}


