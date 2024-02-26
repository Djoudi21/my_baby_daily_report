// Define a class to represent the structure of the tokens data
class TokensData {
  String accessToken;
  String refreshToken;
  TokensData(this.accessToken, this.refreshToken);

  // Factory method to create an instance of TokensData from JSON
  factory TokensData.fromJson(Map<String, dynamic> json) {
    return TokensData(json['accessToken'], json['refreshToken']);
  }
}
