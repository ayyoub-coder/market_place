import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:market_place/test/challenge_list/bloc.dart';
import 'package:market_place/test/challenge_list/data.dart';


const _backgroundColor = Color(0xFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFF2BBEBA);
const categoryHeight = 55.0;
const productHeight = 100.0;

class MainConcept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: _ListConcept(),
    );
  }
}

class _ListConcept extends StatefulWidget {
  @override
  _ListConceptState createState() => _ListConceptState();
}

class _ListConceptState extends State<_ListConcept>
    with SingleTickerProviderStateMixin {
  final _bloc = ListBloc();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                child: TabBar(
                  onTap: _bloc.onTabCategorySelected,
                  indicatorWeight: 0.1,
                  isScrollable: true,
                  controller: _bloc.tabController,
                  tabs: _bloc.tabs.map((e) => AyoubTabWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    controller: _bloc.scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _bloc.items.length,
                    itemBuilder: (context, index) {
                      final item = _bloc.items[index];
                      return (item.isCategory)
                          ? ListCategoryItem(item.category)
                          : ListProductItem(item.product);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AyoubTabWidget extends StatelessWidget {
  final AyoubTabCategory tabCategory;

  const AyoubTabWidget(this.tabCategory);

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            tabCategory.category.name,
            style: TextStyle(
                color: _blueColor, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }
}

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
  final ListProduct product;
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
