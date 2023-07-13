// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widget/icons_barcode_icons.dart';

class GeneratorButtom extends StatelessWidget {
  String typeCod;
  final VoidCallback? onPressed;

  GeneratorButtom({
    Key? key,
    required this.typeCod,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _button_return(typeCod, onPressed);
  }

  Widget _button_return(String typeCod, Function()? onPressed) {
    switch (typeCod.toLowerCase()) {
      case 'qrcode':
        return TextButton.icon(
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 20))),
          label: const Text('Gerar QRCode'),
          onPressed: onPressed,
          icon: const Icon(
            Icons_barcode.qrcode,
            color: Colors.green,
            size: 35,
          ),
        );
      case 'code128':
        return TextButton.icon(
          style: ButtonStyle(
              textStyle:
                  MaterialStateProperty.all(const TextStyle(fontSize: 20))),
          label: const Text('Gerar Code128'),
          onPressed: onPressed,
          icon: const Icon(
            Icons_barcode.barcode,
            size: 35,
            color: Colors.blue,
          ),
        );
      default:
        return const Text('Tipo de botao não definido');
    }
  }
}
