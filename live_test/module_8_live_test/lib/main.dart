import 'package:flutter/material.dart';

void main() {
  runApp(ContactListApp());
}

class ContactListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Mostafejur Rahman', 'mostsfejur@gmail.com', 123445656),
    Contact('M Rahman', 'example@gmail.com', 4444334433),
    Contact('Rahman', 'e@gmail.com', 3453453434),
  ];

  ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                contact.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              const SizedBox(height: 4.0),
              Text('Phone: ${contact.phone}'),
            ],
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final int phone;

  Contact(this.name, this.email, this.phone);
}
