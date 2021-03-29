import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/widget/filters_screen.dart';
import 'package:market_place/widget/hotel_app_theme.dart';

Widget getFilterBarUI(BuildContext context) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 24,
          decoration: BoxDecoration(
            color: HotelAppTheme.buildLightTheme().backgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, -2),
                  blurRadius: 8.0),
            ],
          ),
        ),
      ),
      Container(
        color: HotelAppTheme.buildLightTheme().backgroundColor,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '530 hotels found',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
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
                    Navigator.push<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) =>  FiltersScreen(),
                          fullscreenDialog: true),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.sort,
                              color: HotelAppTheme.buildLightTheme()
                                  .primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Divider(
          height: 1,
        ),
      )
    ],
  );
}