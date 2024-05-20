import 'package:example_demo_t/provider/PostComment_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_demo_t/provider/UserPhoto_provider.dart';

import '../generated/l10n.dart';
import '../provider/localiztion_provider.dart';

class UserPhotoScreen extends StatelessWidget {
  UserPhotoScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<UserPhotoProvider>(context, listen: false).getPhotoData();
    Provider.of<PostCommentProvider>(context, listen: false).getPostsData();
    return Scaffold(
      body: SafeArea(
        child: Consumer3<UserPhotoProvider, PostCommentProvider,
            LocalizationProvider>(
          builder: (context, userPhotoProvider, postCommentProvider,
              localizationProvider, child) {
            return userPhotoProvider.loading
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
                            postCommentProvider.search(value);
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
                      if (postCommentProvider.searchPostResult.isEmpty &&
                          userPhotoProvider.searchPhotoResult.isEmpty)
                        Text(
                          S.of(context).dataNotFound,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      if (postCommentProvider.searchPostResult.isNotEmpty)
                        Column(
                          children: [
                            Text(
                                postCommentProvider.searchPostResult.isNotEmpty
                                    ? S.of(context).postScreen
                                    : '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Container(
                              height: 167,
                              color: postCommentProvider
                                      .searchPostResult.isNotEmpty
                                  ? Colors.deepPurple.shade700
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
                                              color: Colors
                                                  .deepPurpleAccent.shade200,
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
                                                      S.of(context).id,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Text(postCommentProvider
                                                        .searchPostResult[index]
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
                                                        postCommentProvider
                                                            .searchPostResult[
                                                                index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      S.of(context).body,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        postCommentProvider
                                                            .searchPostResult[
                                                                index]
                                                            .body
                                                            .toString(),
                                                        maxLines: 3,
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
                                    postCommentProvider.searchPostResult.length,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                                userPhotoProvider.searchPhotoResult.isNotEmpty
                                    ? S.of(context).photoScreen
                                    : '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Expanded(
                              child: GridView.builder(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                itemCount:
                                    userPhotoProvider.searchPhotoResult.length,
                                itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              userPhotoProvider
                                                  .searchPhotoResult[index].url
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          S.of(context).title,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Flexible(
                                          child: Text(
                                            userPhotoProvider
                                                .searchPhotoResult[index].title
                                                .toString(),
                                            maxLines: 2,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,

                                        ///mainAxisExtent aa 1 container thi 2 container lagin ni space nu kam kare.
                                        mainAxisExtent: 250,
                                        mainAxisSpacing: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
