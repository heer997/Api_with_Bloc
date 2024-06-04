import 'package:api_with_bloc/First_Get_API_call_using_Bloc/Model/user_model.dart';

abstract class UserState {}

/// data loading state
class UserLoadingState extends UserState {}

/// data loaded state
class UserLoadedState extends UserState {
  UserLoadedState(this.users);

  // final List<UserModel> users;
  final UserModel users;
}

/// data error loading state
class UserErrorState extends UserState {
  final String errormsg;

  UserErrorState(this.errormsg);
}
