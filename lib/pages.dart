//TODO:(1.2)Create a Page Widget which will take a PageViewModel

//import 'package:flutter/material.dart';
//import 'package:material_page_reveal/model/page_view_model.dart';
//
//class Page extends StatelessWidget {
//
//  final PageViewModel pageViewModel;
//
//  const Page({Key key, this.pageViewModel}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: pageViewModel.backgroundColor,
//      child: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(bottom:25.0),
//              child: Image.asset(
//                pageViewModel.logoURI,
//                width: 200.0,
//                height: 200.0,
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.symmetric(vertical:10.0),
//              child: Text(
//                pageViewModel.title,
//                style: TextStyle(
//                  fontSize: 35.0,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(bottom:75.0),
//              child: Text(
//                pageViewModel.description,
//                style: TextStyle(
//                  fontSize: 25.0,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
