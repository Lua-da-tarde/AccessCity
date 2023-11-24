import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tccmobile/controller/user_control.dart';
import 'package:tccmobile/model/usuario.dart';
import 'package:tccmobile/tema_provider.dart';
import 'package:tccmobile/view/conta_usuario/login.dart';
import 'package:tccmobile/main.dart';

import '../../../main.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class VariaveisConf {
  static bool light = false;
  
}

class _ConfigState extends State<Config> {
  //AVISO
    void mudarSenha(){
      showDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: Text("Configurações", style: TextStyle(fontSize: Fonte.fonteLarge),),
            content: Text("Deseja mesmo mudar a senha?", style: TextStyle(fontSize: Fonte.fonteSmall)),
            actions: [ 
              CupertinoDialogAction(child: Text("Não", style: TextStyle(fontSize: Fonte.fonteMedia, color: Theme.of(context).colorScheme.tertiaryContainer)), onPressed: (){
                Navigator.pop(context);
              },),
              CupertinoDialogAction(child: Text("Sim", style: TextStyle(fontSize: Fonte.fonteMedia, color: Theme.of(context).colorScheme.tertiaryContainer)), onPressed: (){
                //mudar senha
              },),
            ]
          );
        }
      );
    }
    void deletarConta(){
      showDialog(
        context: context,
        builder: (context){
          return CupertinoAlertDialog(
            title: Text("Configurações", style: TextStyle(fontSize: Fonte.fonteLarge)),
            content: Text("Deseja mesmo deletar sua conta?", style: TextStyle(fontSize: Fonte.fonteSmall)),
            actions: [ 
              CupertinoDialogAction(child: Text("Não", style: TextStyle(fontSize: Fonte.fonteMedia, color: Theme.of(context).colorScheme.tertiaryContainer)), onPressed: (){
                Navigator.pop(context);
              },),
              CupertinoDialogAction(child: Text("Sim", style: TextStyle(fontSize: Fonte.fonteMedia, color: Theme.of(context).colorScheme.tertiaryContainer)), onPressed: (){
                //deletar conta
              },),
            ]
          );
        }
      );
    }

  final bool customIcon = false;
  bool notif = true;

  @override
  Widget build(BuildContext context) {
    double valorF = 1;

    void defineFonte(valor){
      if(valor == 2){
        Fonte.fonteSmall = 13;
        Fonte.fonteMedia = 16;
        Fonte.fonteLarge = 18;
        Fonte.fonteXLarge = 20;
      } else if(valor == 1){
        Fonte.fonteSmall = 11;
        Fonte.fonteMedia = 14;
        Fonte.fonteLarge = 16;
        Fonte.fonteXLarge = 18;
      } else if(valor == 3){
        Fonte.fonteSmall = 15;
        Fonte.fonteMedia = 18;
        Fonte.fonteLarge = 20;
        Fonte.fonteXLarge = 22;
      }
    }

    if (userControl.loggedUser == null) {
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Configurações", style: TextStyle(fontSize: Fonte.fonteLarge, fontWeight: FontWeight.w600)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 16),
          )
        ]
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                height: 100,
                width: 360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/foto-perfil.jpg"),
                        radius: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("@" + userControl.loggedUser!.usuario, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                              //Text(userControl.loggedUser!.deficiencias.isEmpty ? "Sem deficiência" : userControl.loggedUser!.deficiencias.map((e) => deficienciaToString[e]).join(", "), style: TextStyle(fontSize: Fonte.fonteSmall, color: Theme.of(context).colorScheme.tertiaryContainer)),
                              Text(userControl.loggedUser!.email, style: TextStyle(fontSize: Fonte.fonteSmall, color: Theme.of(context).colorScheme.tertiaryContainer))
                            ],
                          )
                        ),
                      ]
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 32),
                        child: TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/perfil');
                          },
                          child: Text("Editar", style: TextStyle(color: Theme.of(context).colorScheme.outlineVariant, fontSize: Fonte.fonteSmall, fontWeight: FontWeight.bold,),)
                        )
                      )
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                width: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary
                ),
                child: Column(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text("Notificações", style: TextStyle(fontSize: Fonte.fonteMedia, fontWeight: FontWeight.w700)),
                        children: [
                          SwitchListTile(
                            title: Text("Permitir notificações?", style: TextStyle(fontSize: Fonte.fonteSmall)),
                            secondary: Icon(Icons.notifications_active, size: 18),
                            value: notif,
                            onChanged: (bool value){
                              setState(() {
                                notif = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        title: Text("Acessibilidade", style: TextStyle(fontSize: Fonte.fonteMedia, fontWeight: FontWeight.w700)),
                        children: [
                          ListTile(
                            title: Text("Tamanho da fonte", style: TextStyle(fontSize: Fonte.fonteSmall)),
                            leading: Icon(Icons.format_size, size: 18),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Cores.cinzaEsc,
                                      shape: BoxShape.circle,
                                      
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        setState(() {  
                                          defineFonte(1);
                                        });
                                      },
                                      child: Text("1", style: TextStyle(fontSize: Fonte.fonteSmall, color: Colors.white),),
                                    ),
                                  ), 
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Cores.cinzaEsc
                                    ),
                                    child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        defineFonte(2);
                                      });
                                    }, 
                                    child: Text("2", style: TextStyle(fontSize: Fonte.fonteSmall, color: Colors.white),)
                                  ),
                                  ),
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Cores.cinzaEsc
                                    ),
                                    child: TextButton(
                                      onPressed: (){
                                        setState(() {
                                          defineFonte(3);
                                        });
                                      }, 
                                      child: Text("3", style: TextStyle(fontSize: Fonte.fonteSmall, color: Colors.white),)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SwitchListTile(
                            title: Text("Modo escuro", style: TextStyle(fontSize: Fonte.fonteSmall)),
                            secondary: Icon(Icons.dark_mode, size: 18),
                            value: VariaveisConf.light,
                            activeColor: Colors.white,
                            onChanged: (bool value){
                              setState(() {
                                VariaveisConf.light = !VariaveisConf.light;
                                Provider.of<ThemeProvider>(context, listen: false).toogleTheme();
                              });
                            },
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}