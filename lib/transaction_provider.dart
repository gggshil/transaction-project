

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'transaction_model.dart';


class TransactionProvider with ChangeNotifier {
  final String baseUrl = "http://192.168.1.94:4000/transactions";
  final List<TransactionModel> _transactions = [];



  List<TransactionModel> get transactions => _transactions;

  Future<void> fetchTransactions()async{
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode== 200){
        final List data = jsonDecode(response.body);
        _transactions.addAll(data.map((e)=> TransactionModel(
          id:e["id"],
            title: e['title'],
        subtitle: e['subtitle'],
        price: e['price'],
        date: e['date'],
        imageUrl: e['imageUrl'],
         )) );
         notifyListeners();
      }else {
        throw Exception("failed to load Transactions ");
      }
  }

  Future<void> addTransaction(TransactionModel transaction) async{
    final response = await http.post(
      Uri.parse("$baseUrl"),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "title": transaction.title,
        "subtitle": transaction.subtitle,
        "price": transaction.price,
        "date": transaction.date,
        "imageUrl": transaction.imageUrl,
      })
    );
    if (response.statusCode == 201) {
      _transactions.add(transaction);
      notifyListeners();
    } else {
      throw Exception("Failed to add transaction");
    }
  }

  Future <void> editTransactionPUT({required String txId, required TransactionModel updatedTx})async{
    final url = Uri.parse("$baseUrl/$txId");
    final response = await http.put(
      url,
      headers: {"Content-Type":"application/json"},
      body:json.encode(updatedTx.toJson()),
    );
     if (response.statusCode == 200) {
    final index = _transactions.indexWhere((t) => t.id == txId);
    if (index != -1) {
      _transactions[index] = updatedTx;
      notifyListeners();
    }
  } else {
    throw Exception("Failed to update transaction");
  }
}

Future<void>deleteTransaction(String txId)async{
  final url = Uri.parse('$baseUrl/$txId');
  final response = await http.delete(url);
if (response.statusCode == 200) {
    _transactions.removeWhere((t) => t.id == txId);
    notifyListeners();
  } else {
    throw Exception("Failed to delete transaction");
  }
}

}
