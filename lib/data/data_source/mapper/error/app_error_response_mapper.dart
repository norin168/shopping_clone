import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';

class JsonErrorMapper extends BaseResponseErrorMapper {
  @override
  ServerError mapToDataModel(dynamic responseError) {
    return ServerError(
      code: responseError['code'] as int?,
      message: responseError['message'] as String?,
      status: responseError['status'] as String?,
    );
  }
}

class JsonArrayErrorMapper extends BaseResponseErrorMapper<List<dynamic>> {
  @override
  ServerError mapToDataModel(dynamic responseError) {
    return ServerError(
      errors: responseError != null && responseError is List
          ? responseError
              .map(
                (e) => ServerError(
                  code: e['code'] as int?,
                  message: e['message'] as String?,
                  status: e['status'] as String?,
                ),
              )
              .toList()
          : [],
    );
  }
}
