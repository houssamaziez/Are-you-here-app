bool isArabic(String text) {
  // Arabic characters range in Unicode
  final arabicRegex =
      RegExp(r'[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]');
  return arabicRegex.hasMatch(text);
}
