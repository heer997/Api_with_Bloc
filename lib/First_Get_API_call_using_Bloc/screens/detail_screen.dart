import "package:api_with_bloc/First_Get_API_call_using_Bloc/Model/user_model.dart";
import "package:flutter/material.dart";

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.e});

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  maxRadius: 60.0,
                  backgroundImage: NetworkImage(e.data![0].avatar.toString()),
                ),
              ),
              const SizedBox(height: 50.0),
              Text(
                e.data![0].firstName.toString() + " " + e.data![0].lastName.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Text(
                e.data![0].email.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
