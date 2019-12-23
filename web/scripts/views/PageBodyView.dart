import 'dart:html';

import 'View.dart';

abstract class PageBodyView extends View {
  DivElement _container = DivElement();

  DivElement get container => _container;
}
