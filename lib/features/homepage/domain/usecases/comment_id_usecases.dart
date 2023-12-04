import 'package:dartz/dartz.dart';
import 'package:firstapplication/core/error/failure.dart';
import 'package:firstapplication/core/usecases/empty_params.dart';
import 'package:firstapplication/core/usecases/usecases.dart';
import 'package:firstapplication/features/homepage/domain/entities/comment_entity.dart';
import 'package:firstapplication/features/homepage/domain/repositories/post_repositories.dart';

class CommentByIdUseCases implements UseCases<List<Comment>, CommentParam> {
  const CommentByIdUseCases({required this.postRepositories});
  final PostRepositories postRepositories;

  @override
  Future<Either<Failure, List<Comment>>> call(CommentParam params) async {
    return postRepositories.getCommentById(params.id);
  }
}
