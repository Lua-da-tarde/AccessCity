 // ignore_for_file: non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tccmobile/tema.dart';
import 'package:tccmobile/tema_provider.dart';
import 'package:tccmobile/view/menu/config/config.dart';
import 'package:tccmobile/view/conta_usuario/login.dart';
import 'package:tccmobile/view/paginas_principais/lugares/comentar.dart';
import 'package:tccmobile/view/paginas_principais/lugares/lugares.dart';
import 'package:tccmobile/view/paginas_principais/lugares/pesquisa.dart';
import 'package:tccmobile/view/paginas_principais/onibus.dart';
import 'package:tccmobile/view/menu/perfil/perfil.dart';
import 'package:tccmobile/view/conta_usuario/cadastro.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    )
  );
}

class Fonte{
  static double fonteSmall = 13;
  static double fonteMedia = 16;
  static double fonteLarge = 18;
  static double fonteXLarge = 20;
}

class Cores {
  static Color blue = Color.fromARGB(255, 82, 109, 130);
  static Color azul = Color.fromARGB(255, 82, 109, 130);
  static Color azul2 = Color.fromARGB(255, 101, 121, 155);
  static Color azulLogo = Color.fromARGB(255, 101, 121, 155);
  static Color azulLogo2 = Color.fromARGB(255, 82, 109, 130);
  static Color azulFundo = Color.fromARGB(255, 211, 224, 234);
  static Color azulFundo2 = Color.fromARGB(255, 211, 224, 234);
  static Color vermelho = Color.fromARGB(255, 226, 62, 87);
  static Color brancoCerto = Color.fromARGB(255, 196, 203, 202);
  static Color barraSuperior = Colors.white;
  static Color brancoAzul = Colors.white;
  static Color corFonte = Colors.black;
  static Color cinza = Color.fromARGB(255, 129, 132, 134);
  static Color cinzaEsc = Color.fromARGB(255, 134, 134, 136);
  static const Color transparent = Color(0x00000000);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AccessCity',
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/': (context) => Login(),
          '/onibus': (context) => Onibus(),
          '/lugar': (context) => Lugar(),
          '/perfil': (context) => Perfil(),
          '/configuracoes': (context) => Config(),
          '/cadastro': (context) => Cadastro(),
          '/pesquisa': (context) => Pesquisa(),
          //'/comentar': (context) => Comentar(),
        });
  }
}
