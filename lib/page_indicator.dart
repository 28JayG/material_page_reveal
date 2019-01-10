import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';

class PageIndicator extends StatelessWidget {
  final PageIndicatorViewModel pageIndicatorViewModel;

  const PageIndicator({Key key, this.pageIndicatorViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PageBubble> bubbles = [];

    for (int i = 0; i < pageIndicatorViewModel.pages.length; i++) {
      final page = pageIndicatorViewModel.pages[i];

      var activePercent;
      if (i == pageIndicatorViewModel.activeIndex) {
        activePercent = 1.0 - pageIndicatorViewModel.slidePercent;
      } else if (i == pageIndicatorViewModel.activeIndex - 1 &&
          pageIndicatorViewModel.slideDirection == SlideDirection.leftToRight) {
        activePercent = pageIndicatorViewModel.slidePercent;
      } else if (i == pageIndicatorViewModel.activeIndex + 1 &&
          pageIndicatorViewModel.slideDirection == SlideDirection.rightToLeft) {
        activePercent = pageIndicatorViewModel.slidePercent;
      } else {
        activePercent = 0.0;
      }

      var isHollow = i > pageIndicatorViewModel.activeIndex ||
          (i == pageIndicatorViewModel.activeIndex &&
              pageIndicatorViewModel.slideDirection ==
                  SlideDirection.leftToRight);
      bubbles.add(
        PageBubble(
          pageBubbleViewModel: PageBubbleViewModel(
            color: page.backgroundColor,
            iconURI: page.iconURI,
            isHollow: isHollow,
            activePercent: activePercent,
          ),
        ),
      );
    }

    final bubbleWidth = 55.0;
    final baseTranslation =
        (pageIndicatorViewModel.pages.length * bubbleWidth) / 2 -
            bubbleWidth / 2;
    var translation =
        baseTranslation - (bubbleWidth * pageIndicatorViewModel.activeIndex);

    if (pageIndicatorViewModel.slideDirection == SlideDirection.leftToRight) {
      translation += bubbleWidth * pageIndicatorViewModel.slidePercent;
    } else if (pageIndicatorViewModel.slideDirection ==
        SlideDirection.rightToLeft) {
      translation -= bubbleWidth * pageIndicatorViewModel.slidePercent;
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Transform(
            transform: Matrix4.translationValues(translation, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bubbles,
            ),
          ),
        ),
      ],
    );
  }
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel pageBubbleViewModel;

  const PageBubble({Key key, this.pageBubbleViewModel}) : super(key: key);

  //TODO:(6.1) Wrap the bubble with Container
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 65.0,
      child: Center(
        child: Container(
          width: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
          height: lerpDouble(20.0, 45.0, pageBubbleViewModel.activePercent),
          decoration: BoxDecoration(
              color: pageBubbleViewModel.isHollow
                  ? Color(0x88FFFFFFF).withAlpha(
                      (0x88 * pageBubbleViewModel.activePercent).round())
                  : Color(0x88FFFFFFF),
              shape: BoxShape.circle,
              border: Border.all(
                color: pageBubbleViewModel.isHollow
                    ? Color(0x88FFFFFF).withAlpha(
                        (0x88 * (1.0 - pageBubbleViewModel.activePercent))
                            .round())
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
      ),
    );
  }
}
