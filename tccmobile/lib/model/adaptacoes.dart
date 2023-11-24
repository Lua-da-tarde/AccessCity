import 'package:tccmobile/model/usuario.dart';

enum Classificacao {
  acessivel,
  pouco,
  nada
}

class Adaptacao {
  final String tipo;
  final Classificacao classificacao;

  const Adaptacao({required this.classificacao, required this.tipo});
}

class Adaptacoes {
  final Map<Deficiencia, List<Adaptacao>> adaptacoes;

  const Adaptacoes({ required this.adaptacoes });
}

const adaptacoes = Adaptacoes(adaptacoes: {
  Deficiencia.motora: [
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Banheiro acessível"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui banheiro acessível"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Rampa"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui rampas"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Possui Corrimão"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui corrimão"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Possui elevadores"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui elevadores"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Espaço para cadeira de rodas"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui cadeira de rodas"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Vaga em estacionamento"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Fila preferencial"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Porta automática"),
  ],
  Deficiencia.auditiva: [
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Banheiro acessível"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui banheiro acessível"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Intérprete"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui intérprete"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Vaga em estacionamento"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui vaga em estacionamento"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Fila preferencial"),
  ],
  Deficiencia.visual: [
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Banheiro acessível"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui banheiro acessível"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Braile"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui braile"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Piso tátil"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui piso tátil"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Fila preferencial"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui fila preferencial"),
  ],
  Deficiencia.outra: [
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Banheiro acessível"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui banheiro acessível"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Vaga em estacionamento"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui vaga em estacionamento"),
    Adaptacao(classificacao: Classificacao.acessivel, tipo: "Fila preferencial"),
    Adaptacao(classificacao: Classificacao.nada, tipo: "Não possui fila preferencial"),
    Adaptacao(classificacao: Classificacao.pouco, tipo: "Lugar barulhento"),
    Adaptacao(classificacao: Classificacao.pouco, tipo: "Luzes Intermitentes"),
    Adaptacao(classificacao: Classificacao.pouco, tipo: "Pouca circulação de ar")
  ],
});
