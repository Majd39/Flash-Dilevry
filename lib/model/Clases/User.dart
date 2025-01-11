class User {
  final String firstName;
  final String lastName;
  final String mobile;
  final String address;
  final String password;
  final String password_confirmation;

  User({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.address,
    required this.password,
    required this.password_confirmation,
  });

  // Convert a User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'f_name': firstName,
      'l_name': lastName,
      'mobile': mobile,
      'address': address,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }
}
