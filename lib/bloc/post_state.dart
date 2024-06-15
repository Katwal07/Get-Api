part of 'post_bloc.dart';

class PostState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostState({
    this.postStatus = PostStatus.loading,
    this.postList = const [],
    this.message = '',
  });

  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postList, postStatus, message];
}
