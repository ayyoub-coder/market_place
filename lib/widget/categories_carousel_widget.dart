import 'package:flutter/material.dart';
import 'package:market_place/model/category.dart';
import 'package:market_place/widget/categoriesCarouelItemWidget.dart';
import 'package:market_place/widget/circularLoadingWidget.dart';



// ignore: must_be_immutable
class CategoriesCarouselWidget extends StatelessWidget {
  List<Category> categories;

  CategoriesCarouselWidget({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.categories.isEmpty
        ? CircularLoadingWidget(height: 150)
        : Container(
        height: 120,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: this.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            double _marginLeft = 0;
            (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
            return new CategoriesCarouselItemWidget(
              marginLeft: _marginLeft,
              category: this.categories.elementAt(index),
            );
          },
        ));
  }
}
