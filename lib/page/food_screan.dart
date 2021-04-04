import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/hotel_list_data.dart';
import 'package:market_place/test/challenge_list/bloc.dart';
import 'package:market_place/test/challenge_list/main_concept_app.dart';
import 'package:market_place/widget/canvas.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FoodScrean extends StatefulWidget {
  ScrollController  scrollController;

  FoodScrean(this.scrollController);

  @override
  _FoodScreanState createState() => _FoodScreanState();
}

class _FoodScreanState extends State<FoodScrean> with TickerProviderStateMixin {
  List<HotelListData> hotelList = HotelListData.hotelList;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  String dropdownValue = 'All';
  static Color _textColor = Color(0xFF4e4e4e);
  final _bloc = ListBloc();
  
  bool showMenu = true;
  bool mealsMenuShown = false;


  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverStack(
              children: [

                MultiSliver(
                  children: <Widget>[
                    ///sliver 0
                    //  SliverStickyHeader(
                    //    header: Header()),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                            height: 200,
                              child: Card(
                                elevation: 0,
                                  child: canvas(context))),
                        childCount: 1,
                      ),
                    ),
                    ///sliver 1


                    SliverPinnedHeader(child: Header()),

                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 4),
                             child: Column(
                               children: [
                                 Container(
                                   alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                       color: Color(0xfffafafa),
                                       border: Border.all(
                                           color: Colors.grey,// set border color
                                           width: 1.0),   // set border width
                                       borderRadius: BorderRadius.all(
                                           Radius.circular(10.0)), // set rounded corner radius
                                       boxShadow: [BoxShadow(blurRadius: 1,color: Colors.black54,offset: Offset(1,1))]// make rounded corner of border
                                   ),
                                   child: infoCard(context),
                                 ),

                                 SizedBox(height: 10,) ,

                                 Container(
                                  height: 60,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.all(0),
                                    children:<Widget> [
                                       Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Card(
                                              elevation: 2,
                                              child:  DropdownButton<String>(
                                                value: dropdownValue,
                                                icon: const Icon(Icons.arrow_downward),
                                                iconSize: 24,

                                                style: const TextStyle(color: Colors.transparent),

                                                onChanged: (String newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue;
                                                  });
                                                },
                                                items: <String>["petit déjeuner\n9:00 am - 10:00 am","Déjouner\n10:00 am - 06:00 PM", "petit déjeuner\n06:00 PM - 09:00 PM",'All']
                                                    .map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Card(
                                                        elevation: 0,
                                                        child: Padding(
                                                          padding: EdgeInsets.all(0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text(value)
                                                            ],),
                                                        )),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            IconButton(icon:  Icon(
                                              Icons.star_border,
                                              color: Colors.grey[700],
                                              size: 25.0,
                                            ),
                                              onPressed: (){},
                                            ),
                                            IconButton(icon:  Icon(
                                              Icons.phone,
                                              color: Colors.grey[700],
                                              size: 25.0,
                                            ),
                                              onPressed: (){},
                                            ),
                                            IconButton(icon:  Icon(
                                              Icons.wrong_location_rounded,
                                              color: Colors.grey[700],
                                              size: 25.0,
                                            ),
                                              onPressed: (){},
                                            ),
                                            IconButton(icon:  Icon(
                                              Icons.more_horiz,
                                              color: Colors.grey[700],
                                              size: 25.0,
                                            ),
                                              onPressed: (){},
                                            ),
                                          ],
                                        ),


                                    ],
                                  ),
                                ),

                               ],
                             ),
                        ),
                        childCount: 1,
                      ),
                    ),
                    ///sliver 1
                  //  SliverPinnedHeader(child: Header1(context,1,this)),
                    ///Sliver2
                 /*   SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                            height: 300,
                            child: canvas1(context)),
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                            height: 300,
                            child: canvas1(context)),
                        childCount: 1,
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                            height: 300,
                            child: canvas1(context)),
                        childCount: 1,
                      ),
                    ),*/

                    SliverPinnedHeader(child:  Container(
                      height: MediaQuery.of(context).size.height,
                      child: AnimatedBuilder(
                        animation: _bloc,
                        builder: (_, __) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(

                              height: 60,
                              child: TabBar(
                                onTap: _bloc.onTabCategorySelected,
                                indicatorWeight: 2,
                                labelStyle: TextStyle(
                                    color: Color(0xFF023048), fontWeight: FontWeight.w400, fontSize: 17) ,
                                isScrollable: true,
                                controller: _bloc.tabController,
                                indicatorColor:Color(0xFF120078),
                                labelColor: Color(0xFF120078),
                                unselectedLabelColor: Colors.black54,
                                indicatorSize: TabBarIndicatorSize.label,
                                tabs: _bloc.tabs.map((e) => Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Tab(
                                    text:  e.category.name,
                                  ),
                                )).toList(),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  controller: _bloc.scrollController,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  itemCount: _bloc.items.length,
                                  itemBuilder: (context, index) {
                                    final item = _bloc.items[index];
                                    return (item.isCategory)
                                        ? ListCategoryItem(item.category)
                                        : ListProductItem(item.product);
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    ),

                    // buildLoadMore(context),
                  ],
                ),

              ],
            ),

          ],
          reverse: false,
        ),
      ),
    );
  }
}
