import 'package:flutter/material.dart';

import '../../core/models/edition.dart';

class DetailPage extends StatelessWidget {
  final Edition edition;

  DetailPage(this.edition, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Author: ${edition.author}'),
                Text(edition.imageTitle),
                Image.network(edition.imageSrc),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
