// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firstapplication/features/homepage/domain/entities/comment_entity.dart';

import 'package:firstapplication/features/homepage/domain/entities/post_entity.dart';

enum PostStatus { initial, loading, fetched, failure }

class HomePageState extends Equatable {
  final PostStatus postStatus;
  final String message;
  final List<Post> post;
  final List<Comment> comment;
  const HomePageState(
      {this.postStatus = PostStatus.initial,
      this.message = '',
      this.post = const [],
      this.comment = const []});

  @override
  List<Object?> get props => [postStatus, message, comment, post];

  HomePageState copyWith({
    PostStatus? postStatus,
    String? message,
    List<Post>? post,
    List<Comment>? comment,
  }) {
    return HomePageState(
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message,
        post: post ?? this.post,
        comment: comment ?? this.comment);
  }
}
