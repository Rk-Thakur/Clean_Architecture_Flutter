import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firstapplication/core/error/failure.dart';
import 'package:firstapplication/core/usecases/empty_params.dart';
import 'package:firstapplication/core/usecases/usecases.dart';
import 'package:firstapplication/features/homepage/domain/entities/post_entity.dart';
import 'package:firstapplication/features/homepage/domain/repositories/post_repositories.dart';

class PostUseCases implements UseCases<List<Post>, NoParams> {
  const PostUseCases({required this.postRepositories});
  final PostRepositories postRepositories;
  @override
  Future<Either<Failure, List<Post>>> call(params) async {
    log('Get PostUseCases is called with NoParams $params');

    return postRepositories.getPost();
  }
}
