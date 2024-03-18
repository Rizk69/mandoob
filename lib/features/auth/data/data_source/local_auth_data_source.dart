import 'package:mandoob/core/netowork_core/error_handler.dart';
import 'package:mandoob/features/auth/data/responses/profile/user_response.dart';

const CACHE_PROFILE_KEY = "CACHE_PROFILE_KEY";
const CACHE_PROFILE_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class LocalDataSource {
  Future<UserResponse> getProfileData();

  Future<void> saveProfileDataToCache(UserResponse userResponse);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = Map();

  @override
  Future<UserResponse> getProfileData() async {
    CachedItem? cachedItem = cacheMap[CACHE_PROFILE_KEY];

    if (cachedItem != null && cachedItem.isValid(CACHE_PROFILE_INTERVAL)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      // return an error that cache is not there or its not valid
      throw ErrorHandler.handle(DataSource.CASHE_ERROR);
    }
  }

  @override
  Future<void> saveProfileDataToCache(UserResponse userResponse) async {
    cacheMap[CACHE_PROFILE_KEY] = CachedItem(userResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;

    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    return isValid;
  }
}