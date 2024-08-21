import 'package:flutter_test/flutter_test.dart';
import 'package:w_navigator/data/data_source/dto/mock/mock_data.dart';
import 'package:w_navigator/data/data_source/mapper/success/app_response_mapper.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';
import 'package:w_navigator/helper/exceptions/remote_exception.dart';

void main() {
  group('Test `map` function of json respose mapper', () {
    group('Should be return the correct response of T', () {
      test('Should be return Lis<MockData> when response is List<MockData>',
          () {
        final _validMockDatas = [
          {
            'uid': 1,
            'email': 'mock_1@example.com',
          },
          {
            'uid': 2,
            'email': 'mock_2@example.com',
          }
        ];

        final _expectResponse = [
          const MockData(id: 1, email: 'mock_1@example.com'),
          const MockData(id: 2, email: 'mock_2@example.com'),
        ];

        final response = JsonArrayResponseMapper<MockData>().map(
          response: _validMockDatas,
          decoder: (json) => MockData.fromJson(json as MapStringDynamic),
        );

        expect(response, isNotNull);
        expect(response, _expectResponse);
      });

      test(
        'Should be return List<MockData2> when response is List<MockData2>',
        () {
          const _validMockData2 = [
            {
              "mock_data": {
                'uid': 1,
                'email': 'mock_1@example.com',
              }
            },
            {
              "mock_data": {
                'uid': 2,
                'email': 'mock_2@example.com',
              }
            }
          ];

          const _expectResponse = [
            MockData2(
              mockData: MockData(id: 1, email: 'mock_1@example.com'),
            ),
            MockData2(
              mockData: MockData(id: 2, email: 'mock_2@example.com'),
            )
          ];

          final response = JsonArrayResponseMapper<MockData2>().map(
            response: _validMockData2,
            decoder: (json) => MockData2.fromJson(json as MapStringDynamic),
          );

          expect(response, _expectResponse);
        },
      );

      test(
        'Should return empty List<MockData> when response is null',
        () {
          const _validMock = [];
          final _validResponse = <MockData>[];

          final res = JsonArrayResponseMapper<MockData>().map(
            response: _validMock,
            decoder: (data) => MockData.fromJson(data as MapStringDynamic),
          );

          expect(res, _validResponse);
        },
      );

      test('Should be return null when response was not type Json Array', () {
        final _validMockData = {'uid': 1, 'email': 'mock@example.dart'};

        final response = JsonArrayResponseMapper<MockData>().map(
          response: _validMockData,
          decoder: (json) => MockData.fromJson(json as MapStringDynamic),
        );

        expect(response, isNull);
      });

      test('Should throw assert null when the response is null', () {
        expect(
          () => JsonArrayResponseMapper().map(response: null),
          throwsAssertionError,
        );
      });

      test('Should throw assert null when decoder is null', () {
        final _validMockData = {'uid': 1, 'email': 'mock@example.dart'};

        expect(
            () => JsonArrayResponseMapper()
                .map(response: _validMockData, decoder: null),
            throwsA(isA<RemoteException>()));
      });
    });
  });
}
