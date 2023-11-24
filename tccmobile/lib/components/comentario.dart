import 'package:flutter/material.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/model/avaliacao.dart';

class ComentarioTile extends StatefulWidget {
  final Avaliacao avaliacao;
  const ComentarioTile({required this.avaliacao, super.key});

  @override
  State<ComentarioTile> createState() => _ComentarioTileState();
}

class _ComentarioTileState extends State<ComentarioTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/hipica.jpg"),
        ),
        title: Text(
          widget.avaliacao.usuario,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
              children: List.generate(
                  5,
                  (index) => Icon(
                        index + 1 <= widget.avaliacao.pontuacao / 2
                            ? Icons.star
                            : Icons.star_border,
                        color: Cores.azul,
                        size: 30,
                      ))),
          Text(
            "${widget.avaliacao.pontuacao.toDouble() / 2}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.avaliacao.comentario,
            style: const TextStyle(fontSize: 15),
          )
        ]));
  }
}
