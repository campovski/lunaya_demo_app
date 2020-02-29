import 'package:flutter/material.dart';

import '../pages/add_new_edition_page.dart';

class AddNewEditionButton extends FloatingActionButton {
  final BuildContext context;

  AddNewEditionButton(this.context)
      : super(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewEditionPage())),
          backgroundColor: Colors.green,
          tooltip: 'Add new edition',
          child: Icon(
            Icons.add,
            size: 40,
          ),
        );
}
