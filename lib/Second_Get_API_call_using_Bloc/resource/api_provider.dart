import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/Model/user_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();

  final String _url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModelTwo>> fetchUsersList() async {
    try {
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
      return value.map((e) {
        return UserModelTwo.fromJson(e);
      }).toList();
    } catch (e) {
      if (e.toString().contains("SocketException")) {
        return [
          UserModelTwo.withError("Check your internet connection please")
        ];
      }
      return [UserModelTwo.withError(e.toString())];
    }
  }
}
