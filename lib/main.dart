import 'package:dart_data_class_generator/pages/person_screen.dart';
import 'package:dart_data_class_generator/pages/user_screen_list.dart';
import 'package:dart_data_class_generator/widgets/custom_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Data Class Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20.0),
          children: [
            CustomButton(title: 'Person Screen', child: PersonScreen()),
            CustomButton(title: 'User List Page', child: UserListScreen()),
          ],
        ),
      ),
    );
  }
}
