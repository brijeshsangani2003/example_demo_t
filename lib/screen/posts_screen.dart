import 'package:example_demo_t/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    PostsData();
    super.initState();
  }

  void PostsData() async {
    final postsProvider = Provider.of<UserProvider>(context, listen: false);
    await postsProvider.getPostsData();
    print('commentList ========> ${postsProvider.postsList}');
  }

  @override
  Widget build(BuildContext context) {
    final postsProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<UserProvider>(
              builder: (context, value, child) {
                if (value.loading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                        color: Colors.black, radius: 20),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(postsProvider.postsList[index].id.toString()),
                      subtitle:
                          Text(postsProvider.postsList[index].title.toString()),
                    );
                  },
                  itemCount: postsProvider.postsList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
