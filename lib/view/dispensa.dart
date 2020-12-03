import 'package:app_ctl_product_manager/view/criarProduto.dart';
import 'package:app_ctl_product_manager/view/editarProduto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:app_ctl_product_manager/model/modDispensa.dart';

ModDispensa dispen = new ModDispensa();
final String pesq = dispen.getPesquisa();
final String fil = dispen.getFiltro();

class Dispensa extends StatefulWidget {
  static const routeNome = 'Dispensa';
  @override
  Dispensa_State createState() => Dispensa_State();
}

class Dispensa_State extends State<Dispensa> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dispensa 1",
            style: TextStyle(fontSize: 25.0),
          ),
        ),

        //leading:
        //child: Icon(Icons.menu, color: Colors.white),
        //   onPressed: () {},
        // ),
        backgroundColor: AppColors.backgroud,
        body: Stack(children: [
          BuscarDispensa(),
          ListaDispensa(),
        ]),

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

class BuscarDispensa extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String pesquisa = "";
  String resultado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      // child: SizedBox(
      //   width: MediaQuery.of(context).size.width - 80,
      child: Form(
        key: _formKey,
        child: Stack(children: <Widget>[
          Container(
            child: TextFormField(
                maxLengthEnforced: false,
                maxLines: null,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Pesquisar',
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                // onSaved: (String val) {
                //   pesquisa = val;
                // },
                validator: (value) {
                  if (value.isEmpty) {
                    dispen.setPesquisa(null);
                    return "";
                  } else {
                    return null;
                  }
                },
                onSaved: (String val) {
                  pesquisa = val;
                }),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 260.0),
                  child: GestureDetector(
                    onTap: () {
                      filtro(context, resultado);
                      print(resultado);
                      dispen.setFiltro(resultado);
                    },
                    child: Icon(
                      Icons.filter_list,
                      size: 30.0,
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        dispen.setPesquisa(pesquisa);
                        print(dispen.getPesquisa());
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Você pesquisou por: $pesquisa'),
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                  )),
            ]),
          ),
        ]),
      ),
    );
  }
}

Future varbusca() async {}

class ListaDispensa extends StatelessWidget {
  String pesquisa, fil;

  QuerySnapshot result;

  // bool lista = true;

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    checkBuscar();
    print("test pesquisa: $pesquisa");

    var disp;

    if (pesquisa == null) {
      disp = FirebaseFirestore.instance
          .collection('Dispensa1')
          .where('Excluido', isEqualTo: false)
          .orderBy('Nome')
          .snapshots();
    } else {
      if (filtro == null) {
        disp = FirebaseFirestore.instance
            .collection('Dispensa1')
            .where("$filtro", isEqualTo: "$pesquisa")
            .where('Excluido', isEqualTo: false)
            .orderBy('Nome')
            .snapshots();
      } else {
        disp = FirebaseFirestore.instance
            .collection('Dispensa1')
            .where("Nome", isEqualTo: "$pesquisa")
            .where('Excluido', isEqualTo: false)
            .orderBy('Nome')
            .snapshots();
      }
    }

    //ScrollController _controller;
    // @override
    //  void initState() {
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener);//the listener for up and down.
    // super.initState();
    // }

    return StreamBuilder<QuerySnapshot>(
        stream: disp,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child:
                    Text('Ops! Ocorreu um erro :( \nError: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.white));
          }
          if (snapshot.data.docs.length == 0) {
            if (pesquisa == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      'Não tem nenhum produto por aqui, insira um com o botão abaixo',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Nenhum Produto encontrado na pesquisa',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                ),
              );
            }
          }

          // return ListView.builder(
          //   itemCount: snapshot.data.docs.length,
          //   itemBuilder: (BuildContext context, int i) {
          //     var doc = snapshot.data.docs[i];
          //     var item = doc.data;
          //if (document.data()['$filtro'] == '$pesquisa') {

          return Padding(
            padding: const EdgeInsets.only(top: 70.0, bottom: 35.0),
            child: ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: colorValidade(context, snapshot, document),
                    child: Builder(builder: (context) {
                      DateTime valid = new DateFormat("yyyy-MM-dd hh:mm:ss")
                          .parse(document.data()['DataValidade']);
                      String validade = DateFormat("dd/MM/yyyy").format(valid);

                      return Container(
                        child: ListTile(
                          title: Text(
                              "${document.data()['Nome']} \nValidade: ${validade} \nQuantidade: ${document.data()['Quantidade']}"),
                          subtitle: Text(document.data()['Descricao']),
                          onTap: () {
                            detalhes(context, snapshot, document);
                          },
                          trailing: Wrap(spacing: 1, // space between two icons
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(EditarProduto.routeNome);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
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
                                                    FirebaseFirestore.instance
                                                        .collection("Dispensa1")
                                                        .doc(document.id)
                                                        .update({
                                                      'Excluido': true
                                                    }).catchError((onError) {
                                                      print(onError);
                                                    });

                                                    Navigator.pop(context);
                                                  }),
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
                                  },
                                ),
                              ]),
                        ),
                      );
                    }),
                  ),
                );
              }).toList(),
            ),
          );
        });
  }

  checkBuscar() async {
    pesquisa = dispen.getPesquisa();
    fil = dispen.getFiltro();
  }
}

Stream<QuerySnapshot> getlistDispensa() {
  return FirebaseFirestore.instance.collection('Dispensa1').snapshots();
}

colorValidade(context, snapshot, document) {
  DateTime validade = new DateFormat("yyyy-MM-dd hh:mm:ss")
      .parse(document.data()['DataValidade']);
  // final validade = DateTime(2021, 12, 19);
  final dataAtual = DateTime.now();
  final diferenc = DateTime.now().difference(validade).inDays;

  // print(diferenc);
  // print(document.data()['DataValidade']);
  // print(validade);

  //return Colors.white;
  if (validade.isBefore(dataAtual)) {
    return AppColors.colorCardRed;
  }
  if (!validade.isBefore(dataAtual)) {
    if (diferenc >= -30) {
      return AppColors.colorCardYellow;
    } else {
      return AppColors.colorCardDefault;
    }
  } else {
    return AppColors.colorCardDefault;
  }
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
              title: Text("Detalhes do Produto"),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Nome: ${document.data()['Nome']}"),
                    Text("Quantidade: ${document.data()['Quantidade']}"),
                    Text(
                        "Data de Validade: ${document.data()['DataValidade']}"),
                    Text(
                        "Codigo de Barras: ${document.data()['CodigoBarras']}"),
                    Text("Descrição: ${document.data()['Descricao']}"),
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text("Deseja excluir esse produto?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("Sim"),
                                        onPressed: () {
                                          print("True");
                                          FirebaseFirestore.instance
                                              .collection("Dispensa1")
                                              .doc(document.id)
                                              .update({'Excluido': true});
                                          // document.reference.update({
                                          //   'Excluido': true,
                                          // });
                                          Navigator.pop(context);
                                        }),
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
                        },
                      ),
                    ]),
                  ]),
            ),
          ),
        );
      });
}

filtro(context, resultado) {
  showDialog(
      //Your Dialog Code that does  when necessar
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 700.0,
            height: 400.0,
            child: AlertDialog(
              title: Text("Filtrar por:"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        resultado = "nome";
                        print(resultado);
                        Navigator.pop(context, resultado);
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(Icons.search),
                          Text("Nome"),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(Icons.search),
                          Text("Data de Validade"),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(Icons.search),
                          Text("Quantidade"),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Row(children: <Widget>[
                          Icon(Icons.search),
                          Text("Descrição"),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
  //return resultado;
}
