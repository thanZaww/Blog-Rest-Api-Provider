import 'package:flutter/material.dart';

import '../../data/service/blog_api_service.dart';
import 'get_complete_post_state.dart';

class GetCompletePostNotifer extends ChangeNotifier {
  GetCompletePostState getAllPostState = GetCompletePostLoading();
  final BlogApiService _apiService = BlogApiService();

  void getCompletePost({required int id}) async {
    getAllPostState = GetCompletePostLoading();
    notifyListeners();
    try {
      final getOnePostResponse = await _apiService.getOnePost(id);
      getAllPostState = GetCompletePostSuccess(getOnePostResponse);
      notifyListeners();
    } catch (_) {
      getAllPostState = GetCompletePostFailed('Something wrong');
      // notifyListeners();
    }
  }
}
