part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class PostFetchedEvent extends PostEvent {}

class PostSearchEvent extends PostEvent {
  final String searchString;
  const PostSearchEvent(this.searchString);
}
