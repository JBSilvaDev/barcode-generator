// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_generator/home_page/print.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'package:barcode_generator/cod_barras/generetor_widget.dart';

class DialogCustom extends Dialog {
  TextEditingController cod1;
  TextEditingController cod2;
  Barcode typeCod;
  bool isChecked;
  double size;
  Color? color;
  BuildContext context;

  DialogCustom({
    super.key,
    required this.cod1,
    required this.context,
    required this.cod2,
    required this.typeCod,
    required this.isChecked,
    required this.size,
    this.color,
  }) : super(
          child: SingleChildScrollView(
            child: SizedBox(
              width: size + 10,
              height: size + 200,
              child: Column(
                children: [
                AppBar(
                    backgroundColor:  Colors.transparent,
                    automaticallyImplyLeading: false,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:40.0, bottom: 20, left: 20, right: 20),
                        child: GeneretorWidget(
                          size: size,
                          typeCod: typeCod,
                          textVisible: !isChecked,
                          textoCod: cod1.text == ''
                              ? 'https://www.linkedin.com/in/jbsilvadev/'
                              : cod1.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GeneretorWidget(
                          size: size,
                          typeCod: typeCod,
                          textVisible: !isChecked,
                          textoCod: cod2.text == ''
                              ? 'https://github.com/JBSilvaDev'
                              : cod2.text,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                            onPressed: () {
                              printDocument(cod1, cod2, typeCod, isChecked, size);
                            },
                            child: const Text('Imprimir')),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
}
