import 'package:example_demo_t/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    commentData();
    super.initState();
  }

  void commentData() async {
    final commentProvider = Provider.of<UserProvider>(context, listen: false);
    await commentProvider.getCommentData();
    print('commentList ========> ${commentProvider.commentList}');
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<UserProvider>(context);
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
                      title: Text(
                          commentProvider.commentList[index].id.toString()),
                      subtitle: Text(
                          commentProvider.commentList[index].email.toString()),
                    );
                  },
                  itemCount: commentProvider.commentList.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
