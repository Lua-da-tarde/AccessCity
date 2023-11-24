import 'package:tccmobile/api.dart';
import 'package:tccmobile/controller/user_control.dart';
import 'package:tccmobile/model/avaliacao.dart';
import 'package:tccmobile/model/local.dart';

class AvaliacaoControl {
  Future<List<Avaliacao>> getFrom(Local local) async {
    final response =
        await api.get('/getavaliacao', data: {"id_lugar": local.idLocal});

    if (response.statusCode != 200) {
      throw Exception("Erro ao carregar avaliações.");
    }

    final data = response.data as List<dynamic>;
    return data.map((avaliacao) => Avaliacao.fromMap(avaliacao)).toList();
  }


  Future<void> create(Avaliacao avaliacao) async {
    final response =
        await api.post("/cadastraavaliacao", data: {
          "comentario": avaliacao.comentario,
          "pontuacao": avaliacao.pontuacao,
          "cpf": userControl.loggedUser!.cpf,
          "id_lugar": avaliacao.lugar
        });

    if (response.statusCode != 200) {
      throw Exception("Erro ao cadastrar nova avaliação.");
    }
  }
}

final avaliacaoControl = AvaliacaoControl();
