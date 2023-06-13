import 'package:flutter/material.dart';

class ProgressAtom extends StatelessWidget {
  const ProgressAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
