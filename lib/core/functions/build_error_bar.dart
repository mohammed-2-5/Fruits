import 'package:flutter/material.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
