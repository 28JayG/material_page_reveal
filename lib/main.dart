
//TODO:(1.1)Create a Page and extract the code to another file
//import 'package:flutter/material.dart';
////import 'package:material_page_reveal/model/page_view_model.dart';
////import 'package:material_page_reveal/pages.dart';
//
//main() {
//  runApp(MaterialPageReveal());
//}
//
//class MaterialPageReveal extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Material Page Reveal',
//      home: HomePage(),
//    );
//  }
//}
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Stack(
//        children: <Widget>[
//
//
//      Container(
//      color: Colors.blue,
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(bottom:25.0),
//                child: Image.asset(
//                  'assets/banks.png',
//                  width: 200.0,
//                  height: 200.0,
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.symmetric(vertical:10.0),
//                child: Text(
//                  'Banks',
//                  style: TextStyle(
//                    fontSize: 35.0,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(bottom:75.0),
//                child: Text(
//                  'Simple Description',
//                  style: TextStyle(
//                    fontSize: 25.0,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      );

//TODO:(1.4) Instantiate a new Page()
////          Page(
////            pageViewModel: PageViewModel(
////                backgroundColor: Colors.blue,
////                description: 'A simple Description',
////                title: 'Banks',
////                logoURI: 'assets/banks.png',
////            ),
////          ),
//        ],
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';

main(){runApp(MaterialApp(home: App()),);}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Data'),);
  }
}
