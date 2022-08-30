// lib/pages/home_page.dart

import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/new_contact_page.dart';
import 'package:contact_app/providers/contact_provider.dart';
import 'package:contact_app/route_map.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> _contacts = [];

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ContactProvider>();

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
      body: FutureBuilder(
        future: provider.loadDataFromWebAPI(100),
        builder:
            (BuildContext context, AsyncSnapshot<Response<dynamic>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            if (snapshot.connectionState == ConnectionState.done) {
              var json = snapshot.data!.data;
              var listOfUsers = json['results'] as List;

              for (var jsonUser in listOfUsers) {
                // _contacts.add(ContactModel.fromMap(jsonUser));
                provider.contacts.add(ContactModel.fromMap(jsonUser));
              }

              // _contacts = listOfUsers.map<ContactModel>(
              //   (jsonUser) {
              //     return ContactModel.fromMap(jsonUser);
              //   },
              // ).toList();

              return ListView.builder(
                itemCount: provider.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  var contact = provider.contacts[index];
                  return ListTile(
                    title: Text('${contact.firstName} ${contact.lastName}'),
                    subtitle: Text('${contact.phone}'),
                    // onTap: () {},
                    // leading: Image.network(contact.photoUrl),
                  );
                },
              );
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
