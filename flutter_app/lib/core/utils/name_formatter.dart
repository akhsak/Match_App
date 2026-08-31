class NameFormatter {
  const NameFormatter._();

  static String formatDisplayName(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    final parts = trimmed.split(RegExp(r'\s+'));
    return parts
        .map((part) => part[0].toUpperCase() + part.substring(1).toLowerCase())
        .join(' ');
  }

  static String comparisonKey(String value) => formatDisplayName(value).toLowerCase();
}
