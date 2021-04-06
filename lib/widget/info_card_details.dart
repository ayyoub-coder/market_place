import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget infoCardDetails(BuildContext context) {
  return Row(
    children: <Widget>[
      Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
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
            ),
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
                      '24 km',
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
                      '10 mad',
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
                      '20-30 min',
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
        child:  Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      size: 15,
                    ),
                  ),
                ],
              ),
              Row(

                crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),),
    ],
  );
}