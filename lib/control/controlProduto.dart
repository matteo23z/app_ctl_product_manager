import 'package:app_ctl_product_manager/model/Produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class controlProduto {
  void Inserir() {
    Produto p = new Produto();
    //FirebaseFirestore.instance.collection('Dispensa1');

    FirebaseFirestore.instance.collection('Dispensa1').add({
      'Nome': p.getNome(),
      'Quantidade': p.getQuant(),
      'DataValidade': p.getValidade(),
      'CodigoBarras': p.getCodebar(),
      'Descrição': p.getDescr()
    });
  }
}
