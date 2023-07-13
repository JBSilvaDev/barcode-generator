import 'package:flutter/material.dart';

import '../../widget/icons_barcode_icons.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(
        height: 30,
      ),
      Text(
        'Infome nos campos abaixo o que deseja converter em codigo de leitura por IR/Camêra',
        style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
      ),
      Text(
        'Em seguida clique em um dos botões para gerar o codigo desejado',
        style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons_barcode.barcode),
          ),
          Text('Ou'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons_barcode.qrcode),
          ),
        ],
      )
    ]);
  }
}
