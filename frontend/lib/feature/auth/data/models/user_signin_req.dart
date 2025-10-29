// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserSigninReq {
  String? email;
  String? password;
  UserSigninReq({this.email, this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
