import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
