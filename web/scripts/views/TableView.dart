import 'dart:html';

import 'PageBodyView.dart';

class TableView extends PageBodyView {
  TableElement _table = TableElement();
  List<String> _colNames;
  String _title;
  String _id;

  TableView(this._id, this._title, this._colNames);

  String get id => _id;
  String get title => _title;
  List<String> get colNames => List.from(_colNames);

  @override
  Element build() {
    var row = _table.createTHead().addRow();
    _colNames.forEach((c) => row.addCell().text = c);
    _table.createTBody().id = _id;
    _table.classes.addAll(['table', 'table-hover', 'table-bordered']);

    return container
      ..append(Element.tag('h1')
        ..text = _title
        ..style.textAlign = "center")
      ..append(_table)
      ..classes.add('pagebody');
  }
}
