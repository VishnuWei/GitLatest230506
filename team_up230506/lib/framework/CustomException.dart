
class CustomException implements Exception {
  String cause;
  int code;
  String message;
  CustomException(this.cause, this.code, this.message);

  @override
  String toString()
  {
    return code.toString() +" : " + message;
  }
}