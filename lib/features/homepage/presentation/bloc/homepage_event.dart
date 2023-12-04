// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {
  const HomepageEvent();

  @override
  List<Object> get props => [];
}

class GetPostEvent extends HomepageEvent {}

class GetCommentEvent extends HomepageEvent {}

// ignore: must_be_immutable
class GetCommentByIdEvent extends HomepageEvent {
  int id;
  GetCommentByIdEvent({
    required this.id,
  });
}
