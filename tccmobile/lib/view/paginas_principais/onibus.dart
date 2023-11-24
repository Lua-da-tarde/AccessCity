// ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:tccmobile/controller/lugar_control.dart';
import 'package:tccmobile/model/local.dart';
import 'package:tccmobile/model/rota.dart';
import 'package:tccmobile/main.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Onibus extends StatefulWidget {
  final String defaultValue;

  const Onibus({super.key, this.defaultValue = " "});

  @override
  State<Onibus> createState() => _OnibusState();
}

class _OnibusState extends State<Onibus> {
  bool mostraContainer = false;
  bool mostraParada = false;
  Rota _selectedRota = defaultRota;
  final _mapController = MapController();
  Icon iconeAcess = Icon(
    Icons.close_rounded,
    color: Cores.cinza,
  );

  dynamic paradas() {
    if (mostraParada == true) {
      return Text("paradas");
    } else {
      return Icon(Icons.vertical_align_bottom_rounded, color: Theme.of(context).colorScheme.outlineVariant);
    }
  }

  List<Rota> rotas = [];

  void carregaRotaBd() {
    rotas = mockRotas;
  }

  _OnibusState() {
    carregaRotaBd();
  }

  List<Rota> get _rotas {
    final List<Rota> rotasAux = [defaultRota];
    rotasAux.addAll(rotas);

    return rotasAux;
  }

  void defineIcone() {
    if (_selectedRota.acessivel == true) {
      iconeAcess = Icon(
        Icons.accessible_rounded,
        color: Theme.of(context).colorScheme.tertiaryContainer,
      );
    } else if (_selectedRota.acessivel == false) {
      iconeAcess = Icon(
        Icons.not_accessible_rounded,
        color: Theme.of(context).colorScheme.tertiaryContainer,
      );
    }
  }

  void updateMapCenter() {
    if (_selectedRota.toString().isNotEmpty) {
      _mapController.move(_selectedRota.path[0], 18.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AccessCity',
        home: Scaffold(
            appBar: AppBar(
              //elevation: 10,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).colorScheme.background,
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 300,
                    child: DropdownButton<Rota>(
                      style: TextStyle(color: Colors.white),
                      dropdownColor: Cores.azul,
                      borderRadius: BorderRadius.circular(10),
                      value: _selectedRota,
                      items: _rotas
                          .map((rota) => DropdownMenuItem<Rota>(
                              child: Text(
                                rota.rota,
                              ),
                              value: rota))
                          .toList(),
                      onChanged: (Rota? newValue) {
                        setState(() {
                          _selectedRota = newValue!;
                          updateMapCenter();
                          int valor = newValue.id;
                          defineIcone();
                          if (valor != 0) {
                            mostraContainer = true;
                          } else {
                            mostraContainer = false;
                          }
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            //Menu
            drawer: Theme(
              data: Theme.of(context).copyWith(
                dividerTheme: const DividerThemeData(color: Colors.transparent) //deixa a linha transparente
              ),
              child: Drawer(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                child: ListView(padding: EdgeInsets.zero, children: <Widget>[
                  DrawerHeader(
                    child: Row(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/logo-menor.png",
                                  width: 64, height: 64),
                            ]),
                        Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Access",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.outlineVariant,
                                          fontSize: 22,
                                          fontFamily: 'Bebas Neue')),
                                  Text("City",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.outlineVariant,
                                          fontSize: 22,
                                          fontFamily: 'Bebas Neue'))
                                ])),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Meu Perfil', style: TextStyle(fontWeight: FontWeight.bold, fontSize: Fonte.fonteMedia)),
                      onTap: () {
                        Navigator.pushNamed(context, "/perfil");
                      },
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Icon(Icons.wallet, color: Cores.corFonte),
                      title: Text('Meus documentos',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Cores.corFonte, fontSize: Fonte.fonteMedia)),
                      onTap: () {
                        Navigator.pushNamed(context, "/documentos");
                      },
                    ),
                  ),*/
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Configurações',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Fonte.fonteMedia)),
                          onTap: () =>
                              {Navigator.pushNamed(context, "/configuracoes")}))
                ]),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Stack(
                  children: [
                    //mapa
                    Container(
                      width: 600,
                      height: 900,
                      child: FlutterMap(
                        options: MapOptions(
                          center: defaultRota.path[0], //_selectedRota.path[0],
                          zoom: 18.0,
                        ),
                        mapController: _mapController,
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          PolylineLayer(
                            polylines: [
                              Polyline(
                                  points: _selectedRota.path,
                                  strokeWidth: 4,
                                  color: Theme.of(context).colorScheme.outlineVariant)
                            ],
                          )
                        ],
                      ),
                    ),
                    //Container com informações rota
                    Visibility(
                      visible: mostraContainer,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 300,
                            //height: 250,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Informações da rota",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Fonte.fonteMedia,
                                          fontFamily: 'Comfortaa')),
                                  SizedBox(height: 10),
                                  //Linha 1
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(child: Text(_selectedRota.id.toString(),), backgroundColor: Theme.of(context).colorScheme.outlineVariant, maxRadius: 15,),
                                      Expanded(
                                        child: Text(
                                          "${_selectedRota.inicio}/${_selectedRota.fim}",
                                          softWrap: true,
                                          style: TextStyle(
                                            fontFamily: 'Comfortaa', 
                                            fontWeight: FontWeight.bold,
                                            fontSize: Fonte.fonteSmall
                                          ),
                                        ),
                                      ),
                                      iconeAcess,
                                    ],
                                  ),
                                  if(_selectedRota.acessivel == false)
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text("O ônibus dessa rota não é acessível", style: TextStyle(color: Theme.of(context).colorScheme.outlineVariant, fontSize: Fonte.fonteSmall),),
                                  ),
                                  //Tentativa de manter o design lindo da Lua
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.place, color: Theme.of(context).colorScheme.outlineVariant), 
                                              Text(_selectedRota.paradaInicial, style: TextStyle(fontSize: Fonte.fonteSmall),),
                                            ],
                                          ),
                                          if(mostraParada == true)
                                            Column(
                                              //crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                for (var parada in _selectedRota.paradas)
                                                  Padding(
                                                    padding: const EdgeInsets.all(6.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.place, color: Theme.of(context).colorScheme.outlineVariant, size: 12,),
                                                        Text(parada),
                                                      ],
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          if(mostraParada == false)
                                            Icon(Icons.arrow_downward),
                                          Row(
                                            children: [
                                              Icon(Icons.place, color: Theme.of(context).colorScheme.outlineVariant),
                                              Text(_selectedRota.paradaFinal, style: TextStyle(fontSize: Fonte.fonteSmall),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          mostraParada = !mostraParada;
                                        });
                                      },
                                      child: Text(
                                        mostraParada == false ? "Ver mais" : "Ver menos",
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.tertiaryContainer,
                                          fontWeight: FontWeight.bold),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
            floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleSwitch(
                    minWidth: 56,
                    minHeight: 48,
                    cornerRadius: 30,
                    radiusStyle: true,
                    iconSize: 60,
                    activeBgColor: [Theme.of(context).colorScheme.background],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Cores.cinzaEsc,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [Icons.directions_bus, Icons.location_on],
                    onToggle: (index) {
                      if (index == 1) {
                        Navigator.pushNamed(context, '/lugar');
                      }
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Theme.of(context).colorScheme.tertiary,
                              title: Text('Carteira', style: TextStyle( fontFamily: 'Comfortaa', fontSize: Fonte.fonteLarge)),
                              content: Image.asset(
                                'assets/carteira.png',
                                width: 500,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.close,
                                    )
                                ),
                              ],
                            );
                          }
                        );
                    },
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ]
              )
            )
          );
  }
}
