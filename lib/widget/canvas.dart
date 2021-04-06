import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:market_place/page/info/infos_screen.dart';



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
        painter: ImagePainter(),
        child: Container(),
      ),

       AnimatedPositioned(
        duration: Duration(milliseconds: 200),
        right: 1,
        top: true
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.21,
        child: IconButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>InfoScreen() ));},
          icon: Icon(
            Icons.info,
            color: Color(0xFF120078),
            size: 30.0,
          ),
        ),
      ),

    ],
  );
}

class ImagePainter extends CustomPainter {
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
                        fontSize: 16,
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
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        color: Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                         FontAwesomeIcons.user ,
                        color: Colors.black87,
                        size: 13.0,
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
