// ignore_for_file: avoid_print

import 'package:intl/intl.dart';
import 'package:tccmobile/api.dart';
import 'package:tccmobile/model/usuario.dart';

class UserControl {
  User? _loggedUser;
 String senha = "";

  List<User> getAll() => users;

  User? get loggedUser => _loggedUser;

  Future<void> login(String email, String password) async {
    print("$email  $password");

    final response = await api.post("/mobile/login",
      data: { "email": email, "senha": password }
    );

    if (response.statusCode != 200) {
      throw Exception("Burro");
    }

    final data = response.data;
    print(data);
    print(data.runtimeType);
    _loggedUser = User.fromMap(data);
  }
  
  Future<void> cadastro(User user, String senha) async{
    final formatter = DateFormat("yyyy-MM-dd");

    final resposta = await api.post("/mobile/registro", data: {
      "cpf": user.cpf,
      "email": user.email,
      "nome_completo": user.nome,
      "senha": senha,
      "username": user.usuario,
      "celular": user.telefone,
      "data_nascimento": formatter.format(user.nascimento),
    });

    if(resposta.statusCode != 200){
      throw Exception("Errou alguma coisa desgraça");
    }

    print(resposta.data);
    print(resposta.runtimeType); 
  }

  Future<void> alterar(User user) async{
    final formatter = DateFormat("yyyy-MM-dd");

    final response = await api.post("/trocadados", data: {
      "cpf": user.cpf,
      "email": user.email,
      "nome": user.nome,
      "username": user.usuario,
      "celular": user.telefone,
      "data_nascimento": formatter.format(user.nascimento)
    });

    if(response.statusCode != 200){
      print(response.data);
      print(response.statusMessage);
      throw Exception("Errou porra");
    }
  }
}


final userControl = UserControl();
