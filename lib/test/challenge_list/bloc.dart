

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/test/challenge_list/data.dart';

const categoryHeight =55.0;
const productHeight  = 100.0;

class ListBloc extends ChangeNotifier {
  TabController  tabController ;
  List<AyoubTabCategory> tabs = [];
  List<ListItem> items = [];
  ScrollController scrollController = ScrollController();
  bool listen = true;
  void init(TickerProvider ticker){

    double offsetFrom = 0.0;
    double offsetTo = 0.0;

    tabController = TabController(vsync: ticker,length: AyoubCategories.length);

    for( int i = 0; i< AyoubCategories.length;i++){
      final category = AyoubCategories[i];

      if(i>0){
        offsetFrom += AyoubCategories[i-1].producs.length * productHeight;
      }

      if(i < AyoubCategories.length -1){
          offsetTo = offsetFrom + AyoubCategories[i+1].producs.length * productHeight;
      }else
        {
        offsetTo = double.infinity;
        }

      tabs.add(AyoubTabCategory(
          category: category,
          selected: i==0,
          offsetForm: categoryHeight * i + offsetFrom,
          offsetTo: offsetTo
      ));

      items.add(ListItem(category: category));

      for(int j=0;j<category.producs.length;j++){
         final products = category.producs[j];
         items.add(ListItem(product: products));
      }

    }

  scrollController.addListener(_onScrollListener);

  }

  void _onScrollListener(){
   if(listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];
        if (scrollController.offset >= tab.offsetForm &&
            scrollController.offset <= tab.offsetTo &&
            !tab.selected) {
          onTabCategorySelected(i, animatedREquired: false);
          tabController.animateTo(i);
          break;
        }
      }
    }
  }
  void onTabCategorySelected(int index , {bool animatedREquired = true}) async{
    final selected = tabs[index];
    print(index);
    for(int i = 0 ; i < tabs.length ; i++){
      final condition = selected.category.name == tabs[i].category.name;
        tabs[i] = tabs[i].copyWith(condition);
      }
    notifyListeners();

    if(animatedREquired){
      listen = false;
     await scrollController.animateTo(
          selected.offsetForm,
          duration: const Duration(milliseconds: 600),
          curve: Curves.linear);
     listen = true;
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollListener);
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}

class AyoubTabCategory{
  final ListCategory category;
  final bool selected;
  final double offsetForm;
  final double offsetTo;
  AyoubTabCategory({@required this.category,@required this.selected,@required this.offsetForm, @required this.offsetTo,});

  AyoubTabCategory copyWith(bool selected)=>AyoubTabCategory(category: category, selected: selected,offsetForm: offsetForm,offsetTo: offsetTo);
}

class ListItem{
  final  ListCategory category;
  final ListProduct product ;

  const ListItem({ this.category, this.product});

  bool get isCategory => category != null;
}