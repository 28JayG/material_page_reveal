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

class _HomePageState extends State<HomePage> {
//TODO:(8.2) Bring in the StreamController to listen to the SlideUpdate
//  StreamController<SlideUpdate> streamController;
//
//  int activeIndex = 0;
//  SlideDirection slideDirection = SlideDirection.none;
//  double slidePercent = 0.0;
//  int nextIndex = 0;
//
//  _HomePageState() {
//    streamController = StreamController<SlideUpdate>();
//
//    streamController.stream.listen((SlideUpdate event) {
//      setState(() {
//        if (event.dragUpdateType == DragUpdateType.dragging) {
//        slideDirection = event.direction;
//          slidePercent = event.percent;
////          if(slideDirection == SlideDirection.leftToRight){
////            nextIndex = activeIndex -1;
////          }else if(slideDirection == SlideDirection.rightToLeft){
////            nextIndex = activeIndex +1;
////          }else{
////           nextIndex = activeIndex;
////          }
//
//          nextIndex = slideDirection == SlideDirection.leftToRight
//              ? activeIndex - 1
//              : activeIndex + 1;
//
//          nextIndex.clamp(0.0, viewModel.length - 1);
//        } else if (event.dragUpdateType == DragUpdateType.doneDragging) {
//          if (slidePercent > 0.5) {
//            activeIndex = slideDirection == SlideDirection.leftToRight
//                ? activeIndex - 1
//                : activeIndex + 1;
//          }
//
//          slideDirection = SlideDirection.none;
//          slidePercent = 0.0;
//        }
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: viewModel[0],
//            pageViewModel: viewModel[activeIndex],
            percentVisible: 1.0,
          ),
          PageReveal(
            revealPercent: 1.0,
//            revealPercent: slidePercent,
            child: Page(
              pageViewModel: viewModel[1],
              percentVisible: 1.0,
//              pageViewModel: viewModel[nextIndex],
//              percentVisible: slidePercent,
            ),
          ),
          PageIndicator(
            pageIndicatorViewModel: PageIndicatorViewModel(
              activeIndex: 1,
              pages: viewModel,
              slideDirection: SlideDirection.rightToLeft,
              slidePercent: 0.3,
//              activeIndex: activeIndex,
//              pages: viewModel,
//              slidePercent: slidePercent,
//              slideDirection: slideDirection,
            ),
          ),
          PageDragger(
//            slideUpdateStream: streamController,
//            canDragLeftToRight: activeIndex > 0,
//            canDragRightToLeft: activeIndex < viewModel.length - 1,
          ),
        ],
      ),
    );
  }
}
