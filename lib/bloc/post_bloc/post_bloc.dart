// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_api/model/post_model.dart';
import 'package:get_api/repository/post_repository.dart';
import 'package:get_api/utils/enums.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> postSearchList = [];

  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostState()) {
    on<PostFetchedEvent>(_postFetchedApi);

    on<PostSearchEvent>(_postSearch);
  }

  void _postFetchedApi(PostFetchedEvent event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
          postStatus: PostStatus.success,
          message: '',
          postList: value,
        ),
      );
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _postSearch(PostSearchEvent event, Emitter<PostState> emit) async {
    if (event.searchString.isEmpty) {
      emit(state.copyWith(postSearchList: [], searchMessage: ''));
    } else {
      // postSearchList = state.postList
      //     .where((element) =>
      //         element.id.toString() == event.searchString.toString())
      //     .toList();

           postSearchList = state.postList
          .where((element) =>
              element.title.toString().toLowerCase().contains(event.searchString.toString().toLowerCase(),),)
          .toList();

      if (postSearchList.isEmpty) {
        emit(state.copyWith(postSearchList: [], searchMessage: 'No data found'));
      } else {
        emit(state.copyWith(postSearchList: postSearchList, searchMessage: ''));
      }
    }
  }
}
