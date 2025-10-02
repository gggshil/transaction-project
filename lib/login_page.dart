import 'package:flutter/material.dart';
import 'package:hello_world/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomnavbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});
  @override
  State<Loginpage> createState() => LoginPageState();
}

class LoginPageState extends State<Loginpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  String errorMessage = "";

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      errorMessage = "";
    });


    final url = Uri.parse("https://dummyjson.com/auth/login");
    try{
    final response = await http.post(
      url,
      headers: {"Content-Type":"application/json"},
      body : jsonEncode({
        "username" : usernameController.text.trim(),
        "password" : passwordController.text.trim()
      }),
      );


      if (response.statusCode ==200) {

        final data = jsonDecode(response.body);

        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // // await prefs.setString("auth_token", data["token"]);
        // await prefs.setString("username", data["username"]);

       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Bottomnavbar()),
      );
      }else{
        setState(() {
          errorMessage = "Invalid Username or Password";
       } );
      }
  } catch (e) {
      setState(() {
        errorMessage = "Error: $e";
      });
    } 
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 3, 4, 43),
            Color.fromARGB(255, 6, 19, 134),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Signup Or Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: usernameController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 163, 191, 252),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
      }

  }