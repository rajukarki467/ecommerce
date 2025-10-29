import 'package:hive_flutter/hive_flutter.dart';
import 'package:frontend/feature/auth/data/models/hive_user.dart';
import 'package:frontend/common/entities/user.dart';

abstract interface class LocalUserService {
  Future<void> saveUserFromEntity(User user); // new
  Future<void> saveUser(HiveUser user);
  HiveUser? getUser();
  Future<void> clearUser();
  bool isAuthenticated();
}

class LocalUserServiceImpl implements LocalUserService {
  final Box<HiveUser> box = Hive.box<HiveUser>('userBox');

  @override
  Future<void> clearUser() async {
    await box.delete('currentUser');
  }

  @override
  HiveUser? getUser() {
    return box.get('currentUser');
  }

  @override
  Future<void> saveUser(HiveUser user) async {
    await box.put('currentUser', user);
  }

  @override
  bool isAuthenticated() {
    return getUser() != null;
  }

  // 🟢 Add this new helper to handle User → HiveUser conversion
  @override
  Future<void> saveUserFromEntity(User user) async {
    final hiveUser = HiveUser(
      userId: user.id,
      firstName: user.name, // if backend gives full name in one field
      lastName: '',
      email: user.email,
      password: '', // optional or blank
    );

    await saveUser(hiveUser);
    print('User saved to Hive: ${hiveUser.email}');
  }
}
