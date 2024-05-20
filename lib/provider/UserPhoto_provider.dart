import 'package:flutter/cupertino.dart';

import '../model/photo_model.dart';
import '../model/user_model.dart';
import '../repositories/service.dart';

class UserPhotoProvider extends ChangeNotifier {
  List<UserModel> userList = [];
  List<UserModel> get userdata => userList;

  List<PhotoModel> photoList = [];
  List<PhotoModel> get photoData => photoList;

  List<UserModel> searchUserResult = [];
  List<PhotoModel> searchPhotoResult = [];

  String searchText = '';

  bool loading = false;

  Future<void> getUserData() async {
    loading = true;

    final userResponse = await ApiServices().user();
    userList = userResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  Future<void> getPhotoData() async {
    loading = true;

    final photoResponse = await ApiServices().photo();
    photoList = photoResponse!;
    updateData();

    loading = false;
    notifyListeners();
  }

  void updateData() {
    searchUserResult.clear();
    searchPhotoResult.clear();
    if (searchText.isEmpty) {
      searchUserResult.addAll(userList);
      searchPhotoResult.addAll(photoList);
    } else {
      searchUserResult.addAll(userList
          .where((element) =>
              element.id.toString().contains(searchText) ||
              element.name!.toLowerCase().contains(searchText.toLowerCase()) ||
              element.username!
                  .toLowerCase()
                  .contains(searchText.toLowerCase()))
          .toList());
      searchPhotoResult.addAll(photoList
          .where((element) =>
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
