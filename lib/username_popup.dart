

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usernameprovider.dart';




class UsernamePopup extends StatelessWidget {
  final TextEditingController _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit username"),
      content: TextField(
        controller: _userName,
        decoration: InputDecoration(
          hintText: "Username",
         
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), 
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TitleProvider>(context, listen: false)
                .updateTitle(_userName.text);
            Navigator.pop(context);
          },
          child: Text("OK"),
        ),
      ],
    );
  }
}


