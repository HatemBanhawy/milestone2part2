import 'package:flutter/material.dart';
import 'package:milestone1/data/locationsAll.dart';
import 'package:milestone1/models/Location.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Location location;

  const DetailsScreen({Key key, this.location}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(location.name),
          Image.network(location.imageUrl),
          Text(location.description),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          launch(location.locationUrl);
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
