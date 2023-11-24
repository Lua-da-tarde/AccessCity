enum Deficiencia {
  motora,
  auditiva,
  visual,
  outra
}

const deficienciaToString = {
  Deficiencia.motora: "motora",
  Deficiencia.auditiva: "auditiva",
  Deficiencia.visual: "visual",
  Deficiencia.outra: "outra"
};

class User {
  String email;
  String cid; 
  String usuario;
  String nome;
  String telefone;
  DateTime nascimento; 
  String cpf;

  List<Deficiencia> deficiencias;

  bool hasDeficiencia(Deficiencia deficiencia) {
    return deficiencias.contains(deficiencia);
  }

  void toggleDeficiencia(Deficiencia deficiencia) {
    if (hasDeficiencia(deficiencia) == true) {
      deficiencias.add(deficiencia);
    }else{
      deficiencias.remove(deficiencia);
    }
  }

  //construtor
  User({required this.usuario, required this.nome, required this.cpf, this.cid = "", required this.email, this.deficiencias = const [], required this.telefone, required this.nascimento});

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      cpf: map["cpf"],
      nome: map["nome_completo"],
      usuario: map["nome_usuario"],
      email: map["email"],
      telefone: map["celular"],
      nascimento: DateTime.parse(map["data_nascimento"] as String),
    );
  }
}

//array com todos os usuarios - vale a pena colocar o banco de dados em uma array e chamar ela depois? não soa seguro
List<User> users = [
    User(usuario: "cat", nome: "Catarina", cpf: "53608557890", email: "catfagboni@gmail.com", deficiencias: [Deficiencia.auditiva], telefone: "991018190", nascimento: DateTime(2005, 09, 27)),
    User(usuario: "tbasso", nome: "Bania", cpf: "86324589620", email: "tbasso@cotil.unicamp.br", deficiencias: [], telefone: "34413010", nascimento: DateTime(1990, 03, 26)),
    User(usuario: "babi", nome: "Babi", cpf: "96358962452", email: "bab1aimy@gmail.com", deficiencias: [], telefone: "945863575", nascimento: DateTime(2006, 06, 22)),
    User(usuario: "nat", nome: "Nat", cpf: "49036292875", email: "nat1234@gmail.com", deficiencias: [Deficiencia.motora], telefone: "992941707", nascimento: DateTime(2005, 05, 06)),
    User(usuario: "meieda", nome: "Meida", cpf: "68396024156", email: "catarinaMeieda@email.com", deficiencias: [Deficiencia.outra, Deficiencia.visual], telefone: "3452-2032", nascimento: DateTime(1970, 07, 14)),
    User(usuario: "portugal", nome: "Heitor", cpf: "23994674859", email: "heitorPortugal@email.com", deficiencias: [Deficiencia.outra], telefone: "983828033", nascimento: DateTime(2005, 11, 06)),
];
