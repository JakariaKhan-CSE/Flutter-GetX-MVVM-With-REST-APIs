/*
It has two instance variables: _message (a general description of the error) and _prefix (a short string categorizing the error, like "Error", "Warning", etc.). Note the underscores, conventionally indicating these are intended for internal use within the class.
The constructor AppException([this._message, this._prefix]) takes optional arguments for the message and prefix. The this. syntax is a shorthand for assigning the constructor parameters to the instance variables. If no arguments are provided, they will be null.
*/
class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends AppException {
  /*
  The super keyword in the initializer list is essential for inheritance.  It allows the derived class (InternetException) to:

Initialize inherited members: The AppException class has _message and _prefix. The super() call ensures these are properly initialized when an InternetException is created. Without super(), these inherited variables would not be initialized by the AppException constructor, potentially leading to errors.
Call the superclass constructor: It's not just about variables; it's about the object's creation. The AppException constructor might have other setup logic. super() makes sure that logic is executed.
   */

  InternetException([String? message]) : super(message, 'No internet');
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Internal server error');
}

class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, '');
}
