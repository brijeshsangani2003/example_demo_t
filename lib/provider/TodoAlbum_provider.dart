import 'package:flutter/cupertino.dart';

import '../model/album_model.dart';
import '../model/todo_model.dart';
import '../repositories/service.dart';

class TodoAlbumProvider extends ChangeNotifier {
  List<TodoModel> todoList = [];
  List<TodoModel> get todoData => todoList;

  List<AlbumModel> albumsList = [];
  List<AlbumModel> get albumsData => albumsList;

  List<TodoModel> searchTodoResult = [];
  List<AlbumModel> searchAlbumResult = [];

  String searchText = '';

  bool loading = false;

  Future<void> getTodoData() async {
    loading = true;

    final todoResponse = await ApiServices().todo();
    todoList = todoResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  Future<void> getAlbumsData() async {
    loading = true;

    final albumsResponse = await ApiServices().albums();
    albumsList = albumsResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  void updateData() {
    searchTodoResult.clear();
    searchAlbumResult.clear();
    if (searchText.isEmpty) {
      searchTodoResult.addAll(todoList);
      searchAlbumResult.addAll(albumsList);
    } else {
      searchTodoResult.addAll(todoList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.title!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.completed.toString().contains(searchText.toLowerCase()))
          .toList());
      // searchAlbumResult.addAll(albumsList
      //     .where((element) => element.title!.toLowerCase().contains(searchText))
      //     .toList());
      searchAlbumResult.addAll(albumsList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.userId.toString().contains(searchText) ||
              element.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList());
    }
    notifyListeners();
  }

  Future<void> search(String title) async {
    searchText = title;
    updateData();
  }
}
