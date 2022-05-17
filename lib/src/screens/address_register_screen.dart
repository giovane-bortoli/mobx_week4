import 'package:flutter/material.dart';
import 'package:mobx_week4/src/components/text_form_field.dart';
import 'package:mobx_week4/src/controllers/controller_home.dart';

class AddressRegister extends StatefulWidget {
  const AddressRegister({Key? key}) : super(key: key);

  @override
  State<AddressRegister> createState() => _AddressRegisterState();
}

class _AddressRegisterState extends State<AddressRegister> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/person_register');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: const Text('Address Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TxtForm(
              hintText: 'Address',
              label: 'Address',
              onChange: (String value) {
                controller.setAddress(value);
              },
            ),
            TxtForm(
              hintText: 'Cep',
              label: 'Cep',
              onChange: (String value) {
                controller.setCep(value);
              },
            ),
            TxtForm(
              hintText: 'Number',
              label: 'Number',
              onChange: (String value) {
                controller.setNumber(value);
              },
            ),
            TxtForm(
              hintText: 'Complement',
              label: 'Complement',
              onChange: (String value) {
                controller.setComplement(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.setLocalStorageAddress();
                Navigator.popAndPushNamed(context, '/home');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
