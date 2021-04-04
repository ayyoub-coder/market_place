import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:market_place/page/info_screen.dart';

Widget canvas1(BuildContext context) {
  return Stack(
    children: <Widget>[
      CachedNetworkImage(
        imageUrl: "https://i.postimg.cc/xC37VGfF/kfcCover.jpg",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      CustomPaint(
        painter: ProfilePainter(),
        child: Container(),
      ),
      AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        left: MediaQuery.of(context).size.width * 0.05,
        top: true
            ? MediaQuery.of(context).size.height * 0.27
            : MediaQuery.of(context).size.height * 0.21,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: true ? 1 : 0,
        ),
      ),
    ],
  );
}

Widget canvas(BuildContext context) {
  return Stack(
    children: <Widget>[
      CachedNetworkImage(
        imageUrl:
            "https://i.pinimg.com/564x/80/09/62/80096235fbd358bd15c893a9b626ae5a.jpg",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      CustomPaint(
        painter: ProfilePainter(),
        child: Container(),
      ),
      AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        left: MediaQuery.of(context).size.width * 0.01,
        top: true
            ? MediaQuery.of(context).size.height * 0.19
            : MediaQuery.of(context).size.height * 0.21,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: true ? 1 : 0,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28.0,
              backgroundImage:
                  NetworkImage('https://i.postimg.cc/XqNPjZXN/KFC.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
      AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        right: MediaQuery.of(context).size.width * 0.01,
        top: true
            ? MediaQuery.of(context).size.height * 0.22
            : MediaQuery.of(context).size.height * 0.21,
        child: IconButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>InfoScrean() ));},
          icon: Icon(
            Icons.info,
            color: Colors.grey[700],
            size: 30.0,
          ),
        ),
      ),
    ],
  );
}

class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Colors.white;
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

List<Tab> _tabs(List<String> categories) {
  List<Tab> tabs = [];
  for (String category in categories) {
    tabs.add(Tab(
      child: Container(
        width: 100,
        child: Card(
            elevation: 4,
            color: Colors.blue[700],
            child: Center(child: Text(category))),
      ),
    ));
  }
  return tabs;
}

Widget infoCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    child: Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width/4,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Text(
                          'American',
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                ),

                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width/4,

                  child: Row(
                    children: [
                      Text(
                        'Fast food',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),



                    ],
                  ),

                ),

                Container(
                  height: 30,
                  width: 100,
                  child: Row(
                    children: [
                      Text(
                        'Fried Chicken',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),



                    ],
                  ),

                ),

              ],
            )),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Container(
            width: 1,
            height: MediaQuery.of(context).size.height/8,
            color: Colors.grey,
          ),
        ),

        Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
                   height: 30,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '24 KM',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Icon(FontAwesomeIcons.peopleArrows,color: Colors.grey,),
                      )
                    ],
                  ),

                ),

                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2.5,

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10 MAD',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Icon(FontAwesomeIcons.coins,color: Colors.grey,),
                      )

                    ],
                  ),

                ),

                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 2.5,

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '20-30 Min',
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:4.0),
                        child: Icon(FontAwesomeIcons.clock,color: Colors.grey,),
                      )
                    ],
                  ),

                ),


              ],
            )),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Container(
            width: 1,
            height: MediaQuery.of(context).size.height/8,
            color: Colors.grey,
          ),
        ),

        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 4),
                  height: 30,
                  width: MediaQuery.of(context).size.width/4,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Text(
                          "Delivery",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 10,),
                Container(
                  height: 30,
                  padding: EdgeInsets.only(left: 4),

                  child: Row(
                    children: [
                      Text(
                        "Drive & Collect",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),

                ),
              ],
            )),
      ],
    ),
  );
}

Widget Header1(BuildContext context, int index, TickerProvider t) {
  return Card(
    elevation: 4,
    margin: EdgeInsets.all(0),
    child: Container(
        height: 60,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: TabBar(
          indicatorPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          indicatorWeight: 2,
          indicatorColor: Colors.blue[600],
          controller: TabController(length: 8, vsync: t, initialIndex: 0),
          isScrollable: true,
          tabs: _tabs([
            'Tap 1',
            'ListView',
            'tab 3',
            'Tap 4',
            'Tap 5',
            'Tap 6',
            'Tap 7',
            'Tap 8'
          ]),
          onTap: (int index) {},
        )),
  );
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.index,
    this.title,
    this.color = Colors.blue,
  }) : super(key: key);

  final String title;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,

        border: Border.all(
            color: Colors.grey, // set border color
            width: 1.0), // set border width
        borderRadius:
            BorderRadius.all(Radius.circular(6.0)), // set rounded corner radius
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "KFC",
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'Langer', color: Colors.black),
                )),
            // width: 70,
          ),
          Container(
            padding: EdgeInsets.only(right: 4),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        child: Center(
                            child: Text(
                      "3,5 ",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Langer',
                        color: Colors.black87,
                      ),
                    ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.star,
                        color: Colors.black87,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "(255",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Langer',
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.star_border,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      ")",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Langer',
                          color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
