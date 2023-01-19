import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/auth/authentication_repository.dart';

import 'authentication_repository_test.mocks.dart';

/**
  To stub any method; gives error when used for futures or stream
  when(mock.method()).thenReturn(value); 

  To stub method that return a future or stream
  when(mock.method()).thenAnswer(() => futureOrStream);

  To stub error
  when(mock.method()).thenThrow(errorObject);
 */

@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  // test for login
  late AuthRepository authRepository;

  setUp(() {
    authRepository = AuthRepository(mockDio); //Dependency injection
  });
// Stubbing
  when(mockDio.post(
    '<https://reqres.in/api/login>',
    data: {'email': 'james@mail.com', 'password': '123456'},
  )).thenAnswer(
    (inv) => Future.value(
      Response(
        statusCode: 200,
        data: {'token': 'ASjwweiBE'},
        requestOptions: RequestOptions(path: '<https://reqres.in/api/login>'),
      ),
    ),
  );
  test('Successfully logged in user', () async {
    expect(
      await authRepository.login(email: 'james@mail.com', password: '123456'),
      true,
    );
  });
}
