import 'package:flutter/material.dart';
import 'package:lunaya_demo_app/components/widgets/new_edition_form.dart';

class AddNewEditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add new edition',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              NewEditionForm(),
            ],
          ),
        ),
      ),
    );
  }
}
