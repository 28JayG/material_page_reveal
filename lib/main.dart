import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';
import 'package:material_page_reveal/model/page_view_model.dart';
import 'package:material_page_reveal/page_indicator.dart';
import 'package:material_page_reveal/pages.dart';
import 'package:material_page_reveal/widget/page_dragger.dart';
import 'package:material_page_reveal/widget/page_reveal.dart';

main() {
  runApp(MaterialPageReveal());
}

class MaterialPageReveal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Page Reveal',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  StreamController<SlideUpdate> streamController;

  //TODO:(9.3) Bring in AnimatedDragger
//  AnimatedDragger animatedDragger;

  int activeIndex = 1;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;
  int nextIndex = 0;

  _HomePageState() {
    streamController = StreamController<SlideUpdate>();

    streamController.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.dragUpdateType == DragUpdateType.dragging) {
          slideDirection = event.direction;
          slidePercent = event.percent;
          if (slideDirection == SlideDirection.leftToRight) {
            nextIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextIndex = activeIndex + 1;
          } else {
            nextIndex = activeIndex;
          }
        } else if (event.dragUpdateType == DragUpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            activeIndex = slideDirection == SlideDirection.leftToRight
                ? activeIndex - 1
                : activeIndex + 1;

//            animatedDragger = AnimatedDragger(
//              slideDirection: slideDirection,
//              slidePercent: slidePercent,
//              slideUpdateStream: streamController,
//              transitionGoal: TransitionGoal.open,
//              vsync: this,
//            );
          }
          slideDirection = SlideDirection.none;
          slidePercent = 0.0;
//          else {
//            animatedDragger = AnimatedDragger(
//              slideUpdateStream: streamController,
//              vsync: this,
//              transitionGoal: TransitionGoal.close,
//              slidePercent: slidePercent,
//              slideDirection: slideDirection,
//            );
//            nextIndex = activeIndex;
//
//          }

//          animatedDragger.run();
        }
//        else if(event.dragUpdateType == DragUpdateType.animating){
//          slideDirection = event.direction;
//          slidePercent = event.percent;
//        }
//        else if (event.dragUpdateType == DragUpdateType.doneAnimating) {
//
//          activeIndex = nextIndex;
//
//          slideDirection = SlideDirection.none;
//          slidePercent = 0.0;
//
//          animatedDragger.dispose();
//        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: viewModel[activeIndex],
            percentVisible: 1.0,
          ),
          PageReveal(
            revealPercent: slidePercent,
            child: Page(
              pageViewModel: viewModel[nextIndex],
              percentVisible: slidePercent,
            ),
          ),
          PageIndicator(
            pageIndicatorViewModel: PageIndicatorViewModel(
              activeIndex: activeIndex,
              pages: viewModel,
              slidePercent: slidePercent,
              slideDirection: slideDirection,
            ),
          ),
          PageDragger(
            slideUpdateStream: streamController,
            canDragLeftToRight: activeIndex > 0,
            canDragRightToLeft: activeIndex < viewModel.length - 1,
          ),
        ],
      ),
    );
  }
}
