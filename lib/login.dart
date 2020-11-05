import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cadastro.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const routeNome = 'Login';
  @override
  Login_State createState() => Login_State();
}

class Login_State extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.bar,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                new Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/app-ctl-product-manager.appspot.com/o/imags%2FIcons%2Fcontrop%20logo%203.png?alt=media&token=b39408db-c3b6-48d1-a727-1334b12a6451",
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                Container(
                  padding: new EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 20.0, height: 1.0, color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: 'Usuário',
                      labelStyle:
                          new TextStyle(color: Colors.white, fontSize: 16.0),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: new EdgeInsets.only(top: 10.0),
                  width: 300.0,
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enabled: true,
                    style: TextStyle(
                        fontSize: 20.0, height: 1.0, color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                      labelStyle:
                          new TextStyle(color: Colors.white, fontSize: 16.0),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Cadastro.routeNome);
                  },
                  child: Container(
                    padding: new EdgeInsets.only(
                        left: 180.0, top: 10.0, bottom: 5.0),
                    child: Text(
                      "Crie um cadastro",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
                Container(
                  width: 150.0,
                  padding: new EdgeInsets.only(top: 10.0, bottom: 15.0),
                  child: RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(Home.routeNome);
                        //if (_formKey.currentState.validate()) {
                        //   Scaffold.of(context).showSnackBar(
                        //       SnackBar(content: Text('Processing Data')));
                      }),
                ),
                Container(
                  width: 900.0,
                  height: 5.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
