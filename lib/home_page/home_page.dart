import 'package:barcode_generator/botoes/generator_buttom.dart';
import 'package:barcode_generator/cod_barras/generetor_widget.dart';
import 'package:barcode_generator/home_page/cabecario/header.dart';
import 'package:barcode_generator/home_page/forms/forms_home.dart';
import 'package:barcode_generator/home_page/print.dart';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cod1 = TextEditingController();
  final cod2 = TextEditingController();
  bool _isChecked = false;
  Barcode typeCod = Barcode.code128();
  double size = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gerador de Código de Barras',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Header(),
          FormsHome(cod1: cod1, cod2: cod2),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                const Text('Ocultar texto ao imprimir',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: SizedBox(
              width: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GeneratorButtom(
                    typeCod: 'Code128',
                    onPressed: () {
                      setState(() {
                        typeCod = Barcode.code128();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Print(
                            cod1: cod1,
                            cod2: cod2,
                            size: size,
                            typeCod: typeCod,
                            isChecked: _isChecked,
                          ),
                        ),
                      );
                    },
                  ),
                  GeneratorButtom(
                    typeCod: 'QrCode',
                    onPressed: () {
                      setState(() {
                        typeCod = Barcode.qrCode();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Print(
                            cod1: cod1,
                            cod2: cod2,
                            size: size,
                            typeCod: typeCod,
                            isChecked: _isChecked,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
