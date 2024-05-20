import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    todoData();
    super.initState();
  }

  void todoData() async {
    final todoProvider = Provider.of<UserProvider>(context, listen: false);
    await todoProvider.getTodoData();
    print('todoList ========> ${todoProvider.todoList}');
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<UserProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return Center(
                    child: CupertinoActivityIndicator(
                      color: Colors.black,
                      radius: 20,
                    ),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        'id:' + todoProvider.todoList[index].id.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        todoProvider.todoList[index].title.toString(),
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  itemCount: todoProvider.todoList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
