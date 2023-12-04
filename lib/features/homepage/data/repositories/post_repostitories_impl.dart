// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:firstapplication/core/error/failure.dart';
import 'package:firstapplication/features/homepage/data/datasources/post_datasources.dart';
import 'package:firstapplication/features/homepage/data/models/post_model.dart';
import 'package:firstapplication/features/homepage/domain/entities/comment_entity.dart';
import 'package:firstapplication/features/homepage/domain/repositories/post_repositories.dart';

class PostRepositoriesImpl extends PostRepositories {
  final PostDataSources postDataSources;
  PostRepositoriesImpl({
    required this.postDataSources,
  });
  @override
  Future<Either<Failure, List<PostModel>>> getPost() {
    return postDataSources.getPost();
  }

  @override
  Future<Either<Failure, List<Comment>>> getComment() {
    return postDataSources.getComment();
  }

  @override
  Future<Either<Failure, List<Comment>>> getCommentById(int id) {
    return postDataSources.getCommentById(id);
  }
}
