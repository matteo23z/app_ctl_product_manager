import 'dart:core';

class Produto {
  String Nome;
  String Quant;
  String Validade;
  String Codebar;
  String Descr;

  void setNome(String nome) {
    Nome = nome;
  }

  getNome() {
    return Nome;
  }

  void setQuant(String quant) {
    Quant = quant;
  }

  getQuant() {
    return Quant;
  }

  void setValidade(String validade) {
    Validade = validade;
  }

  getValidade() {
    return Validade;
  }

  void setCodebar(String codebar) {
    Codebar = codebar;
  }

  getCodebar() {
    return Codebar;
  }

  void setDescr(String descr) {
    Descr = descr;
  }

  getDescr() {
    return Descr;
  }
}
