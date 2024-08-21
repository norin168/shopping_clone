// Unit Test Plain Response Mapper
import 'package:flutter_test/flutter_test.dart';
import 'package:w_navigator/data/data_source/mapper/success/app_response_mapper.dart';

void main() {
  group('Test `map` function', () {
    group('Should return the correct response of T', () {
      test('Should return correct `String` when response `String`', () {
        const _validResponse = 'validResponse';
        const _expectResponse = 'validResponse';

        final response = PlainResponseMapper().map(
          response: _validResponse,
        );

        expect(response, _expectResponse);
      });

      test('Should throw assert error when response is null', () {
        expect(
          () => PlainResponseMapper().map(
            response: null,
          ),
          throwsAssertionError,
        );
      });

      test('Should response RemoteException when response invalid type', () {
        const _validResponse = {'name': "Hello World", 'type': "HelloWorld"};
        final response =
            PlainResponseMapper<String>().map(response: _validResponse);

        expect(response, null);
      });
    });
  });
}
