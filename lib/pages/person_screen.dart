import 'package:dart_data_class_generator/models/person.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  Person generatePerson({
    required int id,
    required String name,
    required String emailAddress
  }
    
  ){
    return Person(
      id:id,
      name:name,
      emailAddress:emailAddress
    );
  }

  @override
  Widget build(BuildContext context) {
    final person1 = generatePerson(
      id: 1,
      name: 'John Doe',
      emailAddress: 'john@kong.com',
    );
    final person2 = person1.copyWith(id: 2, emailAddress: 'john2@kon.com');
    final person3 = generatePerson(
      id: 1,
      name: 'John Doe',
      emailAddress: 'john@kong.com',
    );

    print(person1.toString());
    print(person2.toString());
    print(person1 == person3);
    print(person1.hashCode);
    print(person3.hashCode);

    return const Placeholder();
  }
}
