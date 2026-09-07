import 'package:dart_data_class_generator/models/user.dart';
import 'package:dart_data_class_generator/pages/user_details_screen.dart';
import 'package:dart_data_class_generator/repositories/fetch_users.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  String error = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      setState(() {
        isLoading = true;
      });
      users = await fetchUsers();
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildError() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.toString(), style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            OutlinedButton(
              onPressed: _fetchUsers,
              child: Text('Retry', style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isEmpty
          ? ListUsers(users: users)
          : buildError(),
    );
  }
}

class ListUsers extends StatelessWidget {
  final List<User> users;
  const ListUsers({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          onTap:() => Navigator.of(context).push(
            MaterialPageRoute(
              builder:(_) => UserDetailsScreen(user:user)
            )
          ),
          leading: CircleAvatar(child: Text(user.id.toString())),
          title: Text(user.name),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: users.length,
    );
  }
}
