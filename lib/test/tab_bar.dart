import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_place/model/category.dart';
import 'package:market_place/model/hotel_list_data.dart';
import 'package:market_place/model/slide.dart';
import 'package:market_place/widget/categories_carousel_widget.dart';
import 'package:market_place/widget/filter.dart';
import 'package:market_place/widget/home_slider_widgets.dart';
import 'package:market_place/widget/hotel_list_view.dart';
import 'package:scoped_model/scoped_model.dart';


class NestedTabBar extends StatefulWidget {
  ScrollController scrollController;

  NestedTabBar(this.scrollController);

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;


  AnimationController animationController;
  List<HotelListData> hotelList = HotelListData.hotelList;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();

    _nestedTabController.dispose();
  }

  List<Slide> slides =[
    Slide('1','https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg','IMAGE 1','KFC'),
    Slide('3','https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg','IMAGE 3','KFC'),
    Slide('4','https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg','IMAGE 4','KFC'),
    Slide('2','https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg','IMAGE 2','KFC'),
  ];

  List<Category> categories =[
    Category('1','https://i.postimg.cc/zvvkxz0W/Sans-titre-1-Plan-de-travail-1.png','CAT 1'),
    Category('6','https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg' ,'Kateg 2'),
    Category('2','https://i.postimg.cc/SsDrL27k/2.png' ,'KAt 3'),
    Category('4','https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg','Categ 4'),
    Category('3','https://i.postimg.cc/m2cwMrcW/9-Plan-de-travail-1-Plan-de-travail-1.png' ,'KFC'),
    Category('5','https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg' ,'KFC'),
    Category('7','https://img2.freepng.fr/20180131/afq/kisspng-whopper-hamburger-cheeseburger-burger-king-premium-fast-food-burger-5a725b35edda78.0012443215174438939743.jpg' ,'KFC'),
  ];

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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Column(
        children:[
            TabBar(
              controller: _nestedTabController,
              indicatorColor:Color(0xFF120078),
              labelColor: Color(0xFF120078),
              unselectedLabelColor: Colors.black54,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Tab(
                    text: "Services",
                    icon: Icon(Icons.image),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Tab(
                    text: "Manger",
                    icon: Icon(Icons.extension),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),

                  child: Tab(
                    text: "MarketPlace",
                    icon: Icon(Icons.ac_unit_sharp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Tab(
                    text: "Epicerie Supermarch",
                    icon: Icon(Icons.account_tree_outlined),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Tab(
                    text: "Five",
                    icon: Icon(Icons.image),
                  ),
                ),
              ],
            ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _nestedTabController,
                children: <Widget>[
                  Container(
                    color: Colors.grey[200],
                  //  height: MediaQuery.of(context).size.height/2,
                    child: CustomScrollView(controller: widget.scrollController,
                       slivers: <Widget> [
                         SliverList(

                           delegate: SliverChildBuilderDelegate(
                                   (BuildContext context, int index) {
                                 return Column(
                                   children: [
                                     HomeSliderWidget(slides:slides),
                                     CategoriesCarouselWidget(categories: categories,),
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Container(
                                             margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                                             child: Text('Category ',
                                                 style: Theme.of(context).textTheme.headline6)),
                                        Container(
                                             margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                                             child: InkWell(
                                               onTap: () {

                                               },
                                               child: Text('See all',
                                                   style: Theme.of(context).textTheme.bodyText2),
                                             ))
                                       ],
                                     ),
                                     Container(
                                       height: 270,
                                       margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 14.0),
                                       decoration: new BoxDecoration(
                                         color:  Colors.transparent
                                       ),
                                       child: ListView.builder(

                                         itemCount: hotelList.length,
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (BuildContext context, int index) {
                                           return Padding(
                                               padding: const EdgeInsets.only(top:0),
                                               child:  InkWell(
                                                 onTap: (){},
                                                 child: Card(
                                                   elevation: 4,

                                                   child: Padding(
                                                     padding: const EdgeInsets.all(16.0),
                                                     child: Container(
                                                       color: Colors.red,
                                                       width: 170,
                                                       height: 50,
                                                     ),
                                                   ),
                                                 ),
                                               )
                                           );
                                         },
                                       ),
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Container(
                                             margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                                             child: Text('Category ',
                                                 style: Theme.of(context).textTheme.headline6)),
                                         Container(
                                             margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                                             child: InkWell(
                                               onTap: () {

                                               },
                                               child: Text('See all',
                                                   style: Theme.of(context).textTheme.bodyText2),
                                             ))
                                       ],
                                     ),
                                     Container(
                                       height: 270,
                                       margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 14.0),
                                       decoration: new BoxDecoration(
                                           color:  Colors.transparent
                                       ),
                                       child: ListView.builder(

                                         itemCount: hotelList.length,
                                         scrollDirection: Axis.horizontal,
                                         itemBuilder: (BuildContext context, int index) {
                                           return Padding(
                                               padding: const EdgeInsets.only(top:0),
                                               child:  InkWell(
                                                 onTap: (){},
                                                 child: Card(
                                                 elevation: 4,
                                                   child: Padding(
                                                     padding: const EdgeInsets.all(16.0),
                                                     child: Container(
                                                       color: Colors.red,
                                                       width: 170,
                                                       height: 50,
                                                     ),
                                                   ),
                                                 ),
                                               )
                                           );
                                         },
                                       ),
                                     ),
                                   ],
                                 );
                               }, childCount: 1),
                         ),
                       ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.greenAccent,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.indigoAccent,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}


class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
      this.searchUI,
      );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
