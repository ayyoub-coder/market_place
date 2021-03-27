import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/category.dart';
import 'package:market_place/model/slide.dart';
import 'package:market_place/widget/categories_carousel_widget.dart';
import 'package:market_place/widget/home_slider_widgets.dart';


class NestedTabBar extends StatefulWidget {

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  List<Slide> slides =[
    Slide('1','https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg','IMAGE 1','KFC'),
    Slide('3','https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg','IMAGE 3','KFC'),
    Slide('4','https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg','IMAGE 4','KFC'),
    Slide('2','https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg','IMAGE 2','KFC'),
  ];

  List<Category> categories =[
    Category('1','https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg','KFC'),
    Category('3','https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg' ,'KFC'),
    Category('4','https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg' ,'KFC'),
    Category('2','https://img2.freepng.fr/20180131/afq/kisspng-whopper-hamburger-cheeseburger-burger-king-premium-fast-food-burger-5a725b35edda78.0012443215174438939743.jpg' ,'KFC'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title:Text('app bar'),
        backgroundColor: Color(0xFF0072ff),

      ),
      body:
      Column(
        children:[
            TabBar(
              controller: _nestedTabController,
              indicatorColor:Color(0xFF0072ff),
              labelColor: Color(0xFF0072ff),
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

          Container(
             height: screenHeight *0.65  ,
            child: TabBarView(
              controller: _nestedTabController,
              children: <Widget>[

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      HomeSliderWidget(slides:slides),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          leading: Icon(
                            Icons.category,
                            color: Theme.of(context).hintColor,
                          ),
                          title: Text(

                            'food_categories',
                            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 24) ,
                          ),
                        ),
                      ),
                      CategoriesCarouselWidget(categories: categories,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          leading: Icon(
                            Icons.trending_up,
                            color: Theme.of(context).hintColor,
                          ),
                          title: Text(
                            'Most Popular',
                            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 24) ,
                          ),
                        ),
                      ),
                     // HomeSliderWidget(slides:slides),
                      Container(height:MediaQuery.of(context).size.height/3,
                      child: GridView.builder(
                        itemCount: categories.length,
                        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3),
                        itemBuilder: (BuildContext context, int index) {
                          return new Card(
                            child:  Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: categories[index].url,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter:
                                          ColorFilter.mode(Colors.white70, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Text(categories[index].name)
                              ],
                            )
                          );
                        },
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          leading: Icon(
                            Icons.category,
                            color: Theme.of(context).hintColor,
                          ),
                          title: Text(

                            'food_categories',
                            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 24) ,
                          ),
                        ),
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
        ],
      ),

    );
  }
}