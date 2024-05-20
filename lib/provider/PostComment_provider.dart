import 'package:flutter/cupertino.dart';

import '../model/comment_model.dart';
import '../model/posts_model.dart';
import '../repositories/service.dart';

class PostCommentProvider extends ChangeNotifier {
  List<PostsModel> postsList = [];
  List<PostsModel> get postsData => postsList;

  List<CommentModel> commentList = [];
  List<CommentModel> get commentData => commentList;

  List<CommentModel> searchCommentResult = [];
  List<PostsModel> searchPostResult = [];

  String searchText = '';

  bool loading = false;

  Future<void> getPostsData() async {
    loading = true;

    final postsResponse = await ApiServices().posts();
    postsList = postsResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  Future<void> getCommentData() async {
    loading = true;

    final commentResponse = await ApiServices().comment();
    commentList = commentResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  void updateData() {
    searchCommentResult.clear();
    searchPostResult.clear();
    if (searchText.isEmpty) {
      searchCommentResult.addAll(commentList);
      searchPostResult.addAll(postsList);
    } else {
      searchCommentResult.addAll(commentList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.name!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.email!.toLowerCase().contains(searchText.toLowerCase()))
          .toList());
      searchPostResult.addAll(postsList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.title!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.body!.toLowerCase().contains(searchText.toLowerCase()))
          .toList());
    }
    notifyListeners();
  }

  Future<void> search(String title) async {
    searchText = title;
    updateData();
  }
}
