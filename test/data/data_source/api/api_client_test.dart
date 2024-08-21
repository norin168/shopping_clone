import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:w_navigator/data/data_source/dto/mock/mock_data.dart';
import 'package:w_navigator/data/data_source/mapper/error/base_response_error.dart';
import 'package:w_navigator/data/data_source/mapper/success/base_response_success.dart';
import 'package:w_navigator/data/data_source/remote/api_client/base/api_client_base.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';

class MockDio extends Mock implements Dio {}

void main() {
  final _mockDio = MockDio();

  group('Test base dio api client', () {
    group('Test assertion', () {
      test('Should throw AssertionError when method is GET and decoder is null',
          () {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        expect(
          () async => await _restApiClient.request(
            method: _method,
            path: _path,
          ),
          throwsAssertionError,
        );
      });

      test(
          'Should not throw AssertionError when method is GET and decoder is null, but the SuccessResponseType is Plain',
          () {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.plain,
        );

        when(() => _mockDio.options)
            .thenReturn(BaseOptions(baseUrl: 'https://example.com/api'));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        expect(
          () async => await _restApiClient.request(
            method: _method,
            path: _path,
          ),
          returnsNormally,
        );
      });

      test(
          'should not throw AssertionError when method is POST and decoder is null',
          () {
        const _method = RestMethod.post;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        when(() => _mockDio.options)
            .thenReturn(BaseOptions(baseUrl: 'https://example.com/api'));

        when(
          () => _mockDio.post<dynamic>(_path, options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        expect(
          () => _restApiClient.request(method: _method, path: _path),
          returnsNormally,
        );
      });

      // should not throw AssertionError when method is PUT and decoder is null
      test(
          'should not throw AssertionError when method is PUT and decoder is null',
          () {
        const _method = RestMethod.put;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        when(() => _mockDio.options)
            .thenReturn(BaseOptions(baseUrl: 'https://example.com/api'));

        when(
          () => _mockDio.put<dynamic>(_path, options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        expect(
          () => _restApiClient.request(method: _method, path: _path),
          returnsNormally,
        );
      });

      // should not throw AssertionError when method is PATCH and decoder is null
      test(
          'should not throw AssertionError when method is PUT and decoder is null',
          () {
        const _method = RestMethod.patch;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        when(() => _mockDio.options)
            .thenReturn(BaseOptions(baseUrl: 'https://example.com/api'));

        when(
          () => _mockDio.patch<dynamic>(_path, options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        expect(() => _restApiClient.request(method: _method, path: _path),
            returnsNormally);
      });

      test(
          'should not throw AssertionError when method is Deleted and decoder is null',
          () {
        const _method = RestMethod.delete;
        const _path = 'v1/auth/login';
        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        when(() => _mockDio.options)
            .thenReturn(BaseOptions(baseUrl: 'https://example.com/api'));

        when(
          () => _mockDio.delete<dynamic>(_path, options: any(named: 'options')),
        ).thenAnswer(
          (_) async => Response(requestOptions: RequestOptions()),
        );

        expect(
          () => _restApiClient.request(method: _method, path: _path),
          returnsNormally,
        );
      });
      // end
    });

    group('Test `Get` method', () {
      // test GET method
      test(
          'Should return the correct the DataList<MockData> when API return valid MockData response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataArray,
        );

        const _mockResponse = {
          'data': [
            {'uid': 1, 'email': 'mock@example.com'}
          ]
        };

        const _expectResult = [
          MockData(id: 1, email: 'mock@example.com'),
        ];

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as Map<String, dynamic>),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct the DataList<String> when the API return valid String response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataArray,
        );

        const _mockResponse = {
          'data': ['anyString 1', 'anyString 2']
        };

        const _expectResult = ['anyString 1', 'anyString 2'];

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => data as String,
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct the DataObject<MockData> when the API return valid MockData response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        const _mockResponse = {
          'data': {'uid': 1, 'email': 'mock@example.com'}
        };

        const _expectResult = MockData(id: 1, email: 'mock@example.com');

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct the DataObject<String> when the API return valid String response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        const _mockResponse = {'data': 'anyString'};

        const _expectResult = 'anyString';

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => data as String,
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct the MockData when the API return valid MockData response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.jsonObject,
        );

        final _mockResponse = {'uid': 1, 'email': 'mock@example.com'};

        const _expectResult = MockData(id: 1, email: 'mock@example.com');

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct the JsonList<MockData> when the API return valid MockData response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.jsonArray,
        );

        final _mockResponse = [
          {'uid': 1, 'email': 'mock@example.com'}
        ];

        const _expectResult = [MockData(id: 1, email: 'mock@example.com')];

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return null when using `JsonObject` as SuccessResponseType and response is null',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.jsonObject,
        );

        const _mockResponse = null;

        const _expectResult = isNull;

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return null when using `Plain` as SuccessResponseType and response is null',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.plain,
        );

        const _mockResponse = null;

        const _expectResult = isNull;

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return null when using `JsonArray` as SuccessResponseType and response is null',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.jsonArray,
        );

        const _mockResponse = null;

        const _expectResult = isNull;

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return null when using `DataObject` as SuccessResponseType and response is null',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataObject,
        );

        const _mockResponse = null;

        const _expectResult = isNull;

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return null when using `DataArray` as SuccessResponseType and response is null',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.dataArray,
        );

        const _mockResponse = null;

        const _expectResult = isNull;

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => MockData.fromJson(data as MapStringDynamic),
        );

        // expect
        expect(_result, _expectResult);
      });

      test(
          'Should return the correct String when API return valid String response',
          () async {
        const _method = RestMethod.get;
        const _path = 'v1/auth/login';
        const _baseUrl = 'https://example.com/api';
        final _options = Options(
          headers: {'user-agent': 'android'},
          contentType: 'application/json',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        );

        final _restApiClient = RestApiClient(
          dio: _mockDio,
          errorResponseMapperType: ResponseErrorType.jsonObject,
          successResponseMapperType: ResponseSuccessType.plain,
        );

        const _mockResponse = 'anyString';

        const _expectResult = 'anyString';

        when(() => _mockDio.options).thenReturn(BaseOptions(baseUrl: _baseUrl));

        when(
          () => _mockDio.get<dynamic>(
            _path,
            options: any(named: 'options'),
          ),
        ).thenAnswer(
          (_) async => Response<dynamic>(
            data: _mockResponse,
            requestOptions: RequestOptions(),
          ),
        );

        //result
        final _result = await _restApiClient.request(
          method: _method,
          path: _path,
          options: _options,
          decoder: (data) => data as String,
        );

        // expect
        expect(_result, _expectResult);
      });

      // end
    });
  });
}
