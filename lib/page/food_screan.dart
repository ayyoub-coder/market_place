import 'package:flutter/material.dart';
import 'package:market_place/widget/canvas.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FoodScrean extends StatefulWidget {
  @override
  _FoodScreanState createState() => _FoodScreanState();
}

class _FoodScreanState extends State<FoodScrean> with TickerProviderStateMixin {
  static Color _textColor = Color(0xFF4e4e4e);
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
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
                          height: 300,
                          child: canvas(context)),
                      childCount: 1,
                    ),
                  ),
                  ///sliver 1
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 10,
                        child: Container(
                            padding: EdgeInsets.only(top: 3, left: 10),
                            child: Text(
                              "KFC",
                              style: TextStyle(fontSize: 27),
                            )),
                        // width: 70,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 4),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  // color: Colors.pink,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                          child: Center(
                                              child: Text("3,5 "))),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text("(255   "),
                                      Column(
                                        children: <Widget>[
                                          Image.asset(
                                            "icons/user.png",
                                            width: 15,
                                          ),
                                          SizedBox(
                                            height: 2,
                                          )
                                        ],
                                      ),
                                      Text(")"),
                                      SizedBox(
                                        width: 12,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SliverPinnedHeader(child: Header()),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                        child: Container(
                          color: Colors.white,
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.grey.shade400,
                                  ),
                                  Text(
                                    'settat maroc',
                                    style: TextStyle(
                                      color: _textColor,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 10,),
                                child: Text(
                                  'ABOUT ME',
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      childCount: 1,
                    ),
                  ),
                  ///sliver 1
                  SliverPinnedHeader(child: Header1(context,1,this)),
                  ///Sliver2
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
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => Container(
                          height: 300,
                          child: canvas1(context)),
                      childCount: 1,
                    ),
                  ),
                  // buildLoadMore(context),
                ],
              ),

            ],
          )
        ],
        reverse: false,
      ),
    );
  }
}
