import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dispensa extends StatefulWidget {
  static const routeNome = 'Dispensa';
  @override
  Dispensa_State createState() => Dispensa_State();
}

class Dispensa_State extends State<Dispensa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Dispensa 1"), actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              ))
        ]),

        //leading:
        //child: Icon(Icons.menu, color: Colors.white),
        //   onPressed: () {},
        // ),

        body: Container(child: Center(child: Text("Hello Word"))),
      ),
    );
  }
}
