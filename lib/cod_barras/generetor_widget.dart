// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class GeneretorWidget extends pw.StatelessWidget {
  bool textVisible;
  String textoCod;
  Barcode typeCod;
  double size;
  GeneretorWidget({
    Key? key,
    required this.textVisible,
    required this.textoCod,
    required this.typeCod,
    required this.size,
  }) : super();

  @override
  pw.Widget build(pw.Context context) {
    return pw.BarcodeWidget(
      drawText: textVisible,
      barcode: typeCod,
      data: textoCod,
      width: size,
      height: size / 3,
      textStyle: const pw.TextStyle(fontSize: 20),
    );
  }
}

// import 'package:barcode_widget/barcode_widget.dart';
// import 'package:flutter/material.dart';

// class GeneretorWidget extends StatelessWidget {
//   bool textVisible;
//   String textoCod;
//   Barcode typeCod;
//   double size;
//   Color? color;
//   GeneretorWidget({
//     Key? key,
//     required this.textVisible,
//     required this.textoCod,
//     required this.typeCod,
//     required this.size,
//      this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BarcodeWidget(
//       drawText: textVisible,
//       barcode: typeCod,
//       data: textoCod,
//       width: size,
//       height: size / 3,
//       style: const TextStyle(fontSize: 10),
//       color: color ?? Colors.black,
//     );
//   }
// }
