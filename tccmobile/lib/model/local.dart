import 'package:intl/intl.dart';
import 'package:tccmobile/model/adaptacoes.dart';
import 'package:tccmobile/model/usuario.dart';

class Local {
  int idLocal = 0;
  int tipoLocal = 0;
  String nome = "";
  String endereco = "";
  num estrelas = 0;
  DateTime abertura;
  DateTime fechamento; 
  List<Adaptacao> adaptacoesMot;
  List<Adaptacao> adaptacaoAud;
  List<Adaptacao> adaptacaoVis;
  List<Adaptacao> adaptacaoOut; 

  //Adaptacoes? adaptacoes;

  final formatter = DateFormat.Hm();

  Local({required this.idLocal, required this.tipoLocal, required this.nome, required this.endereco, required this.estrelas, required this.abertura, required this.fechamento, required this.adaptacoesMot, required this.adaptacaoAud, required this.adaptacaoVis, required this.adaptacaoOut});
  
}

  final List<Local> locais = [
    
    Local(idLocal: 2, tipoLocal: 1, nome: "Parque do Mirim", endereco: "R. João Martini, 105 - Jardim Morada do Sol, Indaiatuba - SP, 13348-010", estrelas: 4, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 19, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
      adaptacoes.adaptacoes[Deficiencia.motora]![7],
      adaptacoes.adaptacoes[Deficiencia.motora]![9],
    ], adaptacaoAud: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ], adaptacaoVis: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ], adaptacaoOut: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ]),
    
    Local(idLocal: 3, tipoLocal: 1, nome: "Parque do Mirante", endereco: "R. João Martini, 105 - Jardim Morada do Sol, Indaiatuba - SP, 13348-010", estrelas: 4, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 18, 30), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
      adaptacoes.adaptacoes[Deficiencia.motora]![7], 
      adaptacoes.adaptacoes[Deficiencia.motora]![9],
    ], adaptacaoAud: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ], adaptacaoVis: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ], adaptacaoOut: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![3],
      adaptacoes.adaptacoes[Deficiencia.motora]![5],
    ]),
    
    Local(idLocal: 4, tipoLocal: 6, nome: "Shopping Pátio Limeira", endereco: "R. Carlos Gomes, 1321 - Centro, Limeira - SP, 13480-013", estrelas: 4, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 21, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
      adaptacoes.adaptacoes[Deficiencia.motora]![2]
    ], adaptacaoAud: [], adaptacaoVis: [], adaptacaoOut: []),
    
    Local(idLocal: 5, tipoLocal: 2, nome: "Augusta S Restaurante", endereco: "Av. Gumercindo Araújo, 50 - Jardim Nova Italia, Limeira - SP, 13484-411", estrelas: 4, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 15, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
    ], adaptacaoAud: [], adaptacaoVis: [], adaptacaoOut: []),
    
    Local(idLocal: 6, tipoLocal: 3, nome: "Neverland Louge Music Bar", endereco: "Av. Maria Buzolin, 682 - Jardim Piratininga, Limeira - SP, 13484-318", estrelas: 5, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 23, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![1],
    ], adaptacaoAud: [], adaptacaoVis: [], adaptacaoOut: []),
    
    Local(idLocal: 7, tipoLocal: 4, nome: "Farmácia Droga Raia", endereco: "Av. Maria Buzolin, 682 - Jardim Piratininga, Limeira - SP, 13484-318", estrelas: 5, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 22, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![0],
    ], adaptacaoAud: [], adaptacaoVis: [], adaptacaoOut: []),

    Local(idLocal: 8, tipoLocal: 5, nome: "Enxuto Supermercado", endereco: "R. Comendador Vicente Leone, 200 - Jardim Nossa Sra. de Fatima, Limeira - SP, 13480-041", estrelas: 4.5, abertura: DateTime(2007, 09, 25, 06, 30), fechamento: DateTime(2005, 12, 06, 22, 00), adaptacoesMot: [
      adaptacoes.adaptacoes[Deficiencia.motora]![0],
    ], adaptacaoAud: [], adaptacaoVis: [], adaptacaoOut: [])
  ];