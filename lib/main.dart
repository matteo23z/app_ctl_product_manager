import 'package:app_ctl_product_manager/cadastro.dart';
import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:app_ctl_product_manager/criarProduto.dart';
import 'package:app_ctl_product_manager/dispensa.dart';
import 'package:app_ctl_product_manager/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'ControP Manager',
    theme: ThemeData(primaryColor: AppColors.bar),
    home: Login(),
    routes: {
      Login.routeNome: (context) => Login(),
      Cadastro.routeNome: (context) => Cadastro(),
      Home.routeNome: (context) => Home(),
      Dispensa.routeNome: (context) => Dispensa(),
      CriarProduto.routeNome: (context) => CriarProduto()
    },
  ));
}
