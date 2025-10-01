import 'package:flutter/material.dart';

class recent_text extends StatelessWidget{
   const recent_text({super.key});

   @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top: 20, right: 190),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              );
              }}
