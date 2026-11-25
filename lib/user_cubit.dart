import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_api.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserApi userApi;

  UserCubit(this.userApi) : super(UserInitial());

  Future<void> getUsers() async {
    emit(UserLoading());

    try {
      final users = await userApi.getUsers();

      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('No internet connection'));
    }
  }
}
