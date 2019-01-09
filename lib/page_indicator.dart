import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';

class PageIndicator extends StatelessWidget {
  final PageIndicatorViewModel pageIndicatorViewModel;

  const PageIndicator({Key key, this.pageIndicatorViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO:(4.1) Develope a Indicator View Model for each Page
//    final List<PageBubble> bubbles = [];
//
//    for (int i = 0; i < pageIndicatorViewModel.pages.length; i++) {
//      final page = pageIndicatorViewModel.pages[i];
//
//      bubbles.add(
//        PageBubble(
//          pageBubbleViewModel: PageBubbleViewModel(
//            color: page.backgroundColor,
//            iconURI: page.iconURI,
//            isHollow: i > pageIndicatorViewModel.activeIndex,
//            activePercent: i == pageIndicatorViewModel.activeIndex ? 1.0 : 0.0,
//          ),
//        ),
//      );
//    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            //TODO:(4.2) Pass your bubbles as children
            //children: bubbles,

            children: <Widget>[
              PageBubble(
                pageBubbleViewModel: PageBubbleViewModel(
                  color: Colors.purple,
                  iconURI: 'assets/shopping_cart.png',
                  isHollow: false,
                  activePercent: 0.0,
                ),
              ),
              PageBubble(
                pageBubbleViewModel: PageBubbleViewModel(
                  color: Colors.purple,
                  iconURI: 'assets/shopping_cart.png',
                  isHollow: false,
                  activePercent: 1.0,
                ),
              ),
              PageBubble(
                pageBubbleViewModel: PageBubbleViewModel(
                  color: Colors.purple,
                  iconURI: 'assets/shopping_cart.png',
                  isHollow: true,
                  activePercent: 0.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel pageBubbleViewModel;

  const PageBubble({Key key, this.pageBubbleViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
        height: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
        decoration: BoxDecoration(
            color: pageBubbleViewModel.isHollow
                ? Colors.transparent
                : Color(0x88FFFFFFF),
            shape: BoxShape.circle,
            border: Border.all(
              color: pageBubbleViewModel.isHollow
                  ? Color(0x88FFFFFF)
                  : Colors.transparent,
              width: 3.0,
            )),
        child: Opacity(
          opacity: pageBubbleViewModel.activePercent,
          child: Image.asset(
            pageBubbleViewModel.iconURI,
            color: pageBubbleViewModel.color,
          ),
        ),
      ),
    );
  }
}
