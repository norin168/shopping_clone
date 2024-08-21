// // test auth

// import 'package:async/async.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:w_navigator/helper/validator/auth_validator.dart';

// class MockAuthValidator extends Mock implements AuthValidator {}

// class MockSharePreference extends Mock implements SharedPreferences {}

// void main() {
//   group(
//     'Test auth validator',
//     () {
//       group('Test email Validator', () {
//         test('Expect return false when email is empy', () {
//           // final authValidator = MockAuthValidator();
//           final result = AuthValidator().validateEmail('');

//           // expect
//           expect(result, false);
//         });

//         test('Expect return false when email is null', () {
//           final _authValidator = MockAuthValidator();
//           final result = _authValidator.validateEmail('');

//           // expect
//           expect(result, false);
//         });

//         // test('Expect return false when the email not right email format', () {
//         //   final result = _authValidator.validateEmail('test');

//         //   // expect
//         //   expect(result, false);
//         // });
//       });

//       // group(
//       //   "Test password validator",
//       //   () {
//       //     test('Expect return false when password is empty', () {
//       //       final result = _authValidator.validatePassword('');

//       //       // expect
//       //       expect(result, false);
//       //     });

//       //     test('Expect return false when password is null', () {
//       //       final result = _authValidator.validatePassword(null);

//       //       // expect
//       //       expect(result, false);
//       //     });

//       //     test('Expect return false when password is less than 6 characters',
//       //         () {
//       //       final result = _authValidator.validatePassword('12345');

//       //       // expect
//       //       expect(result, false);
//       //     });
//       //   },
//       // );
//     },
//   );

//   group(
//     'Test login view model',
//     () {
//       late SharedPreferences _pref;
//       late LoginViewModel _loginViewModel;

//       setUp(
//         () {
//           _pref = MockSharePreference();
//           _loginViewModel = LoginViewModel(sharedPreferences: _pref);
//         },
//       );

//       group(
//         'Should return when use valid email and password',
//         () {
//           test(
//             'Expect return true when the cache contains the email, and the password is correct',
//             () {
//               // input
//               String email = 'email@example.com';
//               String password = 'password';

//               // put email and password to cache
//               _loginViewModel.pubCache(email, 'password');

//               // stubbing
//               when(() => _pref.getString(email)).thenReturn('123456');

//               // act
//               final result = _loginViewModel.login(email, password);

//               // assert
//               expect(result, true);
//             },
//           );

//           test(
//             'Expect return false when the cache not contains the email, and the password is correct',
//             () {
//               // input
//               String email = 'email@example.com';
//               String password = 'password';

//               // put email and password to cache
//               // _loginViewModel.pubCache(email, 'password');

//               // stubbing
//               when(() => _pref.getString(email)).thenReturn('123456');

//               // act
//               final result = _loginViewModel.login(email, password);

//               // assert
//               expect(result, false);
//             },
//           );

//           test(
//             'Expect return true when the cache not contains the email, and the password is correct',
//             () {
//               // input
//               String email = 'email@example.com';
//               String password = 'password';

//               // put email and password to cache
//               // _loginViewModel.pubCache(email, 'password');

//               // stubbing
//               when(() => _pref.getString(email)).thenReturn('password');

//               // act
//               final result = _loginViewModel.login(email, password);

//               // assert
//               expect(result, true);
//             },
//           );
//         },
//       );
//     },
//   );
// }
