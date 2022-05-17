import 'package:flutter/material.dart';

class TxtForm extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String) onChange;

  const TxtForm(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: label,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              border: const OutlineInputBorder(),
              hintText: hintText),
          onChanged: onChange),
    );
  }
}
