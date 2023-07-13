import 'package:barcode_generator/botoes/generator_buttom.dart';
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
  bool isChecked = false;
  Barcode typeCod = Barcode.code128();
  double size = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final fontSize = screenWidth * 0.05;
        return Center(
          child: Text(
            'Gerador de Código de Barras',
            style: TextStyle(
              fontSize: fontSize.clamp(20, 35),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      })),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 30),
              child: FormsHome(cod1: cod1, cod2: cod2),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text('Ocultar texto ao imprimir',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                width: 600,
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      GeneratorButtom(
                        typeCod: 'Code128',
                        onPressed: () {
                          setState(() {
                            typeCod = Barcode.code128();
                          });
                          printDocument(cod1, cod2, typeCod, isChecked, size);
                        },
                      ),
                      GeneratorButtom(
                        typeCod: 'QrCode',
                        onPressed: () {
                          setState(() {
                            typeCod = Barcode.qrCode();
                          });
                          printDocument(cod1, cod2, typeCod, isChecked, size);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[300], // Cor de fundo do rodapé
        padding: const EdgeInsets.all(5.0),

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'by: JB Silva',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
