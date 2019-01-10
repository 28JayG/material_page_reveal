import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';

class PageDragger extends StatefulWidget {
  final bool canDragLeftToRight;
  final bool canDragRightToLeft;
  final StreamController<SlideUpdate> slideUpdateStream;

  const PageDragger({
    Key key,
    this.slideUpdateStream,
    this.canDragLeftToRight,
    this.canDragRightToLeft,
  }) : super(key: key);

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
      if (dx < 0.0 && widget.canDragRightToLeft) {
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx > 0.0 && widget.canDragLeftToRight) {
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      if (slideDirection != SlideDirection.none) {
        slidePercent = (dx.abs() / FULL_DRAG).clamp(0.0, 1.0);
      } else {
        slidePercent = 0.0;
      }
    }

    widget.slideUpdateStream.add(
      SlideUpdate(
        direction: slideDirection,
        percent: slidePercent,
        dragUpdateType: DragUpdateType.dragging,
      ),
    );
    print("Slide%=$slideDirection");
  }

  onDragEnd(DragEndDetails details) {
    dragStartPosition = null;
    widget.slideUpdateStream.add(
      SlideUpdate(
        direction: SlideDirection.none,
        percent: 0.0,
        dragUpdateType: DragUpdateType.doneDragging,
      ),
    );

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

enum DragUpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

class SlideUpdate {
  SlideDirection direction;
  double percent;
  DragUpdateType dragUpdateType;

  SlideUpdate({
    this.direction,
    this.percent,
    this.dragUpdateType,
  });
}

//TODO:(9.2) Get your Goals :-p
//enum TransitionGoal {
//  open,
//  close,
//}
//TODO:(9.1) Create a AnimatedDragger
//class AnimatedDragger {
//  static const PERCENT_PER_MILLISECOND = 0.005;
//
//  SlideDirection slideDirection;
//  TransitionGoal transitionGoal;
//
//  AnimationController completionAnimation;
//
//  AnimatedDragger({
//    this.slideDirection,
//    this.transitionGoal,
//    slidePercent,
//    StreamController<SlideUpdate> slideUpdateStream,
//    TickerProvider vsync,
//  }) {
//    final startPercent = slidePercent;
//    var endPercent;
//    var duration;
//
//    if (transitionGoal == TransitionGoal.open) {
//      endPercent = 1.0;
//      final slideRemaining = 1.0 - slidePercent;
//      duration = Duration(
//        milliseconds: (slideRemaining / PERCENT_PER_MILLISECOND).round(),
//      );
//    } else if (transitionGoal == TransitionGoal.close) {
//      endPercent = 0.0;
//      duration = Duration(
//        milliseconds: (slidePercent / PERCENT_PER_MILLISECOND).round(),
//      );
//    }
//
//    completionAnimation = AnimationController(
//      vsync: vsync,
//      duration: duration,
//    )
//      ..addListener(() {
//        slidePercent =
//            lerpDouble(startPercent, endPercent, completionAnimation.value);
//
//        slideUpdateStream.add(SlideUpdate(
//          dragUpdateType: DragUpdateType.animating,
//          percent: slidePercent,
//          direction: slideDirection,
//        ));
//      })
//      ..addStatusListener((AnimationStatus status) {
//        if (status == AnimationStatus.completed) {
//          slideUpdateStream.add(
//            SlideUpdate(
//              direction: slideDirection,
//              percent: endPercent,
//              dragUpdateType: DragUpdateType.doneAnimating,
//            ),
//          );
//        }
//      });
//  }
//
//  run(){
//    completionAnimation.forward(from: 0.0);
//  }
//
//  dispose(){
//    completionAnimation.dispose();
//  }
//}
