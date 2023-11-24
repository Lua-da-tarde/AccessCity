// ignore_for_file: sized_box_for_whitespace
import 'package:provider/provider.dart';
import 'package:tccmobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:tccmobile/model/local.dart';
import 'package:tccmobile/tema_provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Lugar extends StatefulWidget {
  const Lugar({super.key});

  @override
  State<Lugar> createState() => _LugarState();
}

class _LugarState extends State<Lugar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).colorScheme.background,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pushNamed(context, '/pesquisa');
                  },
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
                                          color: Cores.vermelho,
                                          fontSize: 22,
                                          fontFamily: 'Bebas Neue')),
                                  Text("City",
                                      style: TextStyle(
                                          color: Cores.vermelho,
                                          fontSize: 22,
                                          fontFamily: 'Bebas Neue'))
                                ])),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Icon(Icons.person,),
                      title: Text('Meu Perfil',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Fonte.fonteMedia)),
                      onTap: () {
                        Navigator.pushNamed(context, "/perfil");
                      },
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Icon(Icons.wallet, color: Cores.corFonte,),
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
                //Inicio mapa
                Container(
                  width: 600,
                  height: 900,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(-22.560992, -47.423818),
                      zoom: 13.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: const ['a', 'b', 'c'],
                      ),
                    ],
                  ),
                ),
                //Fim mapa
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
                    initialLabelIndex: 1,
                    icons: const [Icons.directions_bus, Icons.location_on],
                    onToggle: (index) {
                      if (index == 0) {
                        Navigator.pushNamed(context, '/onibus');
                      }
                    },
                  ),
                ]));
  }
}
