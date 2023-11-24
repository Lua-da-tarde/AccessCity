import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tccmobile/components/comentario_list.dart';
import 'package:tccmobile/components/rating/star_rating.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/model/adaptacoes.dart';
import 'package:tccmobile/model/local.dart';
import 'package:tccmobile/view/paginas_principais/lugares/comentar.dart';

class PaginaLoc extends StatefulWidget {
  Local local;

  PaginaLoc(this.local, {super.key});

  @override
  State<PaginaLoc> createState() => _PaginaLocState();
}

Icon parqueIcon = Icon(Icons.forest_outlined);
Icon restaurantIcon = Icon(Icons.restaurant);
Icon barIcon = Icon(Icons.nightlife);
Icon saudeIcon = Icon(Icons.medical_services_outlined);
Icon mercadoIcon = Icon(Icons.shopping_basket);
Icon outrosIcon = Icon(Icons.tag);
Icon iconeSelecionado = Icon(Icons.tag);

class _PaginaLocState extends State<PaginaLoc> with TickerProviderStateMixin {
  _PaginaLocState();

  Icon setIcon(int id) {
    switch (id) {
      case 1:
        iconeSelecionado = parqueIcon;
      case 2:
        iconeSelecionado = restaurantIcon;
      case 3:
        iconeSelecionado = barIcon;
      case 4:
        iconeSelecionado = saudeIcon;
      case 5:
        iconeSelecionado = mercadoIcon;
      default:
        iconeSelecionado = outrosIcon;
    }
    return iconeSelecionado;
  }

  Icon defineIcone(Adaptacao adaptacao) {
    if (adaptacao.classificacao.toString() == "Classificacao.acessivel") {
      return const Icon(Icons.accessible);
    } else {
      return const Icon(Icons.tag);
    }
  }

  String nomeLugar = "";
  String enderecoLugar = "";
  String fechamento = "";
  int idLugar = 0;
  int avaliacao = 0;
  final formatter = DateFormat.Hm();

  @override
  void initState() {
    nomeLugar = widget.local.nome;
    enderecoLugar = widget.local.endereco;
    fechamento = formatter.format(widget.local.fechamento).toString();
    idLugar = widget.local.tipoLocal;
    avaliacao = int.parse(widget.local.estrelas.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabControl = TabController(length: 4, vsync: this);
    String image = "assets/hipica.jpg";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 250,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
                )
              ),
              Positioned(
                top: 220,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            setIcon(idLugar),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(nomeLugar,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)
                              )
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: StarRating(avaliacao: "$avaliacao.0")
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                              size: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                width: 300,
                                child: Text(enderecoLugar,style: TextStyle(fontSize: Fonte.fonteMedia,color: Theme.of(context).colorScheme.tertiaryContainer))
                              )
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Icon(Icons.timer_outlined,
                                size: 30),
                              const SizedBox(width: 10),
                              Text('Aberto', style: TextStyle(fontSize: Fonte.fonteMedia, color: Colors.green)),
                              Text(' - Fecha às $fechamento', style: TextStyle(fontSize: Fonte.fonteMedia, color: Theme.of(context).colorScheme.tertiaryContainer)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Container(
                          child: TabBar(
                              controller: tabControl,
                              labelColor: Theme.of(context).colorScheme.primaryContainer,
                              indicatorColor: Theme.of(context).colorScheme.primaryContainer,
                              dividerColor: Cores.transparent,
                              tabs: const [
                                Tab(text: "Motora"),
                                Tab(text: "Auditiva"),
                                Tab(text: "Visual"),
                                Tab(text: "Outras"),
                              ]),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 400,
                          width: double.maxFinite,
                          child: TabBarView(
                              controller: tabControl,
                              children: [
                                //Motora
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for(var adaptacao in widget.local.adaptacoesMot)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          defineIcone(adaptacao),
                                          Text(adaptacao.tipo, style: TextStyle(
                                                fontSize: Fonte.fonteMedia
                                            ),),
                                        ],
                                      ),
                                    ),
                                ]
                                ),
                                //Auditiva
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for(var adaptacao in widget.local.adaptacaoAud)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          defineIcone(adaptacao),
                                          Text(adaptacao.tipo, style: TextStyle(
                                                fontSize: Fonte.fonteMedia
                                            ),),
                                        ],
                                      ),
                                    ),
                                ]
                                ),
                                //Visual
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for(var adaptacao in widget.local.adaptacaoVis)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          defineIcone(adaptacao),
                                          Text(adaptacao.tipo, style: TextStyle(
                                                fontSize: Fonte.fonteMedia
                                            ),),
                                        ],
                                      ),
                                    ),
                                ]
                                ),
                                //Outras
                                Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  for(var adaptacao in widget.local.adaptacaoVis)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          defineIcone(adaptacao),
                                          Text(adaptacao.tipo, style: TextStyle(
                                                fontSize: Fonte.fonteMedia
                                            ),),
                                        ],
                                      ),
                                    ),
                                ]
                                ),
                          ]),
                        ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Comentários e avaliações", style: TextStyle(fontSize: Fonte.fonteXLarge, fontWeight: FontWeight.bold),),
                        )
                      ),
                      ComentarioList(local: widget.local),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                             builder: (context){
                              return Comentar(widget.local); 
                             }
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                            textStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text("Adicionar Avaliação", style: TextStyle(fontSize: Fonte.fonteMedia,fontWeight: FontWeight.bold,color: Colors.white)),
                        ),
                      ),
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
