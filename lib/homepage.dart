import 'package:flutter/material.dart';
import 'package:hello_world/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'balance_card.dart';
import 'insights_widget.dart';
import 'recent_text.dart';
import 'transaction_provider.dart';
import 'alertbox.dart';
import 'editalertbox.dart';
import 'userdetails.dart';

String username = "Guest";

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadUsername();
    Future.microtask(
      () => Provider.of<TransactionProvider>(
        context,
        listen: false,
      ).fetchTransactions(),
    );
  }


  Future<void> loadUsername()async{
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString("username");

    setState(() {
      username = storedUsername ?? "Guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().transactions;
    

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN6E0VfYZjIFiR6Dq-oAiLinfrjJyuV-WpcQ&s',
            ),
            
          ),
        ),
        flexibleSpace: Container(
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
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     showDialog(context: context, builder: (_) => UsernamePopup());
          //   },
          //   icon: const Icon(Icons.face, color: Colors.white),
          // ),
          IconButton(
            onPressed: () => showAddTransactionDialog(context),
            icon: const Icon(Icons.add, color: Colors.white, size: 35),
          ),
          IconButton(onPressed: (){
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Loginpage())
            );
          },
           icon: Icon(Icons.logout,color: Colors.white,size: 28,))
        ],
        title: InkWell(
          onTap:(){
            Navigator.pushReplacement(context,
             MaterialPageRoute(builder:(context) => Userdetails())
             );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello  $username !",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                
              ),
              Text(
                "Welcome back",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceCard(),
            insights_widget(),
            recent_text(),
            Column(
              children: transactions.map((tx) {
                return GestureDetector(
                  onTap: () {
                    showEditTransactionDialog(context, tx);
                  },
                  child: Dismissible(
                    key: ValueKey(tx.id),
                    direction: DismissDirection.endToStart,

                    background: Container(
                      color: Colors.white,
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                    onDismissed: (direction)async {
                      await Provider.of<TransactionProvider>(
                        context,
                        listen: false, 
                      ).deleteTransaction(tx.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${tx.title} deleted")),
                      );
                    },

                    child: Container(
                      width: double.infinity,
                      height: 90,
                      margin: const EdgeInsets.all(2),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(tx.imageUrl),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tx.title,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        tx.price,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          tx.subtitle,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Text(tx.date),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}