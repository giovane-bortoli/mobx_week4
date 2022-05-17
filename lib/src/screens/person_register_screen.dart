import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_week4/src/components/text_form_field.dart';
import 'package:mobx_week4/src/controllers/controller_home.dart';
import 'package:mobx_week4/src/models/gender_model.dart';
import 'package:mobx_week4/src/models/person_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//List<PersonModel> genderSelect = [];

class _MyHomePageState extends State<MyHomePage> {
  //final GlobalKey<FormState> _key = GlobalKey<FormState>();
  //Map<String, dynamic> personMap = jsonDecode();
  //var gender = PersonModel.fromJson();

  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: ReactionBuilder(
        builder: (context) {
          return reaction((_) => controller.isValidPerson, (_) {
            if (controller.isValidPerson == true) {
              final messenger = ScaffoldMessenger.of(context);
              messenger.showSnackBar(
                  const SnackBar(content: Text('valor salvo com sucesso')));
            }
          }, delay: 400);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Person Register',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Observer(
              builder: (_) {
                return Column(
                  children: [
                    TxtForm(
                      label: 'Name',
                      hintText: 'name',
                      onChange: (String value) {
                        controller.setName(value);
                      },
                    ),
                    TxtForm(
                      label: 'Birthdate',
                      hintText: 'Birthdate',
                      onChange: (String value) {
                        controller.setBirthDate(value);
                      },
                    ),
                    TxtForm(
                      label: 'CPF',
                      hintText: 'CPF',
                      onChange: (String value) {
                        controller.setCpf(value);
                      },
                    ),
                    TxtForm(
                      label: 'Phone',
                      hintText: 'Phone',
                      onChange: (String value) {
                        controller.setPhone(value);
                      },
                    ),
                    TxtForm(
                      label: 'Email',
                      hintText: 'Email',
                      onChange: (String value) {
                        controller.setEmail(value);
                      },
                    ),

                    // RadioListTile(
                    //   value: GenderSelect.male,
                    //   groupValue: controller.genderSelect,
                    //   onChanged: (GenderSelect? value) {
                    //     controller.setGenderSelect(value!);
                    //   },
                    // ),

                    // RadioListTile(
                    //   value: GenderSelect.female,
                    //   groupValue: controller.genderSelect,
                    //   onChanged: (GenderSelect? value) {
                    //     controller.setGenderSelect(value!);
                    //   },
                    // ),

                    // ListTile(
                    //   title: const Text('Male'),
                    //   leading: Radio<String>(
                    //     value: controller.genderSelect,
                    //     groupValue: controller.genderSelect,
                    //     onChanged: (String? value) {
                    //       controller.setGenderSelect(value!);
                    //     },
                    //   ),
                    // ),
                    // ListTile(
                    //   title: const Text('Female'),
                    //   leading: Radio<String>(
                    //     value: controller.genderSelect,
                    //     groupValue: controller.genderSelect,
                    //     onChanged: (String? value) {
                    //       controller.setGenderSelect(value!);
                    //     },
                    //   ),
                    // ),r
                    ElevatedButton(
                      onPressed: () {
                        controller.setLocalStoragePerson();
                        Navigator.popAndPushNamed(context, '/address_register');
                      },
                      child: const Text('Register'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
