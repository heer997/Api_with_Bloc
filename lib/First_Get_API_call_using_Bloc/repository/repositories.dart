import "dart:convert";
import "package:api_with_bloc/First_Get_API_call_using_Bloc/Model/user_model.dart";
import "package:http/http.dart" as http;
import "package:http/http.dart";

class UserRepository {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future getUsers() async {
    Response response = await http.get(
      Uri.parse(endpoint),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(response.body);
      return UserModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
