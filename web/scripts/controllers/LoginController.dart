import '../models/User.dart';
import 'Controller.dart';

class LoginController extends Controller {
  static LoginController _instance;
  List<User> _usuarios;

  User _logado;

  LoginController._() {
    _usuarios = <User>[User('admin', 'admin', 0)];
  }

  factory LoginController() {
    return _instance ??= LoginController._();
  }

  get logado => _logado;

  bool login(String userName, String password) {
    var user =
        _usuarios.firstWhere((u) => u.usuario == userName, orElse: () => null);
    // print(user);
    if (user != null) {
      _logado = user.autenticar(password) ? user : null;
    }
    print(_logado);

    return _logado != null;
  }

  int cadastrar(String userName, String senha, String confirmacao) {
    if (userName.isEmpty || senha.isEmpty || confirmacao.isEmpty) {
      return -3;
    }

    if (_usuarios.map((u) => u.usuario).contains(userName)) {
      return -1;
    }

    if (senha != confirmacao) {
      return -2;
    }

    _usuarios.add(User(userName, senha, double.infinity as int));
    return 0;
  }
}
