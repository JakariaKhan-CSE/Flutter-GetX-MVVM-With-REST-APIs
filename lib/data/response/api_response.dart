import 'package:getx_mvvm_with_restapi/data/response/status.dart';

/*
Generics provide type safety and code reusability.

Type Safety: Without generics, you'd likely have to use dynamic for the data field, which means Dart wouldn't be able to check the type of the data at compile time.  With generics, Dart knows the specific type you're working with, preventing type-related errors during runtime.

Code Reusability: You can use ApiResponse with any data type.  You don't need to create separate classes for API responses containing different types of data (e.g., ApiResponseInt, ApiResponseUser, etc.).
 */
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  String toString() {
    return "Status: $status \n Message: $message \n Data: $data";
  }
}
