import 'package:dio/dio.dart';
import 'package:firstapplication/features/homepage/data/datasources/post_datasources.dart';
import 'package:firstapplication/features/homepage/data/repositories/post_repostitories_impl.dart';
import 'package:firstapplication/features/homepage/domain/usecases/comment_id_usecases.dart';
import 'package:firstapplication/features/homepage/domain/usecases/comment_usecases.dart';
import 'package:firstapplication/features/homepage/domain/usecases/post_usecases.dart';
import 'package:firstapplication/features/homepage/presentation/bloc/homepage_bloc.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerFactory(() => HomepageBloc( //registering factory is like telling your assistant how to follow the receipe and make cakes.
      postUseCases: getIt<PostUseCases>(), // assistance
      commentUseCases: getIt<CommentUseCases>(),
      commentByIdUseCases: getIt<CommentByIdUseCases>()));

  getIt.registerSingleton(Dio());

  getIt.registerSingleton(PostDataSourcesImpl(dio: getIt<Dio>()));

  getIt.registerSingleton(PostRepositoriesImpl(postDataSources: getIt<PostDataSourcesImpl>()));

  getIt.registerSingleton(PostUseCases(postRepositories: getIt<PostRepositoriesImpl>()));

  getIt.registerSingleton(CommentUseCases(postRepositories: getIt<PostRepositoriesImpl>()));

  getIt.registerSingleton(CommentByIdUseCases(postRepositories: getIt<PostRepositoriesImpl>()));
}
