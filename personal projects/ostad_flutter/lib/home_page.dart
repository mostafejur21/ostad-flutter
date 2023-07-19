import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter/main.dart';

import 'style.dart';

ThemeManager themeManager = ThemeManager();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Apps'),
        actions: [
          IconButton(
            onPressed: () {
              todos.clear();
              if (mounted) {
                setState(() {});
              }
            },
            icon: const Icon(Icons.playlist_remove),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final String todo = todos.reversed as String;
          return ListTile(
            onLongPress: () {
              todos[index].isDone = !todos[index].isDone;
              if (mounted) {
                setState(() {});
              }
            },
            leading: todos[index].isDone
                ? const Icon(Icons.done_outline)
                : const Icon(Icons.close),
            title: Text(todos[index].title),
            subtitle: Text(
              todos[index].description,
            ),
            trailing: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_forever_outlined),
                  onPressed: () {
                    todos.removeAt(index);
                    if (mounted) {
                      setState(() {});
                    }
                  },
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddNewTodoModalSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddNewTodoModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Add New Todo',
                  style: txtStyle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _titleTEController,
                  decoration: textFieldStyle("Title"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _descriptionTEController,
                  decoration: textFieldStyle("Description"),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 600,
                  child: CupertinoButton.filled(
                    onPressed: () {
                      if (_titleTEController.text.trim().isNotEmpty &&
                          _descriptionTEController.text.trim().isNotEmpty) {
                        todos.add(Todo(_titleTEController.text.trim(),
                            _descriptionTEController.text.trim(), false));
                        if (mounted) {
                          setState(() {});
                        }
                        _titleTEController.clear();
                        _descriptionTEController.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add'),
                  ),
                )
              ],
            ),
          );
        });
  }
}

// To do
// title, description, done

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
