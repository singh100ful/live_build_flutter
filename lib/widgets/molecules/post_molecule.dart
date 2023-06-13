import 'package:flutter/material.dart';
import 'package:live_build/models/post.dart';
import 'package:live_build/widgets/atoms/avatar_atom.dart';

class PostMolecule extends StatelessWidget {
  final Post postData;
  const PostMolecule({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    var data = postData;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AvatarAtom(
            initial: data.title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                children: [
                  Text(
                    data.title.toUpperCase(),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.body,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
