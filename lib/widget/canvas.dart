import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:market_place/page/info_screen.dart';
import 'package:market_place/test/test_sliver.dart';

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
        right: 1,
        top: true
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.21,
        child: IconButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>TestSliver() ));},
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
    path.lineTo(size.width/5,  size.height );
    path.lineTo(size.width , size.height * 0.80);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width/5,size.height );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


Widget infoCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    child: Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
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
                  height: 20,
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
                  height: 20,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   height: 20,
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
                        child: Icon(FontAwesomeIcons.peopleArrows,color: Colors.grey,size: 16,),
                      )
                    ],
                  ),

                ),

                Container(
                  height: 20,
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
                        child: Icon(FontAwesomeIcons.coins,color: Colors.grey,size: 16,),
                      )

                    ],
                  ),

                ),

                Container(
                  height: 20,
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
                        child: Icon(FontAwesomeIcons.clock,color: Colors.grey,size: 16,),
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

Widget infoCardDetails(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    child: Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
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
                  height: 20,
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
                  height: 20,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
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
                        child: Icon(FontAwesomeIcons.peopleArrows,color: Colors.grey,size: 16,),
                      )
                    ],
                  ),

                ),

                Container(
                  height: 20,
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
                        child: Icon(FontAwesomeIcons.coins,color: Colors.grey,size: 16,),
                      )

                    ],
                  ),

                ),

                Container(
                  height: 20,
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
                        child: Icon(FontAwesomeIcons.clock,color: Colors.grey,size: 16,),
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
          child:  Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                                fontFamily: 'Nunito',
                                color: Colors.black87,
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow[700],
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
                        fontFamily: 'Nunito',
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        FontAwesomeIcons.user ,
                        color: Colors.black87,
                        size: 18.0,
                      ),
                    ),
                    Text(
                      ")",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),),
      ],
    ),
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
color: Colors.white,
      padding: EdgeInsets.all(4),

      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "KFC",
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'Nunito', color: Colors.black),
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
                        fontFamily: 'Nunito',
                        color: Colors.black87,
                      ),
                    ))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow[700],
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
                        fontFamily: 'Nunito',
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                         FontAwesomeIcons.user ,
                        color: Colors.black87,
                        size: 18.0,
                      ),
                    ),
                    Text(
                      ")",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nunito',
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
