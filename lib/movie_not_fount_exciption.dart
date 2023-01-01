class MovieNotFountException implements Exception {
  @override
  String toString() {
    return 'No Movies Found';
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);
  @override
  String toString() {
    return message;
  }
}
