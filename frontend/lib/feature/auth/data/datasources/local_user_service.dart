import 'package:hive_flutter/hive_flutter.dart';
import 'package:frontend/feature/auth/data/models/hive_user.dart';
import 'package:frontend/common/entities/user.dart';

abstract interface class LocalUserService {
  Future<void> saveUserFromEntity(User user, {required String token});
  Future<void> saveUser(HiveUser user);
  HiveUser? getUser();
  Future<void> clearUser();
  bool isAuthenticated();
  Future<void> saveToken(String token);
  Future<String?> getToken();
}

class LocalUserServiceImpl implements LocalUserService {
  final Box<HiveUser> box = Hive.box<HiveUser>('userBox');
  final Box<String> tokenBox = Hive.box<String>('tokenBox');

  @override
  Future<void> clearUser() async {
    await box.delete('currentUser');
    await tokenBox.delete('authToken');
  }

  @override
  HiveUser? getUser() => box.get('currentUser');

  @override
  Future<void> saveUser(HiveUser user) async {
    await box.put('currentUser', user);
  }

  @override
  bool isAuthenticated() => getUser() != null;

  @override
  Future<void> saveUserFromEntity(User user, {required String token}) async {
    final hiveUser = HiveUser(
      userId: user.id,
      firstName: user.name,
      lastName: '',
      email: user.email,
      password: '',
    );
    await saveUser(hiveUser);
    await saveToken(token);
  }

  @override
  Future<void> saveToken(String token) async {
    await tokenBox.put('authToken', token);
  }

  @override
  Future<String?> getToken() async {
    return tokenBox.get('authToken');
  }
}
