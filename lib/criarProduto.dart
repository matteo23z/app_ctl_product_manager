import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CriarProduto extends StatefulWidget {
  static const routeNome = 'CriarProduto';
  @override
  CriarProduto_State createState() => CriarProduto_State();
}

class CriarProduto_State extends State<CriarProduto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(children: <Widget>[
              Text(
                "Criar Produto",
                style: TextStyle(fontSize: 25.0),
              ),
              new Container(
                padding: new EdgeInsets.only(left: 60.0),
                child: new Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/app-ctl-product-manager.appspot.com/o/imags%2FIcons%2Fcontrop%20logo2.png?alt=media&token=2027f457-198d-4d61-b540-675a5cbed277",
                  width: 60,
                  height: 60,
                  fit: BoxFit.fill,
                ),
              ),
            ]),
          ),
          backgroundColor: AppColors.backgroud,
          body: formulario()),
    );
  }
}

class formulario extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("Nome do Produto"),
            ),
            Card(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor preencha o campo a cima';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: Text("Quantidade"),
            ),
            Card(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor preencha o campo a cima';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: Text("Data de Validade"),
            ),
            Card(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor preencha o campo a cima';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: Text("Código de Barras"),
            ),
            Card(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor preencha o campo a cima';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: Text("Descrição"),
            ),
            Card(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Por Favor preencha o campo a cima';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Criar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
