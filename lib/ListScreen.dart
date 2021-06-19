import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:milestone1/models/Location.dart';

import 'DetailsScreen.dart';

Widget ListScreen(BuildContext context, DocumentSnapshot snapshot) {
  Location location = new Location(
    name: snapshot['name'],
    theme: snapshot['theme'],
    description: snapshot['description'],
    imageUrl: snapshot['image_url'],
    locationUrl: snapshot['location_url'],
  );
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(location: location)));
      },
      child: Column(
        children: [
          Container(
            child: Image.network(location.imageUrl),
          ),
          ListTile(
            title: Text(location.name, textAlign: TextAlign.center),
            subtitle: Text(location.theme, textAlign: TextAlign.center),
          )
        ],
      ),
    ),
  );
}
