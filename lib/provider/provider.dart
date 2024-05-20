import 'package:example_demo_t/model/album_model.dart';
import 'package:example_demo_t/model/anime_model.dart';
import 'package:example_demo_t/model/comment_model.dart';
import 'package:example_demo_t/model/photo_model.dart';
import 'package:example_demo_t/model/posts_model.dart';
import 'package:example_demo_t/model/todo_model.dart';
import 'package:flutter/cupertino.dart';
import '../model/user_model.dart';
import '../repositories/service.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> userList = [];
  List<UserModel> get userdata => userList;

  List<TodoModel> todoList = [];
  List<TodoModel> get todoData => todoList;

  List<CommentModel> commentList = [];
  List<CommentModel> get commentData => commentList;

  List<PostsModel> postsList = [];
  List<PostsModel> get postsData => postsList;

  List<AlbumModel> albumsList = [];
  List<AlbumModel> get albumsData => albumsList;

  List<PhotoModel> photoList = [];
  List<PhotoModel> get photoData => photoList;

  List<Aanimemodel> animeList = [];
  List<Aanimemodel> get animeData => animeList;

  List<Aanimemodel> searchAnimeResult = [];

  String searchText = '';

  bool loading = false;

  Future<void> getUserData() async {
    loading = true;

    final userResponse = await ApiServices().user();
    userList = userResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getTodoData() async {
    loading = true;

    final todoResponse = await ApiServices().todo();
    todoList = todoResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getCommentData() async {
    loading = true;

    final commentResponse = await ApiServices().comment();
    commentList = commentResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getPostsData() async {
    loading = true;

    final postsResponse = await ApiServices().posts();
    postsList = postsResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getAlbumsData() async {
    loading = true;

    final albumsResponse = await ApiServices().albums();
    albumsList = albumsResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getPhotoData() async {
    loading = true;

    final photoResponse = await ApiServices().photo();
    photoList = photoResponse!;

    loading = false;
    notifyListeners();
  }

  Future<void> getAnimeData(int? page) async {
    loading = true;

    final animeResponse = await ApiServices().anime(page);
    animeList = animeResponse ?? [];
    updateData();

    loading = false;
    notifyListeners();
  }

  void updateData() {
    searchAnimeResult.clear();
    if (searchText.isEmpty) {
      searchAnimeResult.addAll(animeList);
    } else {
      searchAnimeResult.addAll(animeList
          .where((element) => element.title!.toLowerCase().contains(searchText))
          .toList());
    }
    notifyListeners();
  }

  Future<void> search(String title) async {
    searchText = title;
    updateData();
  }
}
