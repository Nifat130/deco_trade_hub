class Validator {
  Validator._();

  // Validates that the input is not empty
  static String? notEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  // Validates that the input is a valid email address
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    final regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Validates that the input is a valid phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your contact number';
    }
    const phonePattern = r'^[0-9]{11}$'; // Adjust pattern as needed
    final regExp = RegExp(phonePattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid contact number';
    }
    return null;
  }
}
