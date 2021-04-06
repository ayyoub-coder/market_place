import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget SearchInAppBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Expanded(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            enableFeedback: false,
            splashColor: Colors.transparent,
            onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
            },
            child: TextField(
              showCursor: false,
              enabled: false,
              decoration: InputDecoration(
                hintText: 'hint',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Circular',
                ),
                filled: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Theme.of(context).focusColor,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: Theme.of(context).focusColor,
                    width: 0,
                  ),
                ),
                contentPadding: EdgeInsets.all(6),
                prefixIcon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),

    ],
  );
}