import 'dart:html';

import '../views/View.dart';

abstract class Controller {
  static Element _body;
  static Element _pagebody;

  static loadOnBody(View view) {
    _body.children.clear();
    _body.append(view.build());
  }

  static loadOnPageBody(View view) {
    _pagebody.children.clear();
    _pagebody.append(view.build());
  }

  static Element get body => _body;
  static Element get pagebody => _pagebody;
  static set body(value) => _body = value;
  static set pagebody(value) => _pagebody = value;
}
