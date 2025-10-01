import 'package:flutter/material.dart';
import 'transaction_provider.dart';
import 'avatar_images.dart';
import 'package:provider/provider.dart';
import 'transaction_model.dart';

void showAddTransactionDialog(BuildContext context) {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final priceController = TextEditingController();
  final dateController = TextEditingController();
  final imageUrlController = TextEditingController(text: avatars[0].imageUrl);
  int selectedAvatarIndex = 0;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text("Add Transaction"),
            content: SizedBox(
              height: 280,
              width: 300,
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: avatars.asMap().entries.map((entry) {
                        int index = entry.key;
                        AvatarModel avatar = entry.value;

                        return InkWell(
                          onTap: () {
                            setStateDialog(() {
                              selectedAvatarIndex = index;
                              imageUrlController.text = avatar.imageUrl;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(avatar.imageUrl),
                              ),
                              if (selectedAvatarIndex == index)
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: "Title"),
                  ),
                  TextField(
                    controller: subtitleController,
                    decoration: const InputDecoration(labelText: "Description"),
                  ),
                  TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: "Price"),
                  ),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: const InputDecoration(labelText: "Select Date"),
                    onTap: () => _pickDate(context, dateController),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () async {
                  final navigator = Navigator.of(context, rootNavigator: true);

                  final newTransaction = TransactionModel(
                    id:idController.text ,
                    title: titleController.text,
                    subtitle: subtitleController.text,
                    price: priceController.text,
                    date: dateController.text,
                    imageUrl: imageUrlController.text,
                  );
                  await Provider.of<TransactionProvider>(
                      context,
                      listen: false,
                    ).addTransaction(newTransaction);

                    navigator.pop();

                    
                 
                },
              ),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
            ],
          );
        },
      );
    },
  );
}

Future<void> _pickDate(
  BuildContext context,
  TextEditingController dateController,
) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (picked != null) {
    dateController.text = "${picked.day}/${picked.month}/${picked.year}";
  }
}
