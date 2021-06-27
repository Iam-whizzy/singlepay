class User {
  //int userId;
  String username;
  String email;
  String phone;
  String full_name;
  String type;
  String token;
  String renewalToken;

  User({this.username, this.email, this.phone, this.full_name, this.type, this.token, this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        //userId: responseData['id'],
        username: responseData['username'],
        email: responseData['email'],
        phone: responseData['phone'],
        full_name: responseData['full_name'],
        type: responseData['type'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']
    );
  }
}