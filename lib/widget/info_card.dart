import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget infoCard(BuildContext context) {
  return Row(
    children: <Widget>[
      Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
          height: MediaQuery.of(context).size.height *0.09,
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
          height: MediaQuery.of(context).size.height *0.09,
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
  );
}