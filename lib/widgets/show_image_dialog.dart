import 'package:flutter/material.dart';

void showImageDialog(String imageUrl, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Close',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
