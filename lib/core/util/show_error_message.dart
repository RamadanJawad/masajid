import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Helper function to show a pop-up message
void _showErrorMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red.withOpacity(0.8),
    colorText: Colors.white,
    duration:const Duration(seconds: 3),
  );
}