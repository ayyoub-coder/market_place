import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PopPupInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Container(width:MediaQuery.of(context).size.width/1.8,
            color: Colors.red,

            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.thumbsUp,color: Colors.grey[700],size: 20,),
                title:  Text(
                  "Like",
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Container(
            width:MediaQuery.of(context).size.width/1.8,
            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.bookmark,color: Colors.grey[700],size: 20,),
                title:  Text(
                  "Voir plus tard",
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Container(
            width:MediaQuery.of(context).size.width/1.8,
            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.heart,color: Colors.grey[700],size: 20,),
                title:  Text(
                  "S'abonner",
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 4,
          child: Container(
            width:MediaQuery.of(context).size.width/1.8,
            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.phone,color: Colors.grey[700],size: 20,),
                title:  Text(
                  "Programme de fidélité",
                  style: TextStyle(
                      color:Colors.grey[700], fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 5,
          child: Container(
            width:MediaQuery.of(context).size.width/1.8,
            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.usersCog,color: Colors.grey[700],size: 20,),
                title:  Text(
                    "Prendre rendez vous",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w700),
                  ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          value: 6,
          child: Container(
            width:MediaQuery.of(context).size.width/1.8,
            child: InkWell(
              onTap: () => print(1),
              child: ListTile(
                leading:  Icon(FontAwesomeIcons.clipboardCheck,color: Colors.grey[700],size: 20,),
                title:  Text(
                  "Evaluer",
                  style: TextStyle(
                      color: Colors.grey[700], fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ),

      ],
      icon: Icon(FontAwesomeIcons.ellipsisV,color: Color(0xFF120078),size: 22,),
      offset: Offset(0, 100),
    );
  }
}