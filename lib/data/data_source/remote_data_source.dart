import 'package:mandoob/data/network/app_api.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/data/responses/login/login_response.dart';
import 'package:mandoob/data/responses/register/register_response.dart';


abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);

  Future<RegisterResponse> register(RegisterRequest registerRequest);


}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }



  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) {
    return _appServiceClient.register(registerRequest);
  }


}
