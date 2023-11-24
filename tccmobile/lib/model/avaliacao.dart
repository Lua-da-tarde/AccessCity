
class Avaliacao  {
  final String comentario;
  final int pontuacao;
  final String usuario;
  final int lugar; 

  Avaliacao({required this.pontuacao, required this.comentario, required this.usuario, required this.lugar});

  factory Avaliacao.fromMap(Map<String, dynamic> map){
    return Avaliacao(
      pontuacao: map["pontuacao"], 
      comentario: map["comentario"], 
      usuario: map["usuario"], 
      lugar: map["id_lugar"]
    );
  }

  Map<String, dynamic> toMap() => {
    "pontuacao": pontuacao,
    "comentario": comentario,
    "usuario": usuario,
    "id_lugar": lugar
  };
}
