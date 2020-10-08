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
                child: ListTile(
                  title: new Text(
                      "${document.data()['Nome']} Validade: ${document.data()['DataValidade']}   Quantidade:${document.data()['Quantidade']}"),
                  subtitle: new Text(document.data()['Descrição']),
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

// class ColsutarDis extends StatelessWidget {
//   var db = FirebaseFirestore.instance;
//   //var snapshots = FirebaseFirestore.instance.collection('Dispensa1').snapshots();
//   var Dis = FirebaseFirestore.instance.collection('Dispensa1').get();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//               stream: getlistDispensa(),
//               builder: (context, snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.none:
//                   case ConnectionState.waiting:
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   default:
//                     List<DocumentSnapshot> dc = snapshot.data.docs;
//                     return ListView.builder(
//                         itemCount: dc.legth,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             title: Text(items[index].nome),
//                             subtitle: (items[index].quantidade),
//                           );
//                         });
//                 }
//               }),
//         ),
//       ],
//     );
//   }

Stream<QuerySnapshot> getlistDispensa() {
  return FirebaseFirestore.instance.collection('Dispensa1').snapshots();
}
