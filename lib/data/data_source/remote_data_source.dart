import 'package:mandoob/data/network/app_api.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/data/responses/login/login_response.dart';

import '../responses/profile/user_response.dart';


abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<UserResponse> getProfile();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }

  @override
  Future<UserResponse> getProfile() {
    return _appServiceClient.getProfile();

  }

}
