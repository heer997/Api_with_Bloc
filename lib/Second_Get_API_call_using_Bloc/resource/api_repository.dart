import 'package:api_with_bloc/Second_Get_API_call_using_Bloc/Model/user_model.dart';

class ApiRepository
{
  final ApiRepository _apiRepository = ApiRepository();

  Future<List<UserModelTwo>> fetchUsersList()
  {
    return _apiRepository.fetchUsersList();
  }
}

class NetworkError extends Error {}