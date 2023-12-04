import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({
    required this.message,
  }) : super();

  @override
  List<Object?> get props => [message];
}
