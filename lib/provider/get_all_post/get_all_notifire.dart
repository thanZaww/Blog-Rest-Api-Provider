import 'package:flutter/material.dart';

import '../../data/service/blog_api_service.dart';
import 'get_all_post_state.dart';

class GetAllNotifier extends ChangeNotifier {
  GetAllPostState getAllPostState = GetAllPostLoading();
  final BlogApiService _apiService = BlogApiService();

  Future<void> getAllPosts() async {
    getAllPostState = GetAllPostLoading();
    notifyListeners();
    try {
      final getAllPostList = await _apiService.getAllPosts();
      getAllPostState = GetAllPostSuccess(getAllPostList: getAllPostList);
      notifyListeners();
    } catch (e) {
      getAllPostState = GetAllPostFailed(error: e.toString());
      notifyListeners();
    }
  }
}
