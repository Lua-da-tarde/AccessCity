import 'package:flutter/material.dart';
import 'package:tccmobile/model/adaptacoes.dart';

class TabRating extends StatefulWidget {
  const TabRating({super.key, required this.adaptacoes});
  final Adaptacoes adaptacoes;

  @override
  State<TabRating> createState() => _TabRatingState();
}

class _TabRatingState extends State<TabRating> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller =
        TabController(length: widget.adaptacoes.adaptacoes.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      TabBar(
          controller: controller,
          tabs: widget.adaptacoes.adaptacoes.keys
              .map((deficiencia) => Tab(
                    text: deficiencia.name,
                  ))
              .toList()),
      TabBarView(
        children: widget.adaptacoes.adaptacoes.keys.map((deficiencia) {
          return ListView(
            children:
                widget.adaptacoes.adaptacoes[deficiencia]!.map((adaptacao) {
              return Text("${adaptacao.tipo}: ${adaptacao.classificacao.name}");
            }).toList(),
          );
        }).toList(),
      )
    ]);
  }
}
