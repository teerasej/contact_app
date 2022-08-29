// lib/models/contact_model.dart

class ContactModel {
  late String firstName;
  late String lastName;
  late String phone;

  ContactModel({this.firstName = '', this.lastName = '', this.phone = ''});

  ContactModel.fromMap(Map jsonMap) {
    firstName = jsonMap['name']['first'];
    lastName = jsonMap['name']['last'];
    phone = jsonMap['phone'];
  }
}
