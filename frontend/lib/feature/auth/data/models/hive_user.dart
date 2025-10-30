import 'package:hive/hive.dart';

part 'hive_user.g.dart';

@HiveType(typeId: 0)
class HiveUser extends HiveObject {
  @HiveField(0)
  String userId;

  @HiveField(1)
  String firstName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String email;

  @HiveField(4)
  String password;

  @HiveField(5)
  String? token; // ✅ Add this field

  HiveUser({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.token,
  });
}
