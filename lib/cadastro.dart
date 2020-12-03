import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'common/appcolor.dart';
import 'login.dart';

class Cadastro extends StatefulWidget {
  static const routeNome = 'Cadastro';

  @override
  Cadastro_State createState() => Cadastro_State();
}

class Cadastro_State extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  bool resultadoM = false, resultadoU = false;
  DateTime _dateTime;
  final format = DateFormat("dd/MM/yyyy");
  String nomeComp, dataNasc, nomeUser, mail, senha1, senha2;

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
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Container(
                        padding: new EdgeInsets.only(top: 5.0),
                        width: 300.0,
                        child: TextFormField(
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por Favor preencha o campo a cima';
                            }
                            return null;
                          },
                          onSaved: (String val) {
                            nomeComp = val;
                          },
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.only(top: 5.0),
                        width: 300.0,
                        child: DateTimeField(
                          format: format,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
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
                          validator: (DateTime dateTime) {
                            if (dateTime == null) {
                              return 'Por Favor preencha o campo a cima';
                            }
                            return null;
                          },
                          onSaved: (DateTime dateTime) => _dateTime = dateTime,
                        ),
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
                        padding: new EdgeInsets.only(top: 5.0),
                        width: 300.0,
                        child: TextFormField(
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por Favor preencha o campo a cima';
                            }
                            return null;
                          },
                          onSaved: (String val) {
                            mail = val;
                          },
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.only(top: 5.0),
                        width: 300.0,
                        child: TextFormField(
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por Favor preencha o campo a cima';
                            }
                            return null;
                          },
                          onSaved: (String val) {
                            senha1 = val;
                          },
                        ),
                      ),
                      Container(
                        padding: new EdgeInsets.only(top: 5.0),
                        width: 300.0,
                        child: TextFormField(
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por Favor preencha o campo a cima';
                            }
                            return null;
                          },
                          onSaved: (String val) {
                            senha2 = val;
                          },
                        ),
                      ),
                      Container(
                        width: 300.0,
                        padding: new EdgeInsets.only(top: 10.0),
                        child: RaisedButton(
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();

                                dataNasc = DateFormat("yyyy-MM-dd hh:mm:ss")
                                    .format(_dateTime);
                                //print("test para string:" + dataNasc);

                                if (senha1 == senha2) {
                                  print("User: " + nomeUser);

                                  CollectionReference db = FirebaseFirestore
                                      .instance
                                      .collection('Usuarios');
                                  QuerySnapshot result = await db
                                      .where("NomeUser", isEqualTo: "$nomeUser")
                                      .get();

                                  if (result.docs.length == 0) {
                                    this.resultadoU = true;
                                    //return true;
                                  } else {
                                    this.resultadoU = false;
                                  }

                                  db = FirebaseFirestore.instance
                                      .collection('Usuarios');
                                  result = await db
                                      .where("Email", isEqualTo: "$mail")
                                      .get();

                                  if (result.docs.length == 0) {
                                    this.resultadoM = true;
                                  } else {
                                    this.resultadoM = false;
                                  }

                                  if (resultadoU == true &&
                                      resultadoM == true) {
                                    FirebaseFirestore.instance
                                        .collection('Usuarios')
                                        .add({
                                      'NomeCompleto': nomeComp,
                                      'DataNascimento': dataNasc,
                                      'NomeUser': nomeUser,
                                      'Email': mail,
                                      'Senha': senha1,
                                      'Excluido': false
                                    });
                                    checkCadastro(context);
                                    print("Usuario inserido");
                                  }
                                  if (resultadoU == false &&
                                      resultadoM == true) {
                                    alerta(context, 2);
                                  }
                                  if (resultadoU == true &&
                                      resultadoM == false) {
                                    alerta(context, 3);
                                  }
                                  if (resultadoU == false &&
                                      resultadoM == false) {
                                    alerta(context, 4);
                                  }
                                } else {
                                  alerta(context, 1);
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

alerta(context, test) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        if (test == 1) {
          return AlertDialog(
              title: Text("As senhas não estão iguais!"),
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
              title: Text("Usuario já está em uso!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]);
        }
        if (test == 3) {
          return AlertDialog(
              title: Text("Email já está em uso!"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ]);
        }
        if (test == 4) {
          return AlertDialog(
              title: Text("Usuario e Email já estão em uso!"),
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

checkCadastro(BuildContext context) {
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
