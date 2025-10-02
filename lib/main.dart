import 'package:flutter/material.dart';
import 'package:hello_world/usernameprovider.dart';
import 'package:provider/provider.dart';
import 'transaction_provider.dart';
import 'login_page.dart';





void main() {
  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => TitleProvider(),),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Loginpage(),
          
          
        
      ),
    );
  }
}

