import 'package:flutter/material.dart';

class THelperFunctions {
  THelperFunctions._();

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (_) => screen)
    );
  }
}