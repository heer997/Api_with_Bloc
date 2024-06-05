import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/models/users_model.dart';

abstract class BlocUserState {}

class BlocUserLoadingState extends BlocUserState {}

class BlocUserLoadedState extends BlocUserState {
  List<UsersModel> users;

  BlocUserLoadedState({required this.users});
}
