class LoginResponse {
    final String email;

    LoginResponse(
        {this.email
         });

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
      return LoginResponse(email: json['email']);
    }

    Map<String, dynamic> toJson() => {'email': email,};

}

