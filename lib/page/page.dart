import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  ScrollController scrollController ;


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }


  @override
  void dispose() {
    scrollController.dispose();
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
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
              child: Image.network(
                "https://i.postimg.cc/xTGdV2xm/profile.jpg",
                fit: BoxFit.cover,
                width: 60.0,
                height: 60.0,
              )
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
        key: globalKey,
        body: Stack(
          children: [


            Container(
              width: double.infinity,
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Google $index'),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),

        //currentPage,
        bottomNavigationBar: AnimatedBuilder (
          animation: scrollController,
          builder: (context, child) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height:scrollController.position.userScrollDirection == ScrollDirection.reverse ?0:100,
              child: child,
            );
          },
          child:  BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
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


