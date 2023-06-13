import 'package:flutter/material.dart';
import 'package:live_build/models/post.dart';
import 'package:live_build/screens/add_post_screen.dart';
import 'package:live_build/screens/post_screen.dart';
import 'package:live_build/services/post_service.dart';
import 'package:live_build/widgets/atoms/progress_atom.dart';
import 'package:live_build/widgets/molecules/post_molecule.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  static const routeName = '/';

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('List Screen'),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PostScreen.routeName,
                      arguments: Post(
                        id: data.id,
                        userId: data.userId,
                        title: data.title,
                        body: data.body,
                      ),
                    );
                  },
                  child: PostMolecule(
                    postData: data,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
              ),
            );
          }
          return const ProgressAtom();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddPostSreen.routeName,
          );
        },
        tooltip: 'Add Post',
        child: const Icon(Icons.edit_note),
      ),
    );
  }
}
