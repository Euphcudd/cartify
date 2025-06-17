class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email required';
    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value))
      return 'Invalid email';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) return 'Min 6 characters';
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) return 'Price required';
    final price = double.tryParse(value);
    if (price == null || price <= 0) return 'Enter a valid price';
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.trim().length < 10)
      return 'Enter at least 10 characters';
    return null;
  }

  static String? validateStock(String? value) {
    if (value == null || value.isEmpty) return 'Stock is required';
    final stock = int.tryParse(value);
    if (stock == null || stock < 1) return 'Enter valid stock count';
    return null;
  }

  static String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) return 'Please select an option';
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) return 'Address is required';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.length != 10)
      return 'Enter 10-digit phone number';
    return null;
  }

  static String? validateUpiId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter UPI ID';
    }

    final upiRegex = RegExp(r'^[\w.\-]{2,256}@[a-zA-Z]{2,64}$');
    if (!upiRegex.hasMatch(value)) {
      return 'Invalid UPI ID format';
    }

    return null;
  }
}
