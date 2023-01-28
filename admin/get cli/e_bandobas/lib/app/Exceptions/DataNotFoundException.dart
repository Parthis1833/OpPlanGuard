class DataNotFoundException implements Exception {
  String cause;
  DataNotFoundException(this.cause);
}