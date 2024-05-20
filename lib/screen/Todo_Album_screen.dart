import 'package:example_demo_t/provider/PostComment_provider.dart';
import 'package:example_demo_t/provider/TodoAlbum_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../provider/localiztion_provider.dart';

class TodoAlbumScreen extends StatelessWidget {
  TodoAlbumScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<TodoAlbumProvider>(context, listen: false).getTodoData();
    Provider.of<PostCommentProvider>(context, listen: false).getCommentData();
    return Scaffold(
      body: SafeArea(
        child: Consumer3<TodoAlbumProvider, PostCommentProvider,
            LocalizationProvider>(
          builder: (context, todoAlbumProvider, postCommentProvider,
              localizationProvider, child) {
            return todoAlbumProvider.loading
                ? const Center(
                    child: CupertinoActivityIndicator(
                        color: Colors.black, radius: 20),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            todoAlbumProvider.search(value);
                            postCommentProvider.search(value);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            //hintText: 'Search...',
                            hintText: S.of(context).search,
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      if (todoAlbumProvider.searchTodoResult.isEmpty &&
                          postCommentProvider.searchCommentResult.isEmpty)
                        Text(
                          //'Data not found',
                          S.of(context).dataNotFound,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      if (todoAlbumProvider.searchTodoResult.isNotEmpty)
                        Column(
                          children: [
                            Text(
                                todoAlbumProvider.searchTodoResult.isNotEmpty
                                    ? S.of(context).todoScreen
                                    : '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                              height: 167,
                              color:
                                  todoAlbumProvider.searchTodoResult.isNotEmpty
                                      ? Colors.amber.shade700
                                      : Colors.white24,
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
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.amberAccent.shade200,
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
                                                    Text(
                                                      //'Id:-',
                                                      S.of(context).id,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(todoAlbumProvider
                                                        .searchTodoResult[index]
                                                        .id
                                                        .toString()),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      // 'Title:-',
                                                      S.of(context).title,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        todoAlbumProvider
                                                            .searchTodoResult[
                                                                index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Text(
                                                      //  'Completed:-',
                                                      S.of(context).completed,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(todoAlbumProvider
                                                        .searchTodoResult[index]
                                                        .completed
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
                                itemCount:
                                    todoAlbumProvider.searchTodoResult.length,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (postCommentProvider.searchCommentResult.isNotEmpty)
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                  postCommentProvider
                                          .searchCommentResult.isNotEmpty
                                      ? S.of(context).commentScreen
                                      : '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.lightBlueAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  //'Id:-',
                                                  S.of(context).id,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(postCommentProvider
                                                    .searchCommentResult[index]
                                                    .id
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
                                                Text(
                                                  // 'Name:-',
                                                  S.of(context).name,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                      postCommentProvider
                                                          .searchCommentResult[
                                                              index]
                                                          .name
                                                          .toString()),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  //'Email:-',
                                                  S.of(context).email,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(postCommentProvider
                                                    .searchCommentResult[index]
                                                    .email
                                                    .toString()),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: postCommentProvider
                                      .searchCommentResult.length,
                                ),
                              ),
                            ],
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
