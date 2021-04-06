import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/widget/pop_pup_info.dart';

import 'file:///C:/Users/hp/Desktop/codanews/market_place/lib/page/info/about_us.dart';
import 'package:market_place/utility/constants.dart';

import 'package:market_place/widget/info_card_details.dart';
import 'package:sliver_tools/sliver_tools.dart';


class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {

  static const String long_lorem =
      "Quiuscipit ac.   consequat vitae. Quisque sapien lorem, vestibulum vitae justo eget, fringilla eleifend nisi."
      "\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dolor risus, aliquet a erat quis, viverra molestie orci. Suspendisse vehicula porta libero. Nam tincidunt nulla ipsum, vel iaculis risus scelerisque sed. Phasellus venenatis, enim vel placerat blandit, leo eros bibendum erat, at auctor mauris diam ac risus. Aenean sit amet congue neque, sit amet condimentum elit. Fusce lacinia massa vel nisl scelerisque, in scelerisque dolor elementum. Vivamus leo enim, congue dictum congue vitae, porttitor id purus. Sed eu ultricies erat. Morbi hendrerit, mi ac volutpat commodo, magna turpis pretium nibh, at fringilla eros lorem quis tellus. Praesent porttitor purus nibh, ac vestibulum massa fringilla vel. Pellentesque dapibus nulla quis luctus dictum. In scelerisque ut ex sed facilisis. ";

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.subhead.copyWith(
      fontSize: 18,
    );
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildScrollable(context),
    );
  }

  Widget _buildScrollable(BuildContext context){
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverPinnedHeader(
          child: Container(
            color: Colors.white,
            height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  "KFC STORE",
                  style: TextStyle(fontSize: 30 , color: Colors.black,fontWeight: FontWeight.w300),
                ),
              ),IconButton(icon: Icon(Icons.close,size: 25,), onPressed: (){Navigator.pop(context);}),
            ],
          ),
        ),
        ),
        SliverFixedExtentList(delegate: SliverChildListDelegate([
          Container(

            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xfffafafa),
                border: Border.all(
                    color: Colors.grey,// set border color
                    width: 1.0),   // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
               // boxShadow: [BoxShadow(blurRadius: 1,color: Colors.black54,offset: Offset(1,1))]// make rounded corner of border
            ),
            child: infoCardDetails(context),
          ),
        ]), itemExtent: size.height*0.1),
        SliverFixedExtentList(delegate: SliverChildListDelegate([

          Container(

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(FontAwesomeIcons.star,color: Color(0xFF120078),size: 22,), onPressed: (){}),
                IconButton(icon: Icon(FontAwesomeIcons.phone,color: Color(0xFF120078),size: 22,), onPressed: (){}),
                IconButton(icon: Icon(FontAwesomeIcons.share,color: Color(0xFF120078),size: 22,), onPressed: (){}),
                PopPupInfo(),
              ],
            ),
          ),

        ]), itemExtent: size.height/13),

        SliverPinnedHeader(child:  TabBar(
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

        ),),
        SliverPinnedHeader(child: Container(
          height: size.height/1.6,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[

              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: MainColor,
                    expandedHeight: 200,
                    stretch: true,
                    automaticallyImplyLeading: false,
                    stretchTriggerOffset: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        'KFC STORE',
                        style: GoogleFonts.inconsolata(fontWeight: FontWeight.w400),
                      ),
                      centerTitle: true,
                      stretchModes: const [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                        StretchMode.blurBackground,
                      ],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://i.pinimg.com/564x/a2/bc/91/a2bc9153a00757ffb711a022ec02bffe.jpg?q=50&fit=crop&w=960&h=500&dpr=1.5',
                            fit: BoxFit.cover,
                          ),
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.0, 0.5),
                                end: Alignment(0.0, 0.0),
                                colors: <Color>[
                                  Color(0x60000000),
                                  Color(0x00000000),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const AboutUs(),
                    ]),
                  )
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
        )),
      ],
    );
  }

}
