import 'package:flutter/material.dart';
import 'package:material_page_reveal/model/page_view_model.dart';
import 'package:material_page_reveal/page_indicator.dart';
import 'package:material_page_reveal/pages.dart';
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
            pageViewModel: viewModel[1],
          ),
          PageReveal(
            revealPercent: 1.0,
            child: Page(
              pageViewModel: viewModel[2],
            ),
          ),
PageIndicator(),
        ],
      ),
    );
  }
}
