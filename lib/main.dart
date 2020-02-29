import 'package:flutter/material.dart';
import 'package:lunaya_demo_app/components/widgets/add_new_edition_button.dart';

import 'components/pages/add_new_edition_page.dart';
import 'components/pages/tile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunaya Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            body: TilePage(),
            backgroundColor: Colors.black,
            floatingActionButton: AddNewEditionButton(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        ),
      ),
    );
  }
}
