// lib/pages/home_page.dart

import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/new_contact_page.dart';
import 'package:contact_app/route_map.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteMap.contactNew).then(
                (value) {
                  // ContactModel newContact = value as ContactModel;
                  var newContact = value as ContactModel;

                  setState(() {
                    _contacts.add(newContact);
                    print('contacts in list: ${_contacts.length}');
                  });
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Dio().get('https://randomuser.me/api/?results=100'),
        builder:
            (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var json = snapshot.data!.data;
            var listOfUsers = json['results'] as List;
            _contacts = listOfUsers.map<ContactModel>(
              (e) {
                return ContactModel.fromMap(e);
              },
            ).toList();
            return ListView.builder(
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
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
