import 'package:flutter/material.dart';
import 'package:hello_world/usernameprovider.dart';
import 'package:provider/provider.dart';
import 'transaction_provider.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomnavbar.dart';




void main()async {
    WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('accessToken');
  runApp(
     MyApp(token: token,),
  );
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key,this.token});

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:token == null? const Loginpage(): const Bottomnavbar(),
          
          
        
      ),
    );
  }
}
