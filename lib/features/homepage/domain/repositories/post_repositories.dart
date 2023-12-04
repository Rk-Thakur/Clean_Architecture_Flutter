import 'package:dartz/dartz.dart';
import 'package:firstapplication/core/error/failure.dart';
import 'package:firstapplication/features/homepage/domain/entities/comment_entity.dart';
import 'package:firstapplication/features/homepage/domain/entities/post_entity.dart';

abstract class PostRepositories {
  Future<Either<Failure, List<Post>>> getPost();
  Future<Either<Failure, List<Comment>>> getComment();
  Future<Either<Failure, List<Comment>>> getCommentById(int id);
}
