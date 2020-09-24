import 'package:app_ctl_product_manager/dispensa.dart';
import 'package:app_ctl_product_manager/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ControP Manager',
    home: Home(),
    routes: {
      Home.routeNome: (context) => Home(),
      Dispensa.routeNome: (context) => Dispensa()
    },
  ));
}
