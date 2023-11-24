import 'package:flutter/material.dart';
import 'package:tccmobile/components/comentario.dart';
import 'package:tccmobile/controller/avaliacao_control.dart';
import 'package:tccmobile/model/avaliacao.dart';
import 'package:tccmobile/model/local.dart';

import '../main.dart';

class ComentarioList extends StatelessWidget {
  final Local local;

  const ComentarioList({super.key, required this.local});

  dynamic carrega(Future<List<Avaliacao>> list){
    if(list.toString().isEmpty){
      return Text("Lugar não possui avaliações");
    }else{
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: avaliacaoControl.getFrom(local),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Lugar não possui avaliações", style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          );
        }

        if (!snapshot.hasData) {
          return const Text("cade");
        }

        return ListView.separated(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          separatorBuilder: (context, index) => const Divider(
            color: Cores.transparent,
          ),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.tertiaryContainer
                          )
                        ),
            child: ComentarioTile(avaliacao: snapshot.data![index])
          ),
        );
      }
    );
  }
}