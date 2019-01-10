import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_indicator_view_model.dart';
import 'package:material_page_reveal/model/page_view_model.dart';
import 'package:material_page_reveal/page_indicator.dart';
import 'package:material_page_reveal/pages.dart';
//import 'package:material_page_reveal/widget/page_dragger.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: viewModel[0],
          ),
          PageReveal(
            revealPercent: 1.0,
            child: Page(
              pageViewModel: viewModel[1],
            ),
          ),
          PageIndicator(
            pageIndicatorViewModel: PageIndicatorViewModel(
              activeIndex: 1,
              pages: viewModel,
              slideDirection: SlideDirection.rightToLeft,
              slidePercent: 0.3,
            ),
          ),
//TODO(7.2)Bring in the Page adder to the top
//          PageDragger(),
        ],
      ),
    );
  }
}
