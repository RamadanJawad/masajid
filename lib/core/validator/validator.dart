import 'package:masajid/core/resources/manager_strings.dart';

class FieldValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return ManagerStrings.invalidEmptyEmail;
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return ManagerStrings.invalidEmptyPhoneNumber;
    }
    if (phoneNumber.length != 10) {
      return ManagerStrings.phoneValid;
    }
    return null;
  }

  String? validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return ManagerStrings.invalidEmptyFullName;
    }
    if (fullName.length < 3) {
      return ManagerStrings.invalidFullName;
    }
    return null;
  }
}
