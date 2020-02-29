import 'package:flutter/material.dart';

import '../../core/firebase/firestore_client.dart';
import '../widgets/tile.dart';

class TilePage extends StatefulWidget {
  @override
  _TilePageState createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: FirestoreClient.getEditions(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading ...'),
                ],
              ),
            );
          }
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              snapshot.data.length,
              (index) {
                return Tile(snapshot.data[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
