import 'dart:html';

import '../controllers/LoginController.dart';
import 'View.dart';

class TopbarView extends View {
  @override
  Element build() {
    return DivElement()
      ..classes.addAll(['topbar'])
      ..append(SpanElement()
        ..classes.add('user-logado')
        ..text = "Mauro");
    // ..text = LoginController().logado);
    // ..appendText(LoginController().logado);
    // ..appendText('Mauro');
  }
}
