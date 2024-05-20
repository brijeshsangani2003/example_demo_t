import 'dart:convert';
import 'dart:developer';

import 'package:example_demo_t/core/constants/network_constants.dart';
import 'package:example_demo_t/model/album_model.dart';
import 'package:example_demo_t/model/anime_model.dart';
import 'package:example_demo_t/model/comment_model.dart';
import 'package:example_demo_t/model/photo_model.dart';
import 'package:example_demo_t/model/posts_model.dart';
import 'package:example_demo_t/model/todo_model.dart';
import 'package:example_demo_t/repositories/Api_services.dart';
import 'package:http/http.dart' as http;
import 'package:example_demo_t/model/user_model.dart';

class ApiServices {
  // Future<List<UserModel>?> user() async {
  //   try {
  //     var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<dynamic> responseData = json.decode(response.body);
  //       List<UserModel> userdata =
  //           responseData.map((e) => UserModel.fromJson(e)).toList();
  //       print('userdata ===============> ${userdata}');
  //       return userdata;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  Future<List<UserModel>?> user() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.user,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.user}');
      if (result != null) {
        List<UserModel> userdata =
            result.map((e) => UserModel.fromJson(e)).toList();
        print('userdata ===============> ${userdata}');
        return userdata;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<List<TodoModel>?> todo() async {
  //   try {
  //     var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  //     var response = await http.get(url);
  //     // print('status code ${} === Api Endpoint ${}');
  //     if (response.statusCode == 200) {
  //       List<dynamic> responseData = json.decode(response.body);
  //       List<TodoModel> todoData =
  //       responseData.map((e) => TodoModel.fromJson(e)).toList();
  //       return todoData;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  Future<List<TodoModel>?> todo() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.todo,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.todo}');
      if (result != null) {
        List<TodoModel> todoData =
            result.map((e) => TodoModel.fromJson(e)).toList();
        print('todoData ===============> ${todoData}');
        return todoData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<List<CommentModel>?> comment() async {
  //   try {
  //     var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<dynamic> responseData = json.decode(response.body);
  //       List<CommentModel> commentData =
  //       responseData.map((e) => CommentModel.fromJson(e)).toList();
  //       return commentData;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  Future<List<CommentModel>?> comment() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.comment,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.comment}');
      if (result != null) {
        List<CommentModel> commentData =
            result.map((e) => CommentModel.fromJson(e)).toList();
        print('commentData ===============> ${commentData}');
        return commentData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<PostsModel>?> posts() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.posts,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.posts}');
      if (result != null) {
        List<PostsModel> postsData =
            result.map((e) => PostsModel.fromJson(e)).toList();
        print('commentData ===============> ${postsData}');
        return postsData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<AlbumModel>?> albums() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.albums,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.albums}');
      if (result != null) {
        List<AlbumModel> albumsData =
            result.map((e) => AlbumModel.fromJson(e)).toList();
        print('albumsData ===============> ${albumsData}');
        return albumsData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<PhotoModel>?> photo() async {
    try {
      final result = await NetworkCall().handleApi(
        endpoint: NetworkConst.photos,
        callType: ApiCallType.get,
      );
      print('response Body ===>:${result}');
      print('Api Endpoint ===>:${NetworkConst.photos}');
      if (result != null) {
        List<PhotoModel> photoData =
            result.map((e) => PhotoModel.fromJson(e)).toList();
        print('photoData ===============> ${photoData}');
        return photoData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Aanimemodel>?> anime(int? page) async {
    try {
      var url = Uri.parse('https://api.jikan.moe/v4/anime?page=$page');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);

        List<dynamic> responseData = responseBody['data'];
        List<Aanimemodel> animeData =
            responseData.map((e) => Aanimemodel.fromJson(e)).toList();
        return animeData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
