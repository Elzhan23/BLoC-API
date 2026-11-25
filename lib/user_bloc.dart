import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_api.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserApi userApi;

  UserBloc(this.userApi) : super(UserInitial()) {
    on<GetUsers>((event, emit) async {
      emit(UserLoading());

      try {
        final users = await userApi.getUsers();

        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
