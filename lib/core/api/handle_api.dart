import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void showErrorMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    margin:const EdgeInsets.only(bottom: 5,left: 5,right: 5),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red.withOpacity(0.8),
    colorText: Colors.white,
    duration:const Duration(seconds: 4),
  );
}

Future<T> handleRequest<T>(Future<T> Function() requestFunction) async {
  try {
    return await requestFunction();
  } on SocketException {
    showErrorMessage("No Internet", "Please check your connection and try again.");
    throw const HttpException('No internet connection.');
  } on TimeoutException {
    showErrorMessage("Request Timeout", "The server is taking too long to respond.");
    throw const HttpException('Request timed out. Please try again.');
  } on FormatException {
    showErrorMessage("Invalid Response", "The server returned an unexpected response.");
    throw const HttpException('Invalid response format.');
  } catch (e) {
    showErrorMessage("Unknown Error", "Something went wrong. Please try again.");
    throw const HttpException('Something went wrong. Please try again later.');
  }
}

dynamic handleResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return jsonDecode(response.body);
    case 400:
      throw const HttpException('Bad request. Please check your input.');
    case 401:
      throw const HttpException('Unauthorized. Please log in again.');
    case 403:
      throw const HttpException('Forbidden. You do not have access.');
    case 404:
      throw const HttpException('Resource not found.');
    case 500:
      throw const HttpException('Server error. Please try again later.');
    default:
      throw HttpException('Unexpected error occurred. (Code: ${response.statusCode})');
  }
}
