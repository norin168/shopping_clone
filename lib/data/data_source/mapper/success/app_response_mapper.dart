import 'package:w_navigator/data/data_source/mapper/success/base_response_success.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';

class PlainResponseMapper<Output extends Object>
    extends BaseResponseSuccessMapper<Output, Output> {
  @override
  Output? mapToDataModel({
    required dynamic response,
    Decoder<Output>? decoder,
  }) {
    // assert(decoder != null, 'Decoder must be not null');

    return response is Output ? response : null;
  }
}

class JsonResponseMapper<Output extends Object>
    extends BaseResponseSuccessMapper<Output, Output> {
  @override
  Output? mapToDataModel({
    required dynamic response,
    Decoder<Output>? decoder,
  }) {
    assert(decoder != null, 'Decoder must be not null');

    return decoder != null && response is Map<String, dynamic>
        ? decoder(response)
        : null;
  }
}

class JsonArrayResponseMapper<Output extends Object>
    extends BaseResponseSuccessMapper<Output, List<Output>> {
  @override
  List<Output>? mapToDataModel({
    required dynamic response,
    Decoder<Output>? decoder,
  }) {
    assert(decoder != null, 'Decoder must be not null');

    return decoder != null && response is List
        ? response
            .map((e) => decoder(e as MapStringDynamic))
            .toList(growable: false)
        : null;
  }
}

class DataJsonResponseMapper<Output extends Object>
    extends BaseResponseSuccessMapper<Output, Output> {
  @override
  Output? mapToDataModel({
    required dynamic response,
    Decoder<Output>? decoder,
  }) {
    assert(decoder != null, 'Decoder must be not null');
    final _data = response['data'];
    assert(_data != null, 'Response data mut not be null');

    return decoder != null && response is MapStringDynamic
        ? decoder(_data)
        : null;
  }
}

class DataJsonArrayResponseMapper<Output extends Object>
    extends BaseResponseSuccessMapper<Output, List<Output>> {
  @override
  List<Output>? mapToDataModel({
    required dynamic response,
    Decoder<Output>? decoder,
  }) {
    assert(decoder != null, 'Decoder must be not null');
    // assert(response != null, 'Response data mut not be null');
    final data = response['data'];
    // assert(
    //     data is! List, '${data.runtimeType} is not sub-type of $runtimeType');

    return decoder != null && data is List
        ? data.map((e) => decoder(e)).toList(growable: false)
        : null;
  }
}
