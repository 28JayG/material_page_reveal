
import 'dart:math';

import 'package:flutter/material.dart';

class PageReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  const PageReveal({
    Key key,
    this.revealPercent,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: child,
      clipper: CircleClipper(revealPercent),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  final double revealPercent;

  CircleClipper(this.revealPercent);

  @override
  Rect getClip(Size size) {
    Offset epicenter = Offset(size.width / 2, size.height * 0.9);

    double theta = atan(epicenter.dy / epicenter.dx);

    double distanceToCorner = epicenter.dy / sin(theta);

    double radius = distanceToCorner * revealPercent;
    double diameter = radius * 2;

    return Rect.fromLTWH(
      epicenter.dx - radius,
      epicenter.dy - radius,
      diameter,
      diameter,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
