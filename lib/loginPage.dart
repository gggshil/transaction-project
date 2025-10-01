import 'package:flutter/material.dart';



class Loginpage extends StatefulWidget{
  const Loginpage ({super.key});
    @override
    State<Loginpage> createState() => _loginPageState();
  
  }


class _loginPageState extends State<Loginpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:NetworkImage("assets/background_image"))
        )
       
        
      ),



    );
  }
}