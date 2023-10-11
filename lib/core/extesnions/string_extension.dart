extension ExtenString on String? {
  String get validate {
    return this != null && this != "" ? this! : "N/A";
  }

}
