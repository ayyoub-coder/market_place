import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:market_place/page/store/data.dart';






import 'package:market_place/utility/constants.dart';



const _blueColor = MainColor;
const _greenColor = Color(0xFF2BBEBA);
const categoryHeight = 55.0;
const productHeight = 100.0;


class ListCategoryItem extends StatelessWidget {
  const ListCategoryItem(this.category);
  final ListCategory category;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category.name,
            style: TextStyle(
                color: _blueColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class ListProductItem extends StatelessWidget {
  const ListProductItem(this.product);
  final ListProduct  product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shadowColor: Colors.black54,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(12),
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    placeholder: (context, url) => CircularProgressIndicator(),
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          color: _blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(color: _blueColor, fontSize: 12),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${product.Price.toString()}\ Dh',
                      style: TextStyle(
                          color: _greenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
