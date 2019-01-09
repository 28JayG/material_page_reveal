import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_view_model.dart';

class Page extends StatelessWidget {
  final PageViewModel pageViewModel;
  final double percentVisible;

  const Page({
    Key key,
    this.pageViewModel,
    this.percentVisible = 1.0,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageViewModel.backgroundColor,
      child: Center(
        child: Opacity(
          opacity: percentVisible,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Transform(
                  transform: Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Image.asset(
                      pageViewModel.logoURI,
                      width: 200.0,
                      height: 200.0,
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      pageViewModel.title,
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 75.0),
                    child: Text(
                      pageViewModel.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
