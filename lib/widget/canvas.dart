
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
        imageUrl: "https://i.pinimg.com/564x/80/09/62/80096235fbd358bd15c893a9b626ae5a.jpg",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
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


    ],
  );
}
class ProfilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Color(0XffFFF1E2);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width, size.height );
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



Widget infoCard(BuildContext context,DateTime startDate, DateTime endDate)  {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
    child: Row(
      children: <Widget>[

        Flexible(
          child: Row(
            children: <Widget>[
              Flexible(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'American\nFast food\nFried chicken',
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
          child: Container(
            width: 1,
            height: 60,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    // setState(() {
                    //   isDatePopupOpen = true;
                    // });

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[

                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${DateFormat("dd, MMM").format(startDate)}',
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${DateFormat("dd, MMM").format(endDate)}',
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
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
          child: Container(
            width: 1,
            height: 60,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Delivery",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                            fontSize: 16,
                          ),
                        ),

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

              ),
            ],
          ),
        ),
      ],
    ),
  );
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
    return Container(



      decoration: BoxDecoration(
          color: Color(0xffA3080B),

          border: Border.all(
              color: Color(0xffFFF1E2),// set border color
              width: 1.0),   // set border width
          borderRadius: BorderRadius.all(
              Radius.circular(4.0)), // set rounded corner radius
          boxShadow: [BoxShadow(blurRadius: 2,color: Colors.black26,offset: Offset(1,2))]// make rounded corner of border
      ),


      child:  Row(
        children: <Widget>[
          Expanded(

            child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "KFC",
                    style: TextStyle(fontSize: 30, fontFamily: 'Langer', color: Color(0xffFFF1E2)),
                )),
            // width: 70,
          ),
          Container(
            padding: EdgeInsets.only(right: 4),
            child: Column(
              children: <Widget>[
                 Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        child: Center(
                            child: Text("3,5 ", style: TextStyle(fontSize: 20, fontFamily: 'Langer', color: Color(0xffFFF1E2)),))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),

                      child: Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("(255", style: TextStyle(fontSize: 20, fontFamily: 'Langer', color: Color(0xffFFF1E2)),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Icon(
                        Icons.star_border,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),

                    Text(")", style: TextStyle(fontSize: 20, fontFamily: 'Langer', color: Color(0xffFFF1E2)),),

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