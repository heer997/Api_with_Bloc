import "package:api_with_bloc/First_Get_API_call_using_Bloc/blocs/app_events.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/blocs/app_states.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/repository/repositories.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final users = await _userRepository.getUsers();
          emit(UserLoadedState(users));
        } catch (e) {
          emit(UserErrorState(e.toString()));
        }
      },
    );
  }
}
