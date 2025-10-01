import 'package:flutter/material.dart';

class insights_widget extends StatelessWidget{
   const insights_widget({super.key});

   @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 241, 209, 235),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/id/171292688/photo/modern-working-desk-with-digital-tablet.jpg?s=612x612&w=0&k=20&c=Ac5Z2sXmwCFR6FGRJ7GbcYpuNbVBWxWczuvw9D9tzto=',
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: [
                              TextSpan(text: "Let's Check your "),
                              TextSpan(
                                text: 'Financial \ninsights',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' for the month of june!'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Icon(Icons.chevron_right)),
                    ],
                  ),
                ),
              );

  }}
