import 'dart:html';

import '../views/View.dart';

abstract class Controller {
  static load(Element elemento, View view) {
    elemento.children.clear();
    elemento.append(view.build());
  }
}
