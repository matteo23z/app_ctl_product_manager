import 'package:app_ctl_product_manager/common/appcolor.dart';
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
            title: Row(children: <Widget>[
          Text(
            "Tela Inicial",
            style: TextStyle(fontSize: 25.0),
          ),
          new Container(
            padding: new EdgeInsets.only(left: 90.0),
            child: new Image.network(
              "https://firebasestorage.googleapis.com/v0/b/app-ctl-product-manager.appspot.com/o/imags%2FIcons%2Fcontrop%20logo2.png?alt=media&token=2027f457-198d-4d61-b540-675a5cbed277",
              width: 60,
              height: 60,
              fit: BoxFit.fill,
            ),
          ),
        ])),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('ControP Manager'),
                decoration: BoxDecoration(
                  //image: DecorationImage(image: null, fit: BoxFit.cover),
                  color: AppColors.bar,
                ),
              ),
              ListTile(
                title: Text('Nova Dispensa'),
                onTap: () {
                  newDispesa();
                },
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.backgroud,
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
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Center(
                    child: Text(
                  "Dispensa 1",
                  style: TextStyle(
                    fontSize: 20.0, // insert your font size here
                  ),
                )),
              )),
        ),
      ),
    );
  }
}

class newDispesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
