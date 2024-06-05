class SignInResponse {
  final int id;
  final String username;
  final String token;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  SignInResponse({
    required this.id,
    required this.username,
    required this.token,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      id: json['id'],
      username: json['username'],
      token: json['token'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'token': token,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'image': image,
    };
  }
}

class SignInRequest {
  final int? expiresInMins;
  final String username;
  final String password;

  SignInRequest({
    required this.username,
    required this.password,
    this.expiresInMins,
  });

  factory SignInRequest.fromJson(Map<String, dynamic> json) {
    return SignInRequest(
      username: json['username'],
      password: json['password'],
      expiresInMins: json['expiresInMins'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'username': username,
      'expiresInMins': expiresInMins,
    };
  }
}
