import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/Model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserStateTwo extends Equatable {
  const UserStateTwo();

  @override
  List<Object> get props => [];
}

class UserInitialStateTwo extends UserStateTwo {}

class UserLoadingStateTwo extends UserStateTwo {}

class UserLoadedStateTwo extends UserStateTwo {
  final List<UserModelTwo> userList;

  const UserLoadedStateTwo({required this.userList});
}

class UserErrorStateTwo extends UserStateTwo {
  final String error;

  const UserErrorStateTwo({required this.error});
}
