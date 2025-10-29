// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserCreationReq {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? role;

  UserCreationReq({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.role = "customer",
  });
}
