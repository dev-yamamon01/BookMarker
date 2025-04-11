import 'package:flutter/material.dart';

void showToastMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
          message,
      style: TextStyle(
          color: Color(0xFFCC0000),
      ),),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}