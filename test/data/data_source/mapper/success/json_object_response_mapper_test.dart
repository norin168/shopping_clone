import 'package:flutter_test/flutter_test.dart';
import 'package:w_navigator/data/data_source/dto/mock/mock_data.dart';
import 'package:w_navigator/data/data_source/mapper/success/app_response_mapper.dart';
import 'package:w_navigator/helper/constants/type_of_constants.dart';

void main() {
  group(
    'Test `map` function on json object',
    () {
      group('Should return the correct response of T when using valid data',
          () {
        test(
          'Should return correct MockData2 when response is MockData2',
          () {
            const _validMock = {
              'mock_data': {
                'uid': 1,
                'email': 'mock@example.com',
              }
            };

            const _expectMockData = MockData2(
              mockData: MockData(
                id: 1,
                email: 'mock@example.com',
              ),
            );

            final response = JsonResponseMapper<MockData2>().map(
              response: _validMock,
              decoder: (json) => MockData2.fromJson(json as MapStringDynamic),
            );

            expect(response, isNotNull);
            expect(response, _expectMockData);
          },
        );

        test(
          'Should return correct MockData when response is MockData',
          () {
            const _validMockData = {
              'uid': 1,
              'email': 'mock@example.com',
            };

            const _expectMockData = MockData(
              id: 1,
              email: 'mock@example.com',
            );

            final response = JsonResponseMapper<MockData>().map(
              response: _validMockData,
              decoder: (json) => MockData.fromJson(json as MapStringDynamic),
            );

            expect(response, isNotNull);
            expect(response, _expectMockData);
          },
        );

        test(
          'Should return null when response is not JSONObject',
          () {
            const _validMock = [
              {
                'uid': 1,
                'email': 'mock@example.com',
              }
            ];

            final response = JsonResponseMapper<MockData2>().map(
              response: _validMock,
              decoder: (json) => MockData2.fromJson(json as MapStringDynamic),
            );

            // assert
            expect(response, isNull);
          },
        );

        test(
          'Should throw assert error when response is null',
          () {
            expect(
              () => JsonResponseMapper().map(response: null),
              throwsAssertionError,
            );
          },
        );
      });
    },
  );
}
