//import 'package:flutter/material.dart';
//import 'package:material_page_reveal/model/page_indicator_view_model.dart';
//
//class PageDragger extends StatefulWidget {
//  @override
//  _PageDraggerState createState() => _PageDraggerState();
//}
//
//class _PageDraggerState extends State<PageDragger> {
//
//static const FULL_DRAG = 300.0;
//
//  Offset dragStartPosition;
//  SlideDirection slideDirection;
//  double slidePercent;
//
//  onDragStart(DragStartDetails details){
//    dragStartPosition = details.globalPosition;
//    print('DragStartPositon:$dragStartPosition');
//  }
//  onDragUpdate(DragUpdateDetails details){
//    if(dragStartPosition != null) {
//      final newPosition = details.globalPosition;
//      final dx = newPosition.dx - dragStartPosition.dx;
//      if (dx < 0.0) {
//        slideDirection = SlideDirection.rightToLeft;
//      } else if (dx > 0.0) {
//        slideDirection = SlideDirection.leftToRight;
//      } else {
//        slideDirection = SlideDirection.none;
//      }
//
//      slidePercent = (dx.abs()/FULL_DRAG).clamp(0.0, 1.0);
//    }
//
//    print("Slide%=$slideDirection");
//
//  }
//  onDragEnd(DragEndDetails details) {
//    dragStartPosition = null;
//    print('DragStartPositon:$dragStartPosition');
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onHorizontalDragStart: onDragStart,
//      onHorizontalDragUpdate: onDragUpdate,
//      onHorizontalDragEnd: onDragEnd,
//    );
//  }
//
//
//}
//TODO:(7) Create a Dragger Widget