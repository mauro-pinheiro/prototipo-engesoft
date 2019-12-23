import 'dart:html';

import 'PageBodyView.dart';

class EdicaoView extends PageBodyView {
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

    return container
      ..append(Element.tag('h1')
        ..text = "Edicões"
        ..style.textAlign = "center")
      ..append(_table)
      ..classes.add('pagebody');
  }
}
