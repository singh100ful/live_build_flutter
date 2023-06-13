import 'dart:math';

import 'package:flutter/material.dart';

class AvatarAtom extends StatelessWidget {
  final String initial;
  const AvatarAtom({super.key, required this.initial});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Text(
        initial[0].toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
