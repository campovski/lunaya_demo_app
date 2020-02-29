import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Edition {
  String author;
  String imageTitle;
  String imageSrc;

  Edition({
    @required this.author,
    @required this.imageTitle,
    @required this.imageSrc,
  });

  factory Edition.fromDocumentSnapshot(DocumentSnapshot snapshot) => Edition(
        author: snapshot.data['author'],
        imageTitle: snapshot.data['image_title'],
        imageSrc: snapshot.data['image'],
      );

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'image_title': imageTitle,
      'image': imageSrc,
    };
  }
}
