// Define a class to represent the structure of the response data
class LoginResponseDataError {
  String message;
  int status;
  LoginResponseDataError(
    this.status,
    this.message,
  );

  // Factory method to create an instance of LoginResponse from JSON
  factory LoginResponseDataError.fromJson(Map<String, dynamic> json) {
    return LoginResponseDataError(
      json['data']['status'],
      json['data']['message'],
    );
  }
}
