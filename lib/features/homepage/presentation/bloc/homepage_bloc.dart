import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firstapplication/core/usecases/empty_params.dart';
import 'package:firstapplication/features/homepage/domain/usecases/comment_id_usecases.dart';
import 'package:firstapplication/features/homepage/domain/usecases/comment_usecases.dart';
import 'package:firstapplication/features/homepage/domain/usecases/post_usecases.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_state.dart';

part 'homepage_event.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomePageState> {
  final PostUseCases postUseCases;
  final CommentUseCases commentUseCases;
  final CommentByIdUseCases commentByIdUseCases;
  HomepageBloc({
    required this.postUseCases,
    required this.commentUseCases,
    required this.commentByIdUseCases,
  }) : super(const HomePageState()) {
    on<GetPostEvent>(_getPost);
    on<GetCommentEvent>(_getComment);
    on<GetCommentByIdEvent>(_getCommentById);
  }

  FutureOr<void> _getPost(GetPostEvent event, Emitter<HomePageState> emit) async {
    try {
      emit(state.copyWith(postStatus: PostStatus.loading));
      log('Get Post State is Loading!!!');

      final response = await postUseCases(NoParams());
      log('Get PostUseCases is Triggered!!!');

      response.fold(
          (l) => emit(state.copyWith(postStatus: PostStatus.failure, message: 'Failure Casees!!!')),
          (r) => emit(
              state.copyWith(postStatus: PostStatus.fetched, message: 'Post Fetched', post: r)));
    } catch (e) {
      emit(state.copyWith(postStatus: PostStatus.failure, message: e.toString()));
      log('Get Post Exception!!!');
    }
  }

  FutureOr<void> _getComment(GetCommentEvent event, Emitter<HomePageState> emit) async {
    try {
      emit(state.copyWith(postStatus: PostStatus.loading));
      final response = await commentUseCases(NoParams());

      response.fold(
          (l) => emit(
              state.copyWith(postStatus: PostStatus.failure, message: 'Comment Failure Casees!!!')),
          (r) => emit(state.copyWith(
              postStatus: PostStatus.fetched, message: 'Comment Fetched!!!!!', comment: r)));
    } catch (e) {
      emit(state.copyWith(postStatus: PostStatus.failure, message: e.toString()));
    }
  }

  FutureOr<void> _getCommentById(GetCommentByIdEvent event, Emitter<HomePageState> emit) async {
    try {
      emit(state.copyWith(postStatus: PostStatus.loading));
      final response = await commentByIdUseCases(CommentParam(id: event.id));

      response.fold(
          (l) => emit(
              state.copyWith(postStatus: PostStatus.failure, message: 'Comment Failure Casees!!!')),
          (r) => emit(state.copyWith(
              postStatus: PostStatus.fetched, message: 'Comment Fetched!!!!!', comment: r)));
    } catch (e) {
      emit(state.copyWith(postStatus: PostStatus.failure, message: e.toString()));
    }
  }
}
