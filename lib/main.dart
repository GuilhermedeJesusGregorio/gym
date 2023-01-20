import 'package:flutter/material.dart';
import 'package:gym/Pages/login/login_page.dart';
import 'package:gym/Pages/cadastro/screens_cadastro.dart';

main(){
  runApp(const Gym());
}

class Gym extends StatelessWidget {
  const Gym({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => const Cadastro(),
        '/':(context) => const LoginPage(),
      },
    );
   
  }
}