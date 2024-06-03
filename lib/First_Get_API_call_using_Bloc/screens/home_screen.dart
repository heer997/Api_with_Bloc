import "package:api_with_bloc/First_Get_API_call_using_Bloc/Model/user_model.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/blocs/app_bloc.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/blocs/app_events.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/blocs/app_states.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/repository/repositories.dart";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/screens/detail_screen.dart";
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
      title: "HomeScreen",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: RepositoryProvider(
        create: (context) {
          return UserRepository();
        },
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserBloc(
          RepositoryProvider.of<UserRepository>(context),
        )..add(LoadUserEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("The Bloc App"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                e: userList[index],
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(userList[index].firstname.toString()),
                          subtitle: Text(userList[index].lastname.toString()),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatar.toString()),
                          ),
                        ),
                        // child: ListTile(
                        //   title: Text(userList[index].data![index].firstName.toString()),
                        //   subtitle: Text(userList[index].data![index].lastName.toString()),
                        //   trailing: CircleAvatar(
                        //     backgroundImage: NetworkImage(
                        //         userList[index].data![index].avatar.toString()),
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is UserErrorState) {
              return const Center(
                child: Text(
                  "Error",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
