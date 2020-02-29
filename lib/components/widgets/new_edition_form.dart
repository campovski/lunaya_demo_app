import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/firebase/firestore_client.dart';
import '../../core/models/edition.dart';

class NewEditionForm extends StatefulWidget {
  @override
  _NewEditionFormState createState() => _NewEditionFormState();
}

class _NewEditionFormState extends State<NewEditionForm> {
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _imageTitleController = TextEditingController();

  File _image;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _authorController,
              validator: _nonEmptyValidator,
              decoration: InputDecoration(hintText: 'Author'),
            ),
            TextFormField(
              controller: _imageTitleController,
              validator: _nonEmptyValidator,
              decoration: InputDecoration(hintText: 'Image title'),
            ),
            RaisedButton(
              onPressed: _selectImage,
              child: Text('Select image ...'),
            ),
            RaisedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  String _nonEmptyValidator(value) => value.isEmpty ? 'Required' : null;

  Future<void> _selectImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<void> _submitForm() async {
    if (_image == null) {
      return;
    }

    String src = await FirestoreClient.uploadImage(_image);

    final Edition newEdition = Edition(
      author: _authorController.value.text,
      imageTitle: _imageTitleController.value.text,
      imageSrc: src,
    );

    await FirestoreClient.addEdition(newEdition);

    Navigator.pop(context);
  }
}
