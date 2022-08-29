import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatelessWidget {
  NewContactPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  ContactModel _newContact = ContactModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('First name:'),
              TextFormField(
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Please fill the box';
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    _newContact.firstName = value;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Last name:'),
              TextFormField(
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Please fill the box';
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    _newContact.lastName = value;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Phone:'),
              TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Please fill the box';
                  }
                },
                onSaved: (value) {
                  if (value != null) {
                    _newContact.phone = value;
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    bool validateResult = _formKey.currentState!.validate();

                    if (validateResult == true) {
                      // Save data
                      _formKey.currentState!.save();
                      print(
                          '${_newContact.firstName} ${_newContact.lastName} ${_newContact.phone}');

                      Navigator.pop(context, _newContact);
                    }
                  },
                  child: Text('Save'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[400],
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
