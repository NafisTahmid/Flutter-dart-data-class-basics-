// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dart_data_class_generator/models/user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;
  const UserDetailsScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(child: Text(user.id.toString())),
          title: Text(user.name),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('name: ${user.name}'),
                Text('email: ${user.email}'),
                Text('phone: ${user.phone}'),
                Text('website: ${user.website}'),
              ],
            ),
          ),
          Container(
            color: Colors.brown,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: ShowAddress(address: user.address),
          ),
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: ShowCompany(company: user.company),
          ),
        ],
      ),
    );
  }
}

class ShowAddress extends StatelessWidget {
  final Address address;
  const ShowAddress({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Address', style: TextStyle(fontSize: 18.0)),
        Text('street: ${address.street}'),
        Text('suite: ${address.suite}'),
        Text('city: ${address.city}'),
        Text('zipcode: ${address.zipcode}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('latitude: ${address.geo.lat}'),
            Text('longitude: ${address.geo.lng}'),
          ],
        ),
      ],
    );
  }
}

class ShowCompany extends StatelessWidget {
  final Company company;
  const ShowCompany({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Company', style: TextStyle(fontSize: 18.0)),
        Text('name: ${company.name}'),
        Text('catchPhrase: ${company.catchPhrase}'),
        Text('bs: ${company.bs}'),
      ],
    );
  }
}
