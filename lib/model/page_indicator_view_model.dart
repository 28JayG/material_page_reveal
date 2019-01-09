import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_view_model.dart';

class PageBubbleViewModel {
  final String iconURI;
  final bool isHollow;
  final double activePercent;
  final Color color;

  PageBubbleViewModel({
    this.iconURI,
    this.isHollow,
    this.activePercent,
    this.color,
  });
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
}

class PageIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final double slidePercent;
  final SlideDirection slideDirection;

  PageIndicatorViewModel({
    this.pages,
    this.activeIndex,
    this.slidePercent,
    this.slideDirection,
  });
}
