import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masked_text/masked_text.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/controller/user_control.dart';
import 'package:tccmobile/model/usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoEmail = TextEditingController();
  TextEditingController campoCPF = TextEditingController();
  TextEditingController campoCID = TextEditingController();
  TextEditingController campoNasc = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  TextEditingController campoTelefone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool auditiva = false;
  bool visual = false;
  bool motora = false;
  bool outra = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Cores.azulFundo,
      ),
      backgroundColor: Cores.azulFundo,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset("assets/logo-AC.png", width: 120, height: 120),
              const SizedBox(height: 24),
              Text("Crie sua conta",  style: TextStyle(fontSize: 24, color: Cores.azulLogo, fontWeight: FontWeight.w700)),
              Form(
                key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 24),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: campoUsuario,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Campo obrigatório!");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Nome de usuário",
                            prefixIcon: const Icon(Icons.alternate_email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          )
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: campoNome,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Campo obrigatório!");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Nome completo",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          )
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: campoEmail,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        MaskedTextField(
                          controller: campoCPF,
                          mask: "###.###.###-##",
                          decoration: InputDecoration(
                            labelText: "CPF",
                            prefixIcon: const Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        MaskedTextField(
                          controller: campoNasc,
                          mask: "##/##/####",
                          decoration: InputDecoration(
                            labelText: "Data de Nascimento",
                            prefixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24,),
                        MaskedTextField(
                          controller: campoTelefone,
                          mask: "## #####-####",
                          decoration: InputDecoration(
                            labelText: "Telefone",
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: campoSenha,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Senha não pode ser vazio");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Senha",
                            prefixIcon: const Icon(Icons.fingerprint),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 48),
                child: ElevatedButton(
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      final cpf = campoCPF.text;
                      final nome = campoNome.text;
                      final usuario = campoUsuario.text;
                      final senha = campoSenha.text;
                      final email = campoEmail.text;
                      final telefone = campoTelefone.text;
                      final data = campoNasc.text;

                      final formatter = DateFormat.yMd();

                      final user = User(usuario: usuario, cpf: cpf, email: email, nascimento: formatter.parse(data), nome: nome, telefone: telefone);

                      () async {
                        try{
                          await userControl.cadastro(user, senha);
                        }catch(error){
                          print(error);
                        }
                      }();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Cores.vermelho,
                    minimumSize: const Size(320, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Cadastre-se",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}