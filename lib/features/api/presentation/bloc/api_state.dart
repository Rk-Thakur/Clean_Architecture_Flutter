part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();  

  @override
  List<Object> get props => [];
}
class ApiInitial extends ApiState {}
