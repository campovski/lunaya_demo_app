import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../models/edition.dart';

class FirestoreClient {
  static Future<List<Edition>> getEditions() async {
    final Firestore firestore = Firestore.instance;
    final QuerySnapshot querySnapshot =
        await firestore.collection('editions').getDocuments();
    return querySnapshot.documents
        .map((edition) => Edition.fromDocumentSnapshot(edition))
        .toList();
  }

  static Future<void> addEdition(Edition edition) async {
    final Firestore firestore = Firestore.instance;
    await firestore.collection('editions').add(edition.toJson());
  }

  static Future<String> uploadImage(File image) async {
    String filename = basename(image.path);
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask storageUploadTask = storageReference.putFile(image);
    await storageUploadTask.onComplete;
    return 'https://firebasestorage.googleapis.com/v0/b/marcel-2020.appspot.com/o/$filename?alt=media';
  }
}
