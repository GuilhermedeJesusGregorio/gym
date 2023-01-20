import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:gym/model/login_model.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

bool confirmedPassowd = false;
bool textoObscuro = true;

class _CadastroState extends State<Cadastro> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _emailInputController = TextEditingController();
  final TextEditingController _senhaInputController = TextEditingController();
  final TextEditingController _confirmedInputController =  TextEditingController();
  
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.blueAccent,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      decoration: const InputDecoration(
                        labelText: 'Nome Completo',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailInputController,
                      decoration: const InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _senhaInputController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.white,
                        ),
                      ),
                      obscureText: (confirmedPassowd == true) ? false : true,
                    ),
                    (confirmedPassowd == false)
                        ? TextFormField(
                            controller: _confirmedInputController,
                            decoration: const InputDecoration(
                              labelText: 'Confirme a senha',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: confirmedPassowd,
                          onChanged: (bool? newValue) {
                            setState(
                              () {
                                confirmedPassowd = newValue!;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: Colors.white,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          onPressed: () {
                            _doSigUp();
                          },
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doSigUp() {
    final  newUser = LoginModel(
      nome: _nameInputController.text,
      email: _emailInputController.text,
      senha: _senhaInputController.text,
      kepon: true,
    );
   
  }

  void saveUser(LoginModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      'LOGIN_USER_INFOS',
      json.encode(
        user.toJson(),
      ),
    );
  }
}
