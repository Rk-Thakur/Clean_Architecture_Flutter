// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class EmptyParams {}

class NoParams extends EmptyParams {}


class CommentParam extends EmptyParams {
  int id;
  CommentParam({
    required this.id,
  });
}
