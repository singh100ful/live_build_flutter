import 'package:flutter/material.dart';
import 'package:live_build/models/post.dart';
import 'package:live_build/services/post_service.dart';
import 'package:live_build/widgets/atoms/input_atom.dart';

class AddPostSreen extends StatefulWidget {
  const AddPostSreen({super.key});

  static const routeName = '/add_post';

  @override
  State<AddPostSreen> createState() => _AddPostSreenState();
}

class _AddPostSreenState extends State<AddPostSreen> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<Post>? _futurePost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputAtom(
                label: 'Title',
                placeHolder: 'Enter Title',
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              InputAtom(
                label: 'Message',
                placeHolder: 'Enter Message',
                controller: _messageController,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _futurePost = addPost(
                        title: _titleController.text,
                        body: _messageController.text,
                      );
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
