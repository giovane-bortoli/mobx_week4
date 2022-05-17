import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/controller_home.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

Controller controller = Controller();

@override
void initState() {
  initState();
  controller.items.addAll(controller.list);
}

class _ContactListState extends State<ContactList> {
  //final titleAppBar = controller.items.length.toString() + 'Contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          )
        ],
        title: const Text(
          'Contact List',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  prefix: Icon(Icons.search),
                  labelText: 'Search'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: const EdgeInsets.all(9),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          child: Text(controller.list[index][0]),
                          backgroundColor: const Color(0x0ff0095c),
                          foregroundColor: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        Text(
                          controller.list[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.popAndPushNamed(context, '/person_register');
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
