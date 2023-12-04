// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class EmptyParams {}

class NoParams extends EmptyParams {}

class CountryParam extends EmptyParams {
  int skip;
  int take;
  CountryParam({
    required this.skip,
    required this.take,
  });
}

class CommentParam extends EmptyParams {
  int id;
  CommentParam({
    required this.id,
  });
}
