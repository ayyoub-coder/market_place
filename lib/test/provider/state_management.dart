

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class BlocProvier with  ChangeNotifier{
  ScrollController scrollController = new ScrollController() ;
  bool showAppbar = true;
  bool isScrollingDown = false;


  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  void init(){
    scrollController = new ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          notifyListeners();
        }
      }

      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
notifyListeners();
        }
      }
    });
  }
}