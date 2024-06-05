import "package:api_with_bloc/Fourth_Get_API_call_using_Bloc/bloc/users_bloc.dart";
import "package:api_with_bloc/Fourth_Get_API_call_using_Bloc/bloc/users_bloc_states.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (context) => UsersBloc(),
      child: MaterialApp(
        title: "HomePage",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const HomePageFourth(),
      ),
    );
  }
}

class HomePageFourth extends StatelessWidget {
  const HomePageFourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bloc Example",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersBloc, BlocUserState>(
        builder: (context, state) {
          if (state is BlocUserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlocUserLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        state.users[index].id.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    title: Text(
                      state.users[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.users[index].username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(state.users[index].address.street),
                        Text(state.users[index].address.zipcode),
                        Text(state.users[index].email),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            );
          }
        },
      ),
    );
  }
}
