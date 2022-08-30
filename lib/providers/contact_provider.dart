// lib/contact_provider.dart

import 'package:contact_app/models/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  ContactModel? creatingContact;
  List<ContactModel> contacts = [];

  void saveNewContact(ContactModel newContact) {
    creatingContact = newContact;
    contacts.add(newContact);
  }

  loadDataFromWebAPI(int amount) {
    return Dio().get('https://randomuser.me/api/?results=$amount');
  }
}
