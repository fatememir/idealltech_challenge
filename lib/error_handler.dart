

class ErrorHandler {
  final target ;
  ErrorHandler(this.target);
  dynamic noSuchMethod(Invocation invocation) {
  return "404";  }
}