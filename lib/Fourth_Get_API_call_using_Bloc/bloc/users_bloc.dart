import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/bloc/users_bloc_events.dart';
import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/bloc/users_bloc_states.dart';
import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/models/users_model.dart';
import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/repositories/users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersBloc extends Bloc<BlocUserEvent, BlocUserState> {
  final UsersRepoFourth usersRepo = UsersRepoFourth();

  UsersBloc() : super(BlocUserLoadingState()) {
    on<BlocUsersInitialEvent>((event, emit) async {
      List<UsersModel> users = await usersRepo.getUsers();
      emit(
        BlocUserLoadedState(users: users),
      );
    });
    add(BlocUsersInitialEvent());
  }
}
