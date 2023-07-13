// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormsText extends StatelessWidget {
  String label;
  final TextEditingController controllerEC;

  FormsText({
    Key? key,
    required this.label,
    required this.controllerEC,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25),
        controller: controllerEC,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controllerEC.text = '';
            },
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            gapPadding: 0,
            borderRadius: BorderRadius.circular(18),
          ),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }
}
