import 'dart:html';
// import 'dart:io';

import '../controllers/Controller.dart';
import '../controllers/LoginController.dart';
import 'LoginView.dart';
import 'View.dart';

class CadastroRapidoView extends View {
  DivElement _container = DivElement();
  LabelElement _feedback = LabelElement();
  TextInputElement _user = TextInputElement();
  PasswordInputElement _password = PasswordInputElement();
  PasswordInputElement _confimation = PasswordInputElement();
  @override
  Element build() {
    return _container
      ..classes.add('login-container')
      ..append(
        FormElement()
          ..classes.add('login-form')
          ..append(Element.tag('h1')..text = 'Cadastrar')
          ..append(_feedback
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
          ..append(DivElement()
            ..classes.add('txtb')
            ..append(
              _confimation
                ..required = true
                ..onFocus.listen(
                  (event) => _onFocus(event),
                )
                ..onBlur.listen(
                  (event) => _onBlur(event),
                ),
            )
            ..append(SpanElement()..dataset['placeholder'] = "Corfimação"))
          // ..appendHtml('<span data-placeholder="Senha"></span>'))
          ..append(ButtonElement()
            ..onClick.listen(
              (event) => _onSubmit(event),
            )
            ..classes.add('btn-login')
            ..text = "Cadastrar")
          ..append(
            DivElement()
              ..classes.add('bottom-text')
              ..appendText('Já tem conta?')
              ..append(
                ButtonElement()
                  ..classes.add('btn-link')
                  ..text = "Faça Login"
                  ..onClick.listen(
                    (e) => Controller.loadOnBody(LoginView()),
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

    switch (LoginController().cadastrar(
      _user.value,
      _password.value,
      _confimation.value,
    )) {
      case -1:
        // _feedback.style.visibility = "visible";
        _feedback.classes.remove('success');
        _feedback.classes.remove('hidden');
        _feedback.classes.add('error');
        _feedback.text = "Username não disponível";
        break;
      case -2:
        // _feedback.style.visibility = "visible";
        _feedback.classes.remove('success');
        _feedback.classes.remove('hidden');
        _feedback.classes.add('error');
        _feedback.text = "As senhas não conferem";
        break;
      case -3:
        _feedback.classes.remove('success');
        _feedback.classes.remove('hidden');
        _feedback.classes.add('error');
        _feedback.text = "Preencha campos obrigatórios";
        break;
      case 0:
        // _feedback.style.visibility = "visible";
        _feedback.classes.remove('hidden');
        _feedback.classes.remove('error');
        _feedback.classes.add('success');
        _feedback.text = "Cadastro realizado com sucesso!";
        // sleep(const Duration(seconds: 3));
        Future.delayed(const Duration(seconds: 2),
            () => Controller.loadOnBody(LoginView()));
        break;
    }
  }
}
