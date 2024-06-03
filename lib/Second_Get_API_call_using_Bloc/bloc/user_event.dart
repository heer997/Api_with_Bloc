import "package:equatable/equatable.dart";

abstract class UserEventTwo extends Equatable {
  const UserEventTwo();

  @override
  List<Object> get props => [];
}

class GetUserList extends UserEventTwo {}
