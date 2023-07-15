// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../campo_texto/forms_text.dart';

class FormsHome extends StatelessWidget {
  final TextEditingController cod1;
  final TextEditingController cod2;
  const FormsHome({
    Key? key,
    required this.cod1,
    required this.cod2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FormsText(
            controllerEC: cod1,
            label: 'Código 1',
          ),
        ),
 
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: FormsText(
            controllerEC: cod2,
            label: 'Código 2',
          ),
        ),
      ],
    );
  }
}
