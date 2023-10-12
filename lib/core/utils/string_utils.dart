extension CapitalizeString on String {
  String get capitlize {
    return substring(0, 1).toUpperCase() + substring(1);
  }
}
