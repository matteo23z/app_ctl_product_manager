import 'package:flutter/cupertino.dart';
import 'package:app_ctl_product_manager/common/appcolor.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'dispensa.dart';

class EditarProduto extends StatefulWidget {
  static const routeNome = 'EditarProduto';
  @override
  EditarProdutoState createState() => EditarProdutoState();
}

class EditarProdutoState extends State<EditarProduto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(children: <Widget>[
              Text(
                "Editar Produto",
                style: TextStyle(fontSize: 25.0),
              ),
              new Container(
                padding: new EdgeInsets.only(left: 50.0),
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
  var con = TextEditingController();
  DateTime _dateTime;
  final format = DateFormat("dd/MM/yyyy");
  String nome, validade, quant, codbar, desc;

  String barcode = "";

  // @override
  // initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Nome do Produto",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      maxLengthEnforced: false,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor preencha o campo a cima';
                        }
                        return null;
                      },
                      onSaved: (String val) {
                        nome = val;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Quantidade",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      maxLengthEnforced: false,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por Favor preencha o campo a cima';
                        }
                        return null;
                      },
                      onSaved: (String val) {
                        quant = val;
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Data de Validade",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Card(
                    child: DateTimeField(
                      format: format,
                      onShowPicker:
                          (BuildContext context, DateTime currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                      validator: (DateTime dateTime) {
                        if (dateTime == null) {
                          return 'Por Favor preencha o campo a cima';
                        }
                        print(dateTime);
                        return null;
                      },
                      onSaved: (DateTime dateTime) => _dateTime = dateTime,
                    ),
                  ),
                  Container(
                      child: Text(
                    "Código de Barras",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  )),
                  Card(
                    elevation: 100,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: 250.00,
                          child: TextFormField(
                            controller: con,
                            keyboardType: TextInputType.visiblePassword,
                            maxLengthEnforced: false,
                            maxLines: null,
                            //initialValue: con.text,
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'Por Favor preencha o campo a cima';
                            //   }
                            //   return null;
                            // },
                            onSaved: (barcode) {
                              codbar = barcode;
                            },
                          ),
                        ),
                        Container(
                          padding: new EdgeInsets.only(left: 250.0),
                          child: RaisedButton(
                            onPressed: barcodeScanning,
                            child: new Text("Leitor"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      "Descrição",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      maxLengthEnforced: false,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      onSaved: (String val) {
                        desc = val;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: new EdgeInsets.only(
                          left: 40.0, top: 40.0, right: 40.0, bottom: 40.0),
                      width: 400.0,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            validade = DateFormat("yyyy-MM-dd hh:mm:ss")
                                .format(_dateTime);
                            print("test para string:" + validade);

                            FirebaseFirestore.instance
                                .collection('Dispensa1')
                                .add({
                              'Nome': nome,
                              'Quantidade': quant,
                              'DataValidade': validade,
                              'CodigoBarras': codbar,
                              'Descricao': desc,
                              'Excluido': false
                            });
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Os dados foram: $nome,$quant,$validade,$codbar,$desc')));
                            showInserido(context);
                          }
                        },
                        child: Text(
                          'Editar',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future barcodeScanning() async {
    try {
      ScanResult barc = await BarcodeScanner.scan();
      //setState(() => this.barcode = barc);
      //debugPrint('Resultado: ${barc.rawContent}');
      this.barcode = barc.rawContent;
      con.value = TextEditingValue(text: barcode);
      debugPrint('Testando Leitor...');
      debugPrint('Resultado: $barcode');
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        this.barcode = 'No camera permission!';
        con.value = TextEditingValue(text: barcode);
        debugPrint('Resultado: $barcode');
      } else {
        this.barcode = 'Unknown error: $e';
        con.value = TextEditingValue(text: barcode);
        debugPrint('Resultado: $barcode');
      }
    } on FormatException {
      this.barcode = 'Nothing captured.';
      con.value = TextEditingValue(text: barcode);
      debugPrint('Resultado: $barcode');
    } catch (e) {
      this.barcode = 'Unknown error: $e';
      con.value = TextEditingValue(text: barcode);
      debugPrint('Resultado: $barcode');
    }
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Basic date field (${format.pattern})'),
      DateTimeField(
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

showInserido(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pushNamed(Dispensa.routeNome);
    },
  );
  AlertDialog alerta = AlertDialog(
    title: Text("Produto inserido com sucesso"),
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
