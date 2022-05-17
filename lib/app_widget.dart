import 'package:flutter/material.dart';
import 'package:mobx_week4/src/screens/address_register_screen.dart';
import 'package:mobx_week4/src/screens/contact_list.dart';
import 'package:mobx_week4/src/screens/home_page.dart';
import 'package:mobx_week4/src/screens/person_register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/person_register': (context) => const MyHomePage(),
        '/address_register': (context) => const AddressRegister(),
        '/contact_list': (context) => const ContactList()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(),
    );
  }
}
