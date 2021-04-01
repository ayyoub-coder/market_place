import 'package:flutter/cupertino.dart';

class ListCategory{

  final String name;
  final List<ListProduct> producs;

  const ListCategory({@required this.name, @required this.producs});
}

class ListProduct{
 final String name;
 final String description;
 final double Price;
 final  String image;

 const ListProduct(@required this.name,@required this.description,@required this.Price,@required this.image);
}

const AyoubCategories = [
  ListCategory(name: 'category 1', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg'),
  ]),


  ListCategory(name: 'category 2', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),


  ListCategory(name: 'category 3', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 4', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner4.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 5', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 6', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner1.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 7', producs: [
    ListProduct('prodcut 1','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 8', producs: [
    ListProduct('prodcut 1 FOR category 8','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2 FOR category 8','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3 FOR category 8','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4 FOR category 8','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5 FOR category 8','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6 FOR category 8','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 9', producs: [
    ListProduct('prodcut 1 FOR category 9','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2 FOR category 9','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3 FOR category 9','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4 FOR category 9','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5 FOR category 9','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6 FOR category 9','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 10', producs: [
    ListProduct('prodcut 1 FOR category 10','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2 FOR category 10','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3 FOR category 10','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4 FOR category 10','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5 FOR category 10 ','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6 FOR category 10','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),

  ListCategory(name: 'category 11', producs: [
    ListProduct('prodcut 1 FOR category 11 ','description of product 1', 343.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/bannerB.jpg'),
    ListProduct('prodcut 2 FOR category 11','description of product 2', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 3 FOR category 11','description of product 3', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 4 FOR category 11','description of product 4', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 5 FOR category 11','description of product 5', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
    ListProduct('prodcut 6 FOR category 11 ','description of product 6', 143.00, 'https://blegourmet.ma/wp-content/uploads/2021/01/banner2.jpg'),
  ]),
];