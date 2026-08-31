class Validators {
  const Validators._();

  static const int maxNameLength = 30;

  static String? validateName(
    String? value, {
    String label = 'Name',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter $label';
    }

    if (value.trim().length < 2) {
      return '$label must contain at least 2 characters';
    }

    return null;
  }
}
