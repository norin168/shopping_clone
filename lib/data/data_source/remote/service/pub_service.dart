import 'package:injectable/injectable.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_base.dart';
import 'package:w_navigator/data/data_source/remote/api_client/non_auth_api_client.dart';

@LazySingleton()
class PubService {
  const PubService(
    this._nonAuthApiClient,
  );

  final NonAuthApiClient _nonAuthApiClient;

  // get sync message
  Future<String?> getSyncMessage() async {
    return await _nonAuthApiClient.request(
      method: RestMethod.get,
      path: '',
      decoder: (data) => data as String,
    );
  }
}
