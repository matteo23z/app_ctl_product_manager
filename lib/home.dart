import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:app_ctl_product_manager/dispensa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

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
              UserAccountsDrawerHeader(
                accountName: Text("Controp"),
                accountEmail: Text("controp@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/app-ctl-product-manager.appspot.com/o/imags%2FIcons%2Fcontrop%20logo2.png?alt=media&token=2027f457-198d-4d61-b540-675a5cbed277",
                  ),
                  backgroundColor: Colors.transparent,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bar,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Tela Inicial"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Voltando...');
                },
              ),
              ListTile(
                leading: Icon(Icons.add_circle),
                title: Text("Criar Nova Dispensa"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Criando...');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configurações"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Criando...');
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Criando...');
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Informações"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Criando...');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                //subtitle: Text("meus favoritos..."),
                //trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.of(context).pushNamed(Login.routeNome);
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
              child: Column(children: <Widget>[
                Row(children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: new EdgeInsets.only(left: 240.0, top: 10.0),
                      child: Icon(
                        Icons.more_vert,
                        size: 30.0,
                      ),
                    ),
                  ),
                ]),
                Container(
                  padding: new EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text(
                    "Dispensa 1",
                    style: TextStyle(
                      fontSize: 25.0, // insert your font size here
                    ),
                  )),
                ),
              ]),
            ),
          ),
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
