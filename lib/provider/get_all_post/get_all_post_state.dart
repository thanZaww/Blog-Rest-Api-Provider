// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/model/get_all_post_response.dart';

sealed class GetAllPostState {}

class GetAllPostLoading extends GetAllPostState {}

class GetAllPostSuccess extends GetAllPostState {
  final List<GetAllPostResponse> getAllPostList;

  GetAllPostSuccess({required this.getAllPostList});
}

class GetAllPostFailed extends GetAllPostState {
  final String error;

  GetAllPostFailed({required this.error});
}
