
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget canvas1(BuildContext context){
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


Widget canvas(BuildContext context){
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
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage:
            NetworkImage('https://i.postimg.cc/XqNPjZXN/KFC.png'),
            backgroundColor: Colors.transparent,
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
    path.lineTo(0, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.95);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.25);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

List<Tab> _tabs(List<String> categories){
  List<Tab> tabs = [];
  for(String category in categories){
    tabs.add(
        Tab(
          child: Container(
            width: 100,
            child: Card(elevation: 4,
                color: Colors.blue[700],
                child: Center(

                    child: Text(category))
            ),
          ),
        )
    );
  }
  return tabs;
}


Widget Header1(BuildContext context , int index ,TickerProvider  t) {
  return Card(
    elevation: 4,
    margin: EdgeInsets.all(0),
    child: Container(
        height: 60,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child:TabBar(
          indicatorPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
          indicatorWeight: 2,
          indicatorColor: Colors.blue[600],
          controller: TabController(
              length:8,
              vsync:  t,
              initialIndex: 0
          ),
          isScrollable: true,
          tabs: _tabs(['Tap 1','ListView','tab 3','Tap 4','Tap 5','Tap 6','Tap 7','Tap 8']),
          onTap: (int index){

          },
        )
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
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0),
      child: Container(
        height: 65,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(

          'Ayoub Kouadir',
          style: TextStyle(
              color: Color(0xFF4e4e4e), fontWeight: FontWeight.w900, fontSize: 32),
        ),
      ),
    );
  }
}