import 'dart:html';

import '../controllers/Controller.dart';
import 'View.dart';

abstract class PageBodyView extends View {
  DivElement _container = DivElement();

  PageBodyView() {
    Controller.pagebody = _container;
  }

  DivElement get container => _container;
}
