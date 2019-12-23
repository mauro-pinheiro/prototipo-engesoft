import 'dart:html';

import '../controllers/Controller.dart';
import '../controllers/LoginController.dart';
import 'CadastroRapidoView.dart';
import 'SideBarView.dart';
import 'View.dart';

class LoginView extends View {
  DivElement _container = DivElement();
  LabelElement _erro = LabelElement();
  TextInputElement _user = TextInputElement();
  PasswordInputElement _password = PasswordInputElement();

  @override
  Element build() {
    return _container
      ..classes.add('login-container')
      ..append(
        FormElement()
          ..classes.add('login-form')
          ..append(Element.tag('h1')..text = 'Login')
          ..append(_erro
            // ..style.visibility = "hidden"
            ..classes.add('hidden')
            ..text = "Erro")
          ..append(
            DivElement()
              ..classes.add('txtb')
              ..append(
                _user
                  ..required = true
                  ..onFocus.listen(
                    (event) => _onFocus(event),
                  )
                  ..onBlur.listen(
                    (event) => _onBlur(event),
                  ),
              )
              ..append(SpanElement()..dataset['placeholder'] = "Usuário"),
          )
          // ..appendHtml('<span data-placeholder="Usuário"></span>'))
          ..append(
            DivElement()
              ..classes.add('txtb')
              ..append(
                _password
                  ..required = true
                  ..onFocus.listen(
                    (event) => _onFocus(event),
                  )
                  ..onBlur.listen(
                    (event) => _onBlur(event),
                  ),
              )
              ..append(SpanElement()..dataset['placeholder'] = "Senha"),
          )
          // ..appendHtml('<span data-placeholder="Senha"></span>'))
          ..append(ButtonElement()
            ..onClick.listen((event) => _onSubmit(event))
            ..classes.add('btn-login')
            ..text = "Entrar")
          ..append(
            DivElement()
              ..classes.add('bottom-text')
              ..appendText('Ainda não tem conta? ')
              ..append(
                ButtonElement()
                  ..classes.add('btn-link')
                  ..text = "Cadastre-se"
                  ..onClick.listen(
                    (e) => Controller.load(
                      _container.parent,
                      CadastroRapidoView(),
                    ),
                  ),
              ),
          ),
      );
  }

  _onFocus(Event event) {
    var target = event.target;
    if (target is InputElement) {
      target.classes.add('focus');
    }
  }

  _onBlur(Event event) {
    var target = event.target;
    if (target is InputElement) {
      if (target.value.isEmpty) {
        target.classes.remove('focus');
      }
    }
  }

  _onSubmit(Event event) {
    event.preventDefault();
    String usuario = _user.value;
    String senha = _password.value;
    if (!LoginController().login(usuario, senha)) {
      _erro.classes.remove('hidden');
      _erro.classes.add('error');
      _erro.text = "Credenciais incorretas";
    } else {
      _erro.classes.remove('error');
      // _erro.classes.add('hidden');
      _erro.classes.add('success');
      _erro.text = "Autenticado com sucesso";
      Future.delayed(const Duration(seconds: 2),
          () => Controller.load(_container.parent, SideBarView()));
    }
  }
}
