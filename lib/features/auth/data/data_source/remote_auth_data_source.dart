import 'package:mandoob/features/auth/data/network/auth_api.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/data/responses/login/login_response.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';


abstract class RemoteAuthDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<UserResponse> getProfile();
  Future<void> editColorProfile(ColorProfile colorProfile);

}

class RemoteAuthDataSourceImpl extends RemoteAuthDataSource {
  final AuthServiceClient _authServiceClient;

  RemoteAuthDataSourceImpl(this._authServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _authServiceClient.login(loginRequest);
  }

  @override
  Future<UserResponse> getProfile() {
    return _authServiceClient.getProfile();
  }

  @override
  Future<void> editColorProfile(ColorProfile colorProfile) {
    return _authServiceClient.editColorProfile(colorProfile);
  }

}
