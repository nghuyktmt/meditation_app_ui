enum ErrorCode { unknown, serverError }

class MyError {
  final ErrorCode code;
  final dynamic originError;

  MyError({required this.code, this.originError});
}

extension GetErrorMessage on MyError {
  String get errorMessage => _errorMessage(code);

  String _errorMessage(ErrorCode code) {
    switch (code) {
      case ErrorCode.serverError:
        return "Server Error";
      case ErrorCode.unknown:
        return "Something went wrong";
    }
  }
}
