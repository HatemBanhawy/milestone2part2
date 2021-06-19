import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FormPage extends StatefulWidget {
  //const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _name;
  String _theme;
  String _description;
  String _imageUrl;
  String _locationUrl;

  int _counter;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Location Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'name is required';
        }
        return '';
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildTheme() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "theme",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'theme is required';
        }
        return null;
      },
      onSaved: (String value) {
        _theme = value;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "full description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      validator: (String value) {
        if (value.isEmpty) {
          return 'description is required';
        }
        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  Widget _buildImageUrl() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "image url",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'url is required';
        }
        return null;
      },
      onSaved: (String value) {
        _imageUrl = value;
      },
    );
  }

  Widget _buildLocationUrl() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "location url",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          )),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'url is required';
        }
        return null;
      },
      onSaved: (String value) {
        _locationUrl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Form Demo")),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildName(),
                  _buildTheme(),
                  _buildDescription(),
                  _buildImageUrl(),
                  _buildLocationUrl(),
                  SizedBox(height: 100),
                  ElevatedButton(
                      onPressed: () {
                        // flutter
                        _formKey.currentState.save();
                        print("rrrrrrrrrrrrrrrrr" + _theme);
                        FirebaseFirestore.instance.collection('locations').add({
                          'name': _name,
                          'theme': _theme,
                          'description': _description,
                          'image_url': _imageUrl,
                          'location_url': _locationUrl
                        });

                        //  FirebaseFirestore.instance
                        // .collection('locations')
                        // .add({'theme': _theme});
                        //  FirebaseFirestore.instance
                        // .collection('locations')
                        // .add({'description': _description});
                        //  FirebaseFirestore.instance
                        // .collection('locations')
                        // .add({'image_url': _imageUrl});
                        //  FirebaseFirestore.instance
                        // .collection('locations')
                        // .add({'location_url': _locationUrl});

                        //print(_name);
                        //print(_theme);
                        //print(_description);
                        //print(_imageUrl);
                        //print(_locationUrl);
                      },
                      child: Text('add'))
                ],
              ),
            ),
          ),
        ));
  }

  void _retrieve() {
    FirebaseFirestore.instance.collection('locations').snapshots();
    AsyncSnapshot<QuerySnapshot> streamSnapshot;
  }
}
