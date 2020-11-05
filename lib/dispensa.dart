import 'package:app_ctl_product_manager/criarProduto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'common/appcolor.dart';

class Dispensa extends StatefulWidget {
  static const routeNome = 'Dispensa';
  @override
  Dispensa_State createState() => Dispensa_State();
}

class Dispensa_State extends State<Dispensa> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    //Firebase.initializeApp();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    //CollectionReference Dis =
    //FirebaseFirestore.instance.collection('Dispensa1');

    //var snapshots = firestore.collection('Dispensa').snapshots();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              "Dispensa 1",
              style: TextStyle(fontSize: 25.0),
            ),
            actions: <Widget>[
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
        backgroundColor: AppColors.backgroud,
        body: ListaDispensa(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CriarProduto.routeNome);
          },
          child: Icon(Icons.add),
        ),

        //     floatingActionButtonLocation: FloatingActionButton(
        //     onPressed: (),
        //     child: Icon(Icons.add),
        // ),
        //ColsutarDis()
      ),
    );
  }
}

class ListaDispensa extends StatelessWidget {
  bool test;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    CollectionReference dis =
        FirebaseFirestore.instance.collection('Dispensa1');

    return StreamBuilder<QuerySnapshot>(
      stream: dis.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Ops! Ocorreu um erro :(');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  child: ListTile(
                    title: new Text(
                        "${document.data()['Nome']} Validade: ${document.data()['DataValidade']}   Quantidade:${document.data()['Quantidade']}"),
                    subtitle: new Text(document.data()['Descrição']),
                    onTap: () {
                      detalhes(context, snapshot, document);
                    },
                    trailing: Wrap(spacing: 12, // space between two icons
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                snapshot.data.docs.remove(document.id);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text(
                                            "Deseja excluir esse produto?"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Sim"),
                                            onPressed: () {
                                              print("True");
                                              snapshot.data.docs
                                                  .remove(document.id);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          FlatButton(
                                            child: Text("Não"),
                                            onPressed: () {
                                              print("False");
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ]);
                                  },
                                );
                              }),
                        ]),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class dispensaBuscar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Stream<QuerySnapshot> getlistDispensa() {
  return FirebaseFirestore.instance.collection('Dispensa1').snapshots();
}

detalhes(context, snapshot, document) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 700.0,
            height: 400.0,
            child: AlertDialog(
              title: Text("Detalhes"),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Nome do Produto: ${document.data()['Nome']}"),
                    Text("Quantidade: ${document.data()['Quantidade']}"),
                    Text(
                        "Data de Validade: ${document.data()['DataValidade']}"),
                    Text(
                        "Codigo de Barras: ${document.data()['Código de barras']}"),
                    Text("Descrição: ${document.data()['Descrição']}"),
                    Row(children: [
                      IconButton(
                        icon: Icon(Icons.keyboard_backspace),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          //snapshot.data.docs.remove(document.id);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          snapshot.data.docs.remove(document.id);
                        },
                      ),
                    ]),
                  ]),
            ),
          ),
        );
      });
}
