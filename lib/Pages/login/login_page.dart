import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gym/model/login_model.dart';
import 'package:gym/value/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color bottom = Colors.transparent;
  Color topColor = Colors.black;

  TextEditingController  _emailInputController= TextEditingController();
  TextEditingController _senhaInputController= TextEditingController();
  bool continueConect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              bottom,
              topColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/Gym.jpg',
                height: 125,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'SING IN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailInputController,
                      autofocus: true,
                      decoration:const InputDecoration(
                        labelText: 'E-MAIL',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _senhaInputController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.password_outlined,
                          color: Colors.white,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                // ignore: avoid_print
                onTap: () => print('FUNCIONOU'),
                child: const Text(
                  'Esqueceu a senha ?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: continueConect,
                    onChanged: (
                      bool? novoValor,
                    ) {
                      setState(() {
                        continueConect = novoValor!;
                      });
                    },
                  ),
                 const  Text(
                    'Continuar Conectado ?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: CustomColors().activitPrimaryBottom,
                child: OutlinedButton(
                  onPressed: () {
                    doLogin();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
             const  Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
             const  Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                  'Ainda não tem cadastro ?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign:TextAlign.center ,
                ),
              ),
               Card(
                color: CustomColors().actividSecondaryBottom,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void doLogin() async{
    String email= _emailInputController.text;
    String senha= _senhaInputController.text;
  
  LoginModel saveUser= await getSavedUser();
  stdout.write(saveUser);

  if(email == saveUser.email && senha==saveUser.senha){
    print('Cadastrado com sucesso');
  }else{
    print('FALHA NO LOGIN');
  }

}

    Future <LoginModel> getSavedUser() async{
  final prefs=  await SharedPreferences.getInstance();
  String jsonUser= prefs.getString('LOGIN_USER_INFOS').toString();
  print(jsonUser);

 Map <String, dynamic> mapUser= json.decode(jsonUser);
 LoginModel user = LoginModel.fromJson(mapUser);
 return user;
  
}
}
