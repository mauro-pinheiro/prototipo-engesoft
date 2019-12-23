import 'dart:html';

import '../controllers/Controller.dart';
import 'PageBodyView.dart';
import 'ProfileView.dart';
import 'TabelaAvaliacoesView.dart';
import 'TabelaEdicoesView.dart';
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
          ..append(_criaItem('Perfil', "", 'fas fa-users', ProfileView()))
          ..append(
              _criaItem('Edicoes', '', 'far fa-newspaper', TableEdicoesView()))
          ..append(_criaItem(
              'Avaliações', '', 'far fa-star', TabelaAvaliacoesView()))
          ..append(_criaItem('Sobre', '', 'far fa-question-circle'))
          ..append(_criaItem('Configurações', "", 'fas fa-cog'))
          ..append(_criaItem('Contato', "", 'fas fa-envelope'))));
  }

  _onClickLoad(Event event, PageBodyView view) {
    event.preventDefault();
    // Controller.load(elemento, view)
    Controller.loadOnPageBody(view);
  }

  LIElement _criaItem(texto, href, fa_icon, [view]) {
    return Element.li()
      ..append(AnchorElement(href: href)
        ..onClick.listen((e) => _onClickLoad(e, view))
        ..innerHtml = '<i class="$fa_icon"></i> $texto');
  }

  CheckboxInputElement get check => _check;
}
