import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool resultadoU = false, resultadoS = false;
  String nomeUser, senha;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.bar,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
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
                    child: TextFormField(
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor preencha o campo a cima';
                        }
                        return null;
                      },
                      onSaved: (String val) {
                        nomeUser = val;
                      },
                    ),
                  ),
                  Container(
                    padding: new EdgeInsets.only(top: 10.0),
                    width: 300.0,
                    child: TextFormField(
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor preencha o campo a cima';
                        }
                        return null;
                      },
                      onSaved: (String val) {
                        senha = val;
                      },
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            CollectionReference db = FirebaseFirestore.instance
                                .collection('Usuarios');
                            QuerySnapshot result = await db
                                .where("NomeUser", isEqualTo: "$nomeUser")
                                .get();

                            if (result.docs.length == 0) {
                              this.resultadoU = false;
                            } else {
                              this.resultadoU = true;
                            }

                            if (resultadoU == false) {
                              alerta(context, 1);
                            } else {
                              db = FirebaseFirestore.instance
                                  .collection('Usuarios');
                              result = await db
                                  .where("NomeUser", isEqualTo: "$nomeUser")
                                  .where("Senha", isEqualTo: "$senha")
                                  .get();
                            }

                            if (result.docs.length == 0) {
                              this.resultadoS = false;
                            } else {
                              this.resultadoS = true;
                            }

                            if (resultadoU == true && resultadoS == true) {
                              checkLogin(context);
                              print("Logado com sucesso");
                              //Navigator.of(context).pushNamed(Home.routeNome);
                            }

                            if (resultadoU == true && resultadoS == false) {
                              alerta(context, 2);
                            }
                          }
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
      ),
    ));
  }
}

alerta(context, test) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        if (test == 1) {
          return AlertDialog(
              title: Text("Usuario não existe!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]);
        }
        if (test == 2) {
          return AlertDialog(
              title: Text("Senha está errada!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]);
        }
      });
}

checkLogin(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pushNamed(Home.routeNome);
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text("Login realizado com Sucesso"),
    //content: Text(""),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
