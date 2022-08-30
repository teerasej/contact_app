// lib/models/contact_model.dart

class ContactModel {
  late String firstName;
  late String lastName;
  late String phone;
  late String photoUrl;

  ContactModel({
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.photoUrl = '',
  });

  ContactModel.fromMap(Map json) {
    firstName = json['name']['first'];
    lastName = json['name']['last'];
    phone = json['phone'];
    photoUrl = json['picture']['large'];
  }
}
