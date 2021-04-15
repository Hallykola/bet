import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Concept1Appbar extends StatefulWidget {
  Concept1Appbar({Key key}) : super(key: key);

  @override
  _Concept1AppbarState createState() => _Concept1AppbarState();
}

class _Concept1AppbarState extends State<Concept1Appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            "Concept 1",
            style: TextStyle(
              fontFamily: "Sofia",
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: "Profile",
                  child: Text("Profile"),
                ),
                PopupMenuItem(
                  value: "Menu",
                  child: Text("Menu"),
                ),
                PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
              ],
            )
          ]),
      body: Container(),
    );
  }
}
