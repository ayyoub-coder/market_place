import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/slide.dart';
import 'package:market_place/widget/home_slider_loader_widget.dart';


class HomeSliderWidget extends StatefulWidget {
  List<Slide> slides;

  HomeSliderWidget({this.slides});

  @override
  _HomeSliderWidgetState createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.slides == null || widget.slides.isEmpty
        ? HomeSliderLoaderWidget()
        : Stack(
          alignment: Alignment.center  ,
          fit: StackFit.passthrough,
          children: <Widget>[
         CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            height: 180,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.slides.map((Slide slide) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: 140,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.15), blurRadius: 15, offset: Offset(0, 2)),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: slide.url,
                          placeholder: (context, url) => Image.asset(
                            'assets/img/loading.gif',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 140,
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                                Text(
                                  slide.text,
                                  style: Theme.of(context).textTheme.headline6.merge(
                                    TextStyle(
                                      fontSize: 14,
                                      height: 1,
                                      color: Colors.red,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  maxLines: 3,
                                ),

                                FlatButton(
                                  onPressed: () {
                                  },
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  color:  ThemeData().accentColor,
                                  shape: StadiumBorder(),
                                  child: Text(
                                    'slide.button',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Theme.of(context).primaryColor),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 0,
          child: Container(

            margin: EdgeInsets.symmetric(vertical: 22, horizontal: 42),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: widget.slides.map((Slide slide) {
                return Container(
                  width: 20.0,
                  height: 3.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: _current == widget.slides.indexOf(slide)
                          ? Colors.redAccent
                          : Colors.red.withOpacity(0.3)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
