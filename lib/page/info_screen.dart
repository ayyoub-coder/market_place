import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_place/widget/canvas.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScrean extends StatefulWidget {
  @override
  _InfoScreanState createState() => _InfoScreanState();
}

class _InfoScreanState extends State<InfoScrean> with TickerProviderStateMixin {
  static const String long_lorem =
      "Quiuscipit ac.   consequat vitae. Quisque sapien lorem, vestibulum vitae justo eget, fringilla eleifend nisi."
      "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dolor risus, aliquet a erat quis, viverra molestie orci. Suspendisse vehicula porta libero. Nam tincidunt nulla ipsum, vel iaculis risus scelerisque sed. Phasellus venenatis, enim vel placerat blandit, leo eros bibendum erat, at auctor mauris diam ac risus. Aenean sit amet congue neque, sit amet condimentum elit. Fusce lacinia massa vel nisl scelerisque, in scelerisque dolor elementum. Vivamus leo enim, congue dictum congue vitae, porttitor id purus. Sed eu ultricies erat. Morbi hendrerit, mi ac volutpat commodo, magna turpis pretium nibh, at fringilla eros lorem quis tellus. Praesent porttitor purus nibh, ac vestibulum massa fringilla vel. Pellentesque dapibus nulla quis luctus dictum. In scelerisque ut ex sed facilisis. Nunc eu finibus nulla, ut hendrerit sem. Suspendisse accumsan risus vel diam fringilla iaculis.";

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.subhead.copyWith(
          fontSize: 18,
        );
  }

  ScrollController scrollController = new ScrollController();
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: Colors.grey[200] ,
      body: CustomScrollView(
        controller: scrollController,
        slivers:<Widget> [
            SliverList(
                delegate:SliverChildBuilderDelegate((BuildContext context,int index ){
              return Column(children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 36.0,
                                    backgroundImage:
                                    NetworkImage('https://i.pinimg.com/564x/ed/d0/bb/edd0bb52e6443aaee46f4e0114482481.jpg'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "KFC",
                                  style: TextStyle(fontSize: 30, fontFamily: 'Langer', color: Colors.black),
                                )
                              ],
                            ),width: MediaQuery.of(context).size.width/2,
                          ),
                          IconButton(icon: Icon(Icons.close,size: 30,), onPressed: (){}),
                        ],),
                    ),
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
                  ],
                ),
                Container(
                  height: size.height/9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(icon: Icon(FontAwesomeIcons.star,color: Colors.grey,size: 25,), onPressed: (){}),
                      IconButton(icon: Icon(FontAwesomeIcons.phone,color: Colors.grey,size: 25,), onPressed: (){}),
                      IconButton(icon: Icon(FontAwesomeIcons.thumbsUp,color: Colors.grey,size: 25,), onPressed: (){}),
                    ],
                  ),
                ),
                Container(
                  height: size.height,
                  child: Column(
                    children: [
                      TabBar(
                        unselectedLabelColor: Colors.black54,
                        labelColor:  Color(0xFF120078),
                        controller: _tabController,
                        indicatorColor:Color(0xFF120078),
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Text("A propos"),
                          ),
                          Tab(
                            child: Text("Photo"),
                          ),
                          Tab(
                            child: Text("Horaires ouverte"),
                          ),
                          Tab(
                            child: Text("Postes"),
                          ),
                          Tab(
                            child: Text("Community"),
                          ),
                        ],

                      ),
                      Container(
                        height: size.height/1.1,
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            ListView(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                                  child: GestureDetector(
                                      child: Text("https://www.google.com/", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                                      onTap: () {
                                        // do what you need to do when "Click here" gets clicked
                                      }
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(long_lorem, textAlign: TextAlign.justify,
                                      style: medium(context).copyWith(color:Colors.black54)
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Card(
                                  margin: EdgeInsets.all(8),
                                  elevation: 4,
                                  child: Image.network('https://i.pinimg.com/564x/a2/bc/91/a2bc9153a00757ffb711a022ec02bffe.jpg'),
                                ),
                                SizedBox(height: 10,),
                              ],
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
                ),
              ],
              );
            },childCount : 1))
        ],

      ),
    );
  }

  _launchURL() async {
    const url = 'https://google.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
