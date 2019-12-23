import 'dart:html';

import 'View.dart';

class SideBarView extends View {
  DivElement _container = DivElement();
  DivElement _sidebar = DivElement();
  CheckboxInputElement _check = CheckboxInputElement();
  @override
  Element build() {
    return _container
      ..classes.add('side-container')
      ..append(_check..id = 'check')
      ..append(LabelElement()
        ..htmlFor = 'check'
        ..appendHtml('<i class="fas fa-bars" id="btn"></i>')
        ..appendHtml('<i class="fas fa-times" id="cancel"></i>'))
      ..append(_sidebar
        ..classes.add('sidebar')
        ..append(Element.header()..appendText("EngeSoft"))
        ..append(Element.ul()
          ..append(_criaItem('Perfil', "#", 'fas fa-users'))
          ..append(_criaItem('Edicoes', '#', 'far fa-newspaper'))
          ..append(_criaItem('Avaliações', '#', 'far fa-star'))
          ..append(_criaItem('Sobre', '#', 'far fa-question-circle'))
          ..append(_criaItem('Configurações', "#", 'fas fa-cog'))
          ..append(_criaItem('Contato', "#", 'fas fa-envelope'))));
  }

  LIElement _criaItem(texto, href, fa_icon) {
    return Element.li()
      ..append(AnchorElement(href: href)
        ..innerHtml = '<i class="$fa_icon"></i> $texto');
  }

  CheckboxInputElement get check => _check;
}
