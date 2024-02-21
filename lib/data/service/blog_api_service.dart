import 'package:dio/dio.dart';

import '../model/get_all_post_response.dart';
import '../model/get_one_post_response.dart';

class BlogApiService {
  static const String baseUrl = 'http://rubylearner.com:5000/';
  late Dio dio;

  //Default Constructor
  BlogApiService() {
    dio = Dio();
  }

  // Get all posts
  Future<List<GetAllPostResponse>> getAllPosts() async {
    Response<dynamic> postAllResponse = await dio.get('${baseUrl}posts');
    final postList = (postAllResponse.data as List)
        .map((json) => GetAllPostResponse.fromJson(json))
        .toList();
    return postList;
  }

  // Get one post
  Future<GetOnePostResponse> getOnePost(int id) async {
    final postOneResponse = await dio.get('${baseUrl}post?id=$id');
    final postList = (postOneResponse.data as List);
    final post = GetOnePostResponse.fromJson(postList[0]);
    return post;
  }
}
