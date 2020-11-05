import 'package:flutter/material.dart';

import 'common/appcolor.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  static const routeNome = 'Cadastro';
  @override
  Cadastro_State createState() => Cadastro_State();
}

class Cadastro_State extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bar,
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Text(
                "Criar Cadastro",
                style: TextStyle(fontSize: 25.0),
              ),
              Container(
                padding: new EdgeInsets.only(left: 50.0),
                child: new Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/app-ctl-product-manager.appspot.com/o/imags%2FIcons%2Fcontrop%20logo2.png?alt=media&token=2027f457-198d-4d61-b540-675a5cbed277",
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      width: 300.0,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                            fontSize: 20.0, height: 1.0, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          labelText: 'Nome Completo',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      width: 300.0,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        style: TextStyle(
                            fontSize: 20.0, height: 1.0, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          labelText: 'Data de Nascimento',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
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
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          labelText: 'Nome Usuário',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      width: 300.0,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            fontSize: 20.0, height: 1.0, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          labelText: 'Email',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      width: 300.0,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            fontSize: 20.0, height: 1.0, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelText: 'Senha',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: new EdgeInsets.only(top: 5.0),
                      width: 300.0,
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            fontSize: 20.0, height: 1.0, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          labelText: 'Repita Senha',
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 16.0),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 300.0,
                      padding: new EdgeInsets.only(top: 10.0),
                      child: RaisedButton(
                          child: Text(
                            'Cadastrar',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                          onPressed: () {
                            showAlertDialog1(context);

                            //if (_formKey.currentState.validate()) {
                            //   Scaffold.of(context).showSnackBar(
                            //       SnackBar(content: Text('Processing Data'))),
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog1(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pushNamed(Login.routeNome);
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text("Conta Criada com Sucesso"),
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
