part of 'post_bloc.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;
  final String searchMessage;

  final List<PostModel> postSearchList;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = '',
    this.postSearchList = const [],
    this.searchMessage = '',
  });

  PostState copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      String? message,
      List<PostModel>? postSearchList, String? searchMessage}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
      postSearchList: postSearchList ?? this.postSearchList,
      searchMessage: searchMessage?? this.searchMessage
    );
  }

  @override
  List<Object?> get props => [postList, postStatus, message, postSearchList, searchMessage];
}
