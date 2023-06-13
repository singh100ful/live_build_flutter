import 'package:flutter/material.dart';

class InputAtom extends StatelessWidget {
  final String placeHolder;
  final String label;
  final bool? obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;

  const InputAtom({
    Key? key,
    required this.label,
    required this.placeHolder,
    this.obscure,
    this.controller,
    this.validator,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscure ?? false,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          hintText: placeHolder,
          labelText: label,
        ),
        validator: validator,
      ),
    );
  }
}
