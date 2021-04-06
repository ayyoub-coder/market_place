import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:market_place/utility/constants.dart';
import 'package:url_launcher/url_launcher.dart';



class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            powersAndAbilities,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 5,
              colors: [MainColorLight, MainColor],
              stops: const [0, 0.4] ,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(

                child: InkWell(
                  onTap: (){
                    _launchURL();
                  },
                  child: Text(
                    "https://www.google.com/",
                    style: GoogleFonts.inconsolata(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),

              ),
                ),
            ),
          ),
        ),
        SizedBox(height: 50,)
      ],
    );
  }
  _launchURL() async {
    const url = 'https://google.com.br';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
