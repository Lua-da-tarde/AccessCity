import 'package:latlong2/latlong.dart';

class Rota {
  final int id;
  final String inicio;
  final String fim;
  final bool acessivel;
  final List<LatLng> path;
  final String paradaInicial; 
  final List<String> paradas; 
  final String paradaFinal; 

  const Rota(this.id, this.inicio, this.fim, this.acessivel, this.paradaInicial, this.paradas, this.paradaFinal, {required this.path});

  String get rota => id.toString().padLeft(3);
}

class DefaultRota extends Rota {
  DefaultRota()
      : super(0, "", "", false, path: const [
          LatLng(-22.5611384, -47.4225738),
        ], "Parada Inicial", [" "], "Parada Final");

  @override
  String get rota => "";
}

var defaultRota = DefaultRota();

const mockRotas = [
  Rota(04, "Olga Veroni", "Vanessa", true,  "R. Vicente De Carvalho", ["Avenida Assis Brasil", "R. João D'Adona"], "R. Ruben Janine", path: [
    LatLng(-22.542062, -47.415878),
    LatLng(-22.542027, -47.415990),
    LatLng(-22.541425, -47.417600),
    LatLng(-22.541431, -47.417742),
    LatLng(-22.541610, -47.417689),
    LatLng(-22.542257, -47.415973),
    LatLng(-22.542062, -47.415878),
    LatLng(-22.543294, -47.416435),
    LatLng(-22.543727, -47.416617),
    LatLng(-22.543755, -47.416617),
    LatLng(-22.543776, -47.416641),
    LatLng(-22.543815, -47.416703),
    LatLng(-22.543871, -47.416694),
    LatLng(-22.543907, -47.416681),
    LatLng(-22.543943, -47.416637),
    LatLng(-22.543976, -47.416634),
    LatLng(-22.544780, -47.416479),
    LatLng(-22.545081, -47.416605),
    LatLng(-22.545220, -47.416512),
    LatLng(-22.545244, -47.416312),
    LatLng(-22.545119, -47.416194),
    LatLng(-22.545008, -47.415860),
    LatLng(-22.544921, -47.415624),
    LatLng(-22.544884, -47.414900),
    LatLng(-22.544748, -47.413940),
    LatLng(-22.544602, -47.413487),
    LatLng(-22.544108, -47.412812)
  ],),
  
  Rota(102, "Parque Hipólito", "Nossa Senhora das Dores", true, "Supermercado Covabra", ["R. Jaime Camargo", "R. Doná Maria Angélica Vergueiro"], "Avenida Higino De Barros Camargo", path: [
    LatLng(-22.559758, -47.425685),
    LatLng(-22.559540, -47.424735),
    LatLng(-22.559275, -47.423545),
    LatLng(-22.559216, -47.423179),
    LatLng(-22.559119, -47.422618),
    LatLng(-22.558994, -47.422074),
    LatLng(-22.558828, -47.421546),
    LatLng(-22.558744, -47.421098),
    LatLng(-22.558644, -47.420679),
    LatLng(-22.558599, -47.420291),
    LatLng(-22.558629, -47.419856),
    LatLng(-22.558673, -47.419526),
    LatLng(-22.558776, -47.419168),
    LatLng(-22.558940, -47.418730),
    LatLng(-22.559135, -47.418341),
    LatLng(-22.559449, -47.417826),
    LatLng(-22.559784, -47.417226),
    LatLng(-22.560412, -47.416205),
    LatLng(-22.560735, -47.415660),
    LatLng(-22.560977, -47.415287),
    LatLng(-22.561085, -47.415148),
    LatLng(-22.561269, -47.415125),
  ],),

  Rota(114, "Lagoa Nova", "Atacadão", false, "R. Henrique Jacobs", ["R. Lauro Camargo Silveira", "R. Adilson Edgar Amigo"], "R. Gilson Cesar Massola", path: [
    LatLng(-22.610702, -47.414981),
    LatLng(-22.609655, -47.415191),
    LatLng(-22.609063, -47.415317),
    LatLng(-22.607887, -47.415673),
    LatLng(-22.606705, -47.416054),
    LatLng(-22.605582, -47.416458),
    LatLng(-22.604488, -47.416936),
    LatLng(-22.603366, -47.417428),
    LatLng(-22.602270, -47.418019),
    LatLng(-22.601674, -47.416640)
  ])
];

const pontos = {"cotil": LatLng(-22.5611384, -47.4225738)};
