// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:firstapplication/core/constants/constants.dart';
import 'package:firstapplication/core/error/failure.dart';
import 'package:firstapplication/features/homepage/data/models/comment_model.dart';
import 'package:firstapplication/features/homepage/data/models/post_model.dart';
import 'package:firstapplication/shared/utils/dio_services.dart';

abstract class PostDataSources {
  Future<Either<Failure, List<PostModel>>> getPost();
  Future<Either<Failure, List<CommentModel>>> getComment();
  Future<Either<Failure, List<CommentModel>>> getCommentById(int id);
}

class PostDataSourcesImpl extends PostDataSources {
  final Dio dio;
  PostDataSourcesImpl({
    required this.dio,
  });
  @override
  Future<Either<Failure, List<PostModel>>> getPost() async {
    final response = await DioService().client.get(APIConstants.baseUrl);

    if (response.statusCode == 200) {
      return Right(
        (response.data as List<dynamic>)
            .map(
              (e) => PostModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    } else {
      return const Left(
        Failure(message: 'Server Failure'),
      );
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getComment() async {
    final response = await DioService().client.get(APIConstants.commentUrl);

    if (response.statusCode == 200) {
      return Right(
        (response.data as List<dynamic>)
            .map(
              (e) => CommentModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    } else {
      return const Left(
        Failure(message: 'Server Failure'),
      );
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getCommentById(int id) async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts/$id/comments');

    if (response.statusCode == 200) {
      return Right(
        (response.data as List<dynamic>)
            .map(
              (e) => CommentModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    } else {
      return const Left(
        Failure(message: 'Server Failure'),
      );
    }
  }
}
