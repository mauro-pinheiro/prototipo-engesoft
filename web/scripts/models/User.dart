import 'Model.dart';

class User extends Model {
  String _usuario;
  String _senha;
  int _privilegio;

  User(this._usuario, this._senha, this._privilegio);

  get usuario => _usuario;
  get senha => _senha;
  get privilegio => _privilegio;

  set usuario(value) => _usuario = value;
  set senha(value) => _senha = value;
  set privilegio(value) => _privilegio = value;

  bool autenticar(String password) {
    return this._senha == password;
  }
}
