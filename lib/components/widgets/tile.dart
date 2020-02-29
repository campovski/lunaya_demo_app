import 'package:flutter/material.dart';

import '../../core/models/edition.dart';
import '../pages/detail_page.dart';

class Tile extends StatelessWidget {
  final Edition edition;

  Tile(this.edition, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetailPage(context),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.5,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.network(edition.imageSrc),
        ),
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage(edition)));
  }
}
