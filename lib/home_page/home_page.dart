import 'package:barcode_generator/botoes/generator_buttom.dart';
import 'package:barcode_generator/home_page/cabecario/header.dart';
import 'package:barcode_generator/home_page/forms/forms_home.dart';
import 'package:barcode_generator/home_page/popup.dart';
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
  void dispose() {
    cod1.dispose();
    cod2.dispose();
    super.dispose();
  }

  Widget backgroud(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final orientacao = MediaQuery.of(context);

    final opacity = screenWidth > 500 ? 200.0 : 400.0;

    if (orientacao == 'landscape') {
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 200,
                image: AssetImage('assets/images/logojb.png'),
                fit: BoxFit.fill)),
      );
    } else {
      return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 150,
                image: AssetImage('assets/images/logojb.png'),
                fit: BoxFit.fill)),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app esta dentro da colum para nao ficar sobreposta a img de fundo
      body: Stack(
        children: [
          backgroud(context),

          SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
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
                              showDialog(
                                  context: context,
                                  builder: (context) => DialogCustom(
                                      context: context,
                                      cod1: cod1,
                                      cod2: cod2,
                                      typeCod: typeCod,
                                      isChecked: isChecked,
                                      size: size));
                            },
                          ),
                          GeneratorButtom(
                            typeCod: 'QrCode',
                            onPressed: () {
                              setState(() {
                                typeCod = Barcode.qrCode();
                              });
                              showDialog(
                                  context: context,
                                  builder: (context) => DialogCustom(
                                      context: context,
                                      cod1: cod1,
                                      cod2: cod2,
                                      typeCod: typeCod,
                                      isChecked: isChecked,
                                      size: size));
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
        ],
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
