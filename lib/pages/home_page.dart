// lib/pages/home_page.dart

import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/new_contact_page.dart';
import 'package:contact_app/route_map.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _usernames = ['john', 'mary'];

  List<ContactModel> _contacts = [
    ContactModel(
      firstName: 'John',
      lastName: 'Travota',
      phone: '0821115555',
    ),
    ContactModel(
      firstName: 'Peter',
      lastName: 'Parker',
      phone: '0830713373',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteMap.contactNew);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (BuildContext context, int index) {
          var contact = _contacts[index];
          return ListTile(
            title: Text('${contact.firstName} ${contact.lastName}'),
            subtitle: Text('${contact.phone}'),
            // onTap: () {},
            leading: InkWell(
              child: Icon(Icons.person),
              onTap: () {
                print('tap');
              },
            ),
          );
        },
      ),
    );
  }
}
