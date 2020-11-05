import 'dart:core';

class Produto {
  String Nome;
  String Quant;
  String Validade;
  String Codebar;
  String Descr;

  getNome() {
    return Nome;
  }

  void setNome(String nome) {
    Nome = nome;
  }

  getQuant() {
    return Quant;
  }

  void setQuant(String quant) {
    Quant = quant;
  }

  getValidade() {
    return Validade;
  }

  void setValidade(String validade) {
    Validade = validade;
  }

  getCodebar() {
    return Codebar;
  }

  void setCodebar(String codebar) {
    Codebar = codebar;
  }

  getDescr() {
    return Descr;
  }

  void setDescr(String descr) {
    Descr = descr;
  }
}
