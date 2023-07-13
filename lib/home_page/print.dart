// import 'package:barcode_generator/main.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../cod_barras/generetor_widget.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

// class Print extends StatelessWidget {
//   final TextEditingController cod1;
//   final TextEditingController cod2;
//   double size;
//   Barcode typeCod;
//   bool isChecked;

//   Print({
//     Key? key,
//     required this.cod1,
//     required this.cod2,
//     required this.size,
//     required this.typeCod,
//     required this.isChecked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: GeneretorWidget(
//             color: cod1.text == '' ? Colors.grey[350] : Colors.black,
//             size: size,
//             typeCod: typeCod,
//             textVisible: !isChecked,
//             textoCod: cod1.text == ''
//                 ? 'https://www.linkedin.com/in/jbsilvadev/'
//                 : cod1.text,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: GeneretorWidget(
//             color: cod1.text == '' ? Colors.grey[350] : Colors.black,
//             size: size,
//             typeCod: typeCod,
//             textVisible: !isChecked,
//             textoCod:
//                 cod2.text == '' ? 'https://github.com/JBSilvaDev' : cod2.text,
//           ),
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Voltar'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   printDocument(cod1, cod2, typeCod, isChecked, size);
//                 },
//                 child: const Text('Imprimir'),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }

void printDocument(TextEditingController cod1, TextEditingController cod2,
    Barcode typeCod, bool isChecked, double size) {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.all(30.0),
                child: GeneretorWidget(
                  size: size,
                  typeCod: typeCod,
                  textVisible: !isChecked,
                  textoCod: cod1.text == ''
                      ? 'https://www.linkedin.com/in/jbsilvadev/'
                      : cod1.text,
                ),
              ),
              pw.Padding(
                padding: const pw.EdgeInsets.all(30.0),
                child: GeneretorWidget(
                  size: size,
                  typeCod: typeCod,
                  textVisible: !isChecked,
                  textoCod: cod2.text == ''
                      ? 'https://github.com/JBSilvaDev'
                      : cod2.text,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
