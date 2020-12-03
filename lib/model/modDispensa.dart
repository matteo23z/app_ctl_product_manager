import 'dart:core';

class ModDispensa {
  String Pesquisa;
  String Filtro;

  void setPesquisa(String pesquisa) {
    Pesquisa = pesquisa;
  }

  getPesquisa() {
    return Pesquisa;
  }

  void setFiltro(String filtro) {
    Filtro = filtro;
  }

  getFiltro() {
    return Filtro;
  }
}
