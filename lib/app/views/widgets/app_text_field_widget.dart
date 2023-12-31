import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.controller,
      required this.textInputFormatter,
      this.decoration,
      this.textStyle,
      this.maxLines,
      this.autofocus,
      this.textAlign,
      this.keyboardType});
  final TextEditingController? controller;
  final TextInputFormatter textInputFormatter;
  final InputDecoration? decoration;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool? autofocus;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: [
          textInputFormatter,
          //FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          //FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
          //WhitelistingTextInputFormatter(RegExp("[a-z A-Z á-ú Á-Ú 0-9]"))
        ],
        decoration: decoration,
        style: textStyle,
        maxLines: maxLines,
        autofocus: autofocus ?? false,
        textAlign: textAlign ?? TextAlign.center,
      );
}
