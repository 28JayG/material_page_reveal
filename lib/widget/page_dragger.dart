import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';

class PageDragger extends StatefulWidget {
  //TODO(8.2) Add a StreamController for SlideUpdate

  //TODO(8.4)Lets solve the error due to drag beyond required

//  final bool canDragLeftToRight;
//  final bool canDragRightToLeft;
//  final StreamController<SlideUpdate> slideUpdateStream;
//
//  const PageDragger({
//    Key key,
//    this.slideUpdateStream,
//    this.canDragLeftToRight,
//    this.canDragRightToLeft,
//  }) : super(key: key);

  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const FULL_DRAG = 300.0;

  Offset dragStartPosition;
  SlideDirection slideDirection;
  double slidePercent;

  onDragStart(DragStartDetails details) {
    dragStartPosition = details.globalPosition;
    print('DragStartPositon:$dragStartPosition');
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStartPosition != null) {
      final newPosition = details.globalPosition;
      final dx = newPosition.dx - dragStartPosition.dx;
//      if (dx < 0.0 && widget.canDragRightToLeft) {
//        slideDirection = SlideDirection.rightToLeft;
//      } else if (dx > 0.0 && widget.canDragLeftToRight) {
//        slideDirection = SlideDirection.leftToRight;
//      } else {
//        slideDirection = SlideDirection.none;
//      }
      if (dx < 0.0) {
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx > 0.0) {
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      if(slideDirection != SlideDirection.none) {
        slidePercent = (dx.abs() / FULL_DRAG).clamp(0.0, 1.0);
      }else{
        slidePercent = 0.0;
      }
    }

//    widget.slideUpdateStream.add(
//      SlideUpdate(
//        direction: slideDirection,
//        percent: slidePercent,
//        dragUpdateType: DragUpdateType.dragging,
//      ),
//    );
    print("Slide%=$slideDirection");
  }

  onDragEnd(DragEndDetails details) {
    dragStartPosition = null;
//    widget.slideUpdateStream.add(
//      SlideUpdate(
//        direction: SlideDirection.none,
//        percent: 0.0,
//        dragUpdateType: DragUpdateType.doneDragging,
//      ),
//    );
    print('DragStartPositon:$dragStartPosition');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}

//TODO:(8.3) Add enum for drag updates
//enum DragUpdateType {
//  dragging,
//  doneDragging,
//}
//TODO:(8.1)Package the SlideDirection and slidePercent together to send a stream SlideUpdate

//class SlideUpdate {
//  SlideDirection direction;
//  double percent;
//  DragUpdateType dragUpdateType;
//
//  SlideUpdate({
//    this.direction,
//    this.percent,
//    this.dragUpdateType,
//  });
//}
