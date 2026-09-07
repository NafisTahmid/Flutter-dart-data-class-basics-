import 'package:dart_data_class_generator/models/user.dart';
import 'package:dio/dio.dart';

Future<List<User>> fetchUsers() async {
  try {
    await Future.delayed(Duration(seconds:2));
    final response = await Dio().get(
      'https://jsonplaceholder.typicode.com/users',
    );
    final List userList = response.data;
    final users = [for (final user in userList) User.fromMap(user)];
    print(users[0]);
    return users;
  } catch (e) {
    rethrow;
  }
}
