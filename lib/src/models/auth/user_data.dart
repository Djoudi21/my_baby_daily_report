// Define a class to represent the structure of the user data
class UserData {
  String email;
  int id;
  UserData(this.email, this.id);

  // Factory method to create an instance of UserData from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(json['email'], json['id']);
  }
}