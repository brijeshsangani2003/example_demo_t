import 'package:example_demo_t/provider/TodoAlbum_provider.dart';
import 'package:example_demo_t/provider/UserPhoto_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../provider/localiztion_provider.dart';

class PostCommentScreen extends StatelessWidget {
  PostCommentScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<TodoAlbumProvider>(context, listen: false).getAlbumsData();
    Provider.of<UserPhotoProvider>(context, listen: false).getUserData();
    return Scaffold(
      body: SafeArea(
        child: Consumer3<TodoAlbumProvider, UserPhotoProvider,
            LocalizationProvider>(
          builder: (context, todoAlbumProvider, userPhotoProvider,
              localizationProvider, child) {
            return todoAlbumProvider.loading
                ? const Center(
                    child: CupertinoActivityIndicator(radius: 20),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: searchController,
                          onChanged: (value) {
                            todoAlbumProvider.search(value);
                            userPhotoProvider.search(value);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
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
                      if (todoAlbumProvider.searchAlbumResult.isEmpty &&
                          userPhotoProvider.searchUserResult.isEmpty)
                        Text(
                          S.of(context).dataNotFound,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      if (todoAlbumProvider.searchAlbumResult.isNotEmpty)
                        Column(
                          children: [
                            Text(
                                todoAlbumProvider.searchAlbumResult.isNotEmpty
                                    ? S.of(context).albumScreen
                                    : '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                              height: 167,
                              color:
                                  todoAlbumProvider.searchAlbumResult.isNotEmpty
                                      ? Colors.orange.shade700
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
                                                  Colors.orangeAccent.shade200,
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
                                                      S.of(context).userId,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(todoAlbumProvider
                                                        .searchAlbumResult[
                                                            index]
                                                        .userId
                                                        .toString()),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Text(
                                                      S.of(context).id,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(todoAlbumProvider
                                                        .searchAlbumResult[
                                                            index]
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
                                                            .searchAlbumResult[
                                                                index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 1,
                                                      ),
                                                    ),
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
                                    todoAlbumProvider.searchAlbumResult.length,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      if (userPhotoProvider.searchUserResult.isNotEmpty)
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                  userPhotoProvider.searchUserResult.isNotEmpty
                                      ? S.of(context).userScreen
                                      : '',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Card(
                                      color: Colors.deepOrange,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  S.of(context).id,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(userPhotoProvider
                                                    .searchUserResult[index].id
                                                    .toString()),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  S.of(context).name,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Flexible(
                                                  child: Text(userPhotoProvider
                                                      .searchUserResult[index]
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
                                                  S.of(context).userName,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text(userPhotoProvider
                                                    .searchUserResult[index]
                                                    .username
                                                    .toString()),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount:
                                      userPhotoProvider.searchUserResult.length,
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
