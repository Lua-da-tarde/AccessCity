// ignore_for_file: prefer_final_fields, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';
import 'package:tccmobile/controller/user_control.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/model/usuario.dart';
import 'package:tccmobile/view/menu/config/config.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

  DateFormat formatoData = DateFormat('dd/MM/yyyy');
  final String dataFormatada = formatoData.format(userControl.loggedUser!.nascimento);

class _PerfilState extends State<Perfil> {
  //VARIAVEIS
  TextEditingController _campoNome = TextEditingController(text: userControl.loggedUser!.nome);
  TextEditingController _campoUsuario = TextEditingController(text: userControl.loggedUser!.usuario);
  TextEditingController _campoNasc = TextEditingController(text: dataFormatada);
  TextEditingController _campoEmail = TextEditingController(text: userControl.loggedUser!.email);
  TextEditingController _campoCel = TextEditingController(text: userControl.loggedUser!.telefone);
  //TextEditingController _campoCid= TextEditingController(text: userControl.loggedUser!.cid);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool enabled = false;
  bool auditiva = false;
  bool visual = false;
  bool motora = false;
  bool outra = false;
  bool salva = false; 

  //METODOS
  void Cancelar() {
    enabled = !enabled;
    _campoNome.clear();
    _campoNasc.clear();
    _campoEmail.clear();
    _campoCel.clear();
  }

  void Salvar() {
    print("salvou");
  }

  Icon mudaIcon() {
    if (enabled == true) {
      salva = true;
      return const Icon(Icons.save, size: 25,);
    } else {
      salva = false;
      return const Icon(Icons.edit,size: 25,);
    }
  }

  @override
  Widget build(BuildContext context) {
    auditiva = userControl.loggedUser!.hasDeficiencia(Deficiencia.auditiva);
    visual = userControl.loggedUser!.hasDeficiencia(Deficiencia.visual);
    motora =  userControl.loggedUser!.hasDeficiencia(Deficiencia.motora);
    outra =  userControl.loggedUser!.hasDeficiencia(Deficiencia.outra);

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Cores.azul,
                    radius: 80,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/foto-perfil.jpg"),
                      radius: 80,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Cores.azulLogo, shape: BoxShape.circle),
                        child: IconButton(
                          icon: const Icon(Icons.photo_camera),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
              SizedBox(height: 10),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _campoNome,
                          enabled: enabled,
                          decoration: InputDecoration(
                            labelText: "Nome completo",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _campoUsuario,
                          enabled: enabled,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Campo não pode ser vazio";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Nome de usuário",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaskedTextField(
                          controller: _campoEmail,
                          enabled: enabled,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Campo não pode ser vazio";
                            }else if(value.contains("@") == false){
                              return "E-mail deve conter um @"; 
                            }else{
                              return null; 
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaskedTextField(
                          controller: _campoCel,
                          enabled: enabled,
                          mask: '(##) #####-####',
                          decoration: InputDecoration(
                            labelText: "Celular",
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaskedTextField(
                          controller: _campoNasc,
                          enabled: enabled,
                          mask: "##/##/####",
                          decoration: InputDecoration(
                            labelText: "Data de Nascimento",
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        /*MaskedTextField(
                          controller: _campoCid,
                          enabled: enabled,
                          mask: "###",
                          decoration: InputDecoration(
                            labelText: "CID (Classificação Internacional de Doenças)",
                            iconColor: Cores.corFonte,
                            prefixIcon: const Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.outlineVariant,
          onPressed: (){
            if(_formKey.currentState!.validate()){
              setState(() {
                enabled = !enabled;
              });
              if(salva == true){
                final String user = _campoUsuario.text;
                print(user);
                final String email = _campoEmail.text;
                print(email);
                final String nome = _campoNome.text;
                print(nome);
                final String celular = _campoCel.text;
                print(user);
                final String nascimento = _campoNasc.text;

                final formatter = DateFormat.yMd();

                final us = User(cpf: userControl.loggedUser!.cpf, email: email, nascimento: formatter.parse(nascimento), nome: nome, usuario: user, telefone: celular);
              
                ()async{
                  try{
                    await userControl.alterar(us);
                    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Alteração de dados", style: TextStyle(fontSize: Fonte.fonteLarge),),
            content: Text("Dados alterados com sucesso", style: TextStyle(fontSize: Fonte.fonteSmall)),
            actions: [ 
              AboutDialog(
                children: [
                  IconButton(
                    onPressed: (){
                      String senhaA = userControl.senha;
                      print(senhaA);
                      String emailA = _campoEmail.text;
                      userControl.login(senhaA, emailA);
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.check),
                  )
                ],
              )
            ]
          );
        }
      );
                  }catch(error){
                    print(error.toString());
                  }
                }();
              }
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: mudaIcon(),
        )
      ]),
    );
  }
}
