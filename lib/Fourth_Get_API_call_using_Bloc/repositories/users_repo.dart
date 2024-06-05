import 'package:api_with_bloc/Fourth_Get_API_call_using_Bloc/models/users_model.dart';
import "package:http/http.dart" as http;
import "package:http/http.dart";

class UsersRepoFourth {
  static const usersUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<UsersModel>> getUsers() async {
    Response response = await http.get(
      Uri.parse(usersUrl),
    );
    return usersModelFromJson(response.body);
  }
}
