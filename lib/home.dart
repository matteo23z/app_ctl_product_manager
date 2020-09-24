import 'package:app_ctl_product_manager/dispensa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeNome = 'Home';
  @override
  Home_State createState() => Home_State();
}

class Home_State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tela Inicial"),
          //leading:
          //child: Icon(Icons.menu, color: Colors.white),
          //   onPressed: () {},
          // ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('ControP Manager'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Nova Dispensa'),
                onTap: () {
                  //
                },
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(Dispensa.routeNome);
          },
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                width: 300.0,
                height: 150.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.black)),
                child: Center(child: Text("Dispensa 1")),
              )),
        ),
      ),
    );
  }
}
