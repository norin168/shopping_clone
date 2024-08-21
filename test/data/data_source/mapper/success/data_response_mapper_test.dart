import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:w_navigator/data/data_source/dto/mock/mock_data.dart';
import 'package:w_navigator/data/data_source/mapper/success/app_response_mapper.dart';
import 'package:w_navigator/data/data_source/mapper/success/base_response_success.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';
import 'package:w_navigator/helper/exceptions/remote_exception.dart';

void main() {
  group('Test function `map` of Data Response mapper', () {
    group(
      'Should return the correct type of T when using the valid data',
      () {
        test('Should return MockData when response is the data of MockData',
            () {
          final _validMock = {
            'data': {'uid': 1, 'email': 'mock@example.com'}
          };
          final _expectedData = MockData.fromJson(_validMock);

          final response =
              BaseResponseSuccessMapper.fromType(ResponseSuccessType.dataObject)
                  .map(
            response: _validMock,
            decoder: (data) => MockData.fromJson(data as MapStringDynamic),
          );

          // Assert
          expect(response, _expectedData);
        });

        test('Should return MockData2 when response is the data of MockData2',
            () {
          final _validMock = {
            'data': {
              'mock_data': {
                'uid': 1,
                'email': 'mock@example.com',
              }
            },
          };

          const _expectResponse = MockData2(
            mockData: MockData(id: 1, email: 'mock@example.com'),
          );

          final response = DataJsonResponseMapper<MockData2>().map(
              response: _validMock,
              decoder: (data) => MockData2.fromJson(data as MapStringDynamic));

          expect(response, _expectResponse);
        });

        test('should handle invalid response gracefully', () {
          // Arrange
          final invalidMock = {
            'invalidKey': 'invalidValue',
          }; // Replace with your actual invalid mock data

          // Act
          final response = DataJsonResponseMapper<MockData>().map(
            response: invalidMock,
            decoder: (data) => MockData.fromJson(data as Map<String, dynamic>),
          );

          // Assert
          expect(response, isNull); // Adjust based on your error handling
        });

        test('Shuld return `int` when response is int data', () {
          const _validResponse = {'data': 12345};
          const _expectResponse = 12345;

          final _response = DataJsonResponseMapper<int>()
              .map(response: _validResponse, decoder: (data) => data as int);

          expect(_response, _expectResponse);
        });

        test('Should return MockData when the response data is null', () {
          const _validResponse = {'data': null};

          expect(
            () => DataJsonResponseMapper<MockData>().map(
              response: _validResponse,
              decoder: (data) => MockData.fromJson(data as MapStringDynamic),
            ),
            throwsException,
          );
        });

        test('Should throw assertion when the response is null', () {
          expect(
            () => DataJsonResponseMapper<MockData>().map(
                response: null,
                decoder: (data) => MockData.fromJson(data as MapStringDynamic)),
            throwsAssertionError,
          );
        });

        test('Should throw assertion when the response data is null', () {
          final _validMock = {'data': null};

          expect(
            () => DataJsonResponseMapper<MockData>().map(
                response: _validMock,
                decoder: (data) => MockData.fromJson(data as MapStringDynamic)),
            throwsA(isA<RemoteException>()),
          );
        });
      },
    );
  });
}
