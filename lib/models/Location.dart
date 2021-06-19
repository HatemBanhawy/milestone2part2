import 'package:flutter/material.dart';

void main(){
  runApp(Location());
}
class Location extends StatelessWidget {
  final int id;
  final String name;
  final String theme;
  final String description;
  final String imageUrl;
  final String locationUrl;

  Location({Key key, this.id, this.name, this.theme, this.description, this.imageUrl, this.locationUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
