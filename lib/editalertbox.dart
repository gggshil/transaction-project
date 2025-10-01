import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transaction_model.dart';
import 'transaction_provider.dart';


void showEditTransactionDialog(BuildContext context,TransactionModel tx){
 
  final titleController = TextEditingController(text:tx.title);
  final subtitleController = TextEditingController(text:tx.subtitle);
  final priceController = TextEditingController(text:tx.price);


showDialog(
  context: context,
   builder: (_){
    return AlertDialog(
      title: Text("Edit Transaction"),
      content: SizedBox(
        height:280 ,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: titleController, 
              decoration: const InputDecoration(labelText: "title"),
            ),
            TextField(
              controller: subtitleController, 
              decoration: const InputDecoration(labelText: "subtitle"),
            ),
            TextField(
              controller: priceController, 
              decoration: const InputDecoration(labelText: "price"),
            )
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("cancel")),
        ElevatedButton(onPressed: (){
          Provider.of<TransactionProvider>(context,listen:false)
          .editTransactionPUT(
            txId:tx.id,
            updatedTx:TransactionModel(
              id: tx.id,
            title :titleController.text,
             subtitle: subtitleController.text,
            price: priceController.text,
            date: tx.date,
            imageUrl: tx.imageUrl,
          ),
          );
          Navigator.pop(context);
        },
         child: const Text("Save"),
         ),
      ],
    );
   }
   );



}
