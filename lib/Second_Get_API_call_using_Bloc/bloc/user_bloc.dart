import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/Model/user_model.dart';
import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/bloc/user_event.dart';
import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/bloc/user_states.dart';
import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/resource/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBlocTwo extends Bloc<UserEventTwo, UserStateTwo> {
  UserBlocTwo() : super(UserInitialStateTwo()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetUserList>((event, emit) async {
      try {
        emit(UserLoadingStateTwo());
        final List<UserModelTwo> userList =
            await apiRepository.fetchUsersList();
        emit(UserLoadedStateTwo(userList: userList));
        // if (userList[0].error != null) {
        //   emit(UserErrorStateTwo(error: userList[0].error.toString()));
        // }
      } on NetworkError {
        emit(
          const UserErrorStateTwo(
              error: "Failed to fetch data is your device online"),
        );
      }
    });
  }
}
