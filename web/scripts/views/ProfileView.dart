import 'dart:html';

import 'PageBodyView.dart';
import 'TableView.dart';
import 'View.dart';

class ProfileView extends PageBodyView {
  TableView _edicoes =
      TableView('sm-edicoes', '', ['Tema', 'Publicacao', 'Situacao']);
  TableView _avaliacoes =
      TableView('sm-avaliacao', '', ['Titulo', 'Media', 'Comentario']);
  TableView _submissoes =
      TableView('sm-submissao', '', ['Titulo', 'Media', 'Situacao']);
  @override
  Element build() {
    return container
      ..id = 'home-body'
      ..children
          .addAll([_edicoes.build(), _avaliacoes.build(), _submissoes.build()]);
  }
}
