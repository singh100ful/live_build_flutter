import 'package:flutter/material.dart';
import 'package:live_build/models/comment.dart';
import 'package:live_build/models/post.dart';
import 'package:live_build/services/post_service.dart';
import 'package:live_build/widgets/molecules/comment_molecule.dart';

class PostScreen extends StatefulWidget {
  final Post arguments;

  const PostScreen(this.arguments, {super.key});

  static const routeName = '/post';

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late Future<List<Comment>> futureComment;

  @override
  void initState() {
    super.initState();
    futureComment = fetchComment(widget.arguments.id);
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(data.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints.expand(width: double.infinity),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Text(
                    data.title.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(data.body),
                  const Text('Comments:'),
                ],
              ),
            ),
            FutureBuilder(
              future: futureComment,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        var commentData = snapshot.data![index];
                        return CommentMolecule(
                          commentData: commentData,
                        );
                      }),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error}',
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
