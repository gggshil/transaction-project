import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget{
   const BalanceCard({super.key});

   @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color.fromARGB(255, 6, 7, 58),
                                  const Color.fromARGB(255, 6, 19, 134),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      margin: EdgeInsets.only(top: 16, left: 8, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 218, 213, 213),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "YOUR BALANCE",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: const Color.fromARGB(
                                    255,
                                    102,
                                    100,
                                    100,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "\$41,379,00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.arrow_upward, size: 30),
                                      Text("Transfer"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.arrow_downward, size: 30),
                                      Text("Withdraw"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.monetization_on, size: 30),
                                      Text("Invest"),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Icon(Icons.credit_card, size: 30),
                                      Text("Top up"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
              
              }}
