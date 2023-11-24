import 'package:flutter/material.dart';
import 'package:tccmobile/controller/avaliacao_control.dart';
import 'package:tccmobile/controller/user_control.dart';
import 'package:tccmobile/main.dart';
import 'package:tccmobile/model/avaliacao.dart';
import 'package:tccmobile/model/local.dart';

class Comentar extends StatefulWidget {
  Local local; 

  Comentar(this.local);

  @override
  State<Comentar> createState() => _ComentarState();
}

class _ComentarState extends State<Comentar> {
  
  TextEditingController comentControl = TextEditingController();
  int _rating = 0;
  int cont = 0;

  void _updateRating(int rating) {
    setState(() {
      _rating = rating*2;
    });
  }

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    List<IconButton> stars = List.generate(5, (index) {
      int starIndex = index + 1;
      return IconButton(
        icon: Icon(
          starIndex <= _rating/2 ? Icons.star : Icons.star_border,
          size: 30,
        ),
        onPressed: () {
          _updateRating(starIndex);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comentário", style: TextStyle(fontSize: Fonte.fonteLarge, fontWeight: FontWeight.w600)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 16),
          )
        ]
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                height: 240,
                width: 360,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/hipica.jpg"),
                              radius: 40,
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
                                    Text("@"+userControl.loggedUser!.usuario, style: TextStyle(fontSize: Fonte.fonteMedia, fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      child: Row(
                                        children: stars,
                                      ),
                                    )
                                  ],
                                )
                              ),
                            ],
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: comentControl,
                            decoration: InputDecoration(
                              labelText: "Comentário",
                              labelStyle: TextStyle(color: Cores.azul),
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Cores.azul, width: 2.0),
                              ),
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Comentário é obrigatório"; 
                              }else if(value.length < 8){
                                return "Comentário deve ter mais de 3 dígitos";
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                          
                          Avaliacao av = Avaliacao(pontuacao: _rating, comentario: comentControl.text.toString(), usuario: userControl.loggedUser!.cpf, lugar: widget.local.idLocal);
                          ()async{
                            try{
                              await avaliacaoControl.create(av);
                              Navigator.pushNamed(context, '/');
                            }catch(error){
                              print(error);
                            }
                          }();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Cores.azul,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: Fonte.fonteMedia,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                          "Enviar",
                          style: TextStyle(
                            fontSize: Fonte.fonteMedia,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ),
                    ]
                  ),
                )
              ), 
            ],
          )
        )
    );
  }
}
