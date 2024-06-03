import "package:api_with_bloc/Second_Get_API_call_using_Bloc/Model/user_model.dart";
import "package:api_with_bloc/Second_Get_API_call_using_Bloc/bloc/user_bloc.dart";
import "package:api_with_bloc/Second_Get_API_call_using_Bloc/bloc/user_event.dart";
import "package:api_with_bloc/Second_Get_API_call_using_Bloc/bloc/user_states.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UserPage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const UserScreen(),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() {
    return UserScreenState();
  }
}

class UserScreenState extends State<UserScreen> {
  final UserBlocTwo _userBloc = UserBlocTwo();

  @override
  void initState() {
    _userBloc.add(GetUserList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bloc Flutter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _buildListener(),
    );
  }

  Widget _buildListener() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (context) {
            return _userBloc;
          },
          child: BlocBuilder<UserBlocTwo, UserStateTwo>(
            builder: (context, state) {
              if (state is UserErrorStateTwo) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is UserInitialStateTwo) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadingStateTwo) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoadedStateTwo) {
                return ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    UserModelTwo userModel = state.userList[index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          userModel.title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(userModel.id.toString()),
                        trailing: Text(userModel.userId.toString()),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
