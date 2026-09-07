// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Person extends Equatable {
    final int id;
    final String name;
    final String emailAddress;
  const Person({
    required this.id,
    required this.name,
    required this.emailAddress,
  });
    

  @override
  String toString() => 'Person(id: $id, name: $name, emailAddress: $emailAddress)';

  Person copyWith({
    int? id,
    String? name,
    String? emailAddress,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'emailAddress': emailAddress,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id'] as int,
      name: map['name'] as String,
      emailAddress: map['emailAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);

 

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ emailAddress.hashCode;

  @override
  List<Object> get props => [id, name, emailAddress];
}
