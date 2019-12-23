import 'dart:html';

import 'View.dart';

class EdicaoView extends View {
  DivElement _container = DivElement();
  TableElement _table = TableElement();
  @override
  Element build() {
    _table.classes.addAll(['table', 'table-hover', 'table-bordered']);
    _table.createTHead().addRow()
      ..addCell().text = 'Tema'
      ..addCell().text = 'Editor-Chefe'
      ..addCell().text = 'Situacao'
      ..addCell().text = 'Publicacao'
      ..addCell().text = 'Submeter Artigo';

    _table.createTBody().id = 'edicoes-body';

    return _container
      ..append(Element.tag('h1')
        ..text = "Edicões"
        ..style.textAlign = "center")
      ..append(_table)
      ..classes.add('pagebody');
  }
}
