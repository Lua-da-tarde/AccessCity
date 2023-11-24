// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tccmobile/controller/lugar_control.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/model/local.dart';
import 'package:tccmobile/tema_provider.dart';
import 'package:tccmobile/view/paginas_principais/lugares/local.dart';
import 'package:tccmobile/model/adaptacoes.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  List<Local> buscaLugar = [];

  @override
  void initState() {
    buscaLugar = List.from(locais);
    super.initState();
  }

  static int local = 0;
  Icon icone1 = Icon(Icons.forest_outlined);
  Icon icone2 = Icon(Icons.restaurant);
  Icon icone3 = Icon(Icons.nightlife);
  Icon icone4 = Icon(Icons.medical_services_outlined);
  Icon icone5 = Icon(Icons.shopping_basket);
  Icon icone6 = Icon(Icons.tag);
  Icon iconeSelecionado = Icon(Icons.tag);
  
  // 1 - Parques e Praças
  // 2 - Restaurantes e Lanchonetes
  // 3 - Bares e Baladas
  // 4 - Farmácias, clínicas e hospitais
  // 5 - Supermercados
  // 6 - Outros

  Icon defineIcone(int id){
    switch(id){
      case 1:
        iconeSelecionado = icone1;
      case 2:
        iconeSelecionado = icone2;  
      case 3:
        iconeSelecionado = icone3;
      case 4:
        iconeSelecionado = icone4;
      case 5:
        iconeSelecionado = icone5;
      default: 
        iconeSelecionado = icone6;
    }
    return iconeSelecionado;
  }

  void carregaBusca(String digitado){
    if(digitado.trim() == "") {
      buscaLugar = lugarControl.getAll();
    }else{
      buscaLugar = [];

      for (var local in locais) {
        if (local.nome.toLowerCase().startsWith(digitado.toLowerCase())) {
          buscaLugar.add(local);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      title: 'AccessCity',
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).colorScheme.background,
          title: TextFormField(
            onChanged: (value){
              setState(() {
                carregaBusca(value);
              });
            },
            decoration: InputDecoration(
              hintText: "Pesquisar...",
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              suffixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.tertiary),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.white, width: 2.0)
              ),
            ),
          ),
          actions: [],
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/lugar');
              },
            ),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sugestões",
                  style: TextStyle(
                    fontSize: Fonte.fonteXLarge,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: buscaLugar.length,
                  separatorBuilder: (context, index) => Divider(thickness: 0, color: Colors.transparent,),
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: defineIcone(buscaLugar[index].tipoLocal),
                      title: Text(buscaLugar[index].nome, style: TextStyle(fontSize: Fonte.fonteMedia),),
                      onTap: () {
                        local = buscaLugar[index].idLocal;
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return PaginaLoc(buscaLugar[index]);
                          }
                        ));
                      },
                    );
                  }, 
                ),
              ],
            ),
          ),
        )
      );

  }
}