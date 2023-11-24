import 'package:flutter/material.dart';
import 'package:tccmobile/model/adaptacoes.dart';
import 'package:tccmobile/model/local.dart';

import '../../main.dart';

class Tab_Motora extends StatelessWidget {
  Local local; 

  Tab_Motora(this.local, {super.key});

  @override
  Widget build(BuildContext context) {

    Icon defineIcone(Adaptacao adaptacao){
      if(adaptacao.classificacao.toString() == "acessivel"){
        return const Icon(Icons.accessible);
      }else{
        return const Icon(Icons.tag);
      }
    } 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(var adaptacao in local.adaptacoesMot)
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                defineIcone(adaptacao),
                Text(adaptacao.tipo, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Cores.corFonte,
                  fontSize: Fonte.fonteMedia
                ),),
              ],
            ),
          ),
      ]
    );
  }
}