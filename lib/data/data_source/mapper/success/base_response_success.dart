import 'package:w_navigator/data/data_source/mapper/success/app_response_mapper.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';
import 'package:w_navigator/helper/exceptions/remote_exception.dart';

enum ResponseSuccessType {
  jsonObject,
  jsonArray,
  dataObject,
  dataArray,
  plain,
}

abstract class BaseResponseSuccessMapper<Input extends Object,
    Output extends Object> {
  const BaseResponseSuccessMapper();

  factory BaseResponseSuccessMapper.fromType(ResponseSuccessType type) {
    return switch (type) {
      ResponseSuccessType.plain => PlainResponseMapper<Input>()
          as BaseResponseSuccessMapper<Input, Output>,
      ResponseSuccessType.jsonObject =>
        JsonResponseMapper<Input>() as BaseResponseSuccessMapper<Input, Output>,
      ResponseSuccessType.jsonArray => JsonArrayResponseMapper<Input>()
          as BaseResponseSuccessMapper<Input, Output>,
      ResponseSuccessType.dataObject => DataJsonResponseMapper<Input>()
          as BaseResponseSuccessMapper<Input, Output>,
      ResponseSuccessType.dataArray => DataJsonArrayResponseMapper<Input>()
          as BaseResponseSuccessMapper<Input, Output>,
    };
  }

  Output? map({
    required dynamic response,
    Decoder<Input>? decoder,
  }) {
    assert(response != null, 'Response must be not null');

    try {
      return mapToDataModel(response: response, decoder: decoder);
    } on RemoteException catch (_) {
      rethrow;
    } catch (e) {
      throw RemoteException(
        type: RemoteExceptionType.decodeError,
        rootException: e,
      );
    }
  }

  Output? mapToDataModel({required dynamic response, Decoder<Input>? decoder});
}
