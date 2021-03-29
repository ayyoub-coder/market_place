import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/widget/canvas.dart';
import 'package:sliver_tools/sliver_tools.dart';

class FoodScrean extends StatefulWidget {
  @override
  _FoodScreanState createState() => _FoodScreanState();
}

class _FoodScreanState extends State<FoodScrean> with TickerProviderStateMixin {

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  String dropdownValue = 'All';
  static Color _textColor = Color(0xFF4e4e4e);
  ScrollController _scrollController;
  bool showMenu = true;
  bool mealsMenuShown = false;
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
                          height: 200,
                            child: canvas(context)),
                      childCount: 1,
                    ),
                  ),
                  ///sliver 1


                  SliverPinnedHeader(child: Header()),

                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                           child: Column(
                             children: [
                               Container(
                                 margin: EdgeInsets.symmetric(horizontal: 0),
                                 padding: EdgeInsets.symmetric(vertical: 0),
                                 decoration: BoxDecoration(
                                     color: Colors.grey[50],
                                     borderRadius: BorderRadius.only(
                                         topLeft: Radius.circular(10),
                                         topRight: Radius.circular(10),
                                         bottomLeft: Radius.circular(10),
                                         bottomRight: Radius.circular(10)),
                                     border: Border.all(color: Colors.grey)),
                                 child: infoCard(context , startDate,endDate),
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
