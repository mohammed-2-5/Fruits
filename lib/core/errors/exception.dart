class CustomExternalException implements Exception {
  final String message;

  CustomExternalException({required this.message});

  @override
  String toString() {
    return message;
  }
}