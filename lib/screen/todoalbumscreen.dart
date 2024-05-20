import 'package:example_demo_t/provider/TodoAlbum_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class todoalbumScreen extends StatefulWidget {
  const todoalbumScreen({super.key});

  @override
  State<todoalbumScreen> createState() => _todoalbumScreenState();
}

class _todoalbumScreenState extends State<todoalbumScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodoAlbumProvider>(context, listen: false)
      ..getTodoData()
      ..getAlbumsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<TodoAlbumProvider>(
          builder: (context, todoAlbumProvider, child) {
            return todoAlbumProvider.loading
                ? const Center(
                    child: CupertinoActivityIndicator(
                        color: Colors.black, radius: 20),
                  )
                : Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('Todo Screen',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Container(
                        height: 167,
                        color: Colors.amber.shade700,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 150,
                                    width: 280,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.amberAccent.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Id:-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(todoAlbumProvider
                                                  .todoList[index].id
                                                  .toString()),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Title:-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  todoAlbumProvider
                                                      .todoList[index].title
                                                      .toString(),
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Text(
                                                'Completed:-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              Text(todoAlbumProvider
                                                  .todoList[index].completed
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: todoAlbumProvider.todoList.length,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Album Screen',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.tealAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          'Id:-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(todoAlbumProvider
                                            .albumsList[index].id
                                            .toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Title:-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Flexible(
                                          child: Text(todoAlbumProvider
                                              .albumsList[index].title
                                              .toString()),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: todoAlbumProvider.albumsList.length,
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
