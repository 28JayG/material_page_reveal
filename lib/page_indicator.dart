import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:material_page_reveal/model/page_indicator_view_model.dart';

class PageIndicator extends StatelessWidget {
  //final PageIndicatorViewModel pageIndicatorViewModel;

  //const PageIndicator({Key key, this.pageIndicatorViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0x88FFFFFFF),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Color(0x88FFFFFFF),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/shopping_cart.png',
                    color: Colors.green,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0x88FFFFFF),
                      width: 3.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/shopping_cart.png',
                    color: Colors.green,
                  ),
                ),
              ),
            ],
//            children: <Widget>[
//              PageBubble(
//                pageBubbleViewModel: PageBubbleViewModel(
//                  color: Colors.purple,
//                  iconURI: 'assets/shopping_cart.png',
//                  isHollow: false,
//                  activePercent: 0.0,
//                ),
//              ),
//              PageBubble(
//                pageBubbleViewModel: PageBubbleViewModel(
//                  color: Colors.purple,
//                  iconURI: 'assets/shopping_cart.png',
//                  isHollow: false,
//                  activePercent: 1.0,
//                ),
//              ),
//              PageBubble(
//                pageBubbleViewModel: PageBubbleViewModel(
//                  color: Colors.purple,
//                  iconURI: 'assets/shopping_cart.png',
//                  isHollow: true,
//                  activePercent: 0.0,
//                ),
//              ),
//            ],
          ),
        ),
      ],
    );
  }
}


//TODO:(3.3) Create a PageIndicatorViewModel
//TODO:(3.2) Create a PageBubble and PageBubbleViewModel
//class PageBubble extends StatelessWidget {
//  final PageBubbleViewModel pageBubbleViewModel;
//
//  const PageBubble({Key key, this.pageBubbleViewModel}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      child: Container(
//        width: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
//        height: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
//        decoration: BoxDecoration(
//            color: pageBubbleViewModel.isHollow
//                ? Colors.transparent
//                : Color(0x88FFFFFFF),
//            shape: BoxShape.circle,
//            border: Border.all(
//              color: pageBubbleViewModel.isHollow
//                  ? Color(0x88FFFFFF)
//                  : Colors.transparent,
//              width: 3.0,
//            )),
//        child: Opacity(
//          opacity: pageBubbleViewModel.activePercent,
//          child: Image.asset(
//            pageBubbleViewModel.iconURI,
//            color: pageBubbleViewModel.color,
//          ),
//        ),
//      ),
//    );
//  }
//}
