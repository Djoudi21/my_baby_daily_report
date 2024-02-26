// Define a class to represent the structure of the response data
class RegisterResponseDataError {
  String message;
  int status;
  RegisterResponseDataError(
    this.status,
    this.message,
  );

  // Factory method to create an instance of LoginResponse from JSON
  factory RegisterResponseDataError.fromJson(Map<String, dynamic> json) {
    return RegisterResponseDataError(
      json['data']['status'],
      json['data']['message'],
    );
  }
}
