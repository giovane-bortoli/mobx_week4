import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/person_register');
                },
                child: const Text('Register'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/contact_list');
              },
              child: const Text('Show Contact List'),
            ),
          ],
        ),
      ),
    );
  }
}
