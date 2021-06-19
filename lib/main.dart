import 'package:flutter/material.dart';
import 'package:milestone1/data/locationsAll.dart';
import 'package:milestone1/DetailsScreen.dart';
import 'models/FormPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:milestone1/models/location.dart';
import 'package:milestone1/ListScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Milestone 1',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: new MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final String title;
  MainScreen({Key key, this.title}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter;
  @override
  void initState() {
    //used to initiate counter and to "subscribe" ie start using this vairable
    // TODO: implement initState
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('favLocations')),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('locations').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (!streamSnapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: streamSnapshot.data.docs.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    ListScreen(context, streamSnapshot.data.documents[index]),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              );
            }));
  }
}
